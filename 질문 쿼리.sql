
-- 1. 누적 20만원 이상 결제한 회원
-- (회원 id, 회원 이름, 누적 결제 금액)

SELECT cl.client_id AS '회원 ID', cl.name AS '이름', CONCAT(SUM(pg.payed_cost), '원') AS '누적 결제 금액'
FROM client cl
JOIN subscribe sub ON cl.client_id = sub.client_id
JOIN payment pg ON sub.subscribe_id = pg.subscribe_id
GROUP BY cl.client_id
HAVING SUM(pg.payed_cost) >= 200000;


-- 2. cl_007 회원의 2025년 12월 결제 예정 금액
-- (회원 id, 회원 이름, 12월 결제 예정 금액)

SELECT cl.client_id AS '회원 ID', cl.name AS '이름', CONCAT(SUM(pg.will_pay_cost), '원') AS '2025년 12월 결제 예정 금액'
FROM client cl
JOIN subscribe sub ON cl.client_id = sub.client_id
JOIN payment pg ON sub.subscribe_id = pg.subscribe_id
WHERE cl.client_id = 'cl_007' AND pg.will_pay_date BETWEEN '2025-12-01' AND '2025-12-31';


-- 3. cl_011 회원의 구독내역
-- (회원 id, 회원 이름, 구독내역 id, 구독 신청 날짜, 프로그램 이름, 요금제 이름, 요금제 가격, 해지 신청 날짜)

SELECT cl.client_id AS '회원 ID', cl.name AS '이름', sub.subscribe_id AS '구독내역 ID', sub.apply AS '구독 신청일',
		pg.name AS '프로그램', pl.name AS '요금제', CONCAT(pl.cost, '원') AS '가격', cnl.apply AS '해지 신청일'
FROM client cl
JOIN subscribe sub ON cl.client_id = sub.client_id
JOIN subscription sbt ON sub.subscription_id = sbt.subscription_id
JOIN program pg ON sbt.program_id = pg.program_id
JOIN plan pl ON sbt.plan_id = pl.plan_id
LEFT JOIN cancel cnl ON sub.subscribe_id = cnl.subscribe_id
WHERE cl.client_id = 'cl_011'
ORDER BY sub.subscribe_id;


-- 4. 7개 이상 구독 중인 회원
-- (회원 id, 회원 이름, 구독 중인 구독제 개수)

SELECT cl.client_id AS '회원 ID', cl.name AS '이름', COUNT(*) AS '구독 중인 구독제 개수'
FROM client cl
JOIN subscribe sub ON cl.client_id = sub.client_id
LEFT JOIN cancel cnl ON sub.subscribe_id = cnl.subscribe_id
WHERE cnl.subscribe_id IS NULL
GROUP BY cl.client_id, cl.name
HAVING COUNT(*) >= 7;


-- 5. cl_024 회원 일반에서 우수로 등업
-- (회원 ID, 회원 이름, 전화번호, 등급 이름)

UPDATE client
SET level_id = 'lv_002'
WHERE client_id = 'cl_024';

SELECT cl.client_id AS '회원 ID', cl.name AS '이름', cl.tel AS '전화번호', lv.name AS '등급'
FROM client cl
JOIN level lv ON cl.level_id = lv.level_id
WHERE cl.client_id = 'cl_024';


-- 6. 2025년 9월 12일 결제한 회원
-- (회원 id, 회원 이름, 9월 12일 결제된 금액)

SELECT cl.client_id AS '회원 ID', cl.name AS '이름', pg.name AS '프로그램', pl.name AS '요금제',
		CONCAT(pay.payed_cost, '원') AS '2025/9/12 결제 금액'
FROM payment pay
JOIN subscribe sub ON pay.subscribe_id = sub.subscribe_id
JOIN client cl ON sub.client_id = cl.client_id
JOIN subscription sbt ON sub.subscription_id = sbt.subscription_id
JOIN plan pl ON sbt.plan_id = pl.plan_id
JOIN program pg ON sbt.program_id = pg.program_id
WHERE pay.payed_date = '2025-09-12'
order by cl.client_id;


-- 7. 새로운 회원 가입
-- (회원 ID, 회원 이름, 전화번호, 등급 이름)

INSERT INTO client
VALUES ('cl_031', '주연오', '010-2402-5962', 'lv_001');

SELECT cl.client_id AS '회원 ID', cl.name AS '이름', cl.tel AS '전화번호', lv.name AS '등급'
FROM client cl
JOIN level lv ON cl.level_id = lv.level_id
ORDER BY cl.client_id;


-- 8. cl_029 회원의 새로운 구독 신청 및 조회 (2025/12/1, 교보문고 sam, 도서 - 스탠다드)
-- (구독내역 id, 회원 id, 회원 이름, 구독 신청 날짜, 구독제 id, 프로그램 이름, 요금제 이름)

INSERT INTO subscribe
VALUES ('sub_116', '2025-12-01', 'cl_029', 'sbt_128');

SELECT sub.subscribe_id AS '구독내역 ID', cl.client_id AS '회원 ID', cl.name AS '이름', sub.apply AS '구독 신청일',
		sbt.subscription_id AS '구독제 ID', pg.name AS '프로그램', pl.name AS '요금제'
FROM subscribe sub
JOIN client cl ON sub.client_id = cl.client_id
JOIN subscription sbt ON sub.subscription_id = sbt.subscription_id
JOIN plan pl ON sbt.plan_id = pl.plan_id
JOIN program pg ON sbt.program_id = pg.program_id
order by sub.subscribe_id;


-- 9. 2025년 11월 해지 신청 내역
-- (해지내역 id, 회원 id, 회원 이름, 구독내역 id, 구독 신청 날짜, 해지 신청 날짜, 프로그램 이름, 요금제 이름)

SELECT cnl.cancel_id AS '해지내역 ID', cl.client_id AS '회원 ID', cl.name AS '이름', sub.subscribe_id AS '구독내역 ID',
		sub.apply AS '구독 신청일', cnl.apply AS '해지 신청일', pg.name AS '프로그램', pl.name AS '요금제'
FROM cancel cnl
JOIN subscribe sub ON cnl.subscribe_id = sub.subscribe_id
JOIN client cl ON sub.client_id = cl.client_id
JOIN subscription sbt ON sub.subscription_id = sbt.subscription_id
JOIN program pg ON sbt.program_id = pg.program_id
JOIN plan pl ON sbt.plan_id = pl.plan_id
WHERE cnl.apply BETWEEN '2025-11-01' AND '2025-11-30';

/* [등급]
 lv_001: 일반
 lv_002: 우수
 lv_003: VIP
 lv_004: VVIP
*/

-- 일반 등급
INSERT INTO level VALUES ('lv_001', '일반', '기본 서비스 제공 (할인 없음)');

-- 우수 등급
INSERT INTO level VALUES ('lv_002', '우수', '매달 1000원 할인 쿠폰 1매 제공');

-- VIP 등급
INSERT INTO level VALUES ('lv_003', 'VIP', '매달 1000원 할인 쿠폰 3매 제공');

-- VVIP 등급
INSERT INTO level VALUES ('lv_004', 'VVIP', '매달 1000원 할인 쿠폰 5매 제공 + CS 우선 처리');

SELECT * FROM level;

COMMIT;
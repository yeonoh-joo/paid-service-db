/* [프로그램]
 pg_001~010: 잡지
 pg_011~019: OTT
 pg_020~029: 게임
 pg_030~039: 편집툴
 pg_040~049: 도서
 pg_050~059: 음악
*/

-- 잡지
INSERT INTO program VALUES ('pg_001', '보그(Vogue)', '잡지');
INSERT INTO program VALUES ('pg_002', '지큐(GQ)', '잡지');
INSERT INTO program VALUES ('pg_003', '에스콰이어(Esquire)', '잡지');
INSERT INTO program VALUES ('pg_004', '엘르(Elle)', '잡지');
INSERT INTO program VALUES ('pg_005', '코스모폴리탄(Cosmopolitan)', '잡지');
INSERT INTO program VALUES ('pg_006', '마리끌레르(Marie Claire)', '잡지');
INSERT INTO program VALUES ('pg_007', '하퍼스 바자(Harpers Bazaar)', '잡지');
INSERT INTO program VALUES ('pg_008', '얼루어(Allure)', '잡지');
INSERT INTO program VALUES ('pg_009', '더블유(W Korea)', '잡지');
INSERT INTO program VALUES ('pg_010', '내셔널지오그래픽(National Geographic)', '잡지');

-- OTT
INSERT INTO program VALUES ('pg_011', '넷플릭스(Netflix)', 'OTT');
INSERT INTO program VALUES ('pg_012', '디즈니플러스(Disney+)', 'OTT');
INSERT INTO program VALUES ('pg_013', '티빙(Tving)', 'OTT');
INSERT INTO program VALUES ('pg_014', '웨이브(Wavve)', 'OTT');
INSERT INTO program VALUES ('pg_015', '쿠팡플레이(Coupang Play)', 'OTT');
INSERT INTO program VALUES ('pg_016', '왓챠(Watcha)', 'OTT');
INSERT INTO program VALUES ('pg_017', '애플TV+(Apple TV+)', 'OTT');
INSERT INTO program VALUES ('pg_018', '아마존 프라임(Amazon Prime)', 'OTT');
INSERT INTO program VALUES ('pg_019', '라프텔(Laftel)', 'OTT');

-- 게임
INSERT INTO program VALUES ('pg_020', '아마존 루나(Amazon Luna)', '게임');
INSERT INTO program VALUES ('pg_021', 'Xbox 게임패스(Xbox Game Pass)', '게임');
INSERT INTO program VALUES ('pg_022', '지포스 나우(GeForce Now)', '게임');
INSERT INTO program VALUES ('pg_023', 'PS Plus(PlayStation Plus)', '게임');
INSERT INTO program VALUES ('pg_024', '닌텐도 온라인(Nintendo Online)', '게임');
INSERT INTO program VALUES ('pg_025', 'EA Play(EA Play)', '게임');
INSERT INTO program VALUES ('pg_026', '유비소프트+(Ubisoft+)', '게임');
INSERT INTO program VALUES ('pg_027', '애플 아케이드(Apple Arcade)', '게임');
INSERT INTO program VALUES ('pg_028', '구글 플레이패스(Google Play Pass)', '게임');
INSERT INTO program VALUES ('pg_029', '험블 초이스(Humble Choice)', '게임');

-- 편집툴 (Creative Tools)
INSERT INTO program VALUES ('pg_030', '다빈치 리졸브(DaVinci Resolve)', '편집툴');
INSERT INTO program VALUES ('pg_031', '어도비(Adobe)', '편집툴');
INSERT INTO program VALUES ('pg_032', '피그마(Figma)', '편집툴');
INSERT INTO program VALUES ('pg_033', '캔바(Canva)', '편집툴');
INSERT INTO program VALUES ('pg_034', '스케치(Sketch)', '편집툴');
INSERT INTO program VALUES ('pg_035', '클립스튜디오(Clip Studio)', '편집툴');
INSERT INTO program VALUES ('pg_036', '망고보드(MangoBoard)', '편집툴');
INSERT INTO program VALUES ('pg_037', '미리캔버스(MiriCanvas)', '편집툴');
INSERT INTO program VALUES ('pg_038', '프로크리에이트(Procreate)', '편집툴');
INSERT INTO program VALUES ('pg_039', '스케치업(SketchUp)', '편집툴');

-- 도서
INSERT INTO program VALUES ('pg_040', '크레마 클럽(Crema Club)', '도서');
INSERT INTO program VALUES ('pg_041', '밀리의 서재(Millie)', '도서');
INSERT INTO program VALUES ('pg_042', '리디 셀렉트(Ridi Select)', '도서');
INSERT INTO program VALUES ('pg_043', '교보 sam(Kyobo sam)', '도서');
INSERT INTO program VALUES ('pg_044', '윌라(Welaaa)', '도서');
INSERT INTO program VALUES ('pg_045', '스토리텔(Storytel)', '도서');
INSERT INTO program VALUES ('pg_046', '카카오페이지(KakaoPage)', '도서');
INSERT INTO program VALUES ('pg_047', '알라딘 eBook(Aladdin eBook)', '도서');
INSERT INTO program VALUES ('pg_048', '킨들 언리미티드(Kindle Unlimited)', '도서');
INSERT INTO program VALUES ('pg_049', '북큐브(BookCube)', '도서');

-- 음악
INSERT INTO program VALUES ('pg_050', '아마존 뮤직(Amazon Music)', '음악');
INSERT INTO program VALUES ('pg_051', '멜론(Melon)', '음악');
INSERT INTO program VALUES ('pg_052', '유튜브 뮤직(YouTube Music)', '음악');
INSERT INTO program VALUES ('pg_053', '지니뮤직(Genie)', '음악');
INSERT INTO program VALUES ('pg_054', '벅스(Bugs)', '음악');
INSERT INTO program VALUES ('pg_055', '플로(Flo)', '음악');
INSERT INTO program VALUES ('pg_056', '스포티파이(Spotify)', '음악');
INSERT INTO program VALUES ('pg_057', '애플뮤직(Apple Music)', '음악');
INSERT INTO program VALUES ('pg_058', '바이브(Vibe)', '음악');
INSERT INTO program VALUES ('pg_059', '사운드클라우드(SoundCloud)', '음악');

SELECT * FROM program;

COMMIT;
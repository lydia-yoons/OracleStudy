SELECT USER
FROM DUAL;
--==>> SCOTT


EXEC PRC_입고_UPDATE(1, 30);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


SELECT *
FROM TBL_입고;

SELECT *
FROM TBL_출고;

SELECT *
FROM TBL_상품;

EXEC PRC_입고_UPDATE(1, 30);
--==>> ORA-20003: 입고 수량이 부족합니다!


EXEC PRC_입고_UPDATE(1, 50);


UPDATE TBL_입고
SET 입고수량 = 200
WHERE  입고번호 = 1;

--------------------------------------------------------------------------------

SELECT *
FROM TBL_INSA;
--==>>
/*1061	이다영	951027-2234567	2021-09-16	서울	010-4113-2353	영업부	대리	10000000	2000000
1062	박혜진	941013-2234567	2021-09-16	경기	010-6331-3939	개발부	대리	10000000	2000000
1001	홍길동	771212-1022432	1998-10-11	서울	011-2356-4528	기획부	부장	2610000	200000
1002	이순신	801007-1544236	2000-11-29	경기	010-4758-6532	총무부	사원	1320000	200000
1003	이순애	770922-2312547	1999-02-25	인천	010-4231-1236	개발부	부장	2550000	160000
1004	김정훈	790304-1788896	2000-10-01	전북	019-5236-4221	영업부	대리	1954200	170000
1005	한석봉	811112-1566789	2004-08-13	서울	018-5211-3542	총무부	사원	1420000	160000
1006	이기자	780505-2978541	2002-02-11	인천	010-3214-5357	개발부	과장	2265000	150000
1007	장인철	780506-1625148	1998-03-16	제주	011-2345-2525	개발부	대리	1250000	150000
1008	김영년	821011-2362514	2002-04-30	서울	016-2222-4444	홍보부	사원	950000	145000
1009	나윤균	810810-1552147	2003-10-10	경기	019-1111-2222	인사부	사원	840000	220400
1010	김종서	751010-1122233	1997-08-08	부산	011-3214-5555	영업부	부장	2540000	130000
1011	유관순	801010-2987897	2000-07-07	서울	010-8888-4422	영업부	사원	1020000	140000
1012	정한국	760909-1333333	1999-10-16	강원	018-2222-4242	홍보부	사원	880000	114000
1013	조미숙	790102-2777777	1998-06-07	경기	019-6666-4444	홍보부	대리	1601000	103000
1014	황진이	810707-2574812	2002-02-15	인천	010-3214-5467	개발부	사원	1100000	130000
1015	이현숙	800606-2954687	1999-07-26	경기	016-2548-3365	총무부	사원	1050000	104000
1016	이상헌	781010-1666678	2001-11-29	경기	010-4526-1234	개발부	과장	2350000	150000
1017	엄용수	820507-1452365	2000-08-28	인천	010-3254-2542	개발부	사원	950000	210000
1018	이성길	801028-1849534	2004-08-08	전북	018-1333-3333	개발부	사원	880000	123000
1019	박문수	780710-1985632	1999-12-10	서울	017-4747-4848	인사부	과장	2300000	165000
1020	유영희	800304-2741258	2003-10-10	전남	011-9595-8585	자재부	사원	880000	140000
1021	홍길남	801010-1111111	2001-09-07	경기	011-9999-7575	개발부	사원	875000	120000
1022	이영숙	800501-2312456	2003-02-25	전남	017-5214-5282	기획부	대리	1960000	180000
1023	김인수	731211-1214576	1995-02-23	서울		영업부	부장	2500000	170000
1024	김말자	830225-2633334	1999-08-28	서울	011-5248-7789	기획부	대리	1900000	170000
1025	우재옥	801103-1654442	2000-10-01	서울	010-4563-2587	영업부	사원	1100000	160000
1026	김숙남	810907-2015457	2002-08-28	경기	010-2112-5225	영업부	사원	1050000	150000
1027	김영길	801216-1898752	2000-10-18	서울	019-8523-1478	총무부	과장	2340000	170000
1028	이남신	810101-1010101	2001-09-07	제주	016-1818-4848	인사부	사원	892000	110000
1029	김말숙	800301-2020202	2000-09-08	서울	016-3535-3636	총무부	사원	920000	124000
1030	정정해	790210-2101010	1999-10-17	부산	019-6564-6752	총무부	과장	2304000	124000
1031	지재환	771115-1687988	2001-01-21	서울	019-5552-7511	기획부	부장	2450000	160000
1032	심심해	810206-2222222	2000-05-05	전북	016-8888-7474	자재부	사원	880000	108000
1033	김미나	780505-2999999	1998-06-07	서울	011-2444-4444	영업부	사원	1020000	104000
1034	이정석	820505-1325468	2005-09-26	경기	011-3697-7412	기획부	사원	1100000	160000
1035	정영희	831010-2153252	2002-05-16	인천		개발부	사원	1050000	140000
1036	이재영	701126-2852147	2003-08-10	서울	011-9999-9999	자재부	사원	960400	190000
*/


SELECT NAME, TEL
FROM TBL_INSA;
--==>>
/*이다영	010-4113-2353
박혜진	010-6331-3939
홍길동	011-2356-4528
이순신	010-4758-6532
이순애	010-4231-1236
김정훈	019-5236-4221
한석봉	018-5211-3542
이기자	010-3214-5357
장인철	011-2345-2525
김영년	016-2222-4444
나윤균	019-1111-2222
김종서	011-3214-5555
유관순	010-8888-4422
정한국	018-2222-4242
조미숙	019-6666-4444
황진이	010-3214-5467
이현숙	016-2548-3365
이상헌	010-4526-1234
엄용수	010-3254-2542
이성길	018-1333-3333
박문수	017-4747-4848
유영희	011-9595-8585
홍길남	011-9999-7575
이영숙	017-5214-5282
김인수	
김말자	011-5248-7789
우재옥	010-4563-2587
김숙남	010-2112-5225
김영길	019-8523-1478
이남신	016-1818-4848
김말숙	016-3535-3636
정정해	019-6564-6752
지재환	019-5552-7511
심심해	016-8888-7474
김미나	011-2444-4444
이정석	011-3697-7412
정영희	
이재영	011-9999-9999
최석규	011-7777-7777
손인수	010-6542-7412
고순정	010-2587-7895
박세열	016-4444-7777
문길수	016-4444-5555
채정희	011-5125-5511
양미옥	016-8548-6547
지수환	011-5555-7548
홍원신	011-7777-7777
허경운	017-3333-3333
산마루	018-0505-0505
이기상	
이미성	010-6654-8854
이미인	011-8585-5252
권영미	011-5555-7548
권옥경	010-3644-5577
김싱식	011-7585-7474
정상호	016-1919-4242
정한나	016-2424-4242
전용재	010-7549-8654
*/



--○ 실습 테이블 생성(TBL_TEST1)
CREATE TABLE TBL_TEST1
( ID    NUMBER
, NAME  VARCHAR2(30)
, TEL   VARCHAR2(60)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.

--○ 생성된 테이블에 제약조건 추가
--  ID 컬럼에 PK 제약조건 지정
ALTER TABLE TBL_TEST1
ADD CONSTRAINT TEST1_ID_PK PRIMARY KEY(ID);
--==>> Table TBL_TEST1이(가) 변경되었습니다.


--○ 실습 테이블 생성(TBL_EVENTLOG)
CREATE TABLE TBL_EVENTLOG
( MEMO  VARCHAR2(200)
, ILJA  DATE DEFAULT SYSDATE
);
--==>> Table TBL_EVENTLOG이(가) 생성되었습니다.

SELECT *
FROM TBL_TEST1;
--==>> 조회결과없음

SELECT *
FROM TBL_EVENTLOG;
--==>> 조회결과없음



ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

--○ TBL_TEST1 테이블에 데이터 입력
INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(1,'이찬호', '010-1111-1111');
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_TEST1(ID,NAME,TEL)
VALUES(2,'장민지', '010-2222-2222');
--==>> 1 행 이(가) 삽입되었습니다.


--○ TBL_TEST1 테이블 업데이트
UPDATE TBL_TEST1
SET NAME = '차노'
WHERE ID = 1;
--==>> 1 행 이(가) 업데이트되었습니다.

--○ TBL_TEST1 테이블의 데이터 삭제
DELETE
FROM TBL_TEST1
WHERE ID = 1;
--==>> 1 행 이(가) 삭제되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID = 2;
--==>> 1 행 이(가) 삭제되었습니다.


--○ 확인
SELECT *
FROM TBL_TEST1;
--==>> 조회 결과 없음

--○ 커밋
COMMIT;
--==>> 커밋 완료.


--○ TBL_EVENTLOG 테이블 조회
SELECT *
FROM TBL_EVENTLOG;
--==>>
/*
INSERT 쿼리문이 수행되었습니다.	2021-09-17 17:20:32
INSERT 쿼리문이 수행되었습니다.	2021-09-17 17:21:13
UPDATE 쿼리문이 수행되었습니다.	2021-09-17 17:21:36
DELETE 쿼리문이 수행되었습니다.	2021-09-17 17:21:57
DELETE 쿼리문이 수행되었습니다.	2021-09-17 17:22:12
*/


SELECT TO_CHAR(SYSDATE, 'HH24') "결과확인"
FROM DUAL;
--==>> 17 → 문자타입

SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) "결과확인"
FROM DUAL;
--==>> 17 → 숫자타입


--○ 테스트
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(3, '윤유동', '010-3333-3333');
--==>> 1 행 이(가) 삽입되었습니다.


INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(4, '김진령', '010-4444-4444');
--==>> 1 행 이(가) 삽입되었습니다.

UPDATE TBL_TEST1
SET NAME='정효진'
WHERE ID=4;
--==>> 1 행 이(가) 업데이트되었습니다.

DELETE
FROM TBL_TEST1
WHERE ID=4;
--==>> 1 행 이(가) 삭제되었습니다.

--○ 확인
SELECT *
FROM TBL_TEST1;
--==>> 3	윤유동	010-3333-3333


COMMIT;
--==>> 커밋 완료.


-- 오라클 서버의 시간을 21시 대로 변경
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(5, '서승균', '010-5555-5555');
--==>> 시간을 벗어났기때문에 에러발생
/*
INSERT INTO TBL_TEST1(ID, NAME, TEL)
VALUES(5, '서승균', '010-5555-5555')
오류 보고 -
ORA-20003: 작업은 08:00 ~  18:00 까지만 가능합니다.
*/

-- 시간이 변경된 상태에서 데이터 수정
UPDATE TBL_TEST1
SET NAME='서승균'
WHERE ID=3;
--==>> 에러발생
/*
ORA-20003: 작업은 08:00 ~  18:00 까지만 가능합니다.
*/

-- 시간이 변경된 상태에서 데이터 삭제
DELETE
FROM TBL_TEST1
WHERE ID=3;
--==>> 에러발생
/*
ORA-20003: 작업은 08:00 ~  18:00 까지만 가능합니다.
*/

SELECT *
FROM TBL_TEST1;
--==>> 3	윤유동	010-3333-3333

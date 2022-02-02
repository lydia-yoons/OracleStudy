SELECT USER
FROM DUAL;
--==>> SCOTT


--○ 생성한 함수(FN_GENDER())가 제대로 작동하는지의 여부 확인
SELECT NAME, SSN, FN_GENDER(SSN) "함수호출결과"
FROM TBL_INSA;
--==>>
/*
홍길동	771212-1022432	남자
이순신	801007-1544236	남자
이순애	770922-2312547	여자
김정훈	790304-1788896	남자
한석봉	811112-1566789	남자
이기자	780505-2978541	여자
장인철	780506-1625148	남자
김영년	821011-2362514	여자
나윤균	810810-1552147	남자
김종서	751010-1122233	남자
유관순	801010-2987897	여자
정한국	760909-1333333	남자
조미숙	790102-2777777	여자
황진이	810707-2574812	여자
이현숙	800606-2954687	여자
이상헌	781010-1666678	남자
엄용수	820507-1452365	남자
이성길	801028-1849534	남자
박문수	780710-1985632	남자
유영희	800304-2741258	여자
홍길남	801010-1111111	남자
이영숙	800501-2312456	여자
김인수	731211-1214576	남자
김말자	830225-2633334	여자
우재옥	801103-1654442	남자
김숙남	810907-2015457	여자
김영길	801216-1898752	남자
이남신	810101-1010101	남자
김말숙	800301-2020202	여자
정정해	790210-2101010	여자
지재환	771115-1687988	남자
심심해	810206-2222222	여자
김미나	780505-2999999	여자
이정석	820505-1325468	남자
정영희	831010-2153252	여자
이재영	701126-2852147	여자
최석규	770129-1456987	남자
손인수	791009-2321456	여자
고순정	800504-2000032	여자
박세열	790509-1635214	남자
문길수	721217-1951357	남자
채정희	810709-2000054	여자
양미옥	830504-2471523	여자
지수환	820305-1475286	남자
홍원신	690906-1985214	남자
허경운	760105-1458752	남자
산마루	780505-1234567	남자
이기상	790604-1415141	남자
이미성	830908-2456548	여자
이미인	810403-2828287	여자
권영미	790303-2155554	여자
권옥경	820406-2000456	여자
김싱식	800715-1313131	남자
정상호	810705-1212141	남자
정한나	820506-2425153	여자
전용재	800605-1456987	남자
이미경	780406-2003214	여자
김신제	800709-1321456	남자
임수봉	810809-2121244	여자
김신애	810809-2111111	여자
*/


--○ 생성한 함수(FN_POW())가 제대로 작동하는지의 여부 확인
SELECT FN_POW_2(10, 30)
FROM DUAL;

SELECT FN_POW_2(2, 8)
FROM DUAL;
--==>> 256





-- 프로시저 관련 실습

-- 실습 테이블 생성(TBL_STUDENTS)
CREATE TABLE TBL_STUDENTS
( ID    VARCHAR2(10)
, NAME  VARCHAR2(40)
, TEL   VARCHAR2(20)
, ADDR  VARCHAR2(100)
);
--==>> Table TBL_STUDENTS이(가) 생성되었습니다.


-- 실습 테이블 생성(TBL_IDPW)
CREATE TABLE TBL_IDPW
( ID    VARCHAR2(10)
, PW    VARCHAR2(20)
, CONSTRAINT IDPW_ID_PK PRIMARY KEY(ID)
);
--==>> Table TBL_IDPW이(가) 생성되었습니다.

-- 두 테이블에 데이터 입력
INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
VALUES('superman', '손범석', '010-1111-1111', '서울 강남구...');
INSERT INTO TBL_IDPW(ID, PW)
VALUES('superman','java006$');
--==>> 1 행 이(가) 삽입되었습니다.*2

SELECT *
FROM TBL_STUDENTS;
--==>> superman	손범석	010-1111-1111	서울 강남구...

SELECT *
FROM TBL_IDPW;
--==>> superman	java006$


-- 위의 업무를 프로시저(INSERT 프로시저, 입력 프로시저)를 생성하게 되면
EXEC PRC_STUDENTS_INSERT('batman','java006$', '송해덕','010-2222-2222','경기도 고양시');
-- 이와 같은 구문 한 줄로 양쪽 테이블에 데이터를 모두 제대로 입력할 수 있다.


DESC TBL_STUDENTS;
DESC TBL_IDPW

--○ 생성한 프로시저(PRC_STUDENTS_INSERT())가 제대로 작동하는지의 여부 확인
--  → 프로시저 호출
EXEC PRC_STUDENTS_INSERT('batman','java006$', '송해덕','010-2222-2222','경기도 고양시');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>>>
/*
superman	손범석	010-1111-1111	서울 강남구...
batman	    송해덕	010-2222-2222	경기도 고양시
*/


SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	java006$
batman	    java006$
*/

--○ 학번, 이름, 국어점수, 영어점수, 수학점수 데이터를
--  입력받을 수 있는 실습 테이블 생성(TBL_SUNGJUK)
CREATE TABLE TBL_SUNGJUK
( HAKBUN    NUMBER
, NAME      VARCHAR2(40)
, KOR       NUMBER(3)
, ENG       NUMBER(3)
, MAT       NUMBER(3)
, CONSTRAINT SUNGJUK_HAKBUN_PK PRIMARY KEY(HAKBUN)
);
--==>> Table TBL_SUNGJUK이(가) 생성되었습니다.

--○ 생성된 테이블에 컬럼 구조 추가
--  (총점 → TOT, 평균 → AVG, 등급 → GRADE)
ALTER TABLE TBL_SUNGJUK
ADD( TOT NUMBER(3), AVG NUMBER(4, 1), GRADE CHAR);
--==>> Table TBL_SUNGJUK이(가) 변경되었습니다.

--※ 여기서 추가한 컬럼에 대한 항목들은
--  프로시저 실습을 위해 추가한 것일 뿐
--  실제 테이블 구조에 적합하지도, 바람직하지도 않은 내용이다.

--○ 변경된 테이블의 구조 확인
DESC TBL_SUNGJUK;
--==>>
/*
이름     널?       유형           
------ -------- ------------ 
HAKBUN NOT NULL NUMBER       
NAME            VARCHAR2(40) 
KOR             NUMBER(3)    
ENG             NUMBER(3)    
MAT             NUMBER(3)    
TOT             NUMBER(3)    
AVG             NUMBER(4,1)  
GRADE           CHAR(1)      
*/


--○ 생성한 프로시저(PRC_SUNGJUK_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_SUNGJUK_INSERT(1, '김진희', 90, 80, 70);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_SUNGJUK;
--==>> 1	김진희	90	80	70	240	80	B


EXEC PRC_SUNGJUK_INSERT(2, '김소연', 98, 88, 78);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	김진희	90	80	70	240	80	B
2	김소연	98	88	78	264	88	B
*/


--○ 생성한 프로시저(PRC_SUNGJUK_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_SUNGJUK_UPDATE(2, 100, 100, 100);
--==> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_SUNGJUK;
--==>> 2	김소연	100	100	100	300	100	A



EXEC PRC_SUNGJUK_UPDATE(1, 55, 66, 77);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_SUNGJUK;
--==>>
/*
1	김진희	55	66	77	198	66	D
2	김소연	100	100	100	300	100	A
*/


SELECT *
FROM TBL_STUDENTS;
SELECT *
FROM TBL_IDPW;
--==>>
/*
superman	손범석	010-1111-1111	서울 강남구...
batman	    송해덕	010-2222-2222	경기도 고양시

superman	java006$
batman	    java006$
*/

DESC TBL_STUDENTS;
DESC TBL_IDPW;




UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR
            FROM TBL_IDPW I JOIN TBL_STUDENTS S
            ON I.ID = S.ID) T

--○ 생성한 프로시저(PRC_SUNGJUK_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_STUDENTS_UPDATE('superman', 'java001', '010-9999-9999', '인천');
-->> 이걸로 확인해볼꺼임... 이거 실행전에 먼저..... 데이터 확인해보자

--○ 프로시저 호출 전에 기존 데이터 확인
SELECT *
FROM TBL_STUDENTS;
--==>>
/*
superman	손범석	010-1111-1111	서울 강남구...
batman	송해덕	010-2222-2222	경기도 고양시
*/
SELECT *
FROM TBL_IDPW;
--==>>
/*superman	java006$
batman	    java006$
*/


--○ 생성한 프로시저(PRC_SUNGJUK_INSERT())가 제대로 작동하는지의 여부 확인
-- → 프로시저 호출
EXEC PRC_STUDENTS_UPDATE('superman', 'java001', '010-9999-9999', '인천');
--> 패스워드 맞지 않음
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>> 변경안됨 (패스워드 틀려서)
/*
superman	손범석	010-1111-1111	서울 강남구...
batman	송해덕	010-2222-2222	경기도 고양시
*/

EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '인천');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_STUDENTS;
--==>> 범석이 데이터 바뀜
/*
superman	손범석	010-9999-9999	인천
batman	송해덕	010-2222-2222	경기도 고양시
*/


SELECT *
FROM TBL_INSA;

DESC TBL_INSA;



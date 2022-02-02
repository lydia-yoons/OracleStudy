SELECT USER
FROM DUAL;
--==>> HR

--■■■ PRIMARY KEY ■■■--

-- 1. 테이블에 대한 기본키를 생성한다.

-- 2. 테이블에서 각 행을 유일하게 식별하는 컬럼 또는 컬럼의 집합이다.
--   기본 키는 테이블 당 최대 하나만 존재한다.
--   그러나 반드시 하나의 컬럼으로만 구성되는 것은 아니다.
--   NULL일 수 없고, 이미 테이블에 존재하고 있는 데이터를
--   다시 입력할 수 없도록 처리된다.
--   UNIQUE INDEX가 자동으로 생성된다.(오라클이 자체적으로 만든다)

-- 3. 형식 및 구조
-- ① 컬럼 레벨의 형식
--  컬럼명 데이터타입[CONSTRAINT CONSTRAINT명] PRIMARY KEY[(컬럼명,...)]

-- ② 테이블 레벨의 형식
--  컬럼명 데이터타입
-- , 컬럼명 데이터타입
-- , CONSTRAINT CONSTRAINT명 PRIMARY KEY(컬럼명[, ...])

-- 4. CONSTRAINT 추가 시 CONSTRAINT 명을 생략하면
--   오라클 서버가 자동적으로 CONSTRAINT명을 부여하게 된다.
--   일반적으로 CONSTRAINT명은 『테이블명_컬럼명_CONSTRAINT약어』
--   형식으로 기술한다.

--○ PK 지정 실습(① 컬럼 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST1
( COL1 NUMBER(5)    PRIMARY KEY
, COL2 VARCHAR2(30)
);
--==>> Table TBL_TEST1이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST1(COL1) VALUES(4);
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2, 'ABCD');      --> 에러발생
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(2, 'KKKK');      --> 에러발생
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(NULL, NULL);     --> 에러발생
INSERT INTO TBL_TEST1(COL1,COL2) VALUES(NULL, 'STUDY');  --> 에러발생
INSERT INTO TBL_TEST1(COL2) VALUES('STUDY');             --> 에러발생


COMMIT;
--==>>커밋 완료.

SELECT *
FROM TBL_TEST1;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

DESC TBL_TEST1;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)         → PK 제약 확인 불가
COL2          VARCHAR2(30) 
*/


--○ 제약조건 확인
SELECT *
FROM USER_CONSTRAINTS;
--==>>
/*
HR	REGION_ID_NN	C	REGIONS	"REGION_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	REG_ID_PK	P	REGIONS					ENABLED	NOT DEFERRABLE
HR	COUNTRY_ID_NN	C	COUNTRIES	"COUNTRY_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	COUNTRY_C_ID_PK	P	COUNTRIES					ENABLED	NOT DEFERRABLE
HR	COUNTR_REG_FK	R	COUNTRIES		HR	REG_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	LOC_CITY_NN	C	LOCATIONS	"CITY" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	LOC_ID_PK	P	LOCATIONS					ENABLED	NOT DEFERRABLE
HR	LOC_C_ID_FK	R	LOCATIONS		HR	COUNTRY_C_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	DEPT_NAME_NN	C	DEPARTMENTS	"DEPARTMENT_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	DEPT_ID_PK	P	DEPARTMENTS					ENABLED	NOT DEFERRABLE
HR	DEPT_LOC_FK	R	DEPARTMENTS		HR	LOC_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	JOB_TITLE_NN	C	JOBS	"JOB_TITLE" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	JOB_ID_PK	P	JOBS					ENABLED	NOT DEFERRABLE
HR	EMP_LAST_NAME_NN	C	EMPLOYEES	"LAST_NAME" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	EMP_EMAIL_NN	C	EMPLOYEES	"EMAIL" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	EMP_HIRE_DATE_NN	C	EMPLOYEES	"HIRE_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	EMP_JOB_NN	C	EMPLOYEES	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	EMP_SALARY_MIN	C	EMPLOYEES	salary > 0				ENABLED	NOT DEFERRABLE
HR	EMP_EMAIL_UK	U	EMPLOYEES					ENABLED	NOT DEFERRABLE
HR	EMP_EMP_ID_PK	P	EMPLOYEES					ENABLED	NOT DEFERRABLE
HR	EMP_DEPT_FK	R	EMPLOYEES		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	EMP_JOB_FK	R	EMPLOYEES		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	EMP_MANAGER_FK	R	EMPLOYEES		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	DEPT_MGR_FK	R	DEPARTMENTS		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	JHIST_EMPLOYEE_NN	C	JOB_HISTORY	"EMPLOYEE_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	JHIST_START_DATE_NN	C	JOB_HISTORY	"START_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	JHIST_END_DATE_NN	C	JOB_HISTORY	"END_DATE" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	JHIST_JOB_NN	C	JOB_HISTORY	"JOB_ID" IS NOT NULL				ENABLED	NOT DEFERRABLE
HR	JHIST_DATE_INTERVAL	C	JOB_HISTORY	end_date > start_date				ENABLED	NOT DEFERRABLE
HR	JHIST_EMP_ID_ST_DATE_PK	P	JOB_HISTORY					ENABLED	NOT DEFERRABLE
HR	JHIST_JOB_FK	R	JOB_HISTORY		HR	JOB_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	JHIST_EMP_FK	R	JOB_HISTORY		HR	EMP_EMP_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	JHIST_DEPT_FK	R	JOB_HISTORY		HR	DEPT_ID_PK	NO ACTION	ENABLED	NOT DEFERRABLE
HR	SYS_C004102	O	EMP_DETAILS_VIEW					ENABLED	NOT DEFERRABLE
HR	SYS_C007039	P	TBL_TEST1					ENABLED	NOT DEFERRABLE
*/

SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'TBL_TEST1';
--==>>
/*
HR	SYS_C007039	P	TBL_TEST1					ENABLED	NOT DEFERRABLE	IMMEDIATE	VALIDATED	GENERATED NAME			21/09/09
*/




--○ 제약조건이 설정된 소유주, 제약조건명, 테이블명, 제약조건종류, 컬럼명 항목 조회
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
    AND UC.TABLE_NAME='TBL_TEST1';
--==>>
/*
HR	SYS_C007039	TBL_TEST1	P	COL1
*/

--○ PK 지정 실습(② 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST2
( COL1 NUMBER(5)    
, COL2 VARCHAR(30)
, CONSTRAINT TEST2_COL1_PK  PRIMARY KEY(COL1)
);
--==>> Table TBL_TEST2이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST2(COL1) VALUES(4);
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2, 'ABCD');      --> 에러발생
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(2, 'KKKK');      --> 에러발생
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(5, 'ABCD');
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(NULL, NULL);     --> 에러발생
INSERT INTO TBL_TEST2(COL1,COL2) VALUES(NULL, 'STUDY');  --> 에러발생
INSERT INTO TBL_TEST2(COL2) VALUES('STUDY');   

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_TEST2;
--==>>
/*
1	TEST
2	ABCD
3	
4	
5	ABCD
*/

--○ 제약조건이 설정된 소유주, 제약조건명, 테이블명, 제약조건종류, 컬럼명 항목 조회
SELECT UC.OWNER, UC.CONSTRAINT_NAME, UC.TABLE_NAME
     , UC.CONSTRAINT_TYPE, UCC.COLUMN_NAME
FROM USER_CONSTRAINTS UC, USER_CONS_COLUMNS UCC
WHERE UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME
    AND UC.TABLE_NAME='TBL_TEST2';
--==>>
/*
HR	TEST2_COL1_PK	TBL_TEST2	P	COL1
*/

--○ PK 지정 실습(③ 다중 커럼 PK지정)
-- 테이블 생성
/*
CREATE TABLE TBL_TEST3
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST3_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST3_COL2_PK PRIMARY KEY(COL2)
);
--(X)
*/

CREATE TABLE TBL_TEST3
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST3_COL1_COL2_PK PRIMARY KEY(COL1,COL2)
);
--==>> Table TBL_TEST3이(가) 생성되었습니다.


-- 데이터 입력
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, NULL);      --> 에러발생
INSERT INTO TBL_TEST3(COL1) VALUES(4);                  --> 에러발생
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(3, 'ABCD');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(2, 'TEST');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(1, 'KKKK');
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, NULL);   --> 에러발생
INSERT INTO TBL_TEST3(COL1, COL2) VALUES(NULL, 'STUDY');--> 에러발생
INSERT INTO TBL_TEST3(COL2) VALUES('TEST');             --> 에러발생


COMMIT;
--==>> 커밋 완료

SELECT *
FROM TBL_TEST3;
--==>>
/*
1	KKKK
1	TEST
2	ABCD
2	TEST
3	ABCD
*/


--○ PK 지정 실습 (④ 테이블 생성 이후 제약조건 추가 → PK 지정)
-- 테이블 생성
CREATE TABLE TBL_TEST4
( COL1 NUMBER(5)
, COL2 VARCHAR(30)
);
--==>> Table TBL_TEST4이(가) 생성되었습니다.

-- ※ 이미 만들어져 있는 테이블에
--  부여하려는 제약조건을 위반한 데이터가 포함되어 있을 경우
--  해당 테이블에 제약조건을 추가하려는 것은 불가능하다.

-- 제약조건 추가
ALTER TABLE TBL_TEST4
ADD CONSTRAINT TEST4_COL1_PK PRIMARY KEY(COL1);
--==>> Table TBL_TEST4이(가) 변경되었습니다.


-- 데이터 입력
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(3, NULL);    
INSERT INTO TBL_TEST4(COL1) VALUES(4);                
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(3, 'ABCD');  --> 에러발생
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(2, 'TEST');  --> 에러발생
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(1, 'KKKK');--> 에러발생
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(NULL, NULL);   --> 에러발생
INSERT INTO TBL_TEST4(COL1, COL2) VALUES(NULL, 'STUDY');--> 에러발생
INSERT INTO TBL_TEST4(COL2) VALUES('TEST');             --> 에러발생

COMMIT;

SELECT *
FROM TBL_TEST4;
--==>>
/*
1	TEST
2	ABCD
3	
4	
*/

--※ 제약조건 확인용 전용 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
     , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
     , UC.TABLE_NAME "TABLE_NAME"
     , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
     , UCC.COLUMN_NAME "COLUMN_NAME"
     , UC.SEARCH_CONDITION "SEARCH_CONDITION"
     , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_CONSTCHECK이(가) 생성되었습니다.

--○ 생성된 뷰(VIEW)를 통한 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST4';
--==>> HR	TEST4_COL1_PK	TBL_TEST4	P	COL1		


--------------------------------------------------------------------------------

--■■■ UNIQUE(UK:U) ■■■--

--1. 테이블에서 지정한 컬럼의 데이터가 중복되지 않고
--   테이블 내에서 유일할 수 있도록 설정하는 제약조건.
--   PRIMARY KEY와 유사한 제약조건이지만, NULL을 허용한다는 차이가 있다.
--   내부적으로 PRIMARY KEY와 마찬가지로 UNIQUE INDEX가 자동생성된다.
--   하나의 테이블 내에서 UNIQUE제약조건은 여러 번 설정하는 것이 가능하다.
--   즉, 하나의 테이블에 UNIQUE 제약조건을 여러개 만든느 것이
--   가능하다는 것이다.

-- 2. 형식 및 구조
-- ① 컬럼 레벨의 형식
--   컬럼명 데이터 타입 [CONSTRAINT CONSTRAINT명] UNIQUE

-- ② 테이블 레벨의 형식
--  컬럼명 데이터타입
--  , 컬럼명 데이터타입
--  , CONSTRAINT CONSTRAINT명 UNIQUE(컬럼명, ...)


--○ UK지정 실습(① 컬럼 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST5
( COL1 NUMBER(5)        PRIMARY KEY
, COL2 VARCHAR2(30)     UNIQUE
);
--==>> Table TBL_TEST5이(가) 생성되었습니다.

-- 제약조건 조회
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST5';
--==>>
/*
HR	SYS_C007043	TBL_TEST5	P	COL1		
HR	SYS_C007044	TBL_TEST5	U	COL2		
*/

--데이터 입력
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(3, NULL);
INSERT INTO TBL_TEST5(COL1) VALUES(4);
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2, 'ABCD');      --> 에러발생
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(2, 'KKKK');      --> 에러발생
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(5, 'ABCD');     --> 에러발생
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(NULL, NULL);     --> 에러발생
INSERT INTO TBL_TEST5(COL1,COL2) VALUES(NULL, 'STUDY');  --> 에러발생
INSERT INTO TBL_TEST5(COL2) VALUES('STUDY');   

COMMIT;
--==>> 커밋완료

SELECT *
FROM TBL_TEST5;
--==>>
/*
1	TEST
2	ABCD
3	
4	
*/

--○ UK 지정 실습(② 테이블 레벨의 형식)
CREATE TABLE TBL_TEST6
( COL1 NUMBER
, COL2 VARCHAR2(30)
, CONSTRAINT TEST6_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST6_COL2_UK UNIQUE(COL2)
);
--==> Table TBL_TEST6이(가) 생성되었습니다.


--제약조건확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST6';
--==>>
/*
HR	TEST6_COL1_PK	TBL_TEST6	P	COL1		
HR	TEST6_COL2_UK	TBL_TEST6	U	COL2		
*/


--○ UK 지정 실습(③ 테이블 생성 이후 제약조건 추가)
-- 테이블 생성
CREATE TABLE TBL_TESR7
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
);
--==>> Table TBL_TESR7이(가) 생성되었습니다.

-- 제약조건 확인(조회)
SELECT *
FROM VIEW_CONSTCHECK
WEHRE TABLE_NAME = 'TBL_TEST7';
--==>> 조회결과없음 → 제약조건을 설정하지 않았음

-- 제약조건 추가
ALTER TABLE TBL_TESR7
ADD (CONSTRAINT TESR7_COL1_PK PRIMARY KEY(COL1)
   , CONSTRAINT TESR7_COL2_UK UNIQUE(COL2) );
--==>> Table TBL_TESR7이(가) 변경되었습니다.

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESR7';
--==>> 
/*
HR	TESR7_COL1_PK	TBL_TESR7	P	COL1		
HR	TESR7_COL2_UK	TBL_TESR7	U	COL2		
*/

-------------------------------------------------------------------------------

--■■■ CHECH(CK:C) ■■■--

-- 1. 컬럼에서 허용 가능한 데이터의 범위나 조건을 지정하기 위한 제약조건
--  컬럼에 입력되는 데이터를 검사하여 조건에 맞는 데이터만 입력될 수 있도록 처리하며,
--  수정되는 데이터 또한 검사하여 조건에 맞는 데이터로 수정되는 것만 허용하는
--  기능을 수행하게 된다.

-- 2. 형식 및 구조
-- ① 컬럼 레벨의 형식
-- 컬럼명 데이터 타입 [CONSTRAINT CONSTRAINT명] CHECK (컬럼 조건)

-- ② 테이블 레벨의 형식
-- 컬럼명 데이터 타입
-- , 컬럼명 데이터 타입
-- , CONSTRAINT CONSTRAINT명 CHECK(컬럼 조건)


--※ NUMBER(38) 까지...
--   CHAR(2000) 까지...
--   VARCHAR(4000) 까지...
--   NCHAR(1000) 까지...
--   NVARCHAR2(2000) 까지...


--○ CK 지정 실습(① 컬럼 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST8
( COL1 NUMBER(5)        PRIMARY KEY
, COL2 VARCHAR(30)
, COL3 NUMBER(3)        CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST8이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(1, '승균', 100);
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(2, '범석', 101);   --> 에러 발생
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(3, '진희', -1);    --> 에러 발생
INSERT INTO TBL_TEST8(COL1, COL2, COL3) VALUES(4, '지윤', 80);

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_TEST8;
--==>>
/*
1	승균	100
4	지윤	80
*/

SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST8';
--==>>
/*
HR	SYS_C007049	TBL_TEST8	C	COL3	COL3 BETWEEN 0 AND 100	
HR	SYS_C007050	TBL_TEST8	P	COL1		
*/


--○ CK 지정 실습(② 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST9
( COL1 NUMBER(5)
, COL2 VARCHAR(30)
, COL3 NUMBER(3)
, CONSTRAINT TEST9_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST9_COL3_CK CHECK(COL3 BETWEEN 0 AND 100)
);
--==>> Table TBL_TEST9이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(1, '승균', 100);
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(2, '범석', 101);   --> 에러 발생
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(3, '진희', -1);    --> 에러 발생
INSERT INTO TBL_TEST9(COL1, COL2, COL3) VALUES(4, '지윤', 80);

COMMIT;
--==>> 커밋 완료.

SELECT *
FROM TBL_TEST9;
--==>>
/*
1	승균	100
4	지윤	80
*/

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST9';
--==>>
/*
HR	TEST9_COL3_CK	TBL_TEST9	C	COL3	COL3 BETWEEN 0 AND 100	
HR	TEST9_COL1_PK	TBL_TEST9	P	COL1		
*/


--○ CK 지정 실습(③ 테이블 생성 이후 제약조건 추ㅏ)
-- 테이블 생성
CREATE TABLE TBL_TEST10
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, COL3 NUMBER(3)
);
--==>> Table TBL_TEST10이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';

-- 제약조건 추가
ALTER TABLE TBL_TEST10
ADD ( CONSTRAINT TEST10_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST10_COL3_PK CHECK(COL3 BETWEEN 0 AND 100));
--==>> Table TBL_TEST10이(가) 변경되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TEST10';
--==>>
/*
HR	TEST10_COL1_PK	TBL_TEST10	P	COL1		
HR	TEST10_COL3_PK	TBL_TEST10	C	COL3	COL3 BETWEEN 0 AND 100	
*/

--○ 실습 문제
-- 다음과 같이 TBL_TESTMEMBER 테이블을 생성하여
-- SSN 컬럼(주민번호 컬럼)에서
-- 데이터 입력시 성별이 유효한 데이터만 입력될 수 있도록
-- 체크 제약조건을 추가할 수 있도록 한다.
-- → 주민번호 특성 자리에 입력 가능한 데이터로 1,2,3,4를 적용
-- 또한, SID 컬럼에는 PRIMARY KEY 제약조건을 설정할 수 있도록 한다.

-- 테이블 생성
CREATE TABLE TBL_TESTMEMEBER
( SID NUMBER
, NAME VARCHAR2(30)
, SSN CHAR(14)          -- 입력 형태  → 'YYMMDD-NNNNNNN'
, TEL VARCHAR2(40)
);
--==>> Table TBL_TESTMEMEBER이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMEBER';

-- 제약조건 추가(혼자 푼 코드)
ALTER TABLE TBL_TESTMEMEBER
ADD ( CONSTRAINT TESTMEMEBER_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT TESTMEMEBER_SSN_CK CHECK(SUBSTR(SSN, 8, 1) BETWEEN 1 AND 4));
    
-- 제약조건 추가(함께 푼 코드)
ALTER TABLE TBL_TESTMEMEBER
ADD ( CONSTRAINT TESTMEMEBER_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT TESTMEMEBER_SSN_CK CHECK(SUBSTR(SSN, 8, 1) IN ('1', '2', '3', '4')));
    

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_TESTMEMEBER';


-- 데이터 입력
INSERT INTO TBL_TESTMEMEBER(SID, NAME, SSN, TEL) VALUES(6, '박효빈', '980611-2234567', '010-1111-1111');
INSERT INTO TBL_TESTMEMEBER(SID, NAME, SSN, TEL) VALUES(2, '손다정', '940603-2234567', '010-1111-1111');
INSERT INTO TBL_TESTMEMEBER(SID, NAME, SSN, TEL) VALUES(3, '이찬호', '941108-1234567', '010-3333-3333');
INSERT INTO TBL_TESTMEMEBER(SID, NAME, SSN, TEL) VALUES(4, '손범석', '960816-5234567', '010-4444-4444');
--==>> 에러발생
/*
INSERT INTO TBL_TESTMEMEBER(SID, NAME, SSN, TEL) VALUES(4, '손범석', '960816-5234567', '010-4444-4444')
오류 보고 -
ORA-02290: check constraint (HR.TESTMEMEBER_SSN_CK) violated
*/
INSERT INTO TBL_TESTMEMEBER(SID, NAME, SSN, TEL) VALUES(5, '이다영', '941027-9234567', '010-5555-5555');
--==>> 에러발생
/*
명령의 592 행에서 시작하는 중 오류 발생 -
INSERT INTO TBL_TESTMEMEBER(SID, NAME, SSN, TEL) VALUES(5, '이다영', '941027-9234567', '010-5555-5555')
오류 보고 -
ORA-02290: check constraint (HR.TESTMEMEBER_SSN_CK) violated
*/

SELECT *
FROM TBL_TESTMEMEBER;
--==>>
/*
2	손다정	940603-2234567	010-1111-1111
3	이찬호	941108-1234567	010-3333-3333
6	박효빈	980611-2234567	010-1111-1111
1	승균	990909-1111111	010-1234-1234
*/

-------------------------------------------------------------------------------

--■■■ FOREIGN KEY(FK:F:R) ■■■--

-- 1. 참조 키 또는 외래 키(FK)는
--   두 테이블의 데이터 간 연결을 설정하고
--  강제 적용시키는데 사용되는 열이다.
--  한 테이블의 기본 키 값이 있는 열을
--  다른 테이블에 추가하면 테이블 간 연결을 설정할 수 있다.
--  이 때, 두 번째 테이블에 추가되는 열이 외래 키가 된다.

-- 2. 부모 테이블(참조받는 컬럼이 포함된 테이블)이 먼저 생성된 후
--    자식 테이블(참조하는 컬럼이 포함된 테이블)이 생성되어야 한다.
--    이 때, 자식 테이블에 FOREIGN KEY 제약조건이 설정된다.

-- 3. 형식 및 구조
-- ① 컬럼 레벨의 형식
-- 컬럼명 데이터타입 [CONSTRAINT CONSTRAINT명]
--                   PERERENCES 참조 테이블명(참조컬럼명)
--                   [ON DELETE CASCADE | ON DELETE SET NULL]

-- ② 테이블 레벨의 형식
-- 컬럼명 데이터 타입
-- , 컬럼명 데이터 타입
-- , CONSTRAINT CONSTRAINT명 FOREIGN KEY(컬럼명)
--                   PERERENCES 참조 테이블명(참조컬럼명)
--                   [ON DELETE CASCADE | ON DELETE SET NULL]


-- ※ FOREIGN KEY 제약조건을 설정하는 실습을 진행하기 위해서는
--   독립적인 하나의 테이블을 생성하여 처리하는 것이 아니라
--   부모 테이블 생성 작업을 먼저 수행해야한다.
--   그리고 이 때, 부모 테이블에는 반드시 PK 또는 UK 제약조건이
--   설정된 컬럼이 존재해야 한다.


--부모 테이블 생성
CREATE TABLE TBL_JOBS
( JIKWI_ID      NUMBER(5)
, JIKWI_NAME VARCHAR2(30)
, CONSTRAINT JOBS_ID_PK PRIMARY KEY(JIKWI_ID)
);
--==>> Table TBL_JOBS이(가) 생성되었습니다.

-- 부모 테이블에 데이터 입력
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(1, '사원');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(2, '대리');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(3, '과장');
INSERT INTO TBL_JOBS(JIKWI_ID, JIKWI_NAME) VALUES(4, '부장');
--==>> 1 행 이(가) 삽입되었습니다. *4

SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
4	부장
*/

COMMIT;
--==>> 커밋 완료.

--○ FK 지정 실습( ① 컬럼 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_EMP1
( SID       NUMBER(5)       PRIMARY KEY
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER(5)       REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>> Table TBL_EMP1이(가) 생성되었습니다.

-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP1';
--==>>
/*
HR	SYS_C007058	TBL_EMP1	P	SID		
HR	SYS_C007059	TBL_EMP1	R	JIKWI_ID		NO ACTION
*/

--데이터 입력
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(1, '최현정', 1);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(2, '최수지', 2);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(3, '정가연', 3);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(4, '이다영', 4);
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5, '손범석', 5);  --> 에러발생
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(5, '손범석', 1);
INSERT INTO TBL_EMP1(SID, NAME) VALUES(6, '정효진');
INSERT INTO TBL_EMP1(SID, NAME, JIKWI_ID) VALUES(7, '손다정', NULL);


SELECT *
FROM TBL_EMP1;
--==>>
/*
1	최현정	1
2	최수지	2
3	정가연	3
4	이다영	4
5	손범석	1
6	정효진	
7	손다정	
*/

COMMIT;
--==>> 커밋 완료.



--○ FK 지정 실습(② 테이블 레벨의 형식) 
-- 테이블 생성
CREATE TABLE TBL_EMP2
( SID       NUMBER(5)      
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER(5)
, CONSTRAINT EMP2_SID_PK PRIMARY KEY(SID)
, CONSTRAINT EMP_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
             REFERENCES TBL_JOBS(JIKWI_ID)
);
--==>> Table TBL_EMP2이(가) 생성되었습니다.


--제약 조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME = 'TBL_EMP2';
--==>>
/*
HR	EMP2_SID_PK	TBL_EMP2	P	SID		
HR	EMP_JIKWI_ID_FK	TBL_EMP2	R	JIKWI_ID		NO ACTION
*/

--○ FK 지정 실습(③ 테이블 생성 이후 제약조건 추가)
-- 테이블 생성
CREATE TABLE TBL_EMP3
( SID       NUMBER(5)
, NAME      VARCHAR2(30)
, JIKWI_ID  NUMBER(5)
);
--==>>Table TBL_EMP3이(가) 생성되었습니다.


-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP3';
--==>> 조회결과없음 → 제약조건 설정되어 있지 않음

-- 제약조건 추가
ALTER TABLE TBL_EMP3
ADD ( CONSTRAINT EMP3_SID_PK PRIMARY KEY(SID)
    , CONSTRAINT EMP3_JIKWI_ID_FK FOREIGN KEY(JIKWI_ID)
                 REFERENCES TBL_JOBS(JIKWI_ID));
--==>> Table TBL_EMP3이(가) 변경되었습니다.


-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP3';
--==>>
/*
HR	EMP3_SID_PK	TBL_EMP3	P	SID		
HR	EMP3_JIKWI_ID_FK	TBL_EMP3	R	JIKWI_ID		NO ACTION
*/

--4. FOREIGN KEY 생성시 주의사항
--  참고하고자 하는 부모 테이블을 먼저 생성해야 한다.
--  참조하고자 하는 테이블의 대상 컬럼이
--  PRIMARY KEY나 UNIQUE 제약조건이 있어야 한다.
--  테이블 사이에 PRIMARY KEY나 FOREIGN KEY가 정의되어 있으면
--  PRIMARY KEY 제약조건이 설정된 컬럼의 데이터 삭제 시
--  FOREIGN KEY 컬럼에 그 값이 입력되어 있는 경우 삭제 되지 않는다.
--  (단, FK설정 과정에서 『ON DELETE CASCADE』나
--  『ON DELETE SET NULL』옵션을 사용하여 설정한 경우에는 삭제가 가능하다.)
--  부모 테이블을 제거하기 위해서는 자식테이블을 먼저 제거해야한다.

-- 부모 테이블
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
4	부장
*/


-- 자식 테이블
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	최현정	1
2	최수지	2
3	정가연	3
4	이다영	4
5	손범석	1
6	정효진	
7	손다정	
*/

-- 이다영 부장의 직위를 사원으로 변경
UPDATE TBL_EMP1
SET JIKWI_iD= 1
WHERE SID = 4;
--==>> 1 행 이(가) 업데이트되었습니다.

-- 확인
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	최현정	1
2	최수지	2
3	정가연	3
4	이다영	1
5	손범석	1
6	정효진	
7	손다정	
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 부모 테이블(TBL_JOBS)의 부장 데이터를 참조하고 있는 
-- 자식 테이블(TBL_EMP1)의 데이터가 존재하지 않는 상황.

-- 이과 같은 상황에서 부모 테이블(TBL_JOBS)의
-- 부장 데이터 삭제

DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=4;
--==>> 1 행 이(가) 삭제되었습니다.


-- 확인
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
*/

-- 커밋
COMMIT;
--==>> 커밋 완료.

-- 부모테이블(TBL_JOBS)의 사원데이터를 참조하고 있는
-- 자식테이블(TBL_EMP1)의 데이터가 3건 존재하고 있는 상황.

-- 이와 같은 상황에서 부모 테이블(TBL_JOBS)DML
-- 사원 데이터 삭제
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 에러발생
/*
명령의 872 행에서 시작하는 중 오류 발생 -
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1
오류 보고 -
ORA-02292: integrity constraint (HR.SYS_C007059) violated - child record found
*/


--부모 테이블(TBL_JOBS)제거
DROP TABLE TBL_JOBS;
--==>> 에러발생
/*
명령의 887 행에서 시작하는 중 오류 발생 -
DROP TABLE TBL_JOBS
오류 보고 -
ORA-02449: unique/primary keys in table referenced by foreign keys
02449. 00000 -  "unique/primary keys in table referenced by foreign keys"
*Cause:    An attempt was made to drop a table with unique or
           primary keys referenced by foreign keys in another table.
*Action:   Before performing the above operations the table, drop the
           foreign key constraints in other tables. You can see what
           constraints are referencing a table by issuing the following
           command:
           SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = "tabnam";
*/


--※ 부모 테이블의 데이터를 자유롭게 삭제하기 위해서는
--  『ON DELETE CASCADE』옵션 지정이 필요하다.

-- TBL_EMP1(자식테이블)에서 FK제약조건을 제거한 후
-- CASCADE 옵션을 포함하여 다시 FK 제약조건을 설정한다.

--○ 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
--==>>
/*
HR	SYS_C007058	TBL_EMP1	P	SID		
HR	SYS_C007059	TBL_EMP1	R	JIKWI_ID		NO ACTION
*/


--○ 제약조건 제거
ALTER TABLE TBL_EMP1
DROP CONSTRAINT SYS_C007059;
--==>> Table TBL_EMP1이(가) 변경되었습니다.

--○ 제약조건 제거이후 다시 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
--==>>> HR	SYS_C007058	TBL_EMP1	P	SID		

--『ON DELETE CASCADE』옵션이 포함된 내용으로 제약조건 재지정
ALTER TABLE TBL_EMP1
ADD CONSTRAINT EMP1_JIKIID_FK FOREIGN KEY(JIKWI_ID)
               REFERENCES TBL_JOBS(JIKWI_ID)
               ON DELETE CASCADE;
--==>> Table TBL_EMP1이(가) 변경되었습니다.


--○ 제약조건 재지정 다시 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_EMP1';
--==>>
/*
HR	SYS_C007058	TBL_EMP1	P	SID		
HR	EMP1_JIKIID_FK	TBL_EMP1	R	JIKWI_ID		CASCADE
*/

--> CASCADE 옵션을 지정한 후에는 
-- 참조받고 있는 부모 테이블의 데이터를
-- 언제든지 제한없이 삭제하는 것이 가능하다.
-- 단,.... . .. 부모 테이블의 데이터가 삭제될 경우
-- 이를 참조하는 자식 테이블의 데이터도 모~~~~~두 함께 삭제된다.
--  CHECK~~!!


-- 부모 테이블
SELECT *
FROM TBL_JOBS;
--==>>
/*
1	사원
2	대리
3	과장
*/

-- 자식 테이블
SELECT *
FROM TBL_EMP1;
--==>>
/*
1	최현정	1 ←
2	최수지	2
3	정가연	3
4	이다영	1 ←
5	손범석	1 ←
6	정효진	
7	손다정	
*/


--○ TBL_JOBS(부모 테이블)의 사원 데이터 삭제
DELETE
FROM TBL_JOBS
WHERE JIKWI_ID=1;
--==>> 1 행 이(가) 삭제되었습니다.

-- 부모 테이블
SELECT *
FROM TBL_JOBS;
--==>>
/*
2	대리
3	과장
*/

-- 자식 테이블
SELECT *
FROM TBL_EMP1;
--==>>
/*
2	최수지	2
3	정가연	3
6	정효진	
7	손다정	
*/

------------------------------------------------------------------------------
--■■■ NOT NULL(NN:CK:C) ■■■--

-- 1. 테이블에서 지정한 컬럼의 데이터가 NULL인 상태를 갖지 못하도록 하는 제약조건.

-- 2. 형식 및 구조
-- ① 컬럼 레벨의 형식
-- 컬럼명 데이터 타입 [CONSTRAINT CONSTRAINT명] NOT NULL

-- ② 테이블 레벨의 형식
-- 컬럼명 데이터타입
-- , 컬럼명 데이터 타입
-- , CONSTRAINT CONSTRAINT명 CHECK(컬럼명 IS NOT NULL)

-- 3. 기존에 생성되어 있는 테이블에 NOT NULL 제약조건을 추가할 경우
--  ADD보다 MODIFY절이 많이 사용된다.

-- ALTER TABLE 테이블명
-- MODIFY 컬럼명 데이터 타입 NOT NULL;

-- 4. 기존 테이블에 데이터가 이미 들어있지 않은 컬럼(→ NULL인 상태)을
--  NOT NULL 제약 조건을 갖게끔 수정하는 경우에는 에러 발생한다.

--○ NOT NULL 지정 실습(① 컬럼 레벨의 형식)
--  테이브 생성
CREATE TABLE TBL_TEST11
( COL1 NUMBER(5)        PRIMARY KEY
, COL2 VARCHAR2(30)     NOT NULL
);
--==>> Table TBL_TEST11이(가) 생성되었습니다.

-- 데이터 입력
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(1, 'TEST');
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(2, 'ABCD');
INSERT INTO TBL_TEST11(COL1, COL2) VALUES(3, NULL); --> 오류발생


SELECT *
FROM TBL_TEST11;
--==>>
/*
1	TEST
2	ABCD
*/

COMMIT;
--==>> 커밋

--○ 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST11';
--==>>
/*
HR	SYS_C007065	TBL_TEST11	C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007066	TBL_TEST11	P	COL1		
*/

--○ NOT NULL 지정 실습(② 테이블 레벨의 형식)
-- 테이블 생성
CREATE TABLE TBL_TEST12
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
, CONSTRAINT TEST12_COL1_PK PRIMARY KEY(COL1)
, CONSTRAINT TEST12_COL2_NN CHECK(COL2 IS NOT NULL)
);
--==>> Table TBL_TEST12이(가) 생성되었습니다.

--○ 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST12';
--==>>
/*
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1		
*/



--○ NOT NULL 지정 실습(③ 테이블 생성 이후 제약조건 추가)
-- 테이블 생성
CREATE TABLE TBL_TEST13
( COL1 NUMBER(5)
, COL2 VARCHAR2(30)
);
--==>> Table TBL_TEST13이(가) 생성되었습니다.


-- 제약조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST13';
--==>> 조회 결과 없음 → 제약조건이 설정되지 않음

-- 제약조건 추가
ALTER TABLE TBL_TEST13
ADD ( CONSTRAINT TEST13_COL1_PK PRIMARY KEY(COL1)
    , CONSTRAINT TEST13_COL2_NN CHECK(COL2 IS NOT NULL));
--==>> Table TBL_TEST13이(가) 변경되었습니다.


-- 제약 조건 확인
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME='TBL_TEST13';
--==>>
/*
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
*/


--※ NOT NULL 제약조건만 TBL_TEST13 테이블의 COL2에 추가하는 경우
-- 다음과 같은 방법도 가능하다.
ALTER TABLE TBL_TEST13
MODIFY COL2 NOT NULL;
--==>> TABLE TBL_TEST13이(가) 변경되었습니다.

-- TBL_TEST11/ TBL_TEST12 / TBL_TEST13

-- 컬럼 레벨에서 NOT NULL 제약조건을 지정한 테이블
DESC TBL_TEST11;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/
--> DESC 를 통해 COL2 컬럼이 NOT NULL 인 정보가 확인되는 상황

-- 테이블 레벨에서 NOT NULL제약조건을 지정한 테이블
DESC TBL_TEST12;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2          VARCHAR2(30) 
*/
--> DRSC를 통해 CDOL2컬럼이 NOT NULL인 정보가 확인되지 않는 상황

-- 테이블 생성 이후 ADD를 통해 NOT NULL 제약조건을 추가하였으며
-- 또한, MODIFY 절을 통해 NOT NULL 제약조건을 다시 추가한 테이블
DESC TBL_TEST13;
--==>>
/*
이름   널?       유형           
---- -------- ------------ 
COL1 NOT NULL NUMBER(5)    
COL2 NOT NULL VARCHAR2(30) 
*/
--> DESC를 통해 COL2 컬럼이 NOT NULL 인 정보가 확인되는 상황

-- 제약조건 확인 전용 뷰(VIEW)조회
SELECT *
FROM VIEW_CONSTCHECK
WHERE TABLE_NAME IN ('TBL_TEST11', 'TBL_TEST12', 'TBL_TEST13');
--==>>
/*
HR	SYS_C007065	TBL_TEST11	    C	COL2	"COL2" IS NOT NULL	
HR	SYS_C007066	TBL_TEST11  	P	COL1		
HR	TEST12_COL2_NN	TBL_TEST12	C	COL2	COL2 IS NOT NULL	
HR	TEST12_COL1_PK	TBL_TEST12	P	COL1		
HR	TEST13_COL1_PK	TBL_TEST13	P	COL1		
HR	TEST13_COL2_NN	TBL_TEST13	C	COL2	COL2 IS NOT NULL	
HR	SYS_C007071	TBL_TEST13  	C	COL2	"COL2" IS NOT NULL		
*/


SELECT USER
FROM DUAL;
--==>> SCOTT

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 
--==>> Session이(가) 변경되었습니다.


--○문제
-- TBL_SAWON 테이블을 활용하여 다음과 같은 항목들을 조회한다.
-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 
-- , 정년퇴직일, 근무일수, 남은일수, 급여, 보너스

-- 단, 현재나이는 한국나이 계산법에 따라 연산을 수행한다.
-- 또한, 정년퇴직일은 해당 직원의 나이가 한국나이로 60세가 되는 해(연도)의
-- 그 직원의 입사 월, 일로 연산을 수행한다.
-- 그리고, 보너스는 4000일 이상 8000일 미만 근무한 사원은
-- 그 사원의 원래 급여 기준 30% 지급,
-- 2000일 이상 근무한 사원은
-- 그 사원의 원래 급여 기준 50% 지급을 할 수 있도록 처리한다.

-------[[내가 푼 코드.. .다 못 품 ㅜ]-----------------------------------------------
SELECT SANO "사원 번호", SANAME "사원명", JUBUN "주민번호"
        , CASE WHEN SUBSTR(JUBUN, 7,1) = '2' OR SUBSTR(JUBUN, 7, 1) = '4' THEN '여'
               WHEN SUBSTR(JUBUN, 7,1) = '1' OR SUBSTR(JUBUN, 7, 1) = '3' THEN '남'
               ELSE '성별이뭐야'
          END "성별"
        , TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))
         - (TO_NUMBER(TO_CHAR(CASE SUBSTR(JUBUN, 7,1)
                                                WHEN '1' THEN '1900'
                                                WHEN '2' THEN '1900'
                                                WHEN '3' THEN '2000'
                                                WHEN '4' THEN '2000'
                END )) + TO_NUMBER(TO_CHAR(SUBSTR(JUBUN, 1,2)) )) + 1  "현재나이"                                          
        , HIREDATE "입사일"
        --, "정년퇴직일"
        ,TRUNC(SYSDATE-HIREDATE) "근무일수"
        , SAL "급여"
     --   , "보너스"
FROM TBL_SAWON;



-- TEST
SELECT  NVL((TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'))
         - (TO_NUMBER(TO_CHAR(CASE SUBSTR(JUBUN, 7,1)
                                                WHEN '1' THEN '1900'
                                                WHEN '2' THEN '1900'
                                                WHEN '3' THEN '2000'
                                                WHEN '4' THEN '2000'
                END )) + TO_NUMBER(TO_CHAR(SUBSTR(JUBUN, 1,2)) )) + 1 ),0) "현재나이"
FROM TBL_SAWON;

-- 퇴직일 => 60세 됐을 때(생일로) -현재 나이.....==> 달로 더해주기...
SELECT  CASE WHEN SUBSTR(JUBUN, 7,1) IN ('2','4') 
             THEN TO_DATE(TO_CHAR((TO_NUMBER('19'||SUBSTR(JUBUN, 1,2))-1)+60)
             ELSE TO_DATE(TO_CHAR((TO_NUMBER('20'||SUBSTR(JUBUN, 1,2))-1)+60)
          END "정년퇴직일"
FROM TBL_SAWON;


-------[[같이 푼 코드]]-----------------------------------------------
--TBL_SAWON테이블에 존재하는 사원들의
-- 입사일 컬럼에서 월, 일만 조회하기
SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM-DD') "월일"
FROM TBL_SAWON;
--==>>>
/*
김소연	2001-01-03	01-03
이다영	2010-11-05	11-05
이지영	2012-08-16	08-16
손다정	1999-02-02	02-02
이하이	2013-07-15	07-15
이이경	2011-08-17	08-17
김이나	1999-11-11	11-11
아이유	1999-11-11	11-11
선동열	1995-11-11	11-11
선우용녀	1995-10-10	10-10
선우선	2001-10-10	10-10
남진	1998-02-13	02-13
남궁현	2002-02-13	02-13
남도일	2002-02-13	02-13
김남길	2015-01-10	01-10
*/

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM') "월",TO_CHAR(HIREDATE, 'DD') "일"
FROM TBL_SAWON;
--==>>>
/*
김소연	2001-01-03	01	03
이다영	2010-11-05	11	05
이지영	2012-08-16	08	16
손다정	1999-02-02	02	02
이하이	2013-07-15	07	15
이이경	2011-08-17	08	17
김이나	1999-11-11	11	11
아이유	1999-11-11	11	11
선동열	1995-11-11	11	11
선우용녀	1995-10-10	10	10
선우선	2001-10-10	10	10
남진	1998-02-13	02	13
남궁현	2002-02-13	02	13
남도일	2002-02-13	02	13
*/

SELECT SANAME, HIREDATE, TO_CHAR(HIREDATE, 'MM') || '-' || TO_CHAR(HIREDATE, 'DD') "월일"
FROM TBL_SAWON;
--==>
/*
김소연	2001-01-03	01-03
이다영	2010-11-05	11-05
이지영	2012-08-16	08-16
손다정	1999-02-02	02-02
이하이	2013-07-15	07-15
이이경	2011-08-17	08-17
김이나	1999-11-11	11-11
아이유	1999-11-11	11-11
선동열	1995-11-11	11-11
선우용녀	1995-10-10	10-10
선우선	2001-10-10	10-10
남진	1998-02-13	02-13
*/


-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 
-- , 정년퇴직일, 근무일수, 남은일수, 급여, 보너스
SELECT SANO "사원 번호", SANAME "사원명", JUBUN "주민번호"
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
            WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
            ELSE '성별확인불가'
        END "성별"
        
     --현재나이 = 현재년도 - 태어난년도 +1 (1900년대 생 / 2000년대 생)
     , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1899)
            WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
            THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1999)
        END "현재나이"     
      , HIREDATE "입사일"
      , SAL "급여"               
FROM TBL_SAWON;
--==>>
/*
1001	김소연	9307302234567	여자	29	2001-01-03	3000
1002	이다영	9510272234567	여자	27	2010-11-05	2000
1003	이지영	0909014234567	여자	13	2012-08-16	1000
1004	손다정	9406032234567	여자	28	1999-02-02	4000
1005	이하이	0406034234567	여자	18	2013-07-15	1000
1006	이이경	0202023234567	남자	20	2011-08-17	2000
1007	김이나	8012122234567	여자	42	1999-11-11	3000
1008	아이유	8105042234567	여자	41	1999-11-11	3000
1009	선동열	7209301234567	남자	50	1995-11-11	3000
1010	선우용녀	7001022234567	여자	52	1995-10-10	3000
1011	선우선	9001022234567	여자	32	2001-10-10	2000
1012	남진	8009011234567	남자	42	1998-02-13	4000
1013	남궁현	8203051234567	남자	40	2002-02-13	3000
1014	남도일	9208091234567	남자	30	2002-02-13	3000
1015	김남길	0202023234567	남자	20	2015-01-10	2000
*/

SELECT T.사원번호, T.연봉
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", SAL "급여", SAL*12 "연봉"
    FROM TBL_SAWON
)T;



SELECT T.SANO, T.SANAME
FROM TBL_SAWON T;

SELECT SCOTT.TBL_SAWON.SANO
FROM SCOTT.TBL_SAWON;


SELECT A.사원번호, A.사원명, A.연봉, A.연봉*2 "두배 연봉"
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", SAL "급여", SAL*12 "연봉"
    FROM TBL_SAWON
) A;



-- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 
-- , 정년퇴직일, 근무일수, 남은일수, 급여, 보너스
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    --정년퇴직일
    --정년퇴직년도 → 해당 직원의 나이가 한국나이로 60세가 되는 해
    -- 현재나이가 58세... 2년  후       2021 → 2023
    -- 현재나이가 35세... 25년 후       2021 → 2046
    -- ADD_MONTHS(SYSDATE, 남은년수*12)
    --                      ------
    --                      (60-현재나이)
    -- ADD_MONTHS(SYSDATE,(60-현재나이)*12) → 이 결과에서 정년퇴직 년도만 필요
    -- TO_CHAR(ADD_MONTHS(SYSDATE, (60-현재나이)*12), 'YYYY') || '-'  || TO_CHAR(HIREDATE, 'MM-DD')
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-'  || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    
    -- 근무일수 = 현재일 - 입사일
    , TRUNC(SYSDATE - T.입사일) "근무일수"
    
    -- 남은일수 = 현재일 - 입사일
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이)*12), 'YYYY') 
     || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
     
    , T.급여
    
    --보너스
    -- 근무일수가 4000일 이상 8000일 미만 → 원래 급여의 30%
    -- 근무일수가 8000일 이상             → 원래 급여의 50%
    -- 나머지 0
    , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 8000 THEN T.급여 * 0.5
           WHEN TRUNC(SYSDATE - T.입사일) >= 4000 THEN T.급여 * 0.3
           ELSE 0
        END "보너스"   
    
FROM
(
    -- 사원번호, 사원명, 주민번호, 성별, 현재나이, 입사일, 
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
                ELSE '성별확인불가'
            END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1999)
            END "현재나이"     
          , HIREDATE "입사일"
          , SAL "급여"               
    FROM TBL_SAWON
) T;

---------------------------------------------------------------------------------
--주석 모두 뺀 쿼리문 버전
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-'  || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    , TRUNC(SYSDATE - T.입사일) "근무일수"
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이)*12), 'YYYY') 
     || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    , T.급여
    , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 8000 THEN T.급여 * 0.5
           WHEN TRUNC(SYSDATE - T.입사일) >= 4000 THEN T.급여 * 0.3
           ELSE 0
        END "보너스"   
    
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
                ELSE '성별확인불가'
            END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1999)
            END "현재나이"     
          , HIREDATE "입사일"
          , SAL "급여"               
    FROM TBL_SAWON
) T;


--※ 상기 내용에서... 특정 근무일수의 사원을 확인해야 한다거나...
--  특정 보너스 금액을 받는 사원을 확인해야 할 경우가 생길 수 있다.
--  이와 같은 경우.. 해당 쿼리문을 다시 구성하는 번거로움을 줄일 수 있도록
--  뷰(VIEW)를 만들어 저장해 둘 수 있다.
CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T.사원 명, T.주민번호, T.성별, T.현재나이, T.입사일
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-'  || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    , TRUNC(SYSDATE - T.입사일) "근무일수"
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이)*12), 'YYYY') 
     || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    , T.급여
    , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 8000 THEN T.급여 * 0.5
           WHEN TRUNC(SYSDATE - T.입사일) >= 4000 THEN T.급여 * 0.3
           ELSE 0
        END "보너스"   
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
                ELSE '성별확인불가'
            END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1999)
            END "현재나이"     
          , HIREDATE "입사일"
          , SAL "급여"               
    FROM TBL_SAWON
) T;
--==>> 에러발생
/*
ORA-00901: invalid CREATE command
00901. 00000 -  "invalid CREATE command"
*Cause:    
*Action:

*/
--> 권한이 불충분하여 발생하는 에러


--※ SYS로 부터 VIEW를 생성할 수 있는 권한을 부여받은 후
--   다시 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_SAWON
AS
SELECT T.사원번호, T.사원명, T.주민번호, T.성별, T.현재나이, T.입사일
    , TO_CHAR(ADD_MONTHS(SYSDATE, (60-T.현재나이)*12), 'YYYY') || '-'  || TO_CHAR(T.입사일, 'MM-DD') "정년퇴직일"
    , TRUNC(SYSDATE - T.입사일) "근무일수"
    , TRUNC(TO_DATE(TO_CHAR(ADD_MONTHS(SYSDATE, (60 - T.현재나이)*12), 'YYYY') 
     || '-' || TO_CHAR(T.입사일, 'MM-DD'), 'YYYY-MM-DD') - SYSDATE) "남은일수"
    , T.급여
    , CASE WHEN TRUNC(SYSDATE - T.입사일) >= 8000 THEN T.급여 * 0.5
           WHEN TRUNC(SYSDATE - T.입사일) >= 4000 THEN T.급여 * 0.3
           ELSE 0
        END "보너스"   
FROM
(
    SELECT SANO "사원번호", SANAME "사원명", JUBUN "주민번호"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '3') THEN '남자'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2', '4') THEN '여자'
                ELSE '성별확인불가'
            END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1999)
            END "현재나이"     
          , HIREDATE "입사일"
          , SAL "급여"               
    FROM TBL_SAWON
) T;
--==>> View VIEW_SAWON이(가) 생성되었습니다.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT *
FROM VIEW_SAWON;
--==>>
/*
1001	김소연	    9307302234567	여자	29	2001-01-03	2052-01-03	7548	11078	3000	900
1002	이다영	    9510272234567	여자	27	2010-11-05	2054-11-05	3955	12115	2000	0
1003	이지영	    0909014234567	여자	13	2012-08-16	2068-08-16	3305	17148	1000	0
1004	손다정	    9406032234567	여자	28	1999-02-02	2053-02-02	8249	11474	4000	2000
1005	이하이	    0406034234567	여자	18	2013-07-15	2063-07-15	2972	15289	1000	0
1006	이이경	    0202023234567	남자	20	2011-08-17	2061-08-17	3670	14592	2000	0
1007	김이나	    8012122234567	여자	42	1999-11-11	2039-11-11	7967	6642	3000	900
1008	아이유	    8105042234567	여자	41	1999-11-11	2040-11-11	7967	7008	3000	900
1009	선동열	    7209301234567	남자	50	1995-11-11	2031-11-11	9428	3720	3000	1500
1010	선우용녀	7001022234567	여자	52	1995-10-10	2029-10-10	9460	2958	3000	1500
1011	선우선	    9001022234567	여자	32	2001-10-10	2049-10-10	7268	10263	2000	600
1012	남진	    8009011234567	남자	42	1998-02-13	2039-02-13	8603	6371	4000	2000
1013	남궁현	    8203051234567	남자	40	2002-02-13	2041-02-13	7142	7102	3000	900
1014	남도일	    9208091234567	남자	30	2002-02-13	2051-02-13	7142	10754	3000	900
1015	김남길	    0202023234567	남자	20	2015-01-10	2061-01-10	2428	14373	2000	0
*/

--○ TBL_SAWON테이블의 김소연 사원의 입사일 및 급여 데이터 변경
-- 현재 테이블 상태 : 1001	김소연	9307302234567	2001-01-03	3000
-- 변경 후 테이블 상태 : 1001	김소연	9307302234567	2021-09-03	5000
-- 현재 뷰 상태 : 1001	김소연	9307302234567	여자	29	2001-01-03	2052-01-03	7548	11078	3000	900
-- 변경 후 뷰 상태 : 1001	김소연	9307302234567	여자	29	2021-09-03	2052-09-03	0	11322	5000	0
-- (테이블 데이터를 변경하면 뷰도 같이 변경된다)

SELECT *
FROM VIEW_SAWON;

UPDATE TBL_SAWON
SET HIREDATE=SYSDATE, SAL=5000
WHERE SANO=1001;
--==>>1 행 이(가) 업데이트되었습니다.

SELECT *
FROM TBL_SAWON
WHERE SANO = 1001;
--==> 1001	김소연	9307302234567	2021-09-03	5000



--○ 문제
-- 서브쿼리를 활용하여 TBL_SAWON 테이블을 다음과 같이 조회할 수 있도록 한다.
/*
-----------------------------------------------
 사원명  성별  현재나이   급여   나이보너스
-----------------------------------------------

단, 나이보너스는 현재 나이가 40세 이상이면 급여의 70%
    30세 이상 40세 미만이면 급여의 50%
    20세 이상 30세 미만이면 급여의 30%로 한다.

또한, 완성된 조회 구문을 기반으로
VIEW_SAWON2라는 이름의 뷰(VIEW)를 생성한다.
*/

---[[내가 푼 문제]]------------------------------------------------

CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.사원명, T.성별, T.현재나이, T.급여
        ,CASE WHEN (T.현재나이) >= 40 THEN T.급여*0.7
            WHEN (T.현재나이) >= 30 THEN T.급여*0.5
            WHEN (T.현재나이) >= 20 THEN T.급여*0.3
            ELSE 0
        END "나이보너스"   
FROM
(
    SELECT SANAME "사원명" 
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','3') THEN '남'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2','4') THEN '여'
                ELSE '성별이 뭐니'
            END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1999)
            END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
) T;


--TEST
--현재 나이가 40세 이상이면 급여의 70%
--    30세 이상 40세 미만이면 급여의 50%
--    20세 이상 30세 미만이면 급여의 30%
SELECT CASE WHEN () >= 40 THEN SAL*0.7
            WHEN () >= 30 THEN SAL*0.5
            WHEN () >= 20 THEN SAL*0.3
        END "나이보너스"
FROM TBL_SAWON;

 


---[[같이 푼 문제]]------------------------------------------------
CREATE 사람 사람이름;
CREATE OR REPLACE 종이컵 종이컵이름;



CREATE OR REPLACE VIEW VIEW_SAWON2
AS
SELECT T.*
        ,CASE WHEN T.현재나이 >= 40 THEN T.급여 * 0.7
            WHEN T.현재나이 >= 30 THEN T.급여 * 0.5
            WHEN T.현재나이 >= 20 THEN T.급여 * 0.3
            ELSE 0
        END "나이보너스"   
FROM
(
    SELECT SANAME "사원명" 
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1','3') THEN '남'
                WHEN SUBSTR(JUBUN, 7, 1) IN ('2','4') THEN '여'
                ELSE '성별이 뭐니'
            END "성별"
         , CASE WHEN SUBSTR(JUBUN, 7, 1) IN ('1', '2')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1899)
                WHEN SUBSTR(JUBUN, 7, 1) IN ('3', '4')
                THEN EXTRACT(YEAR FROM SYSDATE) - (TO_NUMBER(SUBSTR(JUBUN, 1, 2))+1999)
            END "현재나이"
         , SAL "급여"
    FROM TBL_SAWON
) T;
--==>>View VIEW_SAWON2이(가) 생성되었습니다.

SELECT *
FROM VIEW_SAWON2;
--==>>
/*
김소연	여	29	5000	1500
이다영	여	27	2000	600
이지영	여	13	1000	0
손다정	여	28	4000	1200
이하이	여	18	1000	0
이이경	남	20	2000	600
김이나	여	42	3000	2100
아이유	여	41	3000	2100
선동열	남	50	3000	2100
선우용녀	여	52	3000	2100
선우선	여	32	2000	1000
남진	남	42	4000	2800
남궁현	남	40	3000	2100
남도일	남	30	3000	1500
김남길	남	20	2000	600
*/


--------------------------------------------------------------------------------

--○ RANK() 등수(순위)를 반환하는 함수
SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL"급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서내 급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체 급여순위"
FROM EMP;
--==>>
/*
7839	KING	10	5000	1
7902	FORD	20	3000	2
7788	SCOTT	20	3000	2
7566	JONES	20	2975	4
7698	BLAKE	30	2850	5
7782	CLARK	10	2450	6
7499	ALLEN	30	1600	7
7844	TURNER	30	1500	8
*/

SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL"급여"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서내 급여순위"
     , RANK() OVER(ORDER BY SAL DESC) "전체 급여순위"
FROM EMP
ORDER BY 3,4 DESC;
--==>>
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	6
7934	MILLER	10	1300	3	9
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	3	4
7876	ADAMS	20	1100	4	12
7369	SMITH	20	800	5	14
7698	BLAKE	30	2850	1	5
*/


--○ DENSE_RANK()    → 서열을 반환하는 함수
SELECT EMPNO "사원번호", ENAME "사원명", DEPTNO "부서번호", SAL"급여"
     , DENSE_RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) "부서내 급여서열"
     , DENSE_RANK() OVER(ORDER BY SAL DESC) "전체 급여서열"
FROM EMP
ORDER BY 3,4 DESC;
--==>>
/*
7839	KING	10	5000	1	1
7782	CLARK	10	2450	2	5
7934	MILLER	10	1300	3	8
7902	FORD	20	3000	1	2
7788	SCOTT	20	3000	1	2
7566	JONES	20	2975	2	3
7876	ADAMS	20	1100	3	10
7369	SMITH	20	800	       4	12
7698	BLAKE	30	2850	1	4
7499	ALLEN	30	1600	2	6
7844	TURNER	30	1500	3	7
7654	MARTIN	30	1250	4	9
7521	WARD	30	1250	4	9
*/

--○ EMP 테이블의 사원 정보를
-- 사원명, 부서번호, 연봉, 부서내 연봉순위, 전체 연봉순위 항목으로 조회한다.
SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM, 0)"연봉"
     , RANK() OVER(PARTITION BY DEPTNO ORDER BY SAL*12+NVL(COMM, 0) DESC) "부서내 연봉순위"
     , RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "전체 연봉순위"
FROM EMP
ORDER BY 2, 3 DESC;
--==>>
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
MILLER	10	15600	3	10
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
*/


SELECT T.*
    ,RANK() OVER(PARTITION BY T.부서번호 ORDER BY T.연봉 DESC) "부서내 연봉순위"
    ,RANK() OVER(ORDER BY T.연봉 DESC) "전체 연봉순위"
FROM
(
SELECT ENAME 사원명, DEPTNO 부서번호
    , SAL*12+NVL(COMM, 0) "연봉"
FROM EMP
) T
ORDER BY 2,3 DESC;
--==>>
/*
KING	10	60000	1	1
CLARK	10	29400	2	6
MILLER	10	15600	3	10
FORD	20	36000	1	2
SCOTT	20	36000	1	2
JONES	20	35700	3	4
ADAMS	20	13200	4	12
SMITH	20	9600	5	14
BLAKE	30	34200	1	5
ALLEN	30	19500	2	7
TURNER	30	18000	3	8
MARTIN	30	16400	4	9
*/


--○ EMP 테이블에서 전체 연봉 순위가 1등부터 5등 까지만..
--  사원명, 부서번호, 연봉, 전체연봉순위 항목으로 조회한다.
----[[내가 푼 코드]]----------------------------------------------------------
SELECT T.*
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM, 0)"연봉"
        ,RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "전체연봉순위"
    FROM EMP
) T
WHERE T.전체연봉순위 <= 5
ORDER BY 3 DESC;


----[[함께 푼 코드]]----------------------------------------------------------
SELECT T.*
    ,RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "전체연봉순위"
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM, 0)"연봉"
    FROM EMP
) T
WHERE RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "전체연봉순위"
ORDER BY 3 DESC;
--==> 에러 발생
/*
ORA-30483: window  functions are not allowed here
30483. 00000 -  "window  functions are not allowed here"
*Cause:    Window functions are allowed only in the SELECT list of a query.
           And, window function cannot be an argument to another window or group
           function.
*Action:
628행, 37열에서 오류 발생
*/

--※ 위의 내용은 RANK() OVER()를 WHERE 조건절에서 사용한 경우이며..
-- 이 함수는 WHERE 조건절에서 사용할 수 없는 함수이며
-- 이 규칙을 어겼기 때무에 발생하는 에러이다.
-- 이 경우..우리는 INLINE VIEW를 활용하여 풀이해야한다.

SELECT T.*
FROM
(
    SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM, 0)"연봉"
        ,RANK() OVER(ORDER BY SAL*12+NVL(COMM, 0) DESC) "전체연봉순위"
    FROM EMP
) T
WHERE T.전체연봉순위 <= 5;


SELECT T2.*
FROM
(
    SELECT T1.*
        , RANK() OVER(ORDER BY T1.연봉 DESC) "전체연봉순위"
    FROM 
    (
        SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM, 0)"연봉"
        FROM EMP
    ) T1
) T2
WHERE T2.전체연봉순위 <= 5;
---==>>
/*
KING	10	60000	1
SCOTT	20	36000	2
FORD	20	36000	2
JONES	20	35700	4
BLAKE	30	34200	5
*/


--○ EMP테이블에서 각 부서별로 연봉 등수가 1등부터 2등까지만.. 조회한다.
-- 사원명, 부서번호, 연봉, 부서내연봉등수, 전체연봉등수 항목을 조회할 수 있도록 한다.
SELECT T2.*
FROM
(
    SELECT T1.*
         ,RANK() OVER(PARTITION BY T1.부서번호 ORDER BY T1.연봉 DESC) "부서내연봉등수"
         ,RANK() OVER(ORDER BY T1.연봉 DESC) "전체 연봉등수"
    FROM
    (
        SELECT ENAME "사원명", DEPTNO "부서번호", SAL*12+NVL(COMM, 0)"연봉"
        FROM EMP
    ) T1
)T2
WHERE T2.부서내연봉등수 <=2;

--------------------------------------------------------------------------------

--■■■ 그룹함수 ■■■---

--SUM() 합, AVG() 평균, COUNT() 카운트, MAX() 최대값, MIN()최소값,
--  VARIANCE() 분산, STDDEV() 표준편차

--※ 그룹함수의 가장 큰 특징은
--   처리해야 할 데이터들 중 NULL 존재하면
-- 이 NULL은 제외하고 연산을 수행한다는 것이다.

--SUM()
-- EMP 테이블을 대상으로 전체 사원들의 급여 총합을 조회한다.
SELECT SUM(SAL)
FROM EMP;
--==>> 29025

SELECT SUM(COMM)        -- NULL+300+500+NUL+...+NULL (X)
FROM EMP;               -- 300+500+1400+0            (O)
--==>> 2200

--COUNT()
-- 행의 갯수 조회하여 결과값 반환
SELECT COUNT(ENAME)
FROM EMP;
--==>> 14

SELECT COUNT(COMM)      -- COMM 컬럼의 행의 갯수 조회 → NULL 은 제외~!!
FROM EMP;
--==>> 4

SELECT COUNT(*)
FROM EMP;

--○AVG()
--평균 반환
SELECT SUM(SAL)/COUNT(SAL) "1", AVG(SAL) "2"
FROM EMP;
--==>>
/*
2073.214285714285714285714285714285714286	
2073.214285714285714285714285714285714286
*/

SELECT AVG(COMM)
FROM EMP;
--==>> 550

SELECT SUM(COMM) / COUNT(COMM)
FROM EMP;
--==>> 550

SELECT SUM(COMM)/14
FROM EMP;
--==>157.142857142857142857142857142857142857


SELECT SUM(COMM)/COUNT(*)
FROM EMP;
--==>> 157.142857142857142857142857142857142857

--※ 표준편차의 제곱이 분산
--  분산의 제곱근이 표준편차
SELECT AVG(SAL),
FROM EMP;

SELECT POWER(STDDEV(SAL),2) "급여표준편차제곱"
        , VARIANCE(SAL) "급여분산"
FROM EMP;
--==>>
/*
1398313.87362637362637362637362637362637	
1398313.87362637362637362637362637362637
*/

SELECT SQRT(VARIANCE(SAL)) "급여분산제곱근"
        , STDDEV(SAL) "급여표준편차"
FROM EMP;
--==>>
/*
1182.503223516271699458653359613061928508	
1182.503223516271699458653359613061928508
*/


--○ MAX() / MIN()
-- 최대값 최소값 반환
SELECT MAX(SAL), MIN(SAL)
FROM EMP;
--==>> 5000 800

--※주의
SELECT ENAME, SUM(SAL)
FROM EMP;
--==>> 오류발생
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
786행, 8열에서 오류 발생*/

SELECT ENAME, SAL
FROM EMP;

SELECT SUM(SAL)
FROM EMP;

SELECT DEPTNO, SUM(SAL)
FROM EMP;
--==>> 오류발생
/*
ORA-00937: not a single-group group function
00937. 00000 -  "not a single-group group function"
*Cause:    
*Action:
802행, 8열에서 오류 발생*/


--○부서별 급여합 조회
SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY DEPTNO;
--==>>
/*
30	9400
20	10875
10	8750
*/

--○직종별 급여합 조회
SELECT JOB "직종명", SUM(SAL) "급여합"
FROM EMP
GROUP BY JOB;
--==>>
/*
CLERK	4150
SALESMAN	5600
PRESIDENT	5000
MANAGER	8275
ANALYST	6000
*/


SELECT DEPTNO "부서번호", SUM(SAL) "급여합"
FROM EMP
GROUP BY ROLLUP(DEPTNO);

--------------------------------------------------------------------------------


--○ 데이터 입력

INSERT INTO TBL_EMP VALUES
(8001, '차은우', 'CLERK', 7566, SYSDATE, 1500, 10, NULL);
--==> 1 행 이(가) 삽입되었습니다.
INSERT INTO TBL_EMP VALUES
(8002, '서강준', 'CLERK', 7566, SYSDATE, 1000, 0, NULL);
--==> 1 행 이(가) 삽입되었습니다.


--○ 커밋
COMMIT;
--==>> 커밋 완료.

INSERT INTO TBL_EMP VALUES
(8003, '공유', 'SALESMAN', 7698, SYSDATE, 2000, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.


INSERT INTO TBL_EMP VALUES
(8004, '이동욱', 'SALESMAN', 7698, SYSDATE, 2500, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

INSERT INTO TBL_EMP VALUES
(8005, '조인성', 'SALESMAN', 7698, SYSDATE, 1000, NULL, NULL);
--==>> 1 행 이(가) 삽입되었습니다.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session이(가) 변경되었습니다.


--○ 확인
SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK   	7902	1980-12-17	800		20
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300 	30
7521	WARD	SALESMAN	7698	1981-02-22	1250	500 	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		    20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		    30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		    10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20
7839	KING	PRESIDENT		    1981-11-17	5000		    10
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30
7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20
7900	JAMES	CLERK	    7698	1981-12-03	950		        30
7902	FORD	ANALYST	    7566	1981-12-03	3000		    20
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10
8001	차은우	CLERK	    7566	2021-09-03	1500	10	
8002	서강준	CLERK	    7566	2021-09-03	1000	0	
8003	공유	SALESMAN	7698	2021-09-06	2000		
8004	이동욱	SALESMAN	7698	2021-09-06	2500		
8005	조인성	SALESMAN	7698	2021-09-06	1000		*/

--○ 커밋
COMMIT;
--=>커밋 완료.
SELECT USER
FROM DUAL;
--==>> HR

--○ EMPLOYEES 테이블의 직원들 SALARY를 10% 인상한다.
--   단,  부서명이 'IT'인 경우로 한정한다.
--   (직접 눈으로 찾아 부서번호를 입력하는 것이 아님
--   또한, 결과 확인 후 ROLLBACK)

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;
--==>>
/*
103	Alexander	Hunold	    AHUNOLD	    590.423.4567	2006-01-03 00:00:00	IT_PROG	9000		102	60
104	Bruce	    Ernst	    BERNST	    590.423.4568	2007-05-21 00:00:00	IT_PROG	6000		103	60
105	David	    Austin	    DAUSTIN	    590.423.4569	2005-06-25 00:00:00	IT_PROG	4800		103	60
106	Valli	    Pataballa	VPATABAL	590.423.4560	2006-02-05 00:00:00	IT_PROG	4800		103	60
107	Diana	    Lorentz	    DLORENTZ	590.423.5567	2007-02-07 00:00:00	IT_PROG	4200		103	60
*/

UPDATE EMPLOYEES
SET SALARY = SALARY * 1.1
WHERE DEPARTMENT_ID = 60;


SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

ROLLBACK;

SELECT * 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;

DESC DEPARTMENTS;

--------[[함께 푼 문제]]---------------------------------------------
SELECT * 
FROM EMPLOYEES;

SELECT * 
FROM DEPARTMENTS;
--==>> 60번 IT 체크~!!
/*
10	Administration	200	1700
20	Marketing	201	1800
30	Purchasing	114	1700
40	Human Resources	203	2400
50	Shipping	121	1500
60	IT	103	1400                            << CHECK~!!!
70	Public Relations	204	2700
80	Sales	145	2500
90	Executive	100	1700
100	Finance	108	1700
110	Accounting	205	1700
120	Treasury		1700
130	Corporate Tax		1700
140	Control And Credit		1700
150	Shareholder Services		1700
160	Benefits		1700
170	Manufacturing		1700
180	Construction		1700
190	Contracting		1700
200	Operations		1700
210	IT Support		1700
220	NOC		1700
230	IT Helpdesk		1700
240	Government Sales		1700
250	Retail Sales		1700
260	Recruiting		1700
270	Payroll		1700*/



SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1 "인상급여"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;
--==>>
/*
Alexander	Hunold	    9000	60	9900
Bruce	    Ernst	    6000	60	6600
David	    Austin	    4800	60	5280
Valli	    Pataballa	4800	60	5280
Diana	    Lorentz	    4200	60	4620
*/


SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1 "인상급여"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (DEPARTMENTS 테이블에서 IT 부서의 부서번호);

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1 "인상급여"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');


-- UPDATE
UPDATE EMPLOYEES
SET SALARY = SALARY*1.1
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                       FROM DEPARTMENTS
                       WHERE DEPARTMENT_NAME = 'IT');
--==>> 5개 행 이(가) 업데이트되었습니다.

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 60;
--==>>
/*
Alexander	Hunold	    9900	60
Bruce	    Ernst	    6600	60
David	    Austin  	5280	60
Valli	    Pataballa	5280	60
Diana	    Lorentz	    4620	60
*/

ROLLBACK;
--==>> 롤백완료


--○ EMPLOYEES 테이블에서 JOB_TITLE 이 『Sales Manager』인 사원들의
--   SALARY 를 해당 직무(직종)의 최고 급여(MAX_SALARY)로 수정한다.
--   단, 입사일이 2006년 이전(해당 년도 제외) 입사자에 한하여
--  적용할 수 있도록 처리한다.
--  (결과 확인 후 ROLLBACK)

SELECT *
FROM JOBS;
SELECT *
FROM EMPLOYEES;




SELECT JOB_ID
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';


SELECT *
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND SUBSTR(HIRE_DATE, 1, 4) < 2006;
    
    
                
                
UPDATE EMPLOYEES               
SET SALARY = SELECT MAX(SALARY)
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND SUBSTR(HIRE_DATE, 1, 4) < 2006;


--------[[함께 푼 문제]]---------------------------------------------

UPDATE EMPLOYEES               
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>> 3개 행 이(가) 업데이트되었습니다.


--(SALES MANAGER의 MAX(SALARY))
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';


--(SALES MANAGER의 JOB_ID)
SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager';


SELECT FIRST_NAME, SALARY
FROM EMPLOYEES
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>>
/*
John	20080
Karen	20080
Alberto	20080
*/


ROLLBACK;
--==>> 롤백 완료.



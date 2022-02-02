SELECT USER
FROM DUAL;
--==>> HR

--�� EMPLOYEES ���̺��� ������ SALARY�� 10% �λ��Ѵ�.
--   ��,  �μ����� 'IT'�� ���� �����Ѵ�.
--   (���� ������ ã�� �μ���ȣ�� �Է��ϴ� ���� �ƴ�
--   ����, ��� Ȯ�� �� ROLLBACK)

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

--------[[�Բ� Ǭ ����]]---------------------------------------------
SELECT * 
FROM EMPLOYEES;

SELECT * 
FROM DEPARTMENTS;
--==>> 60�� IT üũ~!!
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



SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1 "�λ�޿�"
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


SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1 "�λ�޿�"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (DEPARTMENTS ���̺��� IT �μ��� �μ���ȣ);

SELECT FIRST_NAME, LAST_NAME, SALARY, DEPARTMENT_ID, SALARY*1.1 "�λ�޿�"
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
--==>> 5�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

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
--==>> �ѹ�Ϸ�


--�� EMPLOYEES ���̺��� JOB_TITLE �� ��Sales Manager���� �������
--   SALARY �� �ش� ����(����)�� �ְ� �޿�(MAX_SALARY)�� �����Ѵ�.
--   ��, �Ի����� 2006�� ����(�ش� �⵵ ����) �Ի��ڿ� ���Ͽ�
--  ������ �� �ֵ��� ó���Ѵ�.
--  (��� Ȯ�� �� ROLLBACK)

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


--------[[�Բ� Ǭ ����]]---------------------------------------------

UPDATE EMPLOYEES               
SET SALARY = (SELECT MAX_SALARY
              FROM JOBS
              WHERE JOB_TITLE = 'Sales Manager')
WHERE JOB_ID = (SELECT JOB_ID
                FROM JOBS
                WHERE JOB_TITLE = 'Sales Manager')
    AND TO_NUMBER(TO_CHAR(HIRE_DATE, 'YYYY')) < 2006;
--==>> 3�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


--(SALES MANAGER�� MAX(SALARY))
SELECT MAX_SALARY
FROM JOBS
WHERE JOB_TITLE = 'Sales Manager';


--(SALES MANAGER�� JOB_ID)
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
--==>> �ѹ� �Ϸ�.



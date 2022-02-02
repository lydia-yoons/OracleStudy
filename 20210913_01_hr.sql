SELECT USER
FROM DUAL;
--==>> HR

--�� EMPLOYEES���̺��� SALARY��
--  �� �μ��� �̸����� �ٸ� �λ���� �����Ͽ� ������ �� �ֵ��� �Ѵ�.
-- Finance �� 10%
-- Executive �� 15%
-- Accounting �� 20%
-- (������ ���� �� ��� Ȯ�� �� ROLLBACK)

-- ������ �� 0%


SELECT *
FROM DEPARTMENTS;
     
UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID
                    WHEN ('Finance'�� �μ����̵�) THEN SALARY*1.1
                    WHEN ('Executive'�� �μ����̵�) THEN SALARY*1.15
                    WHEN ('FinanAccountingce'�� �μ����̵�) THEN SALARY*1.2
                    ELSE SALARY
              END
WHERE DEPARTMENT_ID IN ('Finance'�� �μ����̵�,'Executive'�� �μ����̵�,'Accounting'�� �μ����̵�);

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID
                    WHEN ('Finance'�� �μ����̵�) THEN SALARY*1.1
                    WHEN ('Executive'�� �μ����̵�) THEN SALARY*1.15
                    WHEN ('Accounting'�� �μ����̵�) THEN SALARY*1.2
                    ELSE SALARY
              END;

--'Finance'�� �μ����̵�
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Finance';

--'Executive'�� �μ����̵�
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Executive';

--'Accounting'�� �μ����̵�
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'Accounting';


UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Finance') 
                    THEN SALARY*1.1
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Executive') 
                    THEN SALARY*1.15
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Accounting') 
                    THEN SALARY*1.2
                    ELSE SALARY
              END;         
              

UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Finance') 
                    THEN SALARY*1.1
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Executive') 
                    THEN SALARY*1.15
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Accounting') 
                    THEN SALARY*1.2
                    ELSE SALARY
              END
WHERE DEPARTMENT_ID IN ((SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Finance') 
                        ,(SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Executive')
                        ,(SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Accounting'));


SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ('100','110','90');
--==>>
/*
100	Steven	King	SKING	515.123.4567	03/06/17	AD_PRES	27600			90
101	Neena	Kochhar	NKOCHHAR	515.123.4568	05/09/21	AD_VP	19550		100	90
102	Lex	De Haan	LDEHAAN	515.123.4569	01/01/13	AD_VP	19550		100	90
108	Nancy	Greenberg	NGREENBE	515.124.4569	02/08/17	FI_MGR	13208.8		101	100
109	Daniel	Faviet	DFAVIET	515.124.4169	02/08/16	FI_ACCOUNT	9900		108	100
110	John	Chen	JCHEN	515.124.4269	05/09/28	FI_ACCOUNT	9020		108	100
111	Ismael	Sciarra	ISCIARRA	515.124.4369	05/09/30	FI_ACCOUNT	8470		108	100
112	Jose Manuel	Urman	JMURMAN	515.124.4469	06/03/07	FI_ACCOUNT	8580		108	100
113	Luis	Popp	LPOPP	515.124.4567	07/12/07	FI_ACCOUNT	7590		108	100
205	Shelley	Higgins	SHIGGINS	515.123.8080	02/06/07	AC_MGR	14409.6		101	110
206	William	Gietz	WGIETZ	515.123.8181	02/06/07	AC_ACCOUNT	9960		205	110
*/


ROLLBACK;
--==>> �ѹ� �Ϸ�.


UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Finance') 
                    THEN SALARY*1.1
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Executive') 
                    THEN SALARY*1.15
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Accounting') 
                    THEN SALARY*1.2
                    ELSE SALARY
              END;
--==>> 107�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ('100','110','90');
--==>>
/*
100	Steven	King	SKING	515.123.4567	03/06/17	AD_PRES	27600			90
101	Neena	Kochhar	NKOCHHAR	515.123.4568	05/09/21	AD_VP	19550		100	90
102	Lex	De Haan	LDEHAAN	515.123.4569	01/01/13	AD_VP	19550		100	90
108	Nancy	Greenberg	NGREENBE	515.124.4569	02/08/17	FI_MGR	13208.8		101	100
109	Daniel	Faviet	DFAVIET	515.124.4169	02/08/16	FI_ACCOUNT	9900		108	100
110	John	Chen	JCHEN	515.124.4269	05/09/28	FI_ACCOUNT	9020		108	100
111	Ismael	Sciarra	ISCIARRA	515.124.4369	05/09/30	FI_ACCOUNT	8470		108	100
112	Jose Manuel	Urman	JMURMAN	515.124.4469	06/03/07	FI_ACCOUNT	8580		108	100
113	Luis	Popp	LPOPP	515.124.4567	07/12/07	FI_ACCOUNT	7590		108	100
205	Shelley	Higgins	SHIGGINS	515.123.8080	02/06/07	AC_MGR	14409.6		101	110
206	William	Gietz	WGIETZ	515.123.8181	02/06/07	AC_ACCOUNT	9960		205	110
*/


SELECT *
FROM EMPLOYEES;

ROLLBACK;


UPDATE EMPLOYEES
SET SALARY = CASE DEPARTMENT_ID
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Finance') 
                    THEN SALARY*1.1
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Executive') 
                    THEN SALARY*1.15
                    WHEN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME = 'Accounting') 
                    THEN SALARY*1.2
                    ELSE SALARY
              END
WHERE DEPARTMENT_ID IN (SELECT DEPARTMENT_ID
                            FROM DEPARTMENTS
                            WHERE DEPARTMENT_NAME IN ('Finance', 'Executive', 'Accounting'));
--==>> 11�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


ROLLBACK;
--==>> �ѹ� �Ϸ�.

--���� DELETE ����--

-- 1. ���̺��� ������ ��(���ڵ�)�� �����ϴ� �� ����ϴ� ����.

-- 2. ���� �� ����
-- DELETE [FROM] ���̺��
-- [WHERE ������];


SELECT *
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 198	Donald	OConnell	DOCONNEL	650.507.9833	07/06/21	SH_CLERK	2600		124	50

DELETE
FROM EMPLOYEES
WHERE EMPLOYEE_ID = 198;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

ROLLBACK;
--==>> �ѹ� �Ϸ�.


--�� EMPLOYEES ���̺��� �������� ������ �����Ѵ�.
--  ��, �μ����� 'IT'�� ���� �����Ѵ�.

--�� �����δ� EMPLOYEES ���̺��� �����Ͱ�(�����ϰ��� �ϴ� ���)
-- �ٸ� ���̺�(Ȥ�� �ڱ� �ڽ� ���̺�)�� ���� �������ϴ� ���
-- �������� ���� �� �ִٴ� ����� �����ؾ� �ϸ�...
-- �׿� ���� ������ �˾ƾ� �Ѵ�.



------------------[ȥ�� Ǭ �ڵ�]]------------------------------------
SELECT *
FROM DEPARTMNETS;


DELETE
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');

SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';

------------------[�Բ� Ǭ �ڵ�]]------------------------------------

--('IT'�� �μ���ȣ)
SELECT DEPARTMENT_ID
FROM DEPARTMENTS
WHERE DEPARTMENT_NAME = 'IT';
--==>> 60

SELECT *
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>>
/*
103	Alexander	Hunold	AHUNOLD	590.423.4567	06/01/03	IT_PROG	9000		102	60
104	Bruce	Ernst	BERNST	590.423.4568	07/05/21	IT_PROG	6000		103	60
105	David	Austin	DAUSTIN	590.423.4569	05/06/25	IT_PROG	4800		103	60
106	Valli	Pataballa	VPATABAL	590.423.4560	06/02/05	IT_PROG	4800		103	60
107	Diana	Lorentz	DLORENTZ	590.423.5567	07/02/07	IT_PROG	4200		103	60
*/


DELETE 
FROM EMPLOYEES
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID
                        FROM DEPARTMENTS
                        WHERE DEPARTMENT_NAME = 'IT');
--==>> �����߻�
/*
ORA-02292: integrity constraint (HR.DEPT_MGR_FK) violated - child record found
*/

ROLLBACK;


--���� ��(View) ����--

-- 1. ��(View)�� �̹� Ư���� �����ͺ��̽� ���� �����ϴ�
--  �ϳ� �̻��� ���̺��� ����ڰ� ��� ���ϴ� �����͵鸸��
--  ��Ȯ�ϰ� ���ϰ� �������� ���Ͽ� ������ ����ϴ� �÷��鸸 ��Ƽ�
--  �������� ������ ���̺�� ���Ǽ� �� ���ȿ� ������ �ִ�.

--  ������ ���̺��̶� �䰡 ������ �����ϴ� ���̺�(��ü)�� �ƴ϶�
--  �ϳ� �̻��� ���̺��� �Ļ��� �� �ٸ� ������ �� �� �ִ� ����̸�
--  �� ������ �����س��� SQL �����̶�� �� �� �ִٴ� ���̴�.

-- 2. ���Ĺ� ����
--  CREATE [OR REPLACE] VIEW ���̸�
-- [(ALIAS[, ALIAS, ...])]
-- AS
-- ��������(SUBQUERY)
-- [WITH CHECK OPTION]
-- [WITH READ ONLY];


--�� ��(View) ����
CREATE OR REPLACE VIEW VIEW_EMPLOYEES
AS
SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
    AND D.LOCATION_ID = L.LOCATION_ID(+)
    AND L.COUNTRY_ID = C.COUNTRY_ID(+)
    AND C.REGION_ID = R.REGION_ID(+);
--==>> View VIEW_EMPLOYEES��(��) �����Ǿ����ϴ�.


--�� ��(View) ��ȸ
SELECT *
FROM VIEW_EMPLOYEES;

--�� ��(View) ���� Ȯ��
DESC VIEW_EMPLOYEES;
--==>>
/*
�̸�              ��?       ����           
--------------- -------- ------------ 
FIRST_NAME               VARCHAR2(20) 
LAST_NAME       NOT NULL VARCHAR2(25) 
DEPARTMENT_NAME          VARCHAR2(30) 
CITY                     VARCHAR2(30) 
COUNTRY_NAME             VARCHAR2(40) 
REGION_NAME              VARCHAR2(25) 
*/



--�� ��(View) �ҽ� Ȯ�� -- CHECK~!!
SELECT VIEW_NAME, TEXT                  --CHECK~!!
FROM USER_VIEWS                         --TEXT
WHERE VIEW_NAME = 'VIEW_EMPLOYEES';     -- USER_VIEWS


/*
"SELECT E.FIRST_NAME, E.LAST_NAME, D.DEPARTMENT_NAME, L.CITY
        , C.COUNTRY_NAME, R.REGION_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C, REGIONS R
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
    AND D.LOCATION_ID = L.LOCATION_ID(+)
    AND L.COUNTRY_ID = C.COUNTRY_ID(+)
    AND C.REGION_ID = R.REGION_ID(+)"
*/



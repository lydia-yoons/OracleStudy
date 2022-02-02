--�� ���ӵ� ����� ��ȸ
select user
from dual;
--==>> SCOTT

select empno,ename,job,sal,deptno
from emp
where deptno=20;

--�� ���̺��� ��ȸ�ϴ� �������� �� �÷��� ��Ī(ALIAS)�� �ο��� �� �ִ�.

SELECT EMPNO AS "�����ȣ", ENAME "�����", JOB ����, SAL�޿�
FROM EMP
WHERE DEPTNO = 20;

--�� ���̺� ��ȸ �� ����ϴ� ��Ī�� �⺻ ������ ��AS "��Ī��"���� ���·� �ۼ��Ǹ�
--  �� ��, ��AS���� ���� �����ϴ�.
--  ����, ��""���� ���� ������.
--  ������, ��""���� ������ ��� ��ĥ�� ������ ����� �� ����.
--  ������ �ش� �÷��� ������ �ǹ��ϹǷ� ��Ī�� �̸� ���ο� ������ ����� ���
--  ��""���� ����Ͽ� ��Ī�� �ο��� �� �ֵ��� ó���ؾ� �Ѵ�.

--�� EMP���̺��� �μ���ȣ�� 20���� 30�� �������� ���� ��
--  �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
--  ��, ��Ī(ALIAS)�� ����Ѵ�.

SELECT EMPNO "�����ȣ", ENAME �����, JOB ����, SAL "�޿�", DEPTNO �μ���ȣ
FROM EMP
WHERE DEPTNO = 30 OR DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	    800	    20
7499	ALLEN	SALESMAN	1600	30
7521	WARD	SALESMAN	1250	30
7566	JONES	MANAGER 	2975	20
7654	MARTIN	SALESMAN	1250	30
7698	BLAKE	MANAGER	    2850	30
7788	SCOTT	ANALYST	    3000	20
7844	TURNER	SALESMAN	1500	30
7876	ADAMS	CLERK	    1100	20
7900	JAMES	CLERK	    950 	30
7902	FORD	ANALYST	    3000	20
*/

SELECT EMPNO "�����ȣ", ENAME �����, JOB ����, SAL "�޿�", DEPTNO �μ���ȣ
FROM EMP
WHERE DEPTNO IN (20,30);
--==>> IN �����ڸ� Ȱ���Ͽ� �̿� ���� ó���� ���� ������
--  ���� ������ ���� ����� ��ȯ�ϰ� �ȴ�.


--�� EMP ���̺��� ������ CLERK�� ������� ������ ��� ��ȸ�Ѵ�.
SELECT *
FROM EMP
WHERE JOB = 'CLERK';
--�� ����Ŭ����.. �Էµ� ������(��)��ŭ��
--  ��.��.��.  ��ҹ��� ������ �Ѵ�.

--�� EMP ���̺��� ������ CLERK�� ����� ��
--  20�� �μ��� �ٹ��ϴ� �������
--  �����ȣ, �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT EMPNO �����ȣ, ENAME �����, JOB ����, SAL �޿�, DEPTNO �μ���ȣ
FROM EMP
WHERE JOB = 'CLERK' AND DEPTNO = 20;
--==>>
/*
7369	SMITH	CLERK	800 	20
7876	ADAMS	CLERK	1100	20
*/

--�� EMP ���̺��� 10�� �μ��� �ٹ��ϴ� ������ ��
--   �޿��� 2500 �̻��� ��������
--  �����, ������, �޿�, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT ENAME �����, JOB ����, SAL �޿�, DEPTNO �μ���ȣ
FROM EMP
WHERE DEPTNO = 10 AND SAL >= 2500;
--==>> KING	PRESIDENT	5000	10


--�� ���̺� ����
--> ���������� ��� ���̺� �ȿ� �ִ� ������ ���븸 �����ϴ� ����

-- �� EMP ���̺��� �����͸� Ȯ���Ͽ�
--     �̰� �Ȱ��� �����Ͱ� ����ִ� EMPCOPY ���̺��� �����Ѵ�. (������..)

SELECT *
FROM EMP;

DESCRIBE EMP;
DESC EMP;


CREATE TABLE EMPCOPY
( EMPNO NUMBER(4) 
, ENAME VARCHAR2(10)
, JOB VARCHAR2(9)
, MGR NUMBER(4)
, HIREDATE DATE
, SAL NUMBER(7,2)
, COMM NUMBER(7,2)
, DEPTNO NUMBER(2) 
);


INSERT INTO EMPCOPY(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(7369, 'SMITH', 'CLERK', 7902, '80/12/17', 800, NULL, 20);


CREATE TABLE EMP2
AS
SELECT *
FROM EMP;
--==>> Table EMP2��(��) �����Ǿ����ϴ�.


--�� ������ ���̺� Ȯ��
SELECT *
FROM EMP2;

DESC EMP2;


--�� ��¥ ���� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


DROP TABLE EMPCOPY;
--==>> Table EMPCOPY��(��) �����Ǿ����ϴ�.


DELETE
FROM EMP2;
--==>> 14�� �� ��(��) �����Ǿ����ϴ�.

DROP TABLE EMP2;
--==>> Table EMP2��(��) �����Ǿ����ϴ�.

--�����̺� ����
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

CREATE TABLE TBL_DEPT
AS
SELECT *
FROM DEPT;
--==>> Table TBL_DEPT��(��) �����Ǿ����ϴ�.


--�ۺ����� ���̺� Ȯ��
SELECT *
FROM TBL_EMP;

SELECT *
FROM TBL_DEPT;

--�����̺� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;


--�� ���̺� Ŀ��Ʈ ���� �Է�
COMMENT ON TABLE TBL_EMP IS '�������';
--==>> Comment��(��) �����Ǿ����ϴ�.


--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP     	TABLE	�������
TBL_DEPT	    TABLE	
TBL_EXCAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS       	TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/

--�� ���̺� ������ Ŀ��Ʈ ���� �Է� (TBL_DEPT �� �μ�����)
COMMENT ON TABLE TBL_DEPT IS '�μ�����';
--==> Comment��(��) �����Ǿ����ϴ�.

--�� Ŀ��Ʈ ���� �Է� ���� �ٽ� Ȯ��
SELECT *
FROM USER_TAB_COMMENTS;
--==>>
/*
TBL_EMP     	TABLE	�������
TBL_DEPT    	TABLE	�μ�����
TBL_EXCAMPLE2	TABLE	
TBL_EXAMPLE1	TABLE	
SALGRADE	    TABLE	
BONUS	        TABLE	
EMP	            TABLE	
DEPT	        TABLE	
*/


--�� �÷� ������ Ŀ��Ʈ ����Ȯ��
SELECT *
FROM USER_COL_COMMENTS;
/*
TBL_EXCAMPLE2	ADDR	
TBL_EXAMPLE1	NAME	
TBL_EMP	JOB	
TBL_EMP	MGR	
BONUS	JOB	
TBL_DEPT	DNAME	
TBL_EMP	EMPNO	
EMP	SAL	
TBL_EMP	HIREDATE	
TBL_EXCAMPLE2	NO	
EMP	COMM	
EMP	JOB	
TBL_EMP	SAL	
DEPT	LOC	
TBL_EXCAMPLE2	NAME	
DEPT	DNAME	
TBL_EMP	DEPTNO	
BONUS	SAL	
EMP	MGR	
SALGRADE	LOSAL	
TBL_EMP	ENAME	
TBL_DEPT	DEPTNO	
TBL_EMP	COMM	
BONUS	ENAME	
SALGRADE	HISAL	
TBL_EXAMPLE1	ADDR	
EMP	HIREDATE	
DEPT	DEPTNO	
TBL_EXAMPLE1	NO	
SALGRADE	GRADE	
EMP	DEPTNO	
EMP	EMPNO	
EMP	ENAME	
TBL_DEPT	LOC	
BONUS	COMM	
*/


--�� ������ ����
PURGE RECYCLEBIN;
--==>> RECYCLEBIN��(��) ��������ϴ�.

SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	
TBL_DEPT	DNAME	
TBL_DEPT	LOC	
*/

--�� ���̺� �Ҽҵ�(���Ե�) �÷� ������ Ŀ��Ʈ ���� �Է�(����)
COMMENT ON COLUMN TBL_DEPT.DEPTNO IS '�μ���ȣ';
--==> Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.DNAME IS '�μ���';
--==> Comment��(��) �����Ǿ����ϴ�.
COMMENT ON COLUMN TBL_DEPT.LOC IS '�μ���ġ';
--==> Comment��(��) �����Ǿ����ϴ�.


--�� �÷� ���̺��� Ŀ��Ʈ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_DEPT';
--==>>
/*
TBL_DEPT	DEPTNO	�μ���ȣ
TBL_DEPT	DNAME	�μ���
TBL_DEPT	LOC	    �μ���ġ
*/

DESC TBL_EMP;
/*
EMPNO       NUMBER(4)       -- �����ȣ
ENAME       VARCHAR2(10)    -- �����
JOB         VARCHAR2(9)     -- ������
MGR         NUMBER(4)       -- �����ڻ����ȣ
HIREDATE    DATE            -- �Ի���
SAL         NUMBER(7,2)     -- �޿�
COMM        NUMBER(7,2)     -- ����
DEPTNO      NUMBER(2)       -- �μ���ȣ
*/

--�� TBL_EMP���̺� �Ҽӵ� (���Ե�)
--  �÷��� ���� Ŀ��Ʈ ���� �Է�(����)
COMMENT ON COLUMN TBL_EMP.EMPNO IS '�����ȣ';
COMMENT ON COLUMN TBL_EMP.ENAME IS '�����';
COMMENT ON COLUMN TBL_EMP.JOB IS '������';
COMMENT ON COLUMN TBL_EMP.MGR IS '�����ڻ����ȣ';
COMMENT ON COLUMN TBL_EMP.HIREDATE IS '�Ի���';
COMMENT ON COLUMN TBL_EMP.SAL IS '�޿�';
COMMENT ON COLUMN TBL_EMP.COMM IS '����';
COMMENT ON COLUMN TBL_EMP.DEPTNO IS '�μ���ȣ';

--�� Ŀ��Ʈ ������ �Էµ� ���̺��� �÷� ������ ���� Ȯ��
SELECT *
FROM USER_COL_COMMENTS
WHERE TABLE_NAME = 'TBL_EMP';
--==>>
/*
TBL_EMP	EMPNO	    �����ȣ
TBL_EMP	ENAME	    �����
TBL_EMP	JOB 	    ������
TBL_EMP	MGR	        �����ڻ����ȣ
TBL_EMP	HIREDATE	�Ի���
TBL_EMP	SAL	        �޿�
TBL_EMP	COMM    	����
TBL_EMP	DEPTNO	    �μ���ȣ
*/

--���� �÷� ������ �߰� �� ���� ����---

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺� �ֹε�Ϲ�ȣ ������ ���� �� �ִ� �÷� �߰�
ALTER TABLE TBL_EMP
ADD SSN CHAR(13);
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.
-- �� �� �տ� 0�� ���� ���ɼ��� �ִ� ���ڰ� ���յ� �����Ͷ��
--    �������� �ƴ� ���������� ������Ÿ���� ó���ؾ� �Ѵ�.         CHECK~!!

SELECT 9501052222222
FROM DUAL;

SELECT 0950105222
FROM DUAL;

SELECT '095010522'
FROM DUAL;



SELECT *
FROM TBL_EMP;
--==>>
/*
7369	SMITH	CLERK	    7902	1980-12-17	800		        20	
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	    30	
7521	WARD	SALESMAN	7698	1981-02-22	1250	500	    30	
7566	JONES	MANAGER 	7839	1981-04-02	2975		    20	
7654	MARTIN	SALESMAN	7698	1981-09-28	1250	1400	30	
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		    30	
7782	CLARK	MANAGER 	7839	1981-06-09	2450		    10	
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		    20	
7839	KING	PRESIDENT	    	1981-11-17	5000		    10	
7844	TURNER	SALESMAN	7698	1981-09-08	1500	0	    30	
7876	ADAMS	CLERK	    7788	1987-07-13	1100		    20	
7900	JAMES	CLERK	    7698	1981-12-03	950	        	30	
7902	FORD	ANALYST 	7566	1981-12-03	3000		    20	
7934	MILLER	CLERK	    7782	1982-01-23	1300		    10	
*/
--> SSN �÷��� ���������� �߰��� ��Ȳ���� Ȯ��

SELECT ENAME, SSN, HIREDATE, COMM, EMPNO
FROM TBL_EMP;
--> ���̺� ������ �÷��� ������ ���������� �ǹ� ����.

DESC TBL_EMP;

--�� TBL_EMP ���̺��� �߰��� SSN(�ֹε�Ϲ�ȣ) �÷� ����
ALTER TABLE TBL_EMP
DROP COLUMN SSN;
--==>> Table TBL_EMP��(��) ����Ǿ����ϴ�.


--�� Ȯ��
SELECT *
FROM TBL_EMP;

DESC TBL_EMP;
-->SSN(�ֹε�Ϲ�ȣ) �������� Ȯ��


DELETE 
FROM TBL_EMP
WHERE ENAME = 'SMITH';


DELETE TBL_EMP;     --�������� ����

DELETE
FROM TBL_EMP;       --������

--�� ���̺��� ���������� ����(������ �Ӹ� �ƴ϶�, ���̺� ��ü�� ����)
DROP TABLE TBL_EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>> �����߻�
/*
ORA-00942: table or view does not exist
00942. 00000 -  "table or view does not exist"
*Cause:    
*Action:
*/


--�� ���̺� �ٽ� ����(����)
CREATE TABLE TBL_EMP
AS
SELECT *
FROM EMP;
--==>> Table TBL_EMP��(��) �����Ǿ����ϴ�.
--------------------------------------------------------------------------------

--�� NULL �� ó��
SELECT 2, 10+2, 10-2, 10*2, 10/2
FROM DUAL;
--==>> 2	12	8	20	5

SELECT NULL, NULL+2, NULL-2, NULL*2, NULL/2
FROM DUAL;
--==>> (null)(null)(null)(null)(null)

-- �� ���� ���
--     NULL�� ������ ���� �ǹ��ϸ�, ���� �������� �ʴ� ���̱� ������
--     �� NULL�� ���꿡 ���Ե� ���... �� ����� ������ NULL�̴�.

--�� TBL_EMP���̺��� Ŀ�̼�(COMM,����)�� NULL�� ������
--  �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�. 
SELECT ENAME "�����", JOB "������", SAL "�޿�", COMM "����"
FROM TBL_EMP
WHERE COMM IS NULL;

SELECT *
FROM TBL_EMP;

--�� NULL�� ���� �������� �ʴ� ���̱� ������ �Ϲ����� �����ڸ� Ȱ���Ͽ� ���� �� ����.
--  ��, ������� �� ������ ������ �� ���ٴ� �ǹ��̴�.
--  NULL�� ������� ����� �� ���� �����ڵ�...
--  >=, <=, >, <, !=, ^=, <>

--�� TBL_EMP ���̺��� 20�� �μ��� �ٹ����� �ʴ� ��������
--  �����, ������, �μ���ȣ �׸��� ��ȸ�Ѵ�.
SELECT ENAME �����, JOB ������, DEPTNO �μ���ȣ
FROM TBL_EMP
WHERE DEPTNO <>20;
--==>>
/*
ALLEN	SALESMAN	30
WARD	SALESMAN	30
MARTIN	SALESMAN	30
BLAKE	MANAGER 	30
CLARK	MANAGER	    10
KING	PRESIDENT	10
TURNER	SALESMAN	30
JAMES	CLERK	    30
MILLER	CLERK	    10
*/

--�� TBL_EMP ���̺��� Ŀ�̼��� NULL�� �ƴ� ��������
--  �����, ������, �޿�, Ŀ�̼� �׸��� ��ȸ�Ѵ�.
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE COMM IS NOT NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/
SELECT ENAME, JOB, SAL, COMM
FROM TBL_EMP
WHERE NOT COMM IS NULL;
--==>>
/*
ALLEN	SALESMAN	1600	300
WARD	SALESMAN	1250	500
MARTIN	SALESMAN	1250	1400
TURNER	SALESMAN	1500	0
*/

--�� TBL_EMP ���̺��� ��� �������
--  �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--  ��, �޿�(SAL)�� �ų� �����Ѵ�. (��  1ȸ/��)
--  ����, ����(COMM)�� �ų� ���� �Ѵ�. (��  1ȸ/��)
SELECT EMPNO �����ȣ, ENAME �����, SAL �޿�, COMM ����, (SAL*12+COMM) "����"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800		
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975		
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		
7782	CLARK	2450		
7788	SCOTT	3000		
7839	KING	5000		
7844	TURNER	1500	0	    18000
7876	ADAMS	1100		
7900	JAMES	950		
7902	FORD	3000		
7934	MILLER	1300		
*/

SELECT ENAME �����, COMM
FROM TBL_EMP
WHERE EMPNO = 7369;
--==>> SMITH	

SELECT ENAME �����, NVL(COMM, 0)
FROM TBL_EMP
WHERE EMPNO = 7369;

SELECT ENAME �����, COMM ����, NVL(COMM, -1) "�Լ�ȣ����"
FROM TBL_EMP;
--==>> 
/*
SMITH		    -1
ALLEN	300 	300
WARD	500	    500
JONES	(null)  -1
MARTIN	1400	1400
BLAKE	(null)  -1
CLARK	(null)	-1
SCOTT	(null)	-1
KING	(null)	-1
TURNER	0	    0
ADAMS	(null)	-1
JAMES	(null)	-1
FORD	(null)  -1
MILLER	(null)  -1
*/

SELECT EMPNO �����ȣ, ENAME �����, SAL �޿�, NVL(COMM, 0) "Ŀ�̼�"
        , SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800	    0	    9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975	0	    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	    34200
7782	CLARK	2450	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0	    13200
7900	JAMES	950 	0	    11400
7902	FORD	3000	0	    36000
7934	MILLER	1300	0	    15600
*/


--�� NVL2()
--> ù ��° �Ķ���� ���� NULL�� �ƴ� ���, �� ��° �Ķ���� ���� ��ȯ�ϰ�
-- ù ��° �Ķ���� ���� NULL�� ���, �� ��° �Ķ���� ���� ��ȯ�Ѵ�.

SELECT ENAME, COMM, NVL2(COMM, 'û��÷�', '���÷�') "Ȯ�ο���"
FROM TBL_EMP;
--==>>
/*
SMITH	(null)  ���÷�
ALLEN	300	    û��÷�
WARD	500	    û��÷�
JONES	(null)	���÷�
MARTIN	1400	û��÷�
BLAKE	(null)	���÷�
CLARK	(null)	���÷�
SCOTT	(null)	���÷�
KING	(null)  ���÷�
TURNER	0	    û��÷�
ADAMS	(null)  ���÷�
JAMES	(null)	���÷�
FORD	(null)	���÷�
MILLER	(null)	���÷�
*/

--�� NVL2()Ȱ��~ ���� ��ȸ
-- COMM �� NULL�� �ƴϸ�... SAL*12+COMM
-- COMM �� NULL�̸�........ SAL*12

SELECT EMPNO �����ȣ, ENAME �����, SAL �޿�, NVL2(COMM, COMM, 0) "Ŀ�̼�"
        , SAL*12+NVL2(COMM, COMM, 0) "����"
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800	    0	    9600
7499	ALLEN	1600	300	    19500
7521	WARD	1250	500	    15500
7566	JONES	2975	0	    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850	0	    34200
7782	CLARK	2450	0	    29400
7788	SCOTT	3000	0	    36000
7839	KING	5000	0	    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100	0	    13200
7900	JAMES	950	    0	    11400
7902	FORD	3000	0	    36000
7934	MILLER	1300	0	    15600
*/


--�� COALESCE()
--> �Ű����� ������ ���� ���·� �����ϰ� Ȱ���Ѵ�.
-- �� �տ� �ִ� �Ű��������� ���ʷ� NULL���� �ƴ��� Ȯ���Ͽ�
-- NULL�� �ƴҰ�� ����(��ȯ, ó��)�ϰ�,
-- NULL�� ��쿡�� �� ���� �Ű������� ������ ����(��ȯ, ó��)�Ѵ�.
-- NVL()�� NVL2()�� ����.. ��~~~�� ����� ���� ����Ͽ� ó���� �� �ִ� Ư¡�� ���� �ִ�.

SELECT NULL "�⺻ Ȯ��"
    , COALESCE(NULL,NULL,NULL,NULL,30) "�Լ�Ȯ��1"
    , COALESCE(NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100) "�Լ�Ȯ��2"
    , COALESCE(10,NULL,NULL,NULL) "�Լ�Ȯ��3"
    , COALESCE(NULL,NULL, 200,NULL) "�Լ�Ȯ��4"
FROM DUAL;
--==>> (null)   30	100	10	200


--�� �ǽ��� ���� ������ �߰� �Է�
INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, DEPTNO)
VALUES(8000, '���ش�', 'SALESMAN', 7839, SYSDATE, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

INSERT INTO TBL_EMP(EMPNO, ENAME, JOB, MGR, HIREDATE, COMM, DEPTNO)
VALUES(8001, '�̴ٿ�','SALESMAN', 7839, SYSDATE, 100, 10);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_EMP;
--==>>
/*
           : 
8000	���ش�	SALESMAN	7839	2021-08-27	(null)	(null)	10
8001	�̴ٿ�	SALESMAN	7839	2021-08-27	(null)	100	    10
*/

COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� TBL_EMP ���̺��� ��� �������
--  �����ȣ, �����, �޿�, Ŀ�̼�, ���� �׸��� ��ȸ�Ѵ�.
--  ��, �޿�(SAL)�� �ų� �����Ѵ�. (��  1ȸ/��)
--  ����, ����(COMM)�� �ų� ���� �Ѵ�. (��  1ȸ/��)
--  �� COALESCE() �Լ��� Ȱ��~!
SELECT EMPNO �����ȣ, ENAME �����, COALESCE(NULL, SAL, 0) "�޿�"
        , COALESCE(NULL, COMM, 0) "Ŀ�̼�", COALESCE(NULL, SAL, 0)*12+COALESCE(NULL, COMM, 0) "����"        
FROM TBL_EMP;
--> ���� Ǭ �ڵ�

-- �Բ� Ǭ �ڵ�ڡڡڡڡ�
SELECT EMPNO �����ȣ, ENAME �����, SAL "�޿�" , COMM "Ŀ�̼�"
        , COALESCE(SAL*12+COMM, SAL*12, COMM, 0) "����"        
FROM TBL_EMP;
--==>>
/*
7369	SMITH	800		        9600
7499	ALLEN	1600	300 	19500
7521	WARD	1250	500	    15500
7566	JONES	2975		    35700
7654	MARTIN	1250	1400	16400
7698	BLAKE	2850		    34200
7782	CLARK	2450		    29400
7788	SCOTT	3000		    36000
7839	KING	5000		    60000
7844	TURNER	1500	0	    18000
7876	ADAMS	1100		    13200
7900	JAMES	950		        11400
7902	FORD	3000		    36000
7934	MILLER	1300		    15600
8000	���ش�			        0
8001	�̴ٿ�		    100	    100
*/

--------------------------------------------------------------------------------
--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ��¥ �� �ð��� ��ȯ�ϴ� �Լ�
SELECT SYSDATE, CURRENT_DATE, LOCALTIMESTAMP
FROM DUAL;
--==>>
/*
2021-08-27 16:33:35	
2021-08-27 16:33:35	
21/08/27 16:33:35.000000000
*/

--�� �÷��� �÷��� ����(����)
--  ����Ÿ�԰� ����ž���� ����
-- ��+�������� 

SELECT '���ش�'+'�̴ٿ�'
FROM DUAL;
--==>
/*
ORA-01722: invalid number
01722. 00000 -  "invalid number"
*Cause:    The specified number was invalid.
*Action:   Specify a valid number.
*/

SELECT '���ش�','�̴ٿ�'
FROM DUAL;
--==>> ���ش�	�̴ٿ�

SELECT '���ش�'||'�̴ٿ�'
FROM DUAL;
--==>> ���ش��̴ٿ�

SELECT EMPNO, ENAME
FROM TBL_EMP;

SELECT EMPNO||ENAME
FROM TBL_EMP;
--==>>
/*
7369SMITH
7499ALLEN
7521WARD
7566JONES
7654MARTIN
7698BLAKE
7782CLARK
7788SCOTT
7839KING
7844TURNER
7876ADAMS
7900JAMES
7902FORD
7934MILLER
8000���ش�
8001�̴ٿ�
*/

SELECT '�ش��̴�', SYSDATE, '�� ����', 500, '���� ���Ѵ�.'
FROM DUAL;
--==>> �ش��̴�	2021-08-27 16:41:52	�� ����	500	���� ���Ѵ�.
--      ����Ÿ��  ��¥Ÿ��        ����Ÿ�� ����Ÿ�� ����Ÿ��

SELECT '�ش��̴�'|| SYSDATE ||'�� ����'||500|| '���� ���Ѵ�.'
FROM DUAL;
--==>> �ش��̴�2021-08-27 16:42:48�� ����500���� ���Ѵ�.
--         �� ������ ����Ÿ��

-- �� ����Ŭ������ ���� Ÿ���� ���·� �� ��ȯ�ϴ� ������ ���� ����
--   ������ ó���� ����ó�� ��||���� ������ָ� ������ �÷��� �÷���
--  (��, ���� �ٸ� ������ �����͵���) �����ϴ� ���� �����ϴ�.
--  MSSQL ���������� ��� �����͸� ���� Ÿ������ CONVERT �ؾ� �Ѵ�.

--�� TBL_EMP���̺��� ������ Ȱ���Ͽ�
--  ��� �������� �����Ϳ� ���ؼ�
--  ������ ���� ����� ���� �� �ֵ��� �������� �����Ѵ�.

-- SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�.
-- ALLER�� ���� ������ 19500�ε� ��� ������ 39000�̴�.
--                         :

DELETE
FROM TBL_EMP
WHERE EMPNO IN (8000,8001);
--==>> ���ش�, �̴ٿ� ��� ��Ű��

SELECT ENAME ||'�� ���� ������ '|| COALESCE(SAL*12+COMM, SAL*12, 0)||'�ε� ��� ������ '
        || COALESCE((SAL*12+COMM)*2, SAL*12*2, 0)|| '�̴�.'
FROM TBL_EMP;
--==>>
/*
SMITH�� ���� ������ 9600�ε� ��� ������ 19200�̴�.
ALLEN�� ���� ������ 19500�ε� ��� ������ 39000�̴�.
WARD�� ���� ������ 15500�ε� ��� ������ 31000�̴�.
JONES�� ���� ������ 35700�ε� ��� ������ 71400�̴�.
MARTIN�� ���� ������ 16400�ε� ��� ������ 32800�̴�.
BLAKE�� ���� ������ 34200�ε� ��� ������ 68400�̴�.
CLARK�� ���� ������ 29400�ε� ��� ������ 58800�̴�.
SCOTT�� ���� ������ 36000�ε� ��� ������ 72000�̴�.
KING�� ���� ������ 60000�ε� ��� ������ 120000�̴�.
TURNER�� ���� ������ 18000�ε� ��� ������ 36000�̴�.
ADAMS�� ���� ������ 13200�ε� ��� ������ 26400�̴�.
JAMES�� ���� ������ 11400�ε� ��� ������ 22800�̴�.
FORD�� ���� ������ 36000�ε� ��� ������ 72000�̴�.
MILLER�� ���� ������ 15600�ε� ��� ������ 31200�̴�.
*/

SELECT ENAME || '�� ���� ������ ' || (SAL *12 + NVL(COMM,0)) || '�ε� ��� ������ ' 
        || (SAL *24 + NVL(COMM,0) *2) || '�̴�.'
FROM TBL_EMP; 



--�� 
SELECT *
FROM TBL_EMP;

-- SMITH's �Ի����� 1980-12-17�̴�. �׸��� �޿��� 800�̴�.
-- ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT ENAME || '''s �Ի����� '|| HIREDATE||'�̴�. �׸��� �޿��� '|| SAL||'�̴�.'
FROM TBL_EMP;
--==>>
/*
SMITH's �Ի����� 1980-12-17�̴�. �׸��� �޿��� 800�̴�.
ALLEN's �Ի����� 1981-02-20�̴�. �׸��� �޿��� 1600�̴�.
WARD's �Ի����� 1981-02-22�̴�. �׸��� �޿��� 1250�̴�.
JONES's �Ի����� 1981-04-02�̴�. �׸��� �޿��� 2975�̴�.
MARTIN's �Ի����� 1981-09-28�̴�. �׸��� �޿��� 1250�̴�.
BLAKE's �Ի����� 1981-05-01�̴�. �׸��� �޿��� 2850�̴�.
CLARK's �Ի����� 1981-06-09�̴�. �׸��� �޿��� 2450�̴�.
SCOTT's �Ի����� 1987-07-13�̴�. �׸��� �޿��� 3000�̴�.
KING's �Ի����� 1981-11-17�̴�. �׸��� �޿��� 5000�̴�.
TURNER's �Ի����� 1981-09-08�̴�. �׸��� �޿��� 1500�̴�.
ADAMS's �Ի����� 1987-07-13�̴�. �׸��� �޿��� 1100�̴�.
JAMES's �Ի����� 1981-12-03�̴�. �׸��� �޿��� 950�̴�.
FORD's �Ի����� 1981-12-03�̴�. �׸��� �޿��� 3000�̴�.
MILLER's �Ի����� 1982-01-23�̴�. �׸��� �޿��� 1300�̴�.
*/

-- �� ���ڿ��� ��Ÿ���� Ȭ����ǥ ���̿���(���۰� ��)
--  Ȭ����ǥ �� ���� Ȭ����ǥ �ϳ�(���۽�Ʈ����)�� �ǹ��Ѵ�.
--  ���������...
--  Ȭ����ǥ �ϳ� ��'���� ���ڿ��� ������ ��Ÿ����
--  Ȭ����ǥ �� �� ��''���� ���ڿ� ���� �ȿ��� ���۽�Ʈ���Ǹ� ��Ÿ����
--  �ٽ� �����ϴ� Ȭ����ǥ �ϳ� ��'���� ���ڿ� ������ ���Ḧ �ǹ��ϰ� �Ǵ� ���̴�.
SELECT *
FROM TBL_EMP
WHERE JOB = 'salesman';
--==> ��ȸ ��� ����

--�� UPPER(), LOWER(), INITCAP()
SELECT 'oRAcLE' "1", UPPER('oRAcLE')"2", LOWER('oRAcLE')"3", INITCAP('oRAcLE')"4"
FROM DUAL;
--==>> oRAcLE	ORACLE	oracle	Oracle
-- UPPER()�� ��� �빮�ڷ� ��ȯ�Ͽ� ��ȯ
-- LOWER()�� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ
-- INITCAP() �� ù ���ڸ� �빮�ڷ� �ϰ� �������� ��� �ҹ��ڷ� ��ȯ�Ͽ� ��ȯ

SELECT *
FROM TBL_EMP
WHERE LOWER(JOB)=LOWER('sALeSmAn');


COMMIT;
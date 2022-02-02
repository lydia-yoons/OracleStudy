SELECT USER
FROM DUAL;
--==>> SCOTT

SELECT *
FROM TBL_EMP;

--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� �Ի��� ������
--  �����, ������, �Ի��� �׸��� ��ȸ �Ѵ�.
SELECT ENAME �����, JOB ������, HIREDATE �Ի���
FROM TBL_EMP
WHERE HIREDATE = '1981-09-28';


--�� TO_DATE()
SELECT ENAME �����, JOB ������, HIREDATE �Ի���
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>> MARTIN	SALESMAN	81-09-28


--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


SELECT ENAME �����, JOB ������, HIREDATE �Ի���
FROM TBL_EMP
WHERE HIREDATE = TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>> MARTIN	SALESMAN	1981-09-28

--�� TBL_EMP ���̺��� �Ի����� 1981�� 9�� 28�� ����(�ش��� ����)�� �Ի��� ������
--  �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�.

SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
MARTIN	SALESMAN	1981-09-28
SCOTT	ANALYST	1987-07-13
KING	PRESIDENT	1981-11-17
ADAMS	CLERK	1987-07-13
JAMES	CLERK	1981-12-03
FORD	ANALYST	1981-12-03
MILLER	CLERK	1982-01-23
*/

--�� ����Ŭ������ ��¥ �������� ũ�� �񱳰� �����ϴ�.
--  ����Ŭ���� ��¥ �����Ϳ� ���� ũ�� �� ��
--  ���ź��� �̷��� �� ū ������ �����Ͽ� ó���ϰ� �ȴ�.


--�� TBL_EMP ���̺��� �Ի����� 1981�� 4�� 2�Ϻ���
--  1981�� 9�� 28�� ���̿� �Ի��� ��������
--  �����, ������, �Ի��� �׸��� ��ȸ�Ѵ�. (�ش��� ����)

SELECT ENAME �����, JOB ������, HIREDATE �Ի���
FROM TBL_EMP
WHERE HIREDATE >= TO_DATE('1981-04-02', 'YYYY-MM-DD') 
  AND HIREDATE <= TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER	1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	1981-05-01
CLARK	MANAGER	1981-06-09
TURNER	SALESMAN	1981-09-08
*/

--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


--�� BETWEEN �� AND ��
SELECT ENAME "�����", JOB "������", HIREDATE "�Ի���"
FROM TBL_EMP
WHERE HIREDATE BETWEEN TO_DATE('1981-04-02', 'YYYY-MM-DD') 
                AND TO_DATE('1981-09-28', 'YYYY-MM-DD');
--==>>
/*
JONES	MANAGER 	1981-04-02
MARTIN	SALESMAN	1981-09-28
BLAKE	MANAGER	    1981-05-01
CLARK	MANAGER	    1981-06-09
TURNER	SALESMAN	1981-09-08
*/

SELECT *
FROM TBL_EMP
WHERE SAL BETWEEN 1600 AND 3000;
--==>>
/*
7499	ALLEN	SALESMAN	7698	1981-02-20	1600	300	30
7566	JONES	MANAGER	    7839	1981-04-02	2975		20
7698	BLAKE	MANAGER	    7839	1981-05-01	2850		30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		10
7788	SCOTT	ANALYST	    7566	1987-07-13	3000		20
7902	FORD	ANALYST	    7566	1981-12-03	3000		20
*/

SELECT *
FROM TBL_EMP
WHERE ENAME BETWEEN 'C' AND 'S';
--==>>
/*
7566	JONES	MANAGER 	7839	1981-04-02	2975		20
7654	MARTIN	SALESMAN	7698	1981-09-28	1250   1400	30
7782	CLARK	MANAGER	    7839	1981-06-09	2450		10
7839	KING	PRESIDENT		    1981-11-17	5000		10
7900	JAMES	CLERK	    7698	1981-12-03	950		    30
7902	FORD	ANALYST 	7566	1981-12-03	3000		20
7934	MILLER	CLERK	    7782	1982-01-23	1300		10
*/

--�� ASCII()
SELECT ASCII('A'), ASCII('B'), ASCII('a'), ASCII('s')
FROM DUAL;
--==>> 65	66	97	115


--�� ��BETWEEN �� AND �Ρ��� ��¥��, ������, ������ ������ ��ο� ����ȴ�.
--  ��, �������� ��� �ƽ�Ű�ڵ� ������ ������ ������
--  �빮�ڰ� ���ʿ� ��ġ�ϰ� �ҹ��ڰ� ���ʿ� ��ġ�Ѵ�.
--  ����, BETWEEN �� AND �δ� �������� ����Ǵ� ��������
--  ����Ŭ ���������δ� �ε�ȣ �������� ���·� �ٲ�� ������ ó���ȴ�.


--�� TBL_EMP���̺��� ������ SALESMAN��CLERK�� �����
--  �����, ������, �޿� �׸��� ��ȸ�Ѵ�.
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB = 'SALESMAN' 
    OR JOB = 'CLERK';
    
SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB IN ('SALESMAN', 'CLERK');

SELECT ENAME, JOB, SAL
FROM TBL_EMP
WHERE JOB =ANY ('SALESMAN', 'CLERK');   --cf. ��=ALL��

--�� ���� 3���� ������ �������� ��� ���� ����� ��ȯ�Ѵ�.
--  ������, �� ���� �������� ���� ������ ó���ȴ�.
--  ����, �޸𸮿� ���� ������ �ƴ϶� CPU�� ���� �����̱� ������
--  �� �κб��� �����Ͽ� �������� ������ �����ϴ� ���� ���� �ʴ�.
--  �� ��IN���� ��=ANY���� ���� ������ ȿ���� ������.
--  ��� ���������δ� ��OR�� ������ ����Ǿ� ���� ó���ȴ�.

--------------------------------------------------------------------------------

--�� �߰� �ǽ� ���̺� ����(TBL_SAWON)
CREATE TABLE TBL_SAWON
(SANO   NUMBER(4)
, SANAME    VARCHAR2(30)
, JUBUN CHAR(13)
, HIREDATE  DATE    DEFAULT SYSDATE
, SAL   NUMBER(10)
);
--==>> 
Table TBL_SAWON��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;
--==> ��ȸ��� ����

DESC TBL_SAWON;
--==>>
/*
�̸�       ��? ����           
-------- -- ------------ 
SANO        NUMBER(4)    
SANAME      VARCHAR2(30) 
JUBUN       CHAR(13)     
HIREDATE    DATE         
SAL         NUMBER(10)   
*/

--�� ������ �Է�(TBL_SAWON)
INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1001, '��ҿ�', '9307302234567', TO_DATE('2001-01-03','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1002, '�̴ٿ�', '9510272234567', TO_DATE('2010-11-05','YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1003, '������', '0909014234567', TO_DATE('2012-08-16','YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1004, '�մ���', '9406032234567', TO_DATE('1999-02-02','YYYY-MM-DD'), 4000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1005, '������', '0406034234567', TO_DATE('2013-07-15','YYYY-MM-DD'), 1000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1006, '���̰�', '0202023234567', TO_DATE('2011-08-17','YYYY-MM-DD'), 2000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1007, '���̳�', '8012122234567', TO_DATE('1999-11-11','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1008, '������', '8105042234567', TO_DATE('1999-11-11','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1009, '������', '7209301234567', TO_DATE('1995-11-11','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1010, '������', '7001022234567', TO_DATE('1995-10-10','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1011, '���켱', '9001022234567', TO_DATE('2001-10-10','YYYY-MM-DD'), 2000);


INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1012, '����', '8009011234567', TO_DATE('1998-02-13','YYYY-MM-DD'), 4000);


INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1013, '������', '8203051234567', TO_DATE('2002-02-13','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1014, '������', '9208091234567', TO_DATE('2002-02-13','YYYY-MM-DD'), 3000);

INSERT INTO TBL_SAWON(SANO, SANAME, JUBUN, HIREDATE, SAL)
VALUES(1015, '�賲��', '0202023234567', TO_DATE('2015-01-10','YYYY-MM-DD'), 2000);

--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 15

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	    9307302234567	2001-01-03	3000
1002	�̴ٿ�	    9510272234567	2010-11-05	2000
1003	������	    0909014234567	2012-08-16	1000
1004	�մ���	    9406032234567	1999-02-02	4000
1005	������	    0406034234567	2013-07-15	1000
1006	���̰�	    0202023234567	2011-08-17	2000
1007	���̳�	    8012122234567	1999-11-11	3000
1008	������	    8105042234567	1999-11-11	3000
1009	������	    7209301234567	1995-11-11	3000
1010	������	7001022234567	1995-10-10	3000
1011	���켱	    9001022234567	2001-10-10	2000
1012	����	    8009011234567	1998-02-13	4000
1013	������	    8203051234567	2002-02-13	3000
1014	������	    9208091234567	2002-02-13	3000
1015	�賲��	    0202023234567	2015-01-10	2000
*/

--��Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� TBL_SAWON ���̺��� ��ҿ� ����� ������ ��� ��ȸ�Ѵ�.
SELECT *
FROM TBL_SAWON
WHERE SANAME = '��ҿ�';
--==>> 1001	��ҿ�	9307302234567	2001-01-03	3000


SELECT *
FROM TBL_SAWON
WHERE SANAME LIKE '��ҿ�';
--==>> 1001	��ҿ�	9307302234567	2001-01-03	3000

--�� LIKE : ���� �� �����ϴ�
--          �λ� �� ~�� ����, ~ó��

--�� WILD CHARACTER �� ��%��
--   ��LIKE���� �Բ� ���Ǵ� ��%���� ��� ���ڸ� �ǹ��ϰ�
--   ��LIKE���� �Բ� ���Ǵ� ��_���� �ƹ� ���� 1���� �ǹ��Ѵ�.

--�� TBL_SAWON ���̺��� ������ ���̡����� �����
--  �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME = '��';
--==>> ��ȸ��� ���� (�����߻����� ����)

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>>
/*
�̴ٿ�	9510272234567	2000
������	0909014234567	1000
������	0406034234567	1000
���̰�	0202023234567	2000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_';
--==>> ��ȸ��� ���� (�����߻����� ����)

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>
/*
�̴ٿ�	9510272234567	2000
������	0909014234567	1000
������	0406034234567	1000
���̰�	0202023234567	2000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME = '��_';
--==>> ��ȸ��� ���� (�����߻����� ����)


--�� TBL_SAWON ���̺��� �̸��� ���������� �����ϴ� �����
--  �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��%';
--==>>
/*
����	8009011234567	4000
������	8203051234567	3000
������	9208091234567	3000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��__';
--==>> ���� ����
/*
������	8203051234567	3000
������	9208091234567	3000
*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '��_';
--==>> ������, ������ ����
/*
����	8009011234567	4000
*/

--�� TBL_SAWON ���̺��� �̸��� ������ ���ڰ� ����������
--  ������ ����� �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��';
--==>>
/*
�̴ٿ�	9510272234567	2010-11-05	2000
������	0909014234567	2012-08-16	1000
*/


--�� TBL_SAWON ���̺��� �̸��ȿ� ���̡���� ���ڰ�
--  �ϳ��� ���ԵǾ� ������ �� �����
--  �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%';
--==>>
/*
�̴ٿ�	9510272234567	2010-11-05	2000
������	0909014234567	2012-08-16	1000
������	0406034234567	2013-07-15	1000
���̰�	0202023234567	2011-08-17	2000
���̳�	8012122234567	1999-11-11	3000
������	8105042234567	1999-11-11	3000
*/

--�� TBL_SAWON ���̺��� �̸��ȿ� ���̡���� ���ڰ�
--   �� �� ���ԵǾ� ������ �� �����
-- �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%��%��%';
--==>> 
/*
������	0406034234567	2013-07-15	1000
���̰�	0202023234567	2011-08-17	2000
*/

SELECT SANAME, JUBUN, HIREDATE, SAL
FROM TBL_SAWON
WHERE SANAME LIKE '%����%';       --���̡��� ���������� �� ��(�پ�) ����ִ� ������ ��ȸ


--�� TBL_SAWON ���̺��� ������ ������ �����
--  �����, �ֹι�ȣ, �Ի���, �޿� �׸��� ��ȸ�Ѵ�.
--> �Ұ�.. ��, ���� ������ �� �� ���

--�� �����ͺ��̽� ���� �� ���� �̸��� �и��ؼ� ó���ؾ� �� ���� ��ȹ�� �ִٸ�
--  (���� ������ �ƴϴ���..) ���̺��� �� �÷��� �̸� �÷��� �и��Ͽ� �����ؾ��Ѵ�.

--�� TBL_SAWON ���̺��� ���������� �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2______' 
   OR JUBUN LIKE '______4______';
--==>>
/*
��ҿ�	    9307302234567	3000
�̴ٿ�	    9510272234567	2000
������	    0909014234567	1000
�մ��� 	    9406032234567	4000
������	    0406034234567	1000
���̳�	    8012122234567	3000
������	    8105042234567	3000
������	7001022234567	3000
���켱	    9001022234567	2000*/

SELECT SANAME, JUBUN, SAL
FROM TBL_SAWON
WHERE JUBUN LIKE '______2%' 
   OR JUBUN LIKE '______4%';
   
--�� ���̺� ����(TBL_WATCH)
CREATE TABLE TBL_WATCH
(WATCH_NAME     VARCHAR2(20)
, BIGO      VARCHAR2(100)
);
--==>> Table TBL_WATCH��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(TBL_WATCH)
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('�ݽð�', '���� 99.99% ������ �ְ�� �ð�');
INSERT INTO TBL_WATCH(WATCH_NAME, BIGO)
VALUES('���ð�', '�� ������ 99.99���� ȹ���� �ð�');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_WATCH;
--==>>
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�ԿϷ�.

--�� TBL_WATCH ���̺��� BIGO�÷���
--  ��99.99%����� ���ڰ� ����ִ� ��(���ڵ�)�� ������ ��ȸ�Ѵ�.
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99%%';
--==>> '%'�� ��� �ٿ��� '%'
/*
�ݽð�	���� 99.99% ������ �ְ�� �ð�
���ð�	�� ������ 99.99���� ȹ���� �ð�
*/

--��ESCAPE
SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99$%%' ESCAPE '$';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

SELECT *
FROM TBL_WATCH
WHERE BIGO LIKE '%99.99\%%' ESCAPE '\';
--==>> �ݽð�	���� 99.99% ������ �ְ�� �ð�

--�� ESCAPE�� ������ ������ ���� �� ���ڴ� ���ϵ�ī�忡�� Ż����Ѷ�...
--  ��ESCAPE '\'��
-- �Ϲ������� ���󵵰� ���� Ư������(Ư����ȣ)�� ����ϰ� �ȴ�.

--------------------------------------------------------------------------------

-- ���� COMMIT / ROLLBACK ����--

SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES   	CHICAGO
40	OPERATIONS	BOSTON
*/


--�� ������ �Է�(TBL_DEPT)
INSERT INTO TBL_DEPT(DEPTNO, DNAME, LOC)
VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--  �� �����ʹ� TBL_DEPT���̺��� ����Ǿ� �ִ�
--  �ϵ��ũ �翡 �������׷� ����Ǿ� ����� ���� �ƴ϶�
--  �޸�(RAM)�� �Էµ� ���̴�.


--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ٽ�Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/
--> 50�� ���ߺ� ���� �� ���� �����Ͱ�
--  �ҽǵǾ����� Ȯ��(�������� ����)

--�� �ٽ� �Է�
INSERT INTO TBL_DEPT(DEPTNO, DNAME, LOC)
VALUES(50, '���ߺ�', '����');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
--> �޸� �� �Էµ� �� �����͸� ���� �ϵ��ũ�� ���������� �����ϱ� ���ؼ���
--  COMMIT�� �����ؾ��Ѵ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	    ����
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.

--�� Ŀ�� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	    CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�     	����
*/

--�� �ѹ�
ROLLBACK;
--==> �ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==> 
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/
--> �ѹ�(ROLLBACK)�� ������������ �ұ��ϰ�
--  50��... ���ߺ�.. ���� �� �����ʹ� �ҽǵ��� �ʾ����� Ȯ��

--�� COMMIT�� ������ ���ķ� DML����(INSERT, UPDATE, DELETE)�� ����
--  ����� �����͸� ����� �� �ִ� ���� ��...
--  DML ����� ����� �� COMMIT�� �����ϰ� ���� ROLLBACK�� �����غ���
--  ���� ���·� �ǵ��� �� ����. (�ƹ��� �ҿ��� ����.)

--�� ������ ����(TBL_DEPT)
UPDATE TBL_DEPT
SET DNAME = '������', LOC='��õ'
WHERE DEPTNO = 50;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	������	��õ
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ����  Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/
--> ����(UPDATE)�� �����ϱ� ���� ���·� �����Ǿ����� Ȯ��

--�� ������ ����(DELETE)
DELETE
FROM TBL_DEPT
WHERE DEPTNO=50;
--==> 1 �� ��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
*/

--�� �ѹ�
ROLLBACK;
--==>> �ѹ� �Ϸ�.

--�� �ѹ� ���� �ٽ� Ȯ��
SELECT *
FROM TBL_DEPT;
--==>>
/*
10	ACCOUNTING	NEW YORK
20	RESEARCH	DALLAS
30	SALES	CHICAGO
40	OPERATIONS	BOSTON
50	���ߺ�	����
*/
--==>> ����(DELETE)������ �����ϱ� ���� ���·� �����Ǿ����� Ȯ��

--------------------------------------------------------------------------------

--���� ����(ORDER BY) ����--
SELECT ENAME "�����", DEPTNO �μ���ȣ, JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP;
--==>>
/*
SMITH	20	CLERK	    800    	9600
ALLEN	30	SALESMAN	1600	19500
WARD	30	SALESMAN	1250	15500
JONES	20	MANAGER	    2975	35700
MARTIN	30	SALESMAN	1250	16400
BLAKE	30	MANAGER	    2850	34200
CLARK	10	MANAGER	    2450	29400
SCOTT	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
TURNER	30	SALESMAN	1500	18000
ADAMS	20	CLERK	    1100	13200
JAMES	30	CLERK	    950	    11400
FORD	20	ANALYST	    3000	36000
MILLER	10	CLERK	    1300	15600
*/


SELECT ENAME "�����", DEPTNO �μ���ȣ, JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY DEPTNO ASC;    --> DEPTNO --> �μ���ȣ ���� ����
                        --> ASC    --> �������� ����
/*
CLARK	10	MANAGER	    2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
JONES	20	MANAGER	    2975	35700
FORD	20	ANALYST 	3000	36000
ADAMS	20	CLERK	    1100	13200
SMITH	20	CLERK	    800	    9600
SCOTT	20	ANALYST	    3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	    950	    11400
BLAKE	30	MANAGER 	2850	34200
MARTIN	30	SALESMAN	1250	16400
*/                        


SELECT ENAME "�����", DEPTNO �μ���ȣ, JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY DEPTNO;    --> ASC    --> �������� ���� ����~!
/*
CLARK	10	MANAGER	2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
JONES	20	MANAGER	2975	35700
FORD	20	ANALYST	3000	36000
ADAMS	20	CLERK	1100	13200
SMITH	20	CLERK	800	9600
SCOTT	20	ANALYST	3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	950	11400
BLAKE	30	MANAGER	2850	34200
*/


SELECT ENAME "�����", DEPTNO �μ���ȣ, JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY DEPTNO DESC;   --> DESC --> �������� ���� --> ���� �Ұ�~!!
--==>>
/*
BLAKE	30	MANAGER 	2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	    950	    11400
SCOTT	20	ANALYST 	3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	    800	    9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST 	3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/

SELECT ENAME "�����", DEPTNO �μ���ȣ, JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY ���� DESC; 
--==>>
/*
KING	10	PRESIDENT	5000	60000
FORD	20	ANALYST	3000	36000
SCOTT	20	ANALYST	3000	36000
JONES	20	MANAGER	2975	35700
BLAKE	30	MANAGER	2850	34200
CLARK	10	MANAGER	2450	29400
ALLEN	30	SALESMAN	1600	19500
TURNER	30	SALESMAN	1500	18000
MARTIN	30	SALESMAN	1250	16400
MILLER	10	CLERK	1300	15600
WARD	30	SALESMAN	1250	15500
ADAMS	20	CLERK	1100	13200
JAMES	30	CLERK	950	11400
*/

--> ORDER BY ������ SELECT ���� ���� ó���Ǳ� ������
--  �÷��� ��� SELECT ������ ����� ALIAS(��Ī)DMF
--  ORDER BY ������ ����ص� ������ �߻����� �ʴ´�. (�����ϴ�)


SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY �μ� ��ȣ DESC; 
--==> ���� �߻�
/*
ORA-00933: SQL command not properly ended
00933. 00000 -  "SQL command not properly ended"
*Cause:    
*Action:
768��, 113������ ���� �߻�
*/

SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY "�μ� ��ȣ" DESC;
--==>>
/*
BLAKE	30	MANAGER	    2850	34200
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
MARTIN	30	SALESMAN	1250	16400
WARD	30	SALESMAN	1250	15500
JAMES	30	CLERK	    950 	11400
SCOTT	20	ANALYST	    3000	36000
JONES	20	MANAGER	    2975	35700
SMITH	20	CLERK	    800 	9600
ADAMS	20	CLERK	    1100	13200
FORD	20	ANALYST	    3000	36000
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	    1300	15600
CLARK	10	MANAGER	    2450	29400
*/

SELECT ENAME "�����", DEPTNO "�μ� ��ȣ", JOB ����, SAL �޿�
    ,SAL*12+NVL(COMM, 0) "����"
FROM TBL_EMP
ORDER BY 2;     -->> ASC ����
--==>> �μ���ȣ�� �������� �������� ����
/*
CLARK	10	MANAGER	2450	29400
KING	10	PRESIDENT	5000	60000
MILLER	10	CLERK	1300	15600
JONES	20	MANAGER	2975	35700
FORD	20	ANALYST	3000	36000
ADAMS	20	CLERK	1100	13200
SMITH	20	CLERK	800	9600
SCOTT	20	ANALYST	3000	36000
WARD	30	SALESMAN	1250	15500
TURNER	30	SALESMAN	1500	18000
ALLEN	30	SALESMAN	1600	19500
JAMES	30	CLERK	950	11400
BLAKE	30	MANAGER	2850	34200
MARTIN	30	SALESMAN	1250	16400
*/
--> TBL_EMP ���̺��� ���� �ִ� ���̺��� ������ �÷� ������ �ƴ϶�
-- SELECT ó���Ǵ� �� ��° �÷�(��, DEPTNO)�� �������� ���ĵǴ� ���� Ȯ��
-- ASC������ ���� �� �������� ���ĵǴ� ���� Ȯ��
--  ����, �ε����� 1����...

SELECT *
FROM TBL_EMP;

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 4;  -- 2 --> DEPTNO ���� 1�� ����, 4 --> SAL ���� 2�� ����... ASC
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SMITH	20	CLERK	    800
ADAMS	20	CLERK	    1100
JONES	20	MANAGER 	2975
SCOTT	20	ANALYST	    3000
FORD	20	ANALYST	    3000
JAMES	30	CLERK	    950
MARTIN	30	SALESMAN	1250
WARD	30	SALESMAN	1250
TURNER	30	SALESMAN	1500
ALLEN	30	SALESMAN	1600
BLAKE	30	MANAGER	    2850
*/

SELECT ENAME, DEPTNO, JOB, SAL
FROM TBL_EMP
ORDER BY 2, 3, 4 DESC;  -- 2 ASC, 3 ASC, 4 DESC
--> �� 2 �� DEPTNO(�μ���ȣ) ���� �������� ����
-- �� 3 �� JOB(������) ���� �������� ����
-- �� 4 DESC �� SAL(�޿�) ���� �������� ����
-- (3�� ���� ����)
--==>>
/*
MILLER	10	CLERK	    1300
CLARK	10	MANAGER	    2450
KING	10	PRESIDENT	5000
SCOTT	20	ANALYST 	3000
FORD	20	ANALYST	    3000
ADAMS	20	CLERK	    1100
SMITH	20	CLERK	    800
JONES	20	MANAGER 	2975
JAMES	30	CLERK	    950
BLAKE	30	MANAGER	    2850
ALLEN	30	SALESMAN	1600
TURNER	30	SALESMAN	1500
MARTIN	30	SALESMAN	1250
*/

--------------------------------------------------------------------------------

--�� CONCAT() �� ���ڿ� ���� �Լ�
SELECT '�չ���'|| '����ȣ'"1"
    , CONCAT('�չ���', '����ȣ')"2"
FROM DUAL;
--==>> �չ�������ȣ	�չ�������ȣ

SELECT ENAME || JOB "1"
    ,   CONCAT(ENAME, JOB) "2"
FROM TBL_EMP;
--==>>
/*
SMITHCLERK  	SMITHCLERK
ALLENSALESMAN	ALLENSALESMAN
WARDSALESMAN	WARDSALESMAN
JONESMANAGER	JONESMANAGER
MARTINSALESMAN	MARTINSALESMAN
BLAKEMANAGER	BLAKEMANAGER
CLARKMANAGER	CLARKMANAGER
SCOTTANALYST	SCOTTANALYST
KINGPRESIDENT	KINGPRESIDENT
TURNERSALESMAN	TURNERSALESMAN
ADAMSCLERK	    ADAMSCLERK
JAMESCLERK	    JAMESCLERK
FORDANALYST 	FORDANALYST
*/

SELECT ENAME || JOB || DEPTNO "1"
    ,CONCAT(ENAME, JOB, DEPTNO) "2"
FROM TBL_EMP;
--==>> ���� �߻�
/*
ORA-00909: invalid number of arguments
00909. 00000 -  "invalid number of arguments"
*Cause:    
*Action:
905��, 6������ ���� �߻�
*/
--> CONCAT()�Լ��� 2���� ���ڿ��� ���ս����ִ� ����� ���� �Լ�
--  ������ 2���� ���ս�ų �� �ִ�.


SELECT ENAME || JOB || DEPTNO "1"
    , CONCAT(CONCAT(ENAME, JOB), DEPTNO)"2"
FROM TBL_EMP;
--==>
/*
SMITHCLERK20	SMITHCLERK20
ALLENSALESMAN30	ALLENSALESMAN30
WARDSALESMAN30	WARDSALESMAN30
JONESMANAGER20	JONESMANAGER20
MARTINSALESMAN30	MARTINSALESMAN30
BLAKEMANAGER30	BLAKEMANAGER30
CLARKMANAGER10	CLARKMANAGER10
SCOTTANALYST20	SCOTTANALYST20
KINGPRESIDENT10	KINGPRESIDENT10
TURNERSALESMAN30	TURNERSALESMAN30
ADAMSCLERK20	ADAMSCLERK20
JAMESCLERK30	JAMESCLERK30
FORDANALYST20	FORDANALYST20
MILLERCLERK10	MILLERCLERK10
*/
--> �������� �� ��ȥ�� �Ͼ�� ������ �����ϰ� �ȴ�.
-- CONCAT() �� ���ڿ��� ���ڿ��� ���ս����ִ� ������ �����ϴ� �Լ�������
-- ���������δ� ���ڳ� ��¥�� ���� Ÿ������ �ٲپ��ִ� ������ ���ԵǾ� �ִ�.


--�� SUBSTR() ���� ��� / SUBSTRB() ����Ʈ ��� �� ���ڿ� �����Լ�
SELECT ENAME "1"
    , SUBSTR(ENAME, 1, 2) "2"
    , SUBSTR(ENAME, 2, 2) "3"
    , SUBSTR(ENAME, 3, 2) "4"
    , SUBSTR(ENAME, 2) "5"
FROM TBL_EMP;
--> ���ڿ��� �����ϴ� ����� ���� �Լ�
-- ù ��° �Ķ���� ���� ��� ���ڿ�(���ڿ� ������ ���)
-- �� ��° �Ķ���� ���� ������ �����ϴ� ��ġ(��, �ε����� 1���� ����)
-- �� ��° �Ķ���� ���� ������ ���ڿ��� ����(���� ��... ������ġ���� ������)
--==>>
/*
SMITH	SM	MI	IT	MITH
ALLEN	AL	LL	LE	LLEN
WARD	WA	AR	RD	ARD
JONES	JO	ON	NE	ONES
MARTIN	MA	AR	RT	ARTIN
BLAKE	BL	LA	AK	LAKE
CLARK	CL	LA	AR	LARK
SCOTT	SC	CO	OT	COTT
KING	KI	IN	NG	ING
TURNER	TU	UR	RN	URNER
ADAMS	AD	DA	AM	DAMS
JAMES	JA	AM	ME	AMES
FORD	FO	OR	RD	ORD
MILLER	MI	IL	LL	ILLER
*/


--�� TBL_SAWON ���̺��� ������ ������ �����
--   �����ȣ, �����, �ֹι�ȣ, �޿� �׸��� ��ȸ�Ѵ�.
-- ��, SUBSTR() �Լ��� ����� �� �ֵ��� �ϸ�
-- �޿� �������� �������� ���ĸ� ������ �� �ֵ��� �Ѵ�.
SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�" 
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7,1) = '1' OR SUBSTR(JUBUN, 7, 1) = '3'
ORDER BY SAL DESC;
--==>>
/*
1012	����	8009011234567	4000
1009	������	7209301234567	3000
1013	������	8203051234567	3000
1014	������	9208091234567	3000
1015	�賲��	0202023234567	2000
1006	���̰�	0202023234567	2000
*/

SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�" 
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7,1) = '1' OR SUBSTR(JUBUN, 7, 1) = '3'
ORDER BY 4 DESC;
--==>> ���� �Ȱ��� ���


SELECT SANO "�����ȣ", SANAME "�����", JUBUN "�ֹι�ȣ", SAL "�޿�" 
FROM TBL_SAWON
WHERE SUBSTR(JUBUN, 7,1) IN ('1', '3')
ORDER BY 4 DESC;
--==>> ���� �Ȱ��� ���


--�� LENGTH() ���� �� / LENGTHB() ����Ʈ ��
SELECT ENAME "1"
    , LENGTH(ENAME) "2"
    , LENGTHB(ENAME) "3"
FROM TBL_EMP;
--> LENGTH()�� ���� ���� ��ȯ, LENGTHB()�� ����Ʈ ���� ��ȯ
--  ����Ʈ ���� ��ȯ ���� ��쿡�� ���ڵ� ��Ŀ� ������ ��~!!
--==>>
/*
SMITH	5	5
ALLEN	5	5
WARD	4	4
JONES	5	5
MARTIN	6	6
BLAKE	5	5
CLARK	5	5
SCOTT	5	5
KING	4	4
TURNER	6	6
ADAMS	5	5
JAMES	5	5
FORD	4	4
MILLER	6	6
*/


--�� �����ͺ��̽� �Ķ���� ���� ���� ��ȸ ������ ����
SELECT *
FROM NLS_DATABASE_PARAMETERS;


--�� INSTR()
SELECT 'ORACLE ORAHOME BIORA' "1"
    , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 1) "2"
    , INSTR('ORACLE ORAHOME BIORA', 'ORA', 1, 2) "3"
    , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 1) "4"
    , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2) "5"
    , INSTR('ORACLE ORAHOME BIORA', 'ORA', 2, 3) "6"
    , INSTR('ORACLE ORAHOME BIORA', 'PPP', 1, 1) "7"
FROM DUAL;
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ�����... (��� ���ڿ�)
-- �� ��° �Ķ���� ���� ���� �Ѱ��� ���ڿ��� �����ϴ� ��ġ�� ã�ƶ�~!!
-- �� ��° �Ķ���� ���� ���� �����ϴ�... (��, ��ĵ�� �����ϴ�) ��ġ
-- �� ��° �Ķ���� ���� �� ��° �����ϴ� ���� ã�� �������� ���� ����(1�� ���� ����)
--==>> ORACLE ORAHOME BIORA	1	8	8	8	0	0


SELECT '���� ����Ŭ �����ο��� �մϴ�' "1"
    , INSTR('���� ����Ŭ �����ο��� �մϴ�', '����', 1) "2"
    , INSTR('���� ����Ŭ �����ο��� �մϴ�', '����', 2) "3"
    , INSTR('���� ����Ŭ �����ο��� �մϴ�', '����', 10) "4"
    , INSTR('���� ����Ŭ �����ο��� �մϴ�', '����', 11) "5"
  FROM DUAL;
--==>> ���� ����Ŭ �����ο��� �մϴ�	4	4	11	11
--> ������ �Ķ����(�� ��° �Ķ����) ���� ������ ���·� ���~!!! �� 1


--�� REVERSE()
SELECT 'ORACLE' "1"
    , REVERSE('ORACLE') "2"
FROM DUAL;
--==> ORACLE    ELCARO
-->>  ��� ���ڿ��� �Ųٷ� ��ȯ�Ѵ�. (��, �ѱ��� ����)

--�� �ǽ� ���̺� ����(TBL_FILES)
CREATE TABLE TBL_FILES
( FILENO    NUMBER(3)
, FILENAME  VARCHAR(100)
);
--==>> Table TBL_FILES��(��) �����Ǿ����ϴ�.

--�� ������ �Է�(TBL_FILES)
INSERT INTO TBL_FILES VALUES(1, 'C:\AAA\BBB\CCC\SALES.DOC');
INSERT INTO TBL_FILES VALUES(2, 'C:\AAA\PANMAE.XXXLS');
INSERT INTO TBL_FILES VALUES(3, 'D:\RESEARCH.PPT');
INSERT INTO TBL_FILES VALUES(4, 'C:\DOCUMENTS\STUDY.HWP');
INSERT INTO TBL_FILES VALUES(5, 'C:\DOCUMENTS\TEMP\SQL.TXT');
INSERT INTO TBL_FILES VALUES(6, 'D:\SHARE\F\TEST.PNG');
INSERT INTO TBL_FILES VALUES(7, 'C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG');
INSERT INTO TBL_FILES VALUES(8, 'C:\ORACLESTUDY\20210901_01_SCOTT.SQL');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 8

--�� Ȯ��
SELECT *
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC
2	C:\AAA\PANMAE.XXXLS
3	D:\RESEARCH.PPT
4	C:\DOCUMENTS\STUDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT
6	D:\SHARE\F\TEST.PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL
*/


--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


SELECT FILENO "���Ϲ�ȣ", FILENAME "���ϸ�"
FROM TBL_FILES;
--==>> 
/*
���Ϲ�ȣ  ���ϸ�
-------- --------------------------------------
      1	 C:\AAA\BBB\CCC\SALES.DOC
      2	 C:\AAA\PANMAE.XXXLS
      3	 D:\RESEARCH.PPT
      4	 C:\DOCUMENTS\STUDY.HWP
      5	 C:\DOCUMENTS\TEMP\SQL.TXT
      6	 D:\SHARE\F\TEST.PNG
      7	 C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG
      8	 C:\ORACLESTUDY\20210901_01_SCOTT.SQL
*/

/*
���Ϲ�ȣ  ���ϸ�
-------- --------------------------------------
      1	 SALES.DOC
      2	 PANMAE.XXXLS
      3	 RESEARCH.PPT
      4	 STUDY.HWP
      5	 SQL.TXT
      6	 TEST.PNG
      7	 SPRING.JPG
      8	 20210901_01_SCOTT.SQL
*/
--�� TBL_FILES ���̺��� ������� ���Ͱ��� ��ȸ�� �� �ֵ���
--  �������� �����Ѵ�.
-- [���� Ǭ ���� ]----------------------------------------------------------------------------
SELECT fileno "���Ϲ�ȣ", SUBSTR(FILENAME, -INSTR(REVERSE(FILENAME), '\', 1, 1)+1) "���ϸ�" 
FROM TBL_FILES;
/*
���Ϲ�ȣ  ���ϸ�
-------- --------------------
      1	    SALES.DOC
      2	    PANMAE.XXXLS
      3	    RESEARCH.PPT
      4	    STUDY.HWP
      5	    SQL.TXT
      6	    TEST.PNG
      7	    SPRING.JPG
      8	    20210901_01_SCOTT.SQL
*/


SELECT fileno "���Ϲ�ȣ", REVERSE(FILENAME) "���ϸ�"             --TEST
FROM TBL_FILES;
SELECT fileno "���Ϲ�ȣ", INSTR(REVERSE(FILENAME), '\', 1, 1) "���ϸ�"             --TEST2
FROM TBL_FILES;

-- [���� Ǭ ����]---------------------------------------------------
SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�", SUBSTR(FILENAME, 16, 9) "���ϸ�"
FROM TBL_FILES
WHERE FILENO=1;
--==>> 1	C:\AAA\BBB\CCC\SALES.DOC

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�", SUBSTR(FILENAME, 16, 9) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	C:\AAA\BBB\CCC\SALES.DOC	SALES.DOC
2	C:\AAA\PANMAE.XXXLS     	XXLS
3	D:\RESEARCH.PPT	            (NULL)
4	C:\DOCUMENTS\STUDY.HWP	    UDY.HWP
5	C:\DOCUMENTS\TEMP\SQL.TXT	MP\SQL.TX
6	D:\SHARE\F\TEST.PNG	        .PNG
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG	G\PICTURE
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL	    20210901_
*/


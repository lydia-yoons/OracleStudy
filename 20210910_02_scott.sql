 SELECT USER
FROM DUAL;
--==>> SCOTT

--���� UPDATE ����--

--1. ���̺꿡�� ���� �����͸� �����ϴ� ����.


-- 2. ���� �� ����
-- UPDATE ���̺��
-- SET Ŀ���� = �����Ұ�[, �÷��� = �����Ұ�, �÷��� = �����Ұ�]
-- [WHERE ������]

SELECT *
FROM TBL_SAWON;

ALTER SESSION SET NLS_DATE_FORMAT='YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� TBL_SAWON ���̺��� �����ȣ 1003�� �����
--  �ֹι�ȣ�� ��9907222234567���� �����Ѵ�.
UPDATE TBL_SAWON
SET JUBUN = '9907222234567'
WHERE SANO = 1003;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

-- ���� �� COMMIT �Ǵ� ROLLBACK �� �ݵ�� ���������� ����
COMMIT;
--==> Ŀ�� �Ϸ�.

SELECT *
FROM TBL_SAWON;

--�� TBL_SAWON ���̺��� 1005�� ����� �Ի��ϰ� �޿���
--  ���� 2018-02-22, 1200���� �����Ѵ�.
UPDATE TBL_SAWON
SET HIREDATE = TO_DATE('2018-02-22','YYYY-MM-DD')
    , SAL = 1200
WHERE SANO = 1005;
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

COMMIT;

--�� TBL_INSA ���̺� �����͸� ����
CREATE TABLE TBL_INSABACKUP
AS
SELECT *
FROM TBL_INSA;
--==> Table TBL_INSABACKUP��(��) �����Ǿ����ϴ�.


--�� TBL_INSABACKUP ���̺���
--  ������ ����� ���常 ���� 10% �λ�~~!!
UPDATE TBL_INSABACKUP
SET SUDANG = SUDANG * 1.1
WHERE JIKWI IN ('����','����');


SELECT *
FROM TBL_INSABACKUP;

SELECT NAME "�����", JIKWI "����", SUDANG "����", SUDANG*1.1 "10%�λ�ȼ���"
FROM TBL_INSABACKUP
WHERE JIKWI IN ('����','����');
--==>
/*
ȫ�浿	����	200000	220000
�̼���	����	160000	176000
�̱���	����	150000	165000
������	����	130000	143000
�̻���	����	150000	165000
�ڹ���	����	165000	181500
���μ�	����	170000	187000
�迵��	����	170000	187000
������	����	124000	136400
����ȯ	����	160000	176000
�ּ���	����	187000	205700
�����	����	150000	165000
����	����	150000	165000
�ǿ���	����	104000	114400
�̹̰�	����	160000	176000
*/

UPDATE TBL_INSABACKUP
SET SUDANG = SUDANG * 1.1
WHERE JIKWI IN ('����','����');
--==>> 15�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_INSABACKUP;
--==>> ����� �ٲ������ Ȯ��

COMMIT;

--�� TBL_INSABACKUP ���̺��� ��ȭ��ȣ�� 016, 017, 018, 019�� �����ϴ�
-- ��ȭ��ȣ�� ��� �̸� ��� 010���� �����Ѵ�.
SELECT *
FROM TBL_INSABACKUP
WHERE SUBSTR(TEL, 1, 3) IN ('016','017','018','019');


UPDATE TBL_INSABACKUP
SET  TEL = '010'||SUBSTR(TEL, 4)
WHERE SUBSTR(TEL, 1, 3) IN ('016','017','018','019');
--==>> 24�� �� ��(��) ������Ʈ�Ǿ����ϴ�.

SELECT *
FROM TBL_INSABACKUP;

COMMIT;


--�� TBL_SAWON ���̺� ���(2021-09-10 16:10)
CREATE TABLE TBL_SAWONBACKUP
AS
SELECT *
FROM TBL_SAWON;
--==>> Table TBL_SAWONBACKUP��(��) �����Ǿ����ϴ�.

--�� Ȯ��
SELECT *
FROM TBL_SAWON;
SELECT *
FROM TBL_SAWONBACKUP;
-->> TBL_SAWON ���̺��� �����͵鸸 ����� ����
--  ��, �ٸ� �̸��� ���̺� ���·� �����͸� ������ �� ��Ȳ


UPDATE TBL_SAWON
SET SANAME = '�ʶ���';
COMMIT;

SELECT *
FROM TBL_SAWON;

ROLLBACK;

SELECT *
FROM TBL_SAWON;


-- ���Ͱ���..
-- UPDATE ó�� ���Ŀ� COMMIT �� �����Ͽ��� ������
-- �鳯 �غ���.. ROLLBACK �� �Ұ����� ��Ȳ�̴�.
-- ������, TBL_SAWONBACKUP���̺� �����͸� ����� �״�.
-- SANAME �÷��� ���丸 �����Ͽ� �ʶ��� ��� �־��� �� �ִٴ� ���̴�.

UPDATE TBL_SAWON
SET SNAME = '��ҿ�'
WHERE SANO = 1001;
       :
       
UPDATE TBL_SAWON
SET SANAME = (TBL_SAWONBACKUP ���̺��� ���� �ڱ� �����ȣ�� ����� �����);


UPDATE TBL_SAWON
SET SANAME=(FROM TBL_SAWONBACKUP
            WHERE SANO = 1001);     �� '��ҿ�'
            
UPDATE TBL_SAWON
SET SANAME = '��ҿ�';

UPDATE TBL_SAWON
SET SANAME=(SELECT SANAME
            FROM TBL_SAWONBACKUP
            WHERE SANO = TBL_SAWON.SANO); 
--==>> 15�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


SELECT *
FROM TBL_SAWON;
--==>>
/*
1001	��ҿ�	9307302234567	2021-09-03	5000
1002	�̴ٿ�	9510272234567	2010-11-05	2000
1003	������	9907222234567	2012-08-16	1000
1004	�մ���	9406032234567	1999-02-02	4000
1005	������	0406034234567	2018-02-22	1200
1006	���̰�	0202023234567	2011-08-17	2000
1007	���̳�	8012122234567	1999-11-11	3000
1008	������	8105042234567	1999-11-11	3000
1009	������	7209301234567	1995-11-11	3000
1010	������	7001022234567	1995-10-10	3000
1011	���켱	9001022234567	2001-10-10	2000
1012	����	8009011234567	1998-02-13	4000
1013	������	8203051234567	2002-02-13	3000
1014	������	9208091234567	2002-02-13	3000
1015	�賲��	0202023234567	2015-01-10	2000*/

COMMIT;



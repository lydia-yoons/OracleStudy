SELECT USER
FROM DUAL;
--==>> SCOTT

--�� �ǽ� ���̺� ����(TBL_TEST2) �� �θ� ���̺�
CREATE TABLE TBL_TEST2
( CODE  NUMBER
, NAME  VARCHAR2(40)
, CONSTRAINT TEST2_CODE_PK  PRIMARY KEY(CODE)
);
--==>> Table TBL_TEST2��(��) �����Ǿ����ϴ�.



--�� �ǽ� ���̺� ���� �� �ڽ� ���̺�
CREATE TABLE TBL_TEST3
( SID   NUMBER
, CODE  NUMBER
, SU    NUMBER
, CONSTRAINT TEST3_SID_PK PRIMARY KEY(SID)
, CONSTRAINT TEST3_CODE_FK FOREIGN KEY(CODE)
             REFERENCES TBL_TEST2(CODE)
);


----------------------
--�� �ǽ� ������ �Է�
INSERT INTO TBL_TEST2 (CODE, NAME) VALUES(1, '�����');
INSERT INTO TBL_TEST2 (CODE, NAME) VALUES(2, '��Ź��');
INSERT INTO TBL_TEST2 (CODE, NAME) VALUES(3, '������');
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 3��

--�� Ȯ��
SELECT *
FROM TBL_TEST2;
--==>>
/*
1	�����
2	��Ź��
3	������
*/

--�� Ŀ��
COMMIT;
--==>> Ŀ�� �Ϸ�.


--�� �ǽ� ������ �Է�
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(1, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(2, 2, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(3, 1, 40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(4, 2, 50);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(5, 1, 60);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(6, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(7, 1, 30);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(8, 2, 40);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(9, 1, 50);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(10, 3, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(11, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(12, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(13, 1, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(14, 2, 20);
INSERT INTO TBL_TEST3(SID, CODE, SU) VALUES(15, 3, 20);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�. * 15��


SELECT C.SID, P.CODE, P.NAME, C.SU
FROM TBL_TEST2 P JOIN TBL_TEST3 C
ON P.CODE = C.CODE;
--==>>
/*
1	1	�����	20
2	2	��Ź��	30
3	1	�����	40
4	2	��Ź��	50
5	1	�����	60
6	1	�����	20
7	1	�����	30
8	2	��Ź��	40
9	1	�����	50
10	3	������	20
11	2	��Ź��	20
12	2	��Ź��	20
13	1	�����	20
14	2	��Ź��	20
*/


COMMIT;

SELECT *
FROM TBL_TEST2
WHERE CODE = 2;
--==>> 2	��Ź��

DELETE
FROM TBL_TEST2
WHERE CODE = 2;
--==>> ���� �߻�
/*
ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found
*/

SELECT *
FROM TBL_TEST2
WHERE CODE = 3;
--==>> 3	������

DELETE
FROM TBL_TEST2
WHERE CODE = 3;
--==>> ���� �߻�
/*
ORA-02292: integrity constraint (SCOTT.TEST3_CODE_FK) violated - child record found
*/


--�� Ʈ���� �ۼ� ���� �ٽ� �׽�Ʈ

DELETE
FROM TBL_TEST2
WHERE CODE = 3;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2;

DELETE
FROM TBL_TEST2
WHERE CODE = 2;
--==>> 1 �� ��(��) �����Ǿ����ϴ�.

SELECT *
FROM TBL_TEST2;

SELECT *
FROM TBL_TEST3;




TRUNCATE TABLE TBL_�԰�;
--==>> Table TBL_�԰���(��) �߷Ƚ��ϴ�.


TRUNCATE TABLE TBL_���;
--==>> Table TBL_�����(��) �߷Ƚ��ϴ�.


UPDATE TBL_��ǰ
SET ������ = 0;
--==>> 21�� �� ��(��) ������Ʈ�Ǿ����ϴ�.


COMMIT;

SELECT *
FROM TBL_�԰�;


SELECT *
FROM TBL_���;


SELECT *
FROM TBL_��ǰ;


INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(1, 'C001', SYSDATE, 100, 1800);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_�԰�;

SELECT *
FROM TBL_��ǰ;


SELECT *
FROM TBL_���;

-----------------------------------------------------------------------
INSERT INTO TBL_�԰�(�԰��ȣ, ��ǰ�ڵ�, �԰�����, �԰����, �԰�ܰ�)
VALUES(2, 'C002', SYSDATE, 200, 2200);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

SELECT *
FROM TBL_�԰�;
--==>
/*
2	C002	2021-09-23	200	2200
*/

UPDATE TBL_�԰�
SET �԰���� = 50
WHERE ��ǰ�ڵ� = 'C002';
--==>> 1 �� ��(��) ������Ʈ�Ǿ����ϴ�.
/*
2	C002	2021-09-23	50	2200
*/

DELETE 
FROM TBL_�԰�
WHERE ��ǰ�ڵ� = 'C002';


SELECT *
FROM TBL_���;

SELECT *
FROM TBL_��ǰ;

INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, �������, ������, ���ܰ�)
VALUES(1, 'C002', SYSDATE, 100, 2200);
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.
INSERT INTO TBL_���(����ȣ, ��ǰ�ڵ�, �������, ������, ���ܰ�)
VALUES(2, 'C001', SYSDATE, 200, 1800);
--==>>
/*
���� ���� -
ORA-20004: ��� �����մϴ�.
*/

SELECT *
FROM TBL_���;

UPDATE TBL_���
SET ������ = 0;

DELETE
FROM TBL_���
WHERE ����ȣ = 1;


UPDATE TBL_�԰�
SET �԰���� = 0
WHERE �԰��ȣ = 2;

SELECT *
FROM TBL_�԰�;

DELETE
FROM TBL_�԰�
WHERE �԰��ȣ = 2;

-----------------------------------------------------

SELECT INSA_PACK.FN_GENDER('751212-1234567') "RESULT"
FROM DUAL;
--==>> ����

SELECT NAME, SSN, INSA_PACK.FN_GENDER(SSN) "����Ȯ��"
FROM TBL_INSA;
--==>>
/*
�̴ٿ�	951027-2234567	����
������	941013-2234567	����
ȫ�浿	771212-1022432	����
�̼���	801007-1544236	����
�̼���	770922-2312547	����
������	790304-1788896	����
�Ѽ���	811112-1566789	����
�̱���	780505-2978541	����
����ö	780506-1625148	����
�迵��	821011-2362514	����
������	810810-1552147	����
������	751010-1122233	����
������	801010-2987897	����
���ѱ�	760909-1333333	����
���̼�	790102-2777777	����
Ȳ����	810707-2574812	����
������	800606-2954687	����
�̻���	781010-1666678	����
�����	820507-1452365	����
�̼���	801028-1849534	����
�ڹ���	780710-1985632	����
������	800304-2741258	����
ȫ�泲	801010-1111111	����
�̿���	800501-2312456	����
���μ�	731211-1214576	����
�踻��	830225-2633334	����
�����	801103-1654442	����
�����	810907-2015457	����
�迵��	801216-1898752	����
�̳���	810101-1010101	����
�踻��	800301-2020202	����
������	790210-2101010	����
����ȯ	771115-1687988	����
�ɽ���	810206-2222222	����
��̳�	780505-2999999	����
������	820505-1325468	����
������	831010-2153252	����
���翵	701126-2852147	����
�ּ���	770129-1456987	����
���μ�	791009-2321456	����
�����	800504-2000032	����
�ڼ���	790509-1635214	����
�����	721217-1951357	����
ä����	810709-2000054	����
��̿�	830504-2471523	����
����ȯ	820305-1475286	����
ȫ����	690906-1985214	����
����	760105-1458752	����
�긶��	780505-1234567	����
�̱��	790604-1415141	����
�̹̼�	830908-2456548	����
�̹���	810403-2828287	����
�ǿ���	790303-2155554	����
�ǿ���	820406-2000456	����
��̽�	800715-1313131	����
����ȣ	810705-1212141	����
���ѳ�	820506-2425153	����
������	800605-1456987	����
*/

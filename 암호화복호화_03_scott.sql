SELECT USER
FROM DUAL;
--==>> SCOTT


--���� ��ȣȭ ��ȣȭ Ȯ�� �ǽ� ����--

--�� ���̺� ����
CREATE TABLE TBL_EXAM
( ID    NUMBER
, PW    VARCHAR2(20)
);
--==>> Table TBL_EXAM��(��) �����Ǿ����ϴ�.


--�� ������ �Է�(��ȣȭ)
--INSERT INTO TBL_EXAM(ID, PW) VALUES(1, 'java006$');
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, CRYPTPACK.ENCRYPT('java006$', '1234'));
--==>> 1 �� ��(��) ���ԵǾ����ϴ�.

--�� ������ ��ȸ
SELECT *
FROM TBL_EXAM;
--==>> 1	j??s


--�� ������ ��ȸ
SELECT ID, CRYPTPACK.DECRYPT(PW,'1111')
FROM TBL_EXAM;
--==>> 1	???


SELECT ID, CRYPTPACK.DECRYPT(PW,'2222')
FROM TBL_EXAM;
--==>> 1	??D?

SELECT ID, CRYPTPACK.DECRYPT(PW,'1234')
FROM TBL_EXAM;
--==>> 1	java006$
--> ��ȣȭ �ߴ� 1234�� ��ȣȭ �ؾ� ����� ��.





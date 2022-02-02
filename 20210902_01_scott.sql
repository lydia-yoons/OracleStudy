select user
from dual;
--==>> SCOTT


--�� TBL_FILES ���̺��� ������� ���Ͱ��� ��ȸ�� �� �ֵ���
--  �������� �����Ѵ�.
--[�Բ� Ǭ ����]------------------------------------------------------
SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�" 
    , REVERSE(FILENAME) "�Ųٷε� ���ϸ�"
FROM TBL_FILES;
/*
COD.SELAS\CCC\BBB\AAA\:C
SLXXX.EAMNAP\AAA\:C
TPP.HCRAESER\:D
PWH.YDUTS\STNEMUCOD\:C
TXT.LQS\PMET\STNEMUCOD\:C
GNP.TSET\F\ERAHS\:D
GPJ.GNIRPS\OTOHP\ERUTCIP\GNODLIUG\RESU\:C
LQS.TTOCS_10_10901202\YDUTSELCARO\:C
*/

SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�" 
    , SUBSTR(REVERSE(FILENAME), 1, ����'\'�������ϴ���ġ-1) "�Ųٷε� ���ϸ�"
FROM TBL_FILES;

-- ���� '\'�� �����ϴ� ��ġ
    --������ �Ű����� 1����


SELECT FILENO "���Ϲ�ȣ", FILENAME "����������ϸ�" 
    , SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1)-1) "�Ųٷε� ���ϸ�"
FROM TBL_FILES;
--==??
/*
1	C:\AAA\BBB\CCC\SALES.DOC	                 COD.SELAS
2	C:\AAA\PANMAE.XXXLS	                        SLXXX.EAMNAP
3	D:\RESEARCH.PPT                         	TPP.HCRAESER
4	C:\DOCUMENTS\STUDY.HWP          	        PWH.YDUTS
5	C:\DOCUMENTS\TEMP\SQL.TXT       	        TXT.LQS
6	D:\SHARE\F\TEST.PNG                     	GNP.TSET
7	C:\USER\GUILDONG\PICTURE\PHOTO\SPRING.JPG	GPJ.GNIRPS
8	C:\ORACLESTUDY\20210901_01_SCOTT.SQL	    LQS.TTOCS_10_10901202
*/


SELECT FILENO "���Ϲ�ȣ"    --FILENAME "����������ϸ�" 
    , REVERSE(SUBSTR(REVERSE(FILENAME), 1, INSTR(REVERSE(FILENAME), '\', 1)-1)) "���ϸ�"
FROM TBL_FILES;
--==>>
/*
1	SALES.DOC
2	PANMAE.XXXLS
3	RESEARCH.PPT
4	STUDY.HWP
5	SQL.TXT
6	TEST.PNG
7	SPRING.JPG
8	20210901_01_SCOTT.SQL
*/



--�� LPAD()
--> Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "1"
    , LPAD( 'ORACLE', 10, '*') "2"
FROM DUAL;
--==>> ORACLE	****ORACLE
--> �� 10Byte ���� Ȯ���Ѵ�.                  �� �� ��° �Ķ���� ���� ����..
--  �� Ȯ���� ������ 'ORACLE'���ڿ��� ��´�. �� ù ��° �Ķ���� ���� ����...
--  �� �����ִ� Byte ������ ���ʺ��� �� ��° �Ķ���� ������ ä���
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.



--�� RPAD()
--> Byte ������ Ȯ���Ͽ� ���ʺ��� ���ڷ� ä��� ����� ���� �Լ�
SELECT 'ORACLE' "1"
    , RPAD( 'ORACLE', 10, '*') "2"
FROM DUAL;
--==> ORACLE	ORACLE****
--> �� 10Byte ���� Ȯ���Ѵ�.                  �� �� ��° �Ķ���� ���� ����..
--  �� Ȯ���� ������ 'ORACLE'���ڿ��� ��´�. �� ù ��° �Ķ���� ���� ����...
--  �� �����ִ� Byte ������ �����ʺ��� �� ��° �Ķ���� ������ ä���
--  �� �̷��� ������ ���� ������� ��ȯ�Ѵ�.


--�� LTRIM()
SELECT 'ORAORAORACLEORACLE' "1"     --���� ���� ����Ŭ ����Ŭ
    , LTRIM('ORAORAORACLEORACLE', 'ORA') "2"
    , LTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"
    , LTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
    , LTRIM('ORA ORAORACLEORACLE', 'ORA') "5"
    , LTRIM('          ORAORAORACLEORACLE', ' ') "6"
    , LTRIM('                      ORACLE') "7"         --���� ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;
--==>> ORAORAORACLEORACLE	CLEORACLE	CLEORACLE	oRAORACLEORACLE	 ORAORACLEORACLE	ORAORAORACLEORACLE	ORACLE
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
-- ���ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
-- �̸� ������ ������� ��ȯ�Ѵ�.
-- ��, �ϼ������� ó������ �ʴ´�.

SELECT LTRIM('�̱���̱�����̽Žű��̽Ž����̱���̽Ź��̱��', '�̱��') "TEST"
FROM DUAL;
--==> ���̱��

--�� RTRIM()
SELECT 'ORAORAORACLEORACLE' "1"     --���� ���� ����Ŭ ����Ŭ
    , RTRIM('ORAORAORACLEORACLE', 'ORA') "2"
    , RTRIM('AAAORAORAORACLEORACLE', 'ORA') "3"
    , RTRIM('ORAoRAORACLEORACLE', 'ORA') "4"
    , RTRIM('ORA ORAORACLEORACLE', 'ORA') "5"
    , RTRIM('          ORAORAORACLEORACLE', ' ') "6"
    , RTRIM('ORACLE                      ') "7"         --������ ���� ���� �Լ��� Ȱ��(�� ��° �Ķ���� ����)
FROM DUAL;
--==>> ORAORAORACLEORACLE	ORAORAORACLEORACLE	AAAORAORAORACLEORACLE	ORAoRAORACLEORACLE	ORA ORAORACLEORACLE	          ORAORAORACLEORACLE	ORACLE
--> ù ��° �Ķ���� ���� �ش��ϴ� ���ڿ��� �������
-- �����ʺ��� ���������� �� ��° �Ķ���� ������ ������ ���ڿ� ���� ���ڰ� ������ ���
-- �̸� ������ ������� ��ȯ�Ѵ�.
-- ��, �ϼ������� ó������ �ʴ´�.



--�� TRANSLATE()
--> 1:1�� �ٲپ� �ش�.
SELECT TRANSLATE('MY ORACLE SERVER'
                , 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
                , 'abcdefghijklmnopqrstuvwxyz') "RESULT"
FROM DUAL;
--==>> my oracle server

SELECT TRANSLATE('010-8743-7042'
                , '0123456789'
                , '�����̻�����ĥ�ȱ�') "RESULT"
FROM DUAL;
--==>> ���ϰ�-��ĥ���-ĥ������

--�� REPLACE()
SELECT REPLACE('MY ORACLE ORAHOME', 'ORA', '����')
FROM DUAL;
--==>> MY ����CLE ����HOME

--------------------------------------------------------------------------------

--�� ROUND() �ݿø��� ó�����ִ� �Լ�
SELECT 48.678 "1"
    , ROUND(48.678, 2) "2"      --�Ҽ��� ���� ��°�ڸ����� ǥ��(���° �ڸ����� �ݿø�)
    , ROUND(48.674, 2) "3"
    , ROUND(48.674, 1) "4"
    , ROUND(48.674, 0) "5"
    , ROUND(48.674) "6"         --�� ��° �Ķ���� ���� 0�� ��� ���� ����
    , ROUND(48.674, -1) "7"
    , ROUND(48.674, -2) "8"
    , ROUND(48.674, -3) "9"
FROM DUAL;
--==>> 48.678	48.68	48.68	48.7	49	49	50	0	0

--�� TRUNC() ������ ó�����ִ� �Լ�
SELECT 48.678 "1"
    , TRUNC(48.678, 2) "2"      --�Ҽ��� ���� ��°�ڸ����� ǥ��(���° �ڸ����� �ݿø�)
    , TRUNC(48.674, 2) "3"
    , TRUNC(48.674, 1) "4"
    , TRUNC(48.674, 0) "5"
    , TRUNC(48.674) "6"         --�� ��° �Ķ���� ���� 0�� ��� ���� ����
    , TRUNC(48.674, -1) "7"
    , TRUNC(48.674, -2) "8"
    , TRUNC(48.674, -3) "9"
FROM DUAL;
--==>> 48.678	48.67	48.67	48.6	48	48	40	0	0


--�� MOD() �������� ��ȯ�ϴ� �Լ�
SELECT MOD(5, 2) "RESULT"
FROM DUAL;
--==>> 1
--> 5�� 2�� ���� ������ ����� ��ȯ


--�� POWER() ������ ����� ��ȯ�ϴ� �Լ�
SELECT POWER(5,3) "RESULT"
FROM DAUL;
--==>> 125
--> 5�� 3���� ��������� ��ȯ

--�� SQRT()��Ʈ ������� ��ȯ�ϴ� �Լ�
SELECT SQRT(2)
FROM DUAL;
--==>> 1.41421356237309504880168872420969807857
--> ��Ʈ 2�� ���� ����� ��ȯ

--�� LOG() �α� �Լ�
--  (�� ����Ŭ�� ���α׸� �����ϴ� �ݸ�, MSSQL�� ���α�, �ڿ��α� ��� �����Ѵ�.)
SELECT LOG(10,100), LOG(10,20)
FROM DUAL;
--==>> 2	1.30102999566398119521373889472449302677

--�� �ﰢ �Լ�
--  ����, �ڽ���, ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT SIN(1), COS(1), TAN(1)
FROM DUAL;
--==>
/*
0.8414709848078965066525023216302989996233	
0.5403023058681397174009366074429766037354	
1.55740772465490223050697480745836017308
*/

--�� �ﰢ�Լ��� ���Լ�(���� : -1 ~ 1)
-- �����, ���ڽ���, ��ź��Ʈ ������� ��ȯ�Ѵ�.
SELECT ASIN(0.5), ACOS(0.5), ATAN(0.5)
FROM DUAL;
--==>>
/*
0.52359877559829887307710723054658381405	
1.04719755119659774615421446109316762805	
0.4636476090008061162142562314612144020295
*/


--�� SIGN() ����, ��ȣ, Ư¡
--> ���� ������� ����̸� 1, 0�̸� 0, �����̸� -1�� ��ȯ�Ѵ�.
SELECT SIGN(5-2), SIGN(5-5), SIGN(5-8)
FROM DUAL;
--==>> 1	0	-1
--> �����̳� ������ �����Ͽ� ���� �� ������ ������ ��Ÿ�� �� �ַ� ����Ѵ�.

--�� ASCII(), CHR() �� ���� �����ϴ� ������ �Լ�
SELECT ASCII('A') "RESULT1", CHR(65) "RESULT2"
FROM DUAL;
--==>> 65	A
--> ASCII() : �Ű������� �Ѱܹ��� ������ �ƽ�Ű�ڵ� ���� ��ȯ�Ѵ�.
--  CHR() : �Ű������� �Ѱܹ��� ���ڸ� �ƽ�Ű�ڵ� ������ ���ϴ� ���ڸ� ��ȯ�Ѵ�.


--------------------------------------------------------------------------------

--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.


--�� ��¥ ������ �⺻ ������  DAY(�ϼ�)�̴�~!!     CHECK~!!

SELECT SYSDATE "1", SYSDATE+1 "2", SYSDATE-2 "3", SYSDATE+3 "4"
FROM DUAL;
--==>>
/*
2021-09-02 10:35:39	    --����
2021-09-03 10:35:39	    -- 1�� �� 
2021-08-31 10:35:39	    -- 2�� ��
2021-09-05 10:35:39     -- 3�� ��
*/


--�� �ð� ���� ����
SELECT SYSDATE "1", SYSDATE+1/24 "2", SYSDATE - 2/24 "3"
FROM DUAL;
--==>>
/*
2021-09-02 10:38:15	    --����
2021-09-02 11:38:15	    -- 1�ð� ��
2021-09-02 08:38:15     -- 2�ð� ��
*/

--�� ���� �ð���... ���� �ð� ���� 1�� 2�ð� 3�� 4���ĸ� ��ȸ�Ѵ�.
/*
------------------------------------------------------------------
        ���� �ð�               ���� �� �ð�
------------------------------------------------------------------
    2021-09-02 10:40:13      2021-09-03 12:43:17
------------------------------------------------------------------
*/
--[���� Ǭ ����]---------------------------------------------
SELECT SYSDATE "����ð�", SYSDATE+1+(2/24)+(3/1440)+(4/86400) "���� �� �ð�"
FROM DUAL;
--> 2021-09-02 10:45:51	2021-09-03 12:48:55


---[���� Ǭ ����]--------------------------------------------
--��� 1.
SELECT SYSDATE "���� �ð�"
      ,SYSDATE + 1+ (2/24) + (3/(24*60)) + (4/(24*60*60)) "���� �� �ð�"
FROM DUAL;
--==>> 
/*
2021-09-02 11:04:04	
2021-09-03 13:07:08
*/

--��� 2.
SELECT SYSDATE "���� �ð�"
     , SYSDATE + ((24*60*60) + (2*60*60) + (3*60) + 4) /(24*60*60) "���� �� �ð�"
     --             1��           2�ð�     3��     
FROM DUAL;
--==>>
/*
2021-09-02 11:07:03	
2021-09-03 13:10:07*/

--�� ��¥ - ��¥ = �ϼ�
--ex) (2021-12-28) - (2021-09-02)
--      ������            ������
SELECT TO_DATE('2021-12-28', 'YYYY-MM-DD') - TO_DATE('2021-09-02', 'YYYY-MM-DD') "RESULT"
FROM DUAL;
--==>> 117

--�� ������ Ÿ���� ��ȯ
SELECT TO_DATE('2021-09-02', 'YYYY-MM-DD') "���"     --��¥ �������� ��ȯ
FROM DUAL;
--==>> 2021-09-02 00:00:00

SELECT TO_DATE('2021-13-02', 'YYYY-MM-DD') "���"     --��¥ �������� ��ȯ
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01843: not a valid month
01843. 00000 -  "not a valid month"
*Cause:    
*Action:
*/

SELECT TO_DATE('2021-09-31', 'YYYY-MM-DD') "���"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01839: date not valid for month specified
01839. 00000 -  "date not valid for month specified"
*Cause:    
*Action:
*/

SELECT TO_DATE('2021-02-29', 'YYYY-MM-DD') "���"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01839: date not valid for month specified
01839. 00000 -  "date not valid for month specified"
*Cause:    
*Action:
*/

SELECT TO_DATE('2020-02-29', 'YYYY-MM-DD') "���"
FROM DUAL;
--==>> 2020-02-29 00:00:00

--�� TO_DATE() �Լ��� ���� ����Ÿ���� ��¥ Ÿ������ ��ȯ�� ������ ��
--  ���������� �ش� ��¥�� ��ȿ�� �˻簡 �̷������~!!

--�� ADD_MONTHS() ���� ���� �����ִ� �Լ�
SELECT SYSDATE "1"
     , ADD_MONTHS(SYSDATE, 2) "2"
     , ADD_MONTHS(SYSDATE, 3) "3"
     , ADD_MONTHS(SYSDATE, -2) "4"
     , ADD_MONTHS(SYSDATE, -3) "5"
FROM DUAL;
--==>>
/*
2021-09-02 11:19:07	    �� ����
2021-11-02 11:19:07	    �� 2���� ��
2021-12-02 11:19:07	    �� 3���� ��
2021-07-02 11:19:07	    �� 2���� ��
2021-06-02 11:19:07     �� 3���� ��
*/
--> ���� ���ϰ� ����

--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� MONTHS_BETWEEN()
-- ù ��° ���ڰ����� �� ���� ���ڰ��� �� ���� ���� ��ȯ
SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2002-05-31', 'YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--==>> 231.0798245221027479091995221027479092

--> ���� ���� ���̸� ��ȯ�ϴ� �Լ�
-- �� ������� ��ȣ�� ��-���� ��ȯ�Ǿ��� ��쿡��
--  ù ��° ���ڰ��� �ش��ϴ� ��¥����
--  �� ��° ���ڰ��� �ش��Ѵ� ��¥�� ���̷������ �ǹ̷� ������ �� �ִ�.

SELECT MONTHS_BETWEEN(SYSDATE, TO_DATE('2021-12-28', 'YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--==>> -3.82335424133811230585424133811230585424
--> �������� �����Ϻ��� �̷�

--�� NEXT_DAY()
-- ù ���� ���ڰ��� ���� ��¥�� ���ƿ��� ���� ���� ���� ��ȯ
SELECT NEXT_DAY(SYSDATE, '��') "���1", NEXT_DAY(SYSDATE, '��') "���2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06

--�� �߰� ���� ���� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'ENGLISH';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� ���� ������ �� ���� ������ �ٽ� �� �� ��ȸ
SELECT NEXT_DAY(SYSDATE, '��') "���1", NEXT_DAY(SYSDATE, '��') "���2"
FROM DUAL;
--==>> ���� �߻�
/*
ORA-01846: not a valid day of the week
01846. 00000 -  "not a valid day of the week"
*Cause:    
*Action:
*/

SELECT NEXT_DAY(SYSDATE, 'SAT') "���1", NEXT_DAY(SYSDATE, 'MON') "���2"
FROM DUAL;
--==>> 2021-09-04	2021-09-06


--�� �߰� ���� ���� �ٽ� ����
ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� LAST_DAY()
-- �ش� ��¥�� ���ԵǾ� �ִ� �� ���� ������ ���� ��ȯ�Ѵ�.
SELECT LAST_DAY(SYSDATE) "���Ȯ��"
FROM DUAL;
--==>> 2021-09-30

SELECT LAST_DAY(TO_DATE('2020-02-05','YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--==>> 2020-02-29

SELECT LAST_DAY(TO_DATE('2021-02-05','YYYY-MM-DD')) "���Ȯ��"
FROM DUAL;
--==>> 2021-02-28

--�� ���úη� ����ȣ�� ���뿡 �� �Դ��Ѵ�.
-- ���� �Ⱓ�� 22������ �Ѵ�.

-- 1. ���� ���ڸ� ���Ѵ�.
SELECT ADD_MONTHS(SYSDATE, 22) "��������"
FROM DUAL;
--==> 2023-07-02


-- 2. �Ϸ� ���ڲ��� 3�� �Ļ縦 �ؾ��Ѵٰ� �����ϸ�
--  ��ȣ�� �� ���� �Ծ�� ���븦 �ұ�?

-- �����Ⱓ * 3
-- --------
-- (�������� - ��������)

-- (�������� - ��������) * 3

SELECT   (ADD_MONTHS(SYSDATE, 22) - SYSDATE) * 3 "�Ϸ缼��"
FROM DUAL;
--==>> 2004



--�� ���� ��¥ �� �ð����κ���... ������(2021-12-28 18:00:00)����
-- ���� �Ⱓ��.. ������ ���� ���·� ��ȸ�� �� �ֵ��� �Ѵ�.
/*
--------------------------------------------------------------------
���� �ð�            |������               | ��  |�ð�| �� | ��
--------------------------------------------------------------------
2021-09-02 12:08:23 | 2021-12-28 18:00:00 | 116 | 15  | 42 | 37
--------------------------------------------------------------------
*/
--�� ��¥�� ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

----[[ȥ�� Ǭ ����~]]---------------------------------------
SELECT SYSDATE "����ð�"
    , TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') "������"
    , TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) "��"
    , TRUNC(((TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) - TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE))*24) "�ð�"
    , TRUNC((((TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) - TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE))*24
        - TRUNC(((TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) - TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE))*24))*60)"��"
    , TRUNC(((((TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) - TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE))*24
        - TRUNC(((TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) - TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE))*24))*60
        - TRUNC((((TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) - TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE))*24
        - TRUNC(((TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE) - TRUNC(TO_DATE('2021-12-28 18:00', 'YYYY-MM-DD  HH24:MI:SS') - SYSDATE))*24))*60))*60) "��"
FROM DUAL;



----[[�Բ� Ǭ ����~]]---------------------------------------
SELECT (1*24*60*60) + (2*60*60) + (3*60) + (4)
FROM DUAL;
--==>> 93784

--��93784���ʸ� �ٽ� ��, �ð�, ��, �ʷ� ȯ���ϸ�...
SELECT TRUNC(TRUNC(TRUNC(93784/60)/60)/24)
     , MOD(TRUNC(TRUNC(93784/60)/60), 24)
     , MOD(TRUNC(93784/60), 60)
     , MOD(93784, 60)  
FROM DUAL;
--==>> 1	2	3	4

-- �����ϱ��� ���� �Ⱓ Ȯ��(��¥ ����) �� ���� : �ϼ�
SELECT ��������-��������
FROM DUAL;


-- ��������
SELECT TO_DATE('2021-12-28 18:00;00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 2021-12-28 18:00:00 �� ��¥ ����

-- ��������
SELECT SYSDATE
FROM DUAL;
--==>> 2021-09-02 15:19:36 �� ��¥ ����

SELECT TO_DATE('2021-12-28 18:00;00', 'YYYY-MM-DD HH24:MI:SS') - SYSDATE
FROM DUAL;
--==>> 117.102766203703703703703703703703703704

-- �����ϱ��� �����ⰣȮ��



--�� ����
-- ������ �¾�� �������...
-- �󸶸�ŭ�� ��, �ð�, ��, �ʸ� ��Ҵ��� (����ִ���..)
-- ��ȸ�ϴ� �������� �����Ѵ�.
/*
-----------------------------------------------------------------
���� �ð�            |�¾ �ð�         | �� | �ð� | �� | ��
-----------------------------------------------------------------
2021-09-02 15:33:20 | 1994-04-19 12:00:00 |XXX| XX    | XX | XX
-----------------------------------------------------------------
*/

-- ��������-�¾����
SELECT SYSDATE - TO_DATE('1994-04-19 12:00;00', 'YYYY-MM-DD HH24:MI:SS')
FROM DUAL;
--==>> 9998.152048611111111111111111111111111111 (��¥����)

SELECT (SYSDATE - TO_DATE('1994-04-19 12:00;00', 'YYYY-MM-DD HH24:MI:SS')) * (24*60*60)
FROM DUAL;
--==>> 863840823 (�ʴ���)


SELECT SYSDATE "���� �ð�" 
     , TO_DATE('1994-04-19 12:00:00', 'YYYY-MM-DD HH24:MI:SS') "�¾ �ð�"
     ,TRUNC(TRUNC(TRUNC((SYSDATE-TO_DATE('1994-04-19 12:00:00','YYYY-MM-DD HH24:MI:SS'))*24*60*60/60)/60)/24) "��"
    , MOD(TRUNC(TRUNC((SYSDATE-TO_DATE('1994-04-19 12:00:00','YYYY-MM-DD HH24:MI:SS'))*24*60*60/60)/60),24) "�ð�"
    , MOD(TRUNC((SYSDATE-TO_DATE('1994-04-19 12:00:00','YYYY-MM-DD HH24:MI:SS'))*24*60*60/60),60)"��"
    , TRUNC(MOD((SYSDATE-TO_DATE('1994-04-19 12:00:00','YYYY-MM-DD HH24:MI:SS'))*24*60*60,60)) "��"
FROM DUAL;


--�� ��¥ ���� ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ��¥ �����͸� ������� �ݿø�, ������ ������ �� �ִ�.

--�� ��¥ �ݿø�
SELECT SYSDATE "1"                  --2021-09-02  �� �⺻ ���� ��¥
     , ROUND(SYSDATE, 'YEAR') "2"   --2022-01-01  �� �⵵���� ��ȿ�� ������(��ݱ�, �Ϲݱ� ����)
     , ROUND(SYSDATE, 'MONTH') "3"  --2021-09-01  �� ������ ��ȿ�� ������(15�� ����)
     , ROUND(SYSDATE, 'DD') "4"     --2021-09-03  �� ��¥���� ��ȿ�� ������(���� ����)
     , ROUND(SYSDATE, 'DAY') "5"    --2021-09-05  �� ��¥���� ��ȿ�� ������(������ ����)
FROM DUAL;

--�� ��¥ ���� (�ø��� ����� �߻����� ����)
SELECT SYSDATE "1"                  --2021-09-02  �� �⺻ ���� ��¥
     , TRUNC(SYSDATE, 'YEAR') "2"   --2022-01-01  �� �⵵���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'MONTH') "3"  --2021-09-01  �� ������ ��ȿ�� ������
     , TRUNC(SYSDATE, 'DD') "4"     --2021-09-02  �� ��¥���� ��ȿ�� ������
     , TRUNC(SYSDATE, 'DAY') "5"    --2021-09-02  �� ��¥���� ��ȿ�� ������(�� �� �Ͽ���)
FROM DUAL;


--------------------------------------------------------------------------------

--���� ��ȯ �Լ� ����--

-- TO_CHAR()   : ���ڳ� ��¥ �����͸� ���� Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_DATE()   : ���� ������(��¥ ����)�� ��¥ Ÿ������ ��ȯ�����ִ� �Լ�
-- TO_NUMBER() : ���� ������(���� ����)�� ���� Ÿ������ ��ȯ�����ִ� �Լ�

--�س�¥�� ��ȭ ������ ���� ���� ���
--  ���� �������� ���� ������ ������ �� �ִ�.

ALTER SESSION SET NLS_DATE_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_LANGUAGE = 'KOREAN';
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_CURRENCY = '\';   --��(��)
--==>> Session��(��) ����Ǿ����ϴ�.

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
--==>> Session��(��) ����Ǿ����ϴ�.


-- ��¥Ÿ���� ����Ÿ������ ��ȯ�ϴ�....
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')   -- 2021-09-02
     , TO_CHAR(SYSDATE, 'YYYY')         -- 2021
     , TO_CHAR(SYSDATE, 'YEAR')         -- TWENTY TWENTY-ONE
     , TO_CHAR(SYSDATE, 'MM')           -- 09
     , TO_CHAR(SYSDATE, 'MONTH')        -- 9�� 
     , TO_CHAR(SYSDATE, 'MON')          -- 9�� 
     , TO_CHAR(SYSDATE, 'DD')           -- 02
     , TO_CHAR(SYSDATE, 'DAY')          -- �����
     , TO_CHAR(SYSDATE, 'DY')           -- ��
     , TO_CHAR(SYSDATE, 'HH24')         -- 16
     , TO_CHAR(SYSDATE, 'HH')           -- 04
     , TO_CHAR(SYSDATE, 'HH AM')        -- 04 ����
     , TO_CHAR(SYSDATE, 'HH PM')        -- 04 ����
     , TO_CHAR(SYSDATE, 'MI')           -- 23
     , TO_CHAR(SYSDATE, 'SS')           -- 54
     , TO_CHAR(SYSDATE, 'SSSSS')        -- 59034
     , TO_CHAR(SYSDATE, 'Q')            -- 3
FROM DUAL;


SELECT 2021 "1", '2021' "2"
FROM DUAL;
--==>> 2021	2021 --����Ÿ���� ���� ���ĵ�. ����Ÿ���� ������ ����.

SELECT '23' "1", TO_NUMBER('23') "2"
FROM DUAL;


--�� EXTRACT()
SELECT TO_CHAR(SYSDATE, 'YYYY') "1"     -- 2021 �� ������ �����Ͽ� ���� Ÿ������..
      , TO_CHAR(SYSDATE, 'MM') "2"      -- 09   �� ���� �����Ͽ� ���� Ÿ������..
      , TO_CHAR(SYSDATE, 'DD') "3"      -- 02   �� ���� �����Ͽ� ���� Ÿ������..
      , EXTRACT(YEAR FROM SYSDATE) "4"  -- 2021 �� ������ �����Ͽ� ���� Ÿ������..
      , EXTRACT(MONTH FROM SYSDATE) "5" -- 9    �� ���� �����Ͽ� ���� Ÿ������..
      , EXTRACT(DAY FROM SYSDATE) "6"   -- 2    �� ���� �����Ͽ� ���� Ÿ������..
FROM DUAL;
--> ��, ��, �� ���� �ٸ� ���� �Ұ�

--�� TO_CHAR() Ȱ�� �� ���� ���� ǥ�� ����� ��ȯ
SELECT 60000 "1"
     , TO_CHAR(60000) "2"
     , TO_CHAR(60000, '99,999') "3"
     , TO_CHAR(60000, '$99,999') "4"
     , TO_CHAR(60000, 'L99,999' ) "5"
     , LTRIM(TO_CHAR(60000, 'L99,999' )) "6"    --���� ���� ����
FROM DUAL;
--==>>60000	60000	 60,000	 $60,000	          \60,000	\60,000


--�� ��¥ ���� ���� ����
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
--==>> Session��(��) ����Ǿ����ϴ�.

--�� ���� �ð��� �������� 1�� 2�ð� 3�� 4�� �ĸ� ��ȸ�Ѵ�.
SELECT SYSDATE "����ð�"
     , SYSDATE + 1 + (2/24) + (3/(24*60)) + (4/(24*60*60)) "1��2�ð�3��4����"
FROM DUAL;
--==>>
/*
2021-09-02 17:02:25	
2021-09-03 19:05:29
*/

--�� ���� �ð��� �������� 1�� 2���� 3�� 4�ð� 5�� 6�� �ĸ� ��ȸ�Ѵ�.
--  TO_YMINTERVAL(), TO_DSINTERVAL()
SELECT SYSDATE "����ð�"
     , SYSDATE + TO_YMINTERVAL('01-02') + TO_DSINTERVAL('003 04:05:06') "������"
FROM DUAL;
--==>>
/*
2021-09-02 17:06:00	
2022-11-05 21:11:06
*/

-------------------------------------------------------------------------------

--�� CASE ���� (���ǹ�, �б⹮)
/*
CASE
WHEN
TEHN
ELSE
END
*/

SELECT CASE 5+2 WHEN 7 THEN '5+2=7' ELSE '5+2�� �����' END "���Ȯ��"
FROM DUAL;
--==>> 5+2=7

SELECT CASE 5+2 WHEN 9 THEN '5+2=9' ELSE '5+2�� �����' END "���Ȯ��"
FROM DUAL;
--==>> 5+2�� �����


SELECT CASE 1+1 WHEN 2 THEN '1+1=2'
                WHEN 3 THEN '1+1=3'
                WHEN 4 THEN '1+1=4'
       END "��� Ȯ��"
FROM DUAL;
--==>> 1+1=2


--�� DECODE()
SELECT DECODE(5-2, 1, '5-2=1', 2, '5-2=2', 3, '5-2=3', '5-2�� �����') "��� Ȯ��"
FROM DUAL;
--==>> 5-2=3

SELECT CASE WHEN 5<2 THEN '5<2'
            WHEN 5>2 THEN '5>2'
            ELSE '�񱳺Ұ�'
        END "��� Ȯ��"
FROM DUAL;


SELECT CASE WHEN 5<2 OR 3>1 THEN '�Ѹ�����'
            WHEN 5>2 OR 2=3 THEN '�浿����'
            ELSE '�Ѵ�õ��'
        END "��� Ȯ��"
FROM DUAL;
--==> �Ѹ�����
/*
SELECT CASE WHEN F OR T THEN '�Ѹ�����' >> T ���� TRUE ������.. ���� ��, �ؿ��� �������
            WHEN T OR F THEN '�浿����' >> T
            ELSE '�Ѵ�õ��'
        END "��� Ȯ��"
FROM DUAL;
*/


SELECT CASE WHEN 3<1 AND 5<2 OR 3>1 AND 2=2 THEN '�ش�����'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���' 
        END "���Ȯ��"
FROM DUAL;
--==>> �ش�����
/*
SELECT CASE WHEN F AND F OR T AND T THEN '�ش�����' >>T
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���' 
        END "���Ȯ��"
FROM DUAL;
*/

SELECT CASE WHEN 3<1 AND (5<2 OR 3>1) AND 2=2 THEN '�ش�����'
            WHEN 5<2 AND 2=3 THEN '��������'
            ELSE '���ϸ���' 
        END "���Ȯ��"
FROM DUAL;
--==>> ���ϸ���
/*
SELECT CASE WHEN F AND (F OR T) AND T THEN '�ش�����' >>F
            WHEN F AND F THEN '��������' >>F
            ELSE '���ϸ���' 
        END "���Ȯ��"
FROM DUAL;
*/


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD'; 
--==>> Session��(��) ����Ǿ����ϴ�.

SELECT *
FROM TBL_SAWON;

--�۹���
-- TBL_SAWON ���̺��� Ȱ���Ͽ� ������ ���� �׸���� ��ȸ�Ѵ�.
-- �����ȣ, �����, �ֹι�ȣ, ����, ���糪��, �Ի���
-- , ����������, �ٹ��ϼ�, �����ϼ�, �޿�, ���ʽ�

-- ��, ���糪�̴� �ѱ����� ������ ���� ������ �����Ѵ�.
-- ����, ������������ �ش� ������ ���̰� �ѱ����̷� 60���� �Ǵ� ��(����)��
-- �� ������ �Ի� ��, �Ϸ� ������ �����Ѵ�.
-- �׸���, ���ʽ��� 1000�� �̻� 2000�� �̸� �ٹ��� �����
-- �� ����� ���� �޿� ���� 30% ����,
-- 2000�� �̻� �ٹ��� �����
-- �� ����� ���� �޿� ���� 50% ������ �� �� �ֵ��� ó���Ѵ�.

SELECT SANO "��� ��ȣ", SANAME "�����", JUBUN "�ֹι�ȣ"
        , CASE WHEN SUBSTR(JUBUN, 7,1) = '2' OR SUBSTR(JUBUN, 7, 1) = '4' THEN '��'
               WHEN SUBSTR(JUBUN, 7,1) = '1' OR SUBSTR(JUBUN, 7, 1) = '3' THEN '��'
               ELSE '�����̹���'
          END "����"
       , CASE WHEN SUBSTR(JUBUN, 7,1) = '1' OR SUBSTR(JUBUN, 7, 1) = '2' THEN TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(JUBUN, 1, 2)+1900)+1
              WHEN SUBSTR(JUBUN, 7,1) = '3' OR SUBSTR(JUBUN, 7, 1) = '4' THEN TO_CHAR(SYSDATE, 'YYYY') - (SUBSTR(JUBUN, 1, 2)+2000)+1
               ELSE '���̹���'
          END "���糪��"    
        , HIREDATE "�Ի���"
       -- , "����������"
       -- , "�ٹ��ϼ�"
        , SAL "�޿�"
     --   , "���ʽ�"
FROM TBL_SAWON;
select user
from dual;
--==>> SCOTT

-- ���� FUNCTION(�Լ�) ����--

--1. �Լ��� �ϳ� �̻��� PL/SQL������ ������ �����ƾ����
-- �ڵ带 �ٽ� ����� �� �ֶǷ� ĸ��ȭ �ϴµ� ���ȴ�.
-- ����Ŭ������ ����Ŭ�� ���ǵ��� �⺻ ���� �Լ��� ����ϰų�
-- ���� ������ �Լ��� ���� �� �ִ�. (�� ����� ���� �Լ�)
-- �� ����� ���� �Լ��� �ý��� �Լ�ó�� �������� ȣ���ϰų�
-- ���� ���ν���ó�� EXECUTE���� ���� ������ �� �ִ�.


--2. ���� �� ����
/*
CREATE [OR REPLACE] FUNCTION �Լ���
[(
    �Ű�����1  �ڷ���
    , �Ű�����2 �ڷ���
)]
RETURN ������Ÿ��
IS 
    -- �ֿ� ���� ����(��������)
BEGIN
    -- ���๮
    ...
    RETURN (��);
    
    [EXCEPTION]
        -- ���� ó�� ����;
END;
*/

--�� ����ڰ� ���� �Լ�(������ �Լ�)��
--  IN �Ķ����(�Է� �Ű�����)�� ����� �� ������
--  �ݵ�� ��ȯ�� ���� ������Ÿ���� RETURN���� �����ؾ��ϰ�,
--  FUNCTION�� �ݵ�� ���� ���� ��ȯ�Ѵ�.


--�� TBL_INSA ���̺���
--  �ֹε�Ϲ�ȣ�� ������ ������ ��ȸ�Ѵ�.

SELECT *
FROM TBL_INSA;

SELECT NAME, SSN, DECODE( SUBSTR(SSN, 8, 1), 1, '����', 2, '����', 'Ȯ�κҰ�' ) "����"
FROM TBL_INSA;


/*            
              �� �ֹε�Ϲ�ȣ
            \     /
    ---------     -----------
    |                       |
    -------------     -------
                /     \
                  �� ����
*/


--�� FUNCTION ����
--   �Լ��� : FN_GENDER()
--                     �� SSN(�ֹι�ȣ) �� 'YYMMDD-NNNNNNN'

CREATE OR REPLACE FUNCTION FN_GENDER
( VSSN VARCHAR2     -- �Ű����� : �ڸ���(����) ���� ����
)
RETURN VARCHAR2     -- ��ȯ�ڷ��� : �ڸ���(����) ���� ����
IS
    -- �ֿ� ���� ����
    VRESULT VARCHAR2(20);
BEGIN
    -- ���� �� ó��
    IF ( SUBSTR(VSSN, 8, 1) IN ('1', '3') )
        THEN VRESULT := '����';
    ELSIF ( SUBSTR(VSSN, 8, 1) IN ('2', '4'))
        THEN VRESULT := '����';
    ELSE
        VRESULT := '����Ȯ�κҰ�';
    END IF;
    
    -- ���� ����� ��ȯ
    RETURN VRESULT;
    
END;
--==>> Function FN_GENDER��(��) �����ϵǾ����ϴ�.


--�� ������ ���� �� ���� �Ű�����(�Է� �Ķ����)�� �Ѱܹ޾�
--  A�� B���� ���� ��ȯ�ϴ� ����� ���� �Լ��� �ۼ��Ѵ�.
--  �Լ��� : FN_POW()
/*
��� ��)
SELECT FN_POW(1O,3)
             ------
             10 * 10 * 10 = 1000
         1 * 10 * 10 * 10 = 1000
         0 * 10 * 10 * 10 = 0
         
FROM DUAL;
--==>> 1000

*/


CREATE OR REPLACE FUNCTION FN_POW
(a NUMBER
, b NUMBER)     -- �Ű����� : �ڸ���(����) ���� ����
RETURN NUMBER   -- ��ȯ�ڷ��� : �ڸ���(����) ���� ����
IS
    --�ֿ亯������
   VNUM NUMBER;
   N NUMBER ; 
BEGIN
    -- ���� �� ó��
    N := 1;
    VNUM := 1;
        LOOP 
         VNUM := VNUM * a;
         EXIT WHEN N = b;
         N := N + 1;
        END LOOP;  
        
    -- ���� ����� ��ȯ
    RETURN VNUM;
END;

-----------------[[�Բ� Ǭ ����]]-----------------------------------------------

CREATE OR REPLACE FUNCTION FN_POW_2(A NUMBER, B NUMBER)
RETURN NUMBER
IS
    V_RESULT    NUMBER := 1;    --������
    V_NUM       NUMBER;
BEGIN

    FOR V_NUM IN 1..B LOOP
        V_RESULT := V_RESULT * A;
    END LOOP;
    
    -- CHECK~!!
    RETURN V_RESULT;
END;
--==>> Function FN_POW��(��) �����ϵǾ����ϴ�.
--==>> Function FN_POW_2��(��) �����ϵǾ����ϴ�.



--�� ����
-- TBL_INSA ���̺��� �޿� ��� ���� �Լ��� �����Ѵ�.
-- �޿��� ��(�⺻�� * 12) + ���硻�� ������� ������ �����Ѵ�.
-- �Լ��� : FN_PAY(�⺻��, ����)


--�� ����
-- TBL_INSA���̺��� �Ի����� ��������
-- ��������� �ٹ������ ��ȯ�ϴ� �Լ��� �����Ѵ�.
-- ��, �ٹ������ �Ҽ��� ���� ���ڸ����� ����Ѵ�.
-- �Լ��� : FN_WORKYEAR(�Ի���)




--------------------------------------------------------------------------------

--�� ����

-- 1. INSERT, UPDATE, DELETE, (MERGE)
--==>> DML(Data Maniplation Language)
-- COMMIT / ROLLBACK �� �ʿ��ϴ�.

-- 2. CREATE, DROP ALTER, (TRUNCATE)
--==>> DDL(Data Definition Language)

-- 3. GRANT, REVOKE
--==>> DCL(Data Control Language)
-- �����ϸ� �ڵ����� COMMIT �ȴ�.

-- 4. COMMIT, ROLLBACK
--==>> TCL(Transaction Control Language)

-- ���� PL/SQL�� �� DML��, TCL���� ��밡���ϴ�.
-- ���� PL/SQL�� �� DML��, DDL��, DCL��, TCL�� ��� �����ϴ�.

--------------------------------------------------------------------------------



-- ���� PROCEDURE(���ν���) ����--


-- 1. PL/SQL���� ���� ��ǥ���� ������ ������ ���ν�����
--  �����ڰ� ���� �ۼ��ؾ� �ϴ� ������ �帧��
--  �̸� �ۼ��Ͽ� �����ͺ��̽� ���� ������ �ξ��ٰ�
-- �ʿ��� �� ���� ȣ���Ͽ� ������ �� �ֵ��� ó���� �ִ� �����̴�.


-- 2. ���� �� ����
/*
CREATE [OR REPLACE] PROCEDURE ���ν�����
[(
     �Ű����� IN ������Ÿ��          --�Է¸Ű�����
   , �Ű����� OUT ������Ÿ��         
   , �Ű����� INOUT ������Ÿ�� 
)]
IS
    -- �ֿ� ���� ����
BEGIN
    -- ���� ����
    ...
    [EXCEPTION]
        -- ���� ó�� ����
END;
*/


--�� FUNCTION�� ������ ��...
--  ��RETURN ��ȯ�ڷ������κ��� �������� ������,
--  ��RETURN���� �ڤ�ü�� �������� ������,
--  ���ν��� ���� �� �Ѱ��ְ� �Ǵ� �Ű������� ������
--  IN, OUT, INOUT ���� ���еȴ�.


-- 3. ����(ȣ��)
/*
EXEC[UTE] ���ν�����[(�μ�1, �μ�2, ...)];
*/

--�� INSERT ���� ������ ���ν����� �ۼ�(�� INSERT ���ν��� )

-- ���ν��� ����(�ۼ�)
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_INSERT
( V_ID      IN TBL_IDPW.ID%TYPE
, V_PW      IN TBL_IDPW.PW%TYPE
, V_NAME    IN TBL_STUDENTS.NAME%TYPE
, V_TEL     IN TBL_STUDENTS.TEL%TYPE
, V_ADDR    IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- TBL_IDPW ���̺������� �Է�
    INSERT INTO TBL_IDPW(ID, PW)
    VALUES(V_ID, V_PW);
    
    -- TBL_STUDENTS ���̺������� �Է�
    INSERT INTO TBL_STUDENTS(ID, NAME, TEL, ADDR)
    VALUES(V_ID, V_NAME, V_TEL, V_ADDR);
    
    --Ŀ��
    COMMIT;
END;
--==>> Procedure PRC_STUDENTS_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_SUNGJUK ���̺� ������ �Է½�
--  Ư�� �׸��� ������(�й�, �̸�, ��������, ��������, ��������)�� �Է��ϸ�
--  ���������� ����, ���, ��� �׸��� �Բ� �Է� ó���� �� �ֵ��� �ϴ�
--  ���ν����� �����Ѵ�.
--  ���ν��� �� : PRC_SUNGJUK_INSERT()
/*
���� ��)
EXEC PRC_SUNGJUK_INSERT(1, '������', 90, 80, 70);

���ν��� ȣ��� ó���� ��� )
�й�  �̸�  ��������   �������� ��������    ����  ���  ���
  1  ������    90          80      70       240    80     B
*/
-- ���ν��� ����(�ۼ�)
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_INSERT
( V_HAKBUN      IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME        IN TBL_SUNGJUK.NAME%TYPE
, V_KOR         IN TBL_SUNGJUK.KOR%TYPE
, V_ENG         IN TBL_SUNGJUK.ENG%TYPE
, V_MAT         IN TBL_SUNGJUK.MAT%TYPE
)
IS
    --�Ʒ��� �ִ� INSERT �������� �����ϴµ� �ʿ��� �ֿ� ���� ����
    V_TOT       TBL_SUNGJUK.TOT%TYPE;            -- ����
    V_AVG       TBL_SUNGJUK.AVG%TYPE;            -- ���
    V_GRADE     TBL_SUNGJUK.GRADE%TYPE;          -- ���
BEGIN
    -- �Ʒ��� INSERT �������� �����ϱ� ���ؼ���
    -- ������ ������ �����鿡 ���� ��Ƴ��� �Ѵ�.
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;
    
    -- ���� �Ϸ��� ����(line 285~298)�� ���� ��Ƴ� �����
    -- INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
    VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
                                                  ---------------------
                                                  
    --Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_INSERT��(��) �����ϵǾ����ϴ�.


--�� TBL_SUNGJUK ���̺���
--  Ư�� �л��� ����(�й�, ����, ����, ����)
-- ������ ���� �� ����, ���, ��ޱ��� �����ϴ� ���ν����� �ۼ��Ѵ�.
-- ���ν��� �� : PRC_SUNGJUK_UPDATE()
/*
���� ��)
EXEC PRC_SUNGJUK_UPDATE(2, 100, 100, 100);


���ν��� ȣ��� ó���� ��� )
�й�  �̸�  ��������   �������� ��������    ����  ���  ���
  2  ��ҿ�    100       100      100       300    100    A
*/

-------[[���� Ǭ �ڵ�]]---------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN      IN TBL_SUNGJUK.HAKBUN%TYPE
, V_NAME        IN TBL_SUNGJUK.NAME%TYPE
, V_KOR         IN TBL_SUNGJUK.KOR%TYPE
, V_ENG         IN TBL_SUNGJUK.ENG%TYPE
, V_MAT         IN TBL_SUNGJUK.MAT%TYPE
, V_TOT         IN TBL_SUNGJUK.TOT%TYPE            -- ����
, V_AVG         IN TBL_SUNGJUK.AVG%TYPE            -- ���
, V_GRADE       IN TBL_SUNGJUK.GRADE%TYPE 
)
IS
    V_CNT NUMBER := 0;
BEGIN
    
    SELECT COUNT(*)          -- ������ �й� �ִ��� Ȯ��
    INTO V_CNT
    FROM TBL_SUNGJUK
    WHERE HAKBUN = V_HAKBUN;
    
    
    IF V_CNT > 0 THEN        -- ������ �й��� ���ٸ�
        UPDATE TBL_SUNGJUK
        SET HAKBUN = V_HAKBUN
          , NAME = V_NAME
          , KOR = V_KOR
          , ENG = V_ENG
          , MAT = V_MAT
          , TOT = V_TOT
          , AVG = V_AVG
          , GRADE = V_GRADE
        WHERE HAKBUN = V_HAKBUN;
    ELSE
        INSERT INTO TBL_SUNGJUK(HAKBUN, NAME, KOR, ENG, MAT, TOT, AVG, GRADE)
        VALUES(V_HAKBUN, V_NAME, V_KOR, V_ENG, V_MAT, V_TOT, V_AVG, V_GRADE);
    END IF;                                           
                                                  
    --Ŀ��
    COMMIT;
    
END;


-------[[�Բ� Ǭ �ڵ�]]---------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_SUNGJUK_UPDATE
( V_HAKBUN      IN TBL_SUNGJUK.HAKBUN%TYPE
, V_KOR         IN TBL_SUNGJUK.KOR%TYPE
, V_ENG         IN TBL_SUNGJUK.ENG%TYPE
, V_MAT         IN TBL_SUNGJUK.MAT%TYPE
)
IS
    -- UPDATE ���� �� �ʿ��� �����͸� ��Ƴ� �ֿ� ���� ����
    V_TOT       TBL_SUNGJUK.TOT%TYPE;
    V_AVG       TBL_SUNGJUK.AVG%TYPE;
    V_GRADE     TBL_SUNGJUK.GRADE%TYPE;
BEGIN
    -- �Ʒ� UPDATE ������ ������ ����
    --  ������ ������ �����鿡 ���� ��Ƴ���
    V_TOT := V_KOR + V_ENG + V_MAT;
    V_AVG := V_TOT / 3;
    
    IF (V_AVG >= 90)
        THEN V_GRADE := 'A';
    ELSIF (V_AVG >= 80)
        THEN V_GRADE := 'B';
    ELSIF (V_AVG >= 70)
        THEN V_GRADE := 'C';
    ELSIF (V_AVG >= 60)
        THEN V_GRADE := 'D';
    ELSE
        V_GRADE := 'F';
    END IF;

    -- UPDATE ������ ����
    UPDATE TBL_SUNGJUK
    SET KOR = V_KOR, ENG = V_ENG, MAT = V_MAT
      , TOT = V_TOT, AVG = V_AVG, GRADE = V_GRADE
    WHERE HAKBUN = V_HAKBUN;
   
                                       
    --Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_SUNGJUK_UPDATE��(��) �����ϵǾ����ϴ�.


--�� TBL_STUDENTS ���̺���
--   ��ȭ��ȣ�� �ּ� �����͸� �����ϴ� (�����ϴ�) ���ν����� �ۼ��Ѵ�.
--  ��, ID�� PW�� ��ġ�ϴ� ��쿡�� ������ ������ �� �ֵ��� �Ѵ�.
-- ���ν��� �� : PRC_STUDENTS_UPDATE()
/*
���� ��)
EXEC PRC_STUDENTS_UPDATE('superman', 'java006$', '010-9999-9999', '��õ');

���ν��� ȣ��� ó���� ���
superman �չ��� 010-9999-9999  ��õ  
*/

-------[[���� Ǭ �ڵ�]]---------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID          IN TBL_IDPW.ID%TYPE
, V_PW          IN TBL_IDPW.PW%TYPE
, V_TEL         IN TBL_STUDENTS.TEL%TYPE
, V_ADDR        IN TBL_STUDENTS.ADDR%TYPE
)
IS
    V_CNT NUMBER := 0;
BEGIN
    
    SELECT COUNT(*)          -- ������ ID, PW �ִ� �� Ȯ��
    INTO V_CNT
    FROM TBL_IDPW
    WHERE ID = V_ID
      AND PW = V_PW;
    
    
    IF V_CNT = 1 THEN        -- ������ ID, PW�� ���ٸ� TBL_IDPW
        UPDATE TBL_IDPW
        SET ID = V_ID
          , PW = V_PW
        WHERE ID = V_ID
          AND PW = V_PW;
    END IF;  
    
    IF V_CNT = 1 THEN        -- ������ ID, PW�� ���ٸ� TBL_STUDENTS
        UPDATE TBL_STUDENTS
        SET ID = V_ID
          , TEL = V_TEL
          , ADDR = V_ADDR
        WHERE ID = V_ID;
    END IF;      
                                                  
    --Ŀ��
    COMMIT;
    
END;




-------[[�Բ� Ǭ �ڵ�]]---------------------------------------------------
CREATE OR REPLACE PROCEDURE PRC_STUDENTS_UPDATE
( V_ID          IN TBL_STUDENTS.ID%TYPE
, V_PW          IN TBL_IDPW.PW%TYPE
, V_TEL         IN TBL_STUDENTS.TEL%TYPE
, V_ADDR        IN TBL_STUDENTS.ADDR%TYPE
)
IS
BEGIN
    -- UPDATE ������ ����
    UPDATE (SELECT I.ID, I.PW, S.TEL, S.ADDR
            FROM TBL_IDPW I JOIN TBL_STUDENTS S
            ON I.ID = S.ID) T
    SET T.TEL = V_TEL, T.ADDR = V_ADDR
    WHERE T.ID=V_ID AND T.PW=V_PW;
                               
    --Ŀ��
    COMMIT;
    
END;
--==>> Procedure PRC_STUDENTS_UPDATE��(��) �����ϵǾ����ϴ�.



--�� TBL_INSA ���̺��� ������� �ű� ������ �Է� ���ν����� �ۼ��Ѵ�.
-- NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG 
-- ������ ���� �ִ� ��� ���̺� ������ �Է� ��
--  NUM �÷�(�����ȣ)�� ����
-- ���� �ο��� �����ȣ ������ ��ȣ�� �� ���� ��ȣ�� �ڵ�����
-- �Է� ó���� �� �ִ� ���ν����� �����Ѵ�.
-- ���ν��� �� : PRC_INSA_INSERT(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG);
/*
���� ��)
EXEC PRC_INSA_INSERT('�̴ٿ�', '951027-2234567', SYSDATE, '����', '010-4113-2353', '������', '�븮', 10000000, 2000000); -- õ��, �̹鸸

���ν��� ȣ��� ó���� ���)
1061 �̴ٿ� 951027-2234567 SYSDATE ���� 010-4113-2353 ������ �븮 10000000 2000000
*/
CREATE OR REPLACE PROCEDURE PRC_INSA_INSERT
( V_NUM           IN TBL_INSA.NUM%TYPE
, V_NAME          IN TBL_INSA.NAME%TYPE
, V_SSN           IN TBL_INSA.SSN%TYPE
, V_IBSADATE      IN TBL_INSA.IBSADATE%TYPE
, V_CITY          IN TBL_INSA.CITY%TYPE
, V_TEL           IN TBL_INSA.TEL%TYPE
, V_BUSEO         IN TBL_INSA.BUSEO%TYPE
, V_JIKWI         IN TBL_INSA.JIKWI%TYPE
, V_BASICPAY      IN TBL_INSA.BASICPAY%TYPE
, V_SUDANG        IN TBL_INSA.SUDANG%TYPE
)
IS
BEGIN
    V_NUM := V_NUM+1;
    
    
    -- INSERT ������ ����
    INSERT INTO TBL_SUNGJUK(NUM, NAME, SSN, IBSADATE, CITY, TEL, BUSEO, JIKWI, BASICPAY, SUDANG)
    VALUES(V_NUM, V_NAME, V_SSN, V_IBSADATE, V_CITY, V_TEL, V_BUSEO, V_JIKWI, V_BASICPAY, V_SUDANG);
                                                
                                                  
    --Ŀ��
    COMMIT;
    
END;
-->> �ϴٰ� ���� 9�� 16�� ���Ϸ�~~!













SELECT USER
FROM DUAL;
--==>> SCOTT

--���� PL/SQL ����--

-- 1. PL/SQL (Procedural Language extension to SQL)��
-- ���α׷��� ����� Ư���� ������ SQL�� Ȯ���̸�,
-- ������ ���۰� ���� ������ PL/SQL�� ������ �ڵ� �ȿ� ���Եȴ�.
-- ���� PL/SQL�� ����ϸ� SQL�� �� �� ���� ������ �۾��� �����ϴ�.
-- ���⿡�� �����������̶�� �ܾ ������ �ǹ̴�
-- � ���� � ������ ���� ��� �Ϸ�Ǵ���
-- �� ����� ��Ȯ�ϰ� �ڵ忡 ����ϴٴ� ���� �ǹ��Ѵ�.

-- 2. PL/SQL�� ���������� ǥ���ϱ� ����
-- ������ ������ �� �ִ� ���,
-- ���� ������ ������ �� �ִ� ���,
-- ���� �帧�� ��Ʈ���� �� �ִ� ��� ���� �����Ѵ�.

-- 3.  PL/SQL�� �� ������ �Ǿ� ������
-- ���� ���� �κ�, ����κ�, ����ó�� �κ���
-- �� �κ����� �����Ǿ� �ִ�.
-- ����, �ݵ�� ���� �κ��� �����ؾ� �ϸ�, ������ ������ ����.

-- 4. ���� �� ����
/*
[DECLARE]
    -- ����(declarations)
BEGIN
    -- ���๮(statements)
    [EXCEPTION]
        -- ���� ó����(exception handlers)
END;
*/

-- 5. ���� ����
/*
DECLARE
    --�ڷ��� ������; int num; �� X             int num = 10
    ������ �ڷ���;    COL1 NUMBER(3); �� ��    COL1 NUMBER(3) := 10;
    ������ �ڷ��� := �ʱⰪ;
    
BEGIN
    PL/SQL ����;
END;
*/

SET SERVEROUTPUT ON;
--==>> �۾��� �Ϸ�Ǿ����ϴ�.
-- ��DEMS_OUTPUT.PUT_LINE()���� ����
--  ȭ�鿡 �ܰ��� ����ϱ� ���� ȯ�溯�� ����

--�� ������ ������ ���� �����ϰ� ����ϴ� ���� �ۼ�
DECLARE
    -- �����
    V1 NUMBER := 10;
    V2 VARCHAR2(30) := 'HELLO';
    V3 VARCHAR2(20) := 'Oracle';
BEGIN
    -- �����
    --SYSTEM.OUT.PRINTLN(V1);
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>>
/*
10
HELLO
Oracle


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ������ ������ ���� �����ϰ� ����ϴ� PL/SQL ���� �ۼ�
DECLARE
    -- �����
    V1 NUMBER := 10;
    V2 VARCHAR2(30) := 'HELLO';
    V3 VARCHAR2(30) := 'Oracle';
BEGIN
    -- �����
    V1 := V1 * 10;        -- V1 *= 10;
    V2 := V2 || '����';   -- V2 += "����";
    V3 := V3 || 'World';
    
    DBMS_OUTPUT.PUT_LINE(V1);
    DBMS_OUTPUT.PUT_LINE(V2);
    DBMS_OUTPUT.PUT_LINE(V3);
END;
--==>>
/*
100
HELLO����
OracleWorld


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� IF��(���ǹ�)
-- IF ~ THEN ~ ELSE ~ END IF;

-- 1. PL/SQL�� IF������ �ٸ� ����� IF ���ǹ��� ���� �����ϴ�.
--  ��ġ�ϴ� ���ǿ� ���� ���������� �۾��� ������ �� �ֵ��� �Ѵ�.
--  TRUE �̸� THEN �� ELSE������ ������ �����ϰ�
--  FLASE �� NULL�̸� ELSE�� END IF ����� ������ �����ϰ� �ȴ�.

-- 2. ���� �� ����
/*
IF ����
    THEN ó������;
ELSIF ����
    THEN ó������;
ELSIF ����
    THEN ó������;
ELSE
    ó������;
END IF;
*/

--�� ������ ����ִ� ���� ����...
--  Excellent, Good, Fail �� �����Ͽ�
--  ����� ����ϴ� PL/SQL������ �ۼ��Ѵ�.
DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'C';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Fail


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


DECLARE
    GRADE CHAR;
BEGIN
    GRADE := 'B';
    
    IF GRADE = 'A'
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF GRADE = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
END;
--==>>
/*
Good


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� CASE�� (���ǹ�)
-- CASE ~ WHEN ~ THEN ~ ELSE ~ END CASE;

-- 1. ���� �� ����
/*
CASE ����
    WHEN ��1
        THEN ���๮;
    WHEN
        ��2
        THEN ���๮;
    ELSE
        ���๮;
END CASE;
*/

--�� ������ ����ִ� ���� ����...
--  Excellent, Good, Fail �� �����Ͽ�
--  ����� ������� PL/SQL������ �ۼ��Ѵ�.
-- ��, CASE������ Ȱ���Ͽ� �ۼ��Ѵ�.
DECLARE
    GRADE CHAR;
BEGIN
     GRADE := 'B';
    
    CASE GRADE
        WHEN  'A'
            THEN DBMS_OUTPUT.PUT_LINE('Excellent');
        WHEN 'B'
            THEN DBMS_OUTPUT.PUT_LINE('Good');
          ELSE
            DBMS_OUTPUT.PUT_LINE('Fail');
    END CASE;
END;
--==>> 
/*
Good


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/



--�� �ܺ� �Է� ó��

-- ACCEPT ��
-- ACCEPT ������ PROMPT '�޼���';
-- �ܺ� �����κ��� �Է¹��� �����͸� ���� ������ ������ ��
--  ��&�ܺκ����� ���·� �����ϰ� �ȴ�.

--�� ���� 2���� �ܺηκ���(����ڷκ���) �Է¹޾�
--  �̵��� ���� ����� ����ϴ� PL/SQL������ �ۼ��Ѵ�.

ACCEPT N1 PROMPT 'ù ��° ������ �Է��ϼ���.';
ACCEPT N2 PROMPT '�� ��° ������ �Է��ϼ���.';

DECLARE
    --�ֿ� ���� ���� �� �ʱ�ȭ
    NUM1     NUMBER := &N1;
    NUM2     NUMBER := &N2;
    TOTAL    NUMBER := 0;
BEGIN
    -- ���� �� ó��
    TOTAL := NUM1 + NUM2;
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE(NUM1 || '+' || NUM2 || '=' || TOTAL);
END;
--==>>
/*
10+20=30


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ����ڷκ��� �Է¹��� �ݾ��� ȭ�� ������ ����ϴ� ���α׷��� �ۼ��Ѵ�.
--   ��, ��ȯ �ݾ��� ���ǻ� 1õ�� �̸�, 10�� �̻� �����ϴٰ� �����Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� �ݾ� �Է� : [       890  ]

�Է¹��� �ݾ� �Ѿ� : 890��
ȭ����� : ����� 1, ��� 3, ���ʿ� 1, �ʿ� 4

*/

ACCEPT WON PROMPT '�ݾ��� �Է��ϼ���.';

DECLARE
    --�ֿ� ���� ���� �� �ʱ�ȭ
    WON     NUMBER := &WON;
BEGIN
    -- ���� �� ó��
    IF WON*1
        THEN DBMS_OUTPUT.PUT_LINE('Excellent');
    ELSIF WON = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSIF WON = 'B'
        THEN DBMS_OUTPUT.PUT_LINE('Good');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Fail');
    END IF;
      
    
    -- ��� ���
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� :'|| WON || '��');
    DBMS_OUTPUT.PUT_LINE('ȭ����� :'|| '�����' || );
END;


ACCEPT INPUT PROMPT '�ݾ� �Է�';

DECLARE
    --�� �ֿ� ���� ���� �� �ʱ�ȭ
    MONEY  NUMBER := &INPUT;    -- ������ ���� ��Ƶ� ����
    MONEY2 NUMBER := &INPUT;    -- ����� ���� ��Ƶ� ����(���� �������� ���� ���ϱ� ������...)
    M500   NUMBER;              -- 500�� ¥�� ������ ��Ƶ� ����
    M100   NUMBER;              -- 100�� ¥�� ������ ��Ƶ� ����
    M50    NUMBER;              -- 50�� ¥�� ������ ��Ƶ� ����
    M10    NUMBER;              -- 10�� ¥�� ������ ��Ƶ� ����
BEGIN
    --�� ���� �� ó��
    --  MONEY�� 500���� ������ ���� ���ϰ� �������� ������.   �� 500���� ����
    M500 := TRUNC(MONEY/500);
    
    --  MONEY�� 500���� ������ ���� ������ �������� ���Ѵ��� 
    --  �� ����� MONEY�� ��Ƴ���.
    MONEY := MOD(MONEY, 500);
     
    --  MOENY�� 100���� ������ ���� ���ϰ� �������� ������.   �� 100���� ����
    M100 := TRUNC(MONEY/100);
     
    --  MONEY�� 100���� ������ ���� ������ �������� ���Ѵ��� 
    --  �� ����� MONEY�� ��Ƴ���.
    MONEY := MOD(MONEY, 100);
    
    --  MOENY�� 50���� ������ ���� ���ϰ� �������� ������.   �� 50���� ����
    M50 := TRUNC(MONEY/50);
    
    --  MONEY�� 50���� ������ ���� ������ �������� ���Ѵ��� 
    --  �� ����� MONEY�� ��Ƴ���.
    MONEY := MOD(MONEY, 50);
    
    --  MOENY�� 10���� ������ ���� ���ϰ� �������� ������.   �� 10���� ����
    M10 := TRUNC(MONEY/10);
    
   
    --�� ��� ���
    DBMS_OUTPUT.PUT_LINE('�Է¹��� �ݾ� �Ѿ� :'|| MONEY2 || '��');
    DBMS_OUTPUT.PUT_LINE('ȭ����� : �����'|| M500 || ', ���'|| M100||
                         ', ���ʿ�' || M50 || ', �ʿ�' || M10);
END;
--> ���ε� ���� �Է� ��ȭ���� 870�Է�

--==>>
/*
�Է¹��� �ݾ� �Ѿ� :870��
ȭ����� : �����1, ���3, ���ʿ�1, �ʿ�2


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� �⺻ �ݺ���
-- LOOP ~ END LOOP;

-- 1. ������ ���ǰ� ������� ������ �ݺ��ϴ� ����.


-- 2. ���� �� ����
/*
LOOP
    -- ���๮;
    
    [NEXT WHEN ����]      --������ ���� ��� �ݺ����� ����������.

END LOOP;
*/

--�� 1 ���� 10������ �� ��� (LOOP Ȱ��)
DECLARE
    N NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(N);
        EXIT WHEN N>=10;
        N := N + 1;                   -- N++;  N+=1;
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/



--�� WHILE �ݺ���
--  WHILE LOOP ~ END LOOP;

-- 1. ���� ������ TRUE �� ���� �Ϸ��� ������ �ݺ��ϱ� ����
--   WHILE LOOP ������ ����ϰ� �ȴ�.
--   ������ �ݺ��� ���۵� �� üũ�ϰ� �Ǿ�
--   LOOP ���� ������ �� ���� ������� ���� ���� �ִ�.
--   LOOP�� ������ �� ������ FALSE �̸� �ݺ� ������ Ż���ϰ� �ȴ�.

-- 2. ���� �� ����
/*
WHILE LOOP      -- ������ ���� ��� �ݺ� ����
    -- ���๮;
END LOOP;
*/

--�� 1���� 10������ �� ��� (WHILE LOOP Ȱ��)
DECLARE
    N NUMBER;
BEGIN
    N := 0;
    WHILE N<10 LOOP 
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(N);    
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


--�� FOR �ݺ���
--  FOR LOOP ~ END LOOP;

-- 1. ������ �������� 1�� �����Ͽ�
--   ������ ������ �� �� ���� �ݺ� �����Ѵ�.

-- 2. ���� �� ����
/*
FOR ī���� in [REVERSE] ���ۼ� .. ������ LOOP
    -- ���๮;
END LOOP;
*/

--�� 1���� 10������ �� ���(FOR LOOP Ȱ��)
DECLARE
    N   NUMBER;
BEGIN
    FOR N IN 1.. 10 LOOP
        DBMS_OUTPUT.PUT_LINE(N);
    END LOOP;
END;
--==>>
/*
1
2
3
4
5
6
7
8
9
10


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/

--�� ����ڷκ��� ������ ��(������)�� �Է¹޾�
--  �ش� �ܼ��� �������� ����ϴ� PL/SQL������ �ۼ��Ѵ�.
/*
���� ��)
���ε� ���� �Է� ��ȭâ �� ���� �Է��ϼ��� : [       2 ]

2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
    :
2 * 9 = 18
*/

-- 1. LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN      NUMBER := &NUM;
    N        NUMBER;
BEGIN
    N := 1;
    LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));
        EXIT WHEN N>=9;
        N := N + 1;                  
    END LOOP;
END;
--==>>
/*
2 * 1 = 2
2 * 2 = 4
2 * 3 = 6
2 * 4 = 8
2 * 5 = 10
2 * 6 = 12
2 * 7 = 14
2 * 8 = 16
2 * 9 = 18


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


-- 2. WHILE LOOP ���� ���
ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN      NUMBER := &NUM;
    N        NUMBER;
BEGIN
    N := 0;
    WHILE N<9 LOOP 
        N := N + 1;
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));    
    END LOOP;
END;
--==>>
/*
3 * 1 = 3
3 * 2 = 6
3 * 3 = 9
3 * 4 = 12
3 * 5 = 15
3 * 6 = 18
3 * 7 = 21
3 * 8 = 24
3 * 9 = 27


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/


-- 3. FOR LOOP ���� ���
--[[���� Ǭ �ڵ� ]]-----------------------------------------------
ACCEPT dan PROMPT '���� �Է��ϼ���';

DECLARE
    dan      NUMBER := &dan;
    N        NUMBER := 1 ;
    TOTAL    NUMBER := 0;
BEGIN
    
    FOR N IN 1..9 LOOP
        TOTAL := dan * N;
        DBMS_OUTPUT.PUT_LINE(dan || ' * ' || N || ' = ' || TOTAL);    
        N := N + 1;
    END LOOP;
END;



--[[�Բ� Ǭ �ڵ� ]]-----------------------------------------------
ACCEPT NUM PROMPT '���� �Է��ϼ���';

DECLARE
    DAN      NUMBER := &NUM;
    N        NUMBER := 1 ;
BEGIN
    FOR N IN 1..9 LOOP
        DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || N || ' = ' || (DAN*N));    
    END LOOP;
END;
--==>>
/*
4 * 1 = 4
4 * 2 = 8
4 * 3 = 12
4 * 4 = 16
4 * 5 = 20
4 * 6 = 24
4 * 7 = 28
4 * 8 = 32
4 * 9 = 36


PL/SQL ���ν����� ���������� �Ϸ�Ǿ����ϴ�.
*/




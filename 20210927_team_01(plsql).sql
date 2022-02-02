SELECT USER
FROM DUAL;
--==>> TEAM_01


--�� FRUNCTION �ۼ�

-- ���������ȣ�� �Ѱ��ָ�, �����������̺��� ����� ���������ȣ�� �ش��ϴ� �����ȣ�� �������̺��� ã�� �����̸��� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_SUBJECT_NAME(V_OS_ID   VARCHAR2)
RETURN VARCHAR2
IS
    V_SUBJECT_ID    SUBJECT.SUBJECT_ID%TYPE;
    V_RESULT        SUBJECT.SUBJECT_NAME%TYPE;
BEGIN
    SELECT SUBJECT_ID INTO V_SUBJECT_ID
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OS_ID;
    
    SELECT SUBJECT_NAME INTO V_RESULT
    FROM SUBJECT
    WHERE SUBJECT_ID=V_SUBJECT_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_SUBJECT_NAME��(��) �����ϵǾ����ϴ�.


-- ����������ȣ�� �Ѱ��ָ� ������ȣ�� ã�� �����̸��� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_COURSE_NAME(V_OC_ID  VARCHAR2)
RETURN VARCHAR2
IS
    V_COURSE_ID     COURSE.COURSE_ID%TYPE;
    V_RESULT        COURSE.COURSE_NAME%TYPE;
BEGIN
    SELECT COURSE_ID INTO V_COURSE_ID
    FROM OPEN_COURSE
    WHERE OPEN_COURSE_ID = V_OC_ID;
    
    SELECT COURSE_NAME INTO V_RESULT
    FROM COURSE
    WHERE COURSE_ID = V_COURSE_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_COUORSE_NAME��(��) �����ϵǾ����ϴ�.


-- ���������ȣ�� �Ѱ��ָ�, �����������̺��� ���������ȣ�� �ش��ϴ� �����ȣ�� �������̺��� ã�� ������� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_BOOK_NAME(V_OS_ID   VARCHAR2)
RETURN VARCHAR2
IS
    V_BOOK_ID   BOOK.BOOK_ID%TYPE;
    V_RESULT    BOOK.BOOK_NAME%TYPE;
BEGIN
    SELECT BOOK_ID INTO V_BOOK_ID
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OS_ID;
    
    SELECT BOOK_NAME INTO V_RESULT
    FROM BOOK
    WHERE BOOK_ID = V_BOOK_ID;
    
    RETURN V_RESULT;
END;
--==>>Function FN_BOOK_NAME��(��) �����ϵǾ����ϴ�.


-- ���������ȣ�� �Ѱ��ָ�, �����������̺��� ���������ȣ�� �ش��ϴ� ���ǽǹ�ȣ�� ���ǽ����̺��� ã�� ���ǽ���ġ�� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_ROOM_LOC(V_OS_ID   VARCHAR2)
RETURN VARCHAR2
IS
    V_ROOM_ID   ROOM.ROOM_ID%TYPE;
    V_RESULT    ROOM.ROOM_LOCATION%TYPE;
BEGIN
    SELECT ROOM_ID INTO V_ROOM_ID
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OS_ID;
    
    SELECT ROOM_LOCATION INTO V_RESULT
    FROM ROOM
    WHERE ROOM_ID = V_ROOM_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_ROOM_LOC��(��) �����ϵǾ����ϴ�.


-- ���������ȣ�� �Ѱ��ָ�, �����������̺��� ���������, ������������ ã�� �Ⱓ(������ ~ ������)�� ��ȯ�ϴ� �Լ�
-- ������
CREATE OR REPLACE FUNCTION FN_OS_STDATE(V_OS_ID   VARCHAR2)
RETURN  DATE
IS
    V_RESULT    DATE;
BEGIN
    SELECT SUBJECT_STARTDATE INTO V_RESULT
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OS_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_OS_STDATE��(��) �����ϵǾ����ϴ�.

-- ������
CREATE OR REPLACE FUNCTION FN_OS_ENDDATE(V_OS_ID   VARCHAR2)
RETURN  DATE
IS
    V_RESULT    DATE;
BEGIN
    SELECT SUBJECT_ENDDATE INTO V_RESULT
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OS_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_OS_ENDDATE��(��) �����ϵǾ����ϴ�.


-- ������û��ȣ, ���������ȣ�� �Ѱ��ָ� �� �л��� ����� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_RANK
( V_REGI_ID   VARCHAR2
, V_OS_ID     VARCHAR2
)
RETURN NUMBER
IS
    V_RESULT    NUMBER(3);
BEGIN
    SELECT RANK() OVER(PARTITION BY OPEN_SUBJECT_ID ORDER BY (ATTENDANCE_SCORE + PRACTICAL_SCORE + WRITTEN_SCORE)) INTO V_RESULT
    FROM GRADE
    WHERE REGISTRATION_ID = V_REGI_ID 
    AND OPEN_SUBJECT_ID = V_OS_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_RANK��(��) �����ϵǾ����ϴ�.
--> �ʿ���� �����ϸ� ��~!



-- �л�ID�� �Ű������� �Ѱ��ָ� �л��̸��� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_STUDENT_NAME(V_STUDENT_ID CHAR)
RETURN VARCHAR2
IS
    V_RESULT    STUDENT.STUDENT_NAME%TYPE;
BEGIN
    SELECT STUDENT_NAME INTO V_RESULT
    FROM STUDENT
    WHERE STUDENT_ID = V_STUDENT_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_STUDENT_NAME��(��) �����ϵǾ����ϴ�.


-- ������ID�� �Ű������� �Ѱ��ָ� �����ڸ��� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_TUTOR_NAME(V_TUTOR_ID CHAR)
RETURN VARCHAR2
IS
    V_RESULT    TUTOR.TUTOR_NAME%TYPE;
BEGIN
    SELECT TUTOR_NAME INTO V_RESULT
    FROM TUTOR
    WHERE TUTOR_ID = V_TUTOR_ID;
    
    RETURN V_RESULT;
END;
--==>> Function FN_TUTOR_NAME��(��) �����ϵǾ����ϴ�.


-- ���������ȣ�� �Ű������� �Ѱ��ָ�, �������࿩�θ� ��ȯ�ϴ� �Լ�
CREATE OR REPLACE FUNCTION FN_SUBJECT_CHECK(V_OS_ID   VARCHAR2)
RETURN VARCHAR2
IS
    V_STARTDATE DATE;
    V_ENDDATE   DATE;
    V_RESULT    VARCHAR2(20);
BEGIN
    SELECT SUBJECT_STARTDATE, SUBJECT_ENDDATE INTO V_STARTDATE, V_ENDDATE
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OS_ID;

    IF (SYSDATE < V_STARTDATE)
        THEN V_RESULT := '���� ����';
    ELSIF (SYSDATE > V_ENDDATE)
        THEN V_RESULT := '���� ����';
    ELSIF (SYSDATE BETWEEN V_STARTDATE AND V_ENDDATE)
        THEN V_RESULT := '���� ��';
    END IF;
    
    RETURN V_RESULT;
END;
--==>> Function FN_SUBJECT_CHECK��(��) �����ϵǾ����ϴ�.




--------------------------------------------------------------------------------

--�� PROCEDURE �ۼ�

-- �������� ������ ���� �Է� ���ν���
CREATE OR REPLACE PROCEDURE PRC_TUTOR_INSERT
( V_ID    IN TUTOR.TUTOR_ID%TYPE
, V_NAME  IN TUTOR.TUTOR_NAME%TYPE
, V_SSN   IN TUTOR.TUTOR_SSN%TYPE
)
IS
    -- ����� ���� ���ܿ� ���� ���� ����
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- T�� �������� ������ ����ó��
    IF (V_ID NOT LIKE 'T%') 
        -- ���� �߻�
        -- USER_DEFINE_ERROR�� �߻���Ű�ڴ�.
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO TUTOR(TUTOR_ID, TUTOR_NAME, TUTOR_SSN, TUTOR_PW) VALUES (V_ID, V_NAME, V_SSN, SUBSTR(V_SSN,7)); 
    
    -- Ŀ��
    COMMIT;

     -- ����ó�� ����
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '���̵� �ٽ� �Է��ϼ���!');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_TUTOR_INSERT��(��) �����ϵǾ����ϴ�.



-- �������� �л� ���� �Է� ���ν���
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID    IN STUDENT.STUDENT_ID%TYPE
, V_NAME  IN STUDENT.STUDENT_NAME%TYPE
, V_SSN   IN STUDENT.STUDENT_SSN%TYPE
)
IS
    -- ����� ���� ���ܿ� ���� ���� ����
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- S�� �������� ������ ����ó��
    IF (V_ID NOT LIKE 'S%')
        -- ���� �߻�
        -- USER_DEFINE_ERROR�� �߻���Ű�ڴ�.
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO STUDENT(STUDENT_ID, STUDENT_NAME, STUDENT_SSN, STUDENT_PW) VALUES (V_ID, V_NAME, V_SSN, SUBSTR(V_SSN,7));         

    -- Ŀ��
    COMMIT;

     -- ����ó�� ����
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '���̵� �ٽ� �Է��ϼ���!');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_STUDENT_INSERT��(��) �����ϵǾ����ϴ�.



-- ������ ������� �� ������ ������ 100���̶�� ������ ���� ���ν���
CREATE OR REPLACE PROCEDURE PRC_ALLOT_UPDATE
( V_OSI   IN OPEN_SUBJECT.OPEN_SUBJECT_ID%TYPE
, V_AA    IN OPEN_SUBJECT.ATTENDANCE_ALLOT%TYPE
, V_PA    IN OPEN_SUBJECT.PRACTICAL_ALLOT%TYPE
, V_WA    IN OPEN_SUBJECT.WRITTEN_ALLOT%TYPE
)
IS
    USER_DEFINE_ERROR EXCEPTION;
    
BEGIN
    
    IF (V_AA + V_PA + V_WA = 100)
        THEN 
            UPDATE OPEN_SUBJECT
            SET ATTENDANCE_ALLOT = V_AA, PRACTICAL_ALLOT = V_PA, WRITTEN_ALLOT = V_WA
            WHERE OPEN_SUBJECT_ID = V_OSI;
        ELSE
            RAISE USER_DEFINE_ERROR;
    END IF;
    
    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20010, '������ ������ 100���̾�� �մϴ�!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_ALLOT_UPDATE��(��) �����ϵǾ����ϴ�.



-- ������ ����ó�� �Է� ���ν��� PRC_GRADE_UPDATE
CREATE OR REPLACE PROCEDURE PRC_GRADE_UPDATE
( V_OPEN_SUBJECT_ID     IN OPEN_SUBJECT.OPEN_SUBJECT_ID%TYPE
, V_STUDENT_ID          IN REGISTRATION.STUDENT_ID%TYPE
, V_ATTENDANCE_SCORE    IN GRADE.ATTENDANCE_SCORE%TYPE
, V_PRACTICAL_SCORE     IN GRADE.PRACTICAL_SCORE%TYPE
, V_WRITTEN_SCORE       IN GRADE.WRITTEN_SCORE%TYPE
)
IS
    V_ATTENDANCE_ALLOT  OPEN_SUBJECT.ATTENDANCE_ALLOT%TYPE;
    V_PRACTICAL_ALLOT   OPEN_SUBJECT.PRACTICAL_ALLOT%TYPE;
    V_WRITTEN_ALLOT     OPEN_SUBJECT.WRITTEN_ALLOT%TYPE;
    V_REGISTRATION_ID   REGISTRATION.REGISTRATION_ID%TYPE;
    
    -- ����� ���� ���ܿ� ���� ���� ����    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
    -- ���, �Ǳ�, �ʱ� ����
    SELECT ATTENDANCE_ALLOT, PRACTICAL_ALLOT, WRITTEN_ALLOT INTO V_ATTENDANCE_ALLOT, V_PRACTICAL_ALLOT, V_WRITTEN_ALLOT
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OPEN_SUBJECT_ID;
    
    -- ������û�ڵ�
    SELECT REGISTRATION_ID INTO V_REGISTRATION_ID
    FROM REGISTRATION
    WHERE STUDENT_ID = V_STUDENT_ID;
     
    -- �������� ������ ���ٸ�.. ���ܹ߻�
    IF (V_ATTENDANCE_ALLOT < V_ATTENDANCE_SCORE OR V_PRACTICAL_ALLOT < V_PRACTICAL_SCORE OR V_WRITTEN_ALLOT < V_WRITTEN_SCORE)
        -- ���� �߻�
        THEN RAISE USER_DEFINE_ERROR;
    ELSE       -- ���ܻ�Ȳ�� �ƴ϶�� ���� ������Ʈ
        UPDATE GRADE
        SET ATTENDANCE_SCORE = V_ATTENDANCE_SCORE, PRACTICAL_SCORE = V_PRACTICAL_SCORE, WRITTEN_SCORE = V_WRITTEN_SCORE
        WHERE OPEN_SUBJECT_ID = V_OPEN_SUBJECT_ID AND REGISTRATION_ID = V_REGISTRATION_ID;
    END IF;
    
    -- Ŀ��
    COMMIT;
    
    --���� ó�� 
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '�������� ������ �����ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;
--==>> Procedure PRC_GRADE_UPDATE��(��) �����ϵǾ����ϴ�.



-- ������(TUTOR) ���̺��� ���� �����ϵ�, �� ���� �����ϰ� �ִ� �ڽ����̺��� ���ڵ尡 ���ٸ� �����ϰ�,
-- �ִٸ� ���� �߻���Ű�� DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_TUTOR_DELETE
( V_TUTOR_ID    IN TUTOR.TUTOR_ID%TYPE
)
IS
    -- �������ɿ��� Ȯ���� ���� ���� ����
    V_NUM   NUMBER;
    -- �ֿ� ����(����� ���� ����) �߰� ����
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    SELECT COUNT(*) INTO V_NUM
    FROM OPEN_SUBJECT
    WHERE TUTOR_ID = V_TUTOR_ID;
    
    IF V_NUM != 0
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    DELETE
    FROM TUTOR
    WHERE TUTOR_ID = V_TUTOR_ID;

    COMMIT;
    
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20011, '�ڽ����̺� �������� �����ֽ��ϴ�.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_TUTOR_DELETE��(��) �����ϵǾ����ϴ�.


-- ����(COURSE) ���̺��� ���� �����ϵ�, �� ���� �����ϰ� �ִ� �ڽ����̺��� ���ڵ尡 ���ٸ� �����ϰ�,
-- �ִٸ� ���� �߻���Ű�� DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_DELETE_COURSE
(
    V_COURSE_ID IN  COURSE.COURSE_ID%TYPE
)

IS
    --�� �ֿ� ���� ����(COUNT ��)
    V_COUNT NUMBER;

BEGIN
    --�� ��������(�ڽ����̺�)���� ����Ű�� �ִ��� ��ȸ
    SELECT COUNT(*) INTO V_COUNT
    FROM OPEN_COURSE OC
    WHERE OC.COURSE_ID = V_COURSE_ID;
    
    
    --�� ���ǿ����� �θ����̺��� �⺻Ű(COURESE_ID) �������� �Ǵ�
    IF (V_COUNT = 0)
        THEN
            DELETE
            FROM COURSE
            WHERE COURSE_ID = V_COURSE_ID;
    ELSE 
            RAISE_APPLICATION_ERROR(-20011, '�ڽ����̺� �������� �����ֽ��ϴ�.');
            ROLLBACK;
    END IF;
    
END;
--==>> Procedure PRC_DELETE_COURSE��(��) �����ϵǾ����ϴ�.



-- ����(SUBJECT) ���̺��� ���� �����ϵ�, �� ���� �����ϰ� �ִ� �ڽ����̺��� ���ڵ尡 ���ٸ� �����ϰ�,
-- �ִٸ� ���� �߻���Ű�� DELETE ���ν���
CREATE OR REPLACE PROCEDURE PRC_DELETE_SUBJECT
(
    V_SUBJECT_ID IN  SUBJECT.SUBJECT_ID%TYPE
)

IS
    --�� �ֿ� ���� ����(COUNT ��)
    V_COUNT NUMBER;

BEGIN
    --�� ��������(�ڽ����̺�)���� ����Ű�� �ִ��� ��ȸ
    SELECT COUNT(*) INTO V_COUNT
    FROM OPEN_SUBJECT OS
    WHERE OS.SUBJECT_ID = V_SUBJECT_ID;
    
    
    --�� ���ǿ����� �θ����̺��� �⺻Ű(COURESE_ID) �������� �Ǵ�
    IF (V_COUNT = 0)
        THEN
            DELETE
            FROM SUBJECT
            WHERE SUBJECT_ID = V_SUBJECT_ID;
    ELSE 
            RAISE_APPLICATION_ERROR(-20011, '�ڽ����̺� �������� �����ֽ��ϴ�.');
            ROLLBACK;
    END IF;
    
END;




--------------------------------------------------------------------------------

--�� TRIGGER �ۼ�

-- ������û(REGISTRATION) ���̺� INSERT�� �Ͼ ��, 
-- ����(GRATE) ���̺� ��û�� ������ �ش��ϴ� ������ ������û��ȣ�� INSERT �Ǵ� Ʈ����
CREATE OR REPLACE TRIGGER TRG_REGIS_INSERT
                  AFTER 
                  INSERT ON REGISTRATION
                  FOR EACH ROW
DECLARE 
    V_OS_ID OPEN_SUBJECT.OPEN_SUBJECT_ID%TYPE;
    
    -- �ش������ ���ϴ� ������� ��� ���� Ŀ�� ���� ����(�� Ŀ�� ����)
    CURSOR CUR_SUBJECT_SELECT
    IS
    SELECT OPEN_SUBJECT_ID
    FROM OPEN_SUBJECT
    WHERE OPEN_COURSE_ID = :NEW.OPEN_COURSE_ID;
BEGIN
  
    IF (INSERTING)
        THEN 
            OPEN CUR_SUBJECT_SELECT;
            
            LOOP
                FETCH CUR_SUBJECT_SELECT INTO V_OS_ID;
                EXIT WHEN CUR_SUBJECT_SELECT%NOTFOUND;
                
                INSERT INTO GRADE(OPEN_SUBJECT_ID, REGISTRATION_ID) VALUES (V_OS_ID, :NEW.REGISTRATION_ID);
            END LOOP;
            
            CLOSE CUR_SUBJECT_SELECT;
    END IF;
    
END;
--==>> Trigger TRG_REGIS_INSERT��(��) �����ϵǾ����ϴ�.



-- DROPOUT ���̺� INSERT ��, �ߵ�Ż����(DROPOUT_DATE) ���� ������(SUBJECT_ENDDATE)�� ���� ���� ���ؼ��� 
-- �� �л��� ���ڵ尡 GRADE ���̺��� ������ �� �ֵ��� �ϴ� Ʈ����
CREATE OR REPLACE TRIGGER TRG_DROUT_INSERT
        AFTER
        INSERT ON DROPOUT
        FOR EACH ROW
DECLARE
BEGIN
    
    --���������Ϻ��� �ߵ��������� �۴ٸ�(�ռ��ٸ�) �������̺��� ����
    DELETE 
    FROM GRADE
    WHERE FN_OS_ENDDATE(OPEN_SUBJECT_ID) > :NEW.DROPOUT_DATE
    AND REGISTRATION_ID = :NEW.REGISTRATION_ID;

END;





-- STUDENT ���̺��� �л����� ���� ��, 
-- �� ������ �����ϰ� �ִ� �ڽ����̺��� ���ڵ带 ���� �� ������ �� ������ �����ϴ� Ʈ����
CREATE OR REPLACE TRIGGER TRG_STUDENT_DELETE
                    BEFORE
                    DELETE ON STUDENT
                    FOR EACH ROW
DECLARE
    V_RI    REGISTRATION.REGISTRATION_ID%TYPE;
    
    CURSOR CUR_REGI_ID
    IS
    SELECT REGISTRATION_ID
    FROM REGISTRATION
    WHERE STUDENT_ID = :OLD.STUDENT_ID;
BEGIN

    OPEN CUR_REGI_ID;
    
    LOOP
        FETCH CUR_REGI_ID INTO V_RI;
        EXIT WHEN CUR_REGI_ID%NOTFOUND;
        
        --���� ����
        DELETE
        FROM GRADE
        WHERE REGISTRATION_ID = V_RI;
        
        --�ߵ�Ż�� ����
        DELETE
        FROM DROPOUT
        WHERE REGISTRATION_ID = V_RI;
           
    END LOOP;
    
    CLOSE CUR_REGI_ID;
    
    --������û ����
    DELETE
    FROM REGISTRATION
    WHERE STUDENT_ID = :OLD.STUDENT_ID;
END;
--==>> Trigger TRG_STUDENT_DELETE��(��) �����ϵǾ����ϴ�.


--�����ڰ� ����ID ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_TUTOR_ID_UPDATE
                  AFTER
                  UPDATE ON TUTOR
                  FOR EACH ROW
BEGIN
    UPDATE OPEN_SUBJECT
    SET TUTOR_ID = :NEW.TUTOR_ID
    WHERE TUTOR_ID = :OLD.TUTOR_ID;
END;
--==>> Trigger TRG_TUTOR_ID_UPDATE��(��) �����ϵǾ����ϴ�.


--�����ڰ� �л�ID ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_STUDENT_ID_UPDATE
                    AFTER
                    UPDATE ON STUDENT
                    FOR EACH ROW
BEGIN
    UPDATE REGISTRATION
    SET STUDENT_ID = :NEW.STUDENT_ID
    WHERE STUDENT_ID = :OLD.STUDENT_ID;
END;
--==>> Trigger TRG_STUDENT_ID_UPDATE��(��) �����ϵǾ����ϴ�.


--�����ڰ� ����ID ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_COURSE_ID_UPDATE
                AFTER
                UPDATE ON COURSE
                FOR EACH ROW
BEGIN
    UPDATE OPEN_COURSE
    SET COURSE_ID = :NEW.COURSE_ID
    WHERE  COURSE_ID = :OLD.COURSE_ID;
END;
--==>> Trigger TRG_COURSE_ID_UPDATE��(��) �����ϵǾ����ϴ�.


--�����ڰ� ����ID ���� Ʈ����
CREATE OR REPLACE TRIGGER TRG_SUBJECT_ID_UPDATE
                AFTER
                UPDATE ON SUBJECT
                FOR EACH ROW
BEGIN
    UPDATE OPEN_SUBJECT
    SET SUBJECT_ID = :NEW.SUBJECT_ID
    WHERE SUBJECT_ID = :OLD.SUBJECT_ID;
END;
--==>> Trigger TRG_SUBJECT_ID_UPDATE��(��) �����ϵǾ����ϴ�.













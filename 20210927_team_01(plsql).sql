SELECT USER
FROM DUAL;
--==>> TEAM_01


--○ FRUNCTION 작성

-- 개설과목번호를 넘겨주면, 개설과목테이블에서 념겨준 개설과목번호에 해당하는 과목번호를 과목테이블에서 찾아 과목이름을 반환하는 함수
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
--==>> Function FN_SUBJECT_NAME이(가) 컴파일되었습니다.


-- 개설과정번호를 넘겨주면 과정번호를 찾아 과정이름을 반환하는 함수
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
--==>> Function FN_COUORSE_NAME이(가) 컴파일되었습니다.


-- 개설과목번호를 넘겨주면, 개설과목테이블에서 개설과목번호에 해당하는 교재번호를 교재테이블에서 찾아 교재명을 반환하는 함수
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
--==>>Function FN_BOOK_NAME이(가) 컴파일되었습니다.


-- 개설과목번호를 넘겨주면, 개설과목테이블에서 개설과목번호에 해당하는 강의실번호를 강의실테이블에서 찾아 강의실위치을 반환하는 함수
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
--==>> Function FN_ROOM_LOC이(가) 컴파일되었습니다.


-- 개설과목번호를 넘겨주면, 개설과목테이블에서 과목시작일, 과목종료일을 찾아 기간(시작일 ~ 종료일)을 반환하는 함수
-- 시작일
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
--==>> Function FN_OS_STDATE이(가) 컴파일되었습니다.

-- 종료일
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
--==>> Function FN_OS_ENDDATE이(가) 컴파일되었습니다.


-- 수강신청번호, 개설과목번호를 넘겨주면 그 학생의 등수를 반환하는 함수
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
--==>> Function FN_RANK이(가) 컴파일되었습니다.
--> 필요없음 삭제하면 됨~!



-- 학생ID를 매개변수로 넘겨주면 학생이름을 반환하는 함수
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
--==>> Function FN_STUDENT_NAME이(가) 컴파일되었습니다.


-- 교수자ID를 매개변수로 넘겨주면 교수자명을 반환하는 함수
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
--==>> Function FN_TUTOR_NAME이(가) 컴파일되었습니다.


-- 개설과목번호를 매개변수로 넘겨주면, 강의진행여부를 반환하는 함수
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
        THEN V_RESULT := '강의 예정';
    ELSIF (SYSDATE > V_ENDDATE)
        THEN V_RESULT := '강의 종료';
    ELSIF (SYSDATE BETWEEN V_STARTDATE AND V_ENDDATE)
        THEN V_RESULT := '강의 중';
    END IF;
    
    RETURN V_RESULT;
END;
--==>> Function FN_SUBJECT_CHECK이(가) 컴파일되었습니다.




--------------------------------------------------------------------------------

--○ PROCEDURE 작성

-- 관리자의 교수자 정보 입력 프로시저
CREATE OR REPLACE PROCEDURE PRC_TUTOR_INSERT
( V_ID    IN TUTOR.TUTOR_ID%TYPE
, V_NAME  IN TUTOR.TUTOR_NAME%TYPE
, V_SSN   IN TUTOR.TUTOR_SSN%TYPE
)
IS
    -- 사용자 정의 예외에 대한 변수 선언
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- T로 시작하지 않으면 예외처리
    IF (V_ID NOT LIKE 'T%') 
        -- 예외 발생
        -- USER_DEFINE_ERROR를 발생시키겠다.
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO TUTOR(TUTOR_ID, TUTOR_NAME, TUTOR_SSN, TUTOR_PW) VALUES (V_ID, V_NAME, V_SSN, SUBSTR(V_SSN,7)); 
    
    -- 커밋
    COMMIT;

     -- 예외처리 구문
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '아이디를 다시 입력하세요!');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_TUTOR_INSERT이(가) 컴파일되었습니다.



-- 관리자의 학생 정보 입력 프로시저
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_ID    IN STUDENT.STUDENT_ID%TYPE
, V_NAME  IN STUDENT.STUDENT_NAME%TYPE
, V_SSN   IN STUDENT.STUDENT_SSN%TYPE
)
IS
    -- 사용자 정의 예외에 대한 변수 선언
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    -- S로 시작하지 않으면 예외처리
    IF (V_ID NOT LIKE 'S%')
        -- 예외 발생
        -- USER_DEFINE_ERROR를 발생시키겠다.
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    INSERT INTO STUDENT(STUDENT_ID, STUDENT_NAME, STUDENT_SSN, STUDENT_PW) VALUES (V_ID, V_NAME, V_SSN, SUBSTR(V_SSN,7));         

    -- 커밋
    COMMIT;

     -- 예외처리 구문
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20008, '아이디를 다시 입력하세요!');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_STUDENT_INSERT이(가) 컴파일되었습니다.



-- 교수가 배점등록 시 배점의 총합은 100점이라는 조건을 가진 프로시저
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
            THEN RAISE_APPLICATION_ERROR(-20010, '배점의 총합은 100점이어야 합니다!');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_ALLOT_UPDATE이(가) 컴파일되었습니다.



-- 교수자 성적처리 입력 프로시저 PRC_GRADE_UPDATE
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
    
    -- 사용자 정의 예외에 대한 변수 선언    
    USER_DEFINE_ERROR EXCEPTION;
BEGIN
    
    -- 출결, 실기, 필기 배점
    SELECT ATTENDANCE_ALLOT, PRACTICAL_ALLOT, WRITTEN_ALLOT INTO V_ATTENDANCE_ALLOT, V_PRACTICAL_ALLOT, V_WRITTEN_ALLOT
    FROM OPEN_SUBJECT
    WHERE OPEN_SUBJECT_ID = V_OPEN_SUBJECT_ID;
    
    -- 수강신청코드
    SELECT REGISTRATION_ID INTO V_REGISTRATION_ID
    FROM REGISTRATION
    WHERE STUDENT_ID = V_STUDENT_ID;
     
    -- 배점보다 점수가 높다면.. 예외발생
    IF (V_ATTENDANCE_ALLOT < V_ATTENDANCE_SCORE OR V_PRACTICAL_ALLOT < V_PRACTICAL_SCORE OR V_WRITTEN_ALLOT < V_WRITTEN_SCORE)
        -- 예외 발생
        THEN RAISE USER_DEFINE_ERROR;
    ELSE       -- 예외상황이 아니라면 성적 업데이트
        UPDATE GRADE
        SET ATTENDANCE_SCORE = V_ATTENDANCE_SCORE, PRACTICAL_SCORE = V_PRACTICAL_SCORE, WRITTEN_SCORE = V_WRITTEN_SCORE
        WHERE OPEN_SUBJECT_ID = V_OPEN_SUBJECT_ID AND REGISTRATION_ID = V_REGISTRATION_ID;
    END IF;
    
    -- 커밋
    COMMIT;
    
    --예외 처리 
    EXCEPTION 
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20009, '배점보다 점수가 높습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;    
END;
--==>> Procedure PRC_GRADE_UPDATE이(가) 컴파일되었습니다.



-- 교수자(TUTOR) 테이블의 정보 삭제하되, 그 값을 참조하고 있는 자식테이블의 레코드가 없다면 삭제하고,
-- 있다면 에러 발생시키는 DELETE 프로시저
CREATE OR REPLACE PROCEDURE PRC_TUTOR_DELETE
( V_TUTOR_ID    IN TUTOR.TUTOR_ID%TYPE
)
IS
    -- 삭제가능여부 확인을 위한 변수 선언
    V_NUM   NUMBER;
    -- 주요 변수(사용자 정의 예외) 추가 선언
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
            THEN RAISE_APPLICATION_ERROR(-20011, '자식테이블에 참조값이 남아있습니다.');
                 ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_TUTOR_DELETE이(가) 컴파일되었습니다.


-- 과정(COURSE) 테이블의 정보 삭제하되, 그 값을 참조하고 있는 자식테이블의 레코드가 없다면 삭제하고,
-- 있다면 에러 발생시키는 DELETE 프로시저
CREATE OR REPLACE PROCEDURE PRC_DELETE_COURSE
(
    V_COURSE_ID IN  COURSE.COURSE_ID%TYPE
)

IS
    --② 주요 변수 선언(COUNT 값)
    V_COUNT NUMBER;

BEGIN
    --① 개설과정(자식테이블)에서 참조키가 있는지 조회
    SELECT COUNT(*) INTO V_COUNT
    FROM OPEN_COURSE OC
    WHERE OC.COURSE_ID = V_COURSE_ID;
    
    
    --② 조건에따라 부모테이블의 기본키(COURESE_ID) 삭제여부 판단
    IF (V_COUNT = 0)
        THEN
            DELETE
            FROM COURSE
            WHERE COURSE_ID = V_COURSE_ID;
    ELSE 
            RAISE_APPLICATION_ERROR(-20011, '자식테이블에 참조값이 남아있습니다.');
            ROLLBACK;
    END IF;
    
END;
--==>> Procedure PRC_DELETE_COURSE이(가) 컴파일되었습니다.



-- 과목(SUBJECT) 테이블의 정보 삭제하되, 그 값을 참조하고 있는 자식테이블의 레코드가 없다면 삭제하고,
-- 있다면 에러 발생시키는 DELETE 프로시저
CREATE OR REPLACE PROCEDURE PRC_DELETE_SUBJECT
(
    V_SUBJECT_ID IN  SUBJECT.SUBJECT_ID%TYPE
)

IS
    --② 주요 변수 선언(COUNT 값)
    V_COUNT NUMBER;

BEGIN
    --① 개설과정(자식테이블)에서 참조키가 있는지 조회
    SELECT COUNT(*) INTO V_COUNT
    FROM OPEN_SUBJECT OS
    WHERE OS.SUBJECT_ID = V_SUBJECT_ID;
    
    
    --② 조건에따라 부모테이블의 기본키(COURESE_ID) 삭제여부 판단
    IF (V_COUNT = 0)
        THEN
            DELETE
            FROM SUBJECT
            WHERE SUBJECT_ID = V_SUBJECT_ID;
    ELSE 
            RAISE_APPLICATION_ERROR(-20011, '자식테이블에 참조값이 남아있습니다.');
            ROLLBACK;
    END IF;
    
END;




--------------------------------------------------------------------------------

--○ TRIGGER 작성

-- 수강신청(REGISTRATION) 테이블에 INSERT가 일어날 시, 
-- 성적(GRATE) 테이블에 신청한 과정에 해당하는 과목들과 수강신청번호가 INSERT 되는 트리거
CREATE OR REPLACE TRIGGER TRG_REGIS_INSERT
                  AFTER 
                  INSERT ON REGISTRATION
                  FOR EACH ROW
DECLARE 
    V_OS_ID OPEN_SUBJECT.OPEN_SUBJECT_ID%TYPE;
    
    -- 해당과정에 속하는 과목들을 담기 위한 커서 변수 선언(→ 커서 정의)
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
--==>> Trigger TRG_REGIS_INSERT이(가) 컴파일되었습니다.



-- DROPOUT 테이블에 INSERT 시, 중도탈락일(DROPOUT_DATE) 보다 종료일(SUBJECT_ENDDATE)이 늦은 과목에 대해서는 
-- 그 학생의 레코드가 GRADE 테이블에서 삭제될 수 있도록 하는 트리거
CREATE OR REPLACE TRIGGER TRG_DROUT_INSERT
        AFTER
        INSERT ON DROPOUT
        FOR EACH ROW
DECLARE
BEGIN
    
    --수강종료일보다 중도포기일이 작다면(앞선다면) 성적테이블에서 삭제
    DELETE 
    FROM GRADE
    WHERE FN_OS_ENDDATE(OPEN_SUBJECT_ID) > :NEW.DROPOUT_DATE
    AND REGISTRATION_ID = :NEW.REGISTRATION_ID;

END;





-- STUDENT 테이블에서 학생정보 삭제 시, 
-- 그 정보를 참조하고 있는 자식테이블의 레코드를 먼저 다 삭제한 후 삭제를 진행하는 트리거
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
        
        --성적 삭제
        DELETE
        FROM GRADE
        WHERE REGISTRATION_ID = V_RI;
        
        --중도탈락 삭제
        DELETE
        FROM DROPOUT
        WHERE REGISTRATION_ID = V_RI;
           
    END LOOP;
    
    CLOSE CUR_REGI_ID;
    
    --수강신청 삭제
    DELETE
    FROM REGISTRATION
    WHERE STUDENT_ID = :OLD.STUDENT_ID;
END;
--==>> Trigger TRG_STUDENT_DELETE이(가) 컴파일되었습니다.


--관리자가 교수ID 변경 트리거
CREATE OR REPLACE TRIGGER TRG_TUTOR_ID_UPDATE
                  AFTER
                  UPDATE ON TUTOR
                  FOR EACH ROW
BEGIN
    UPDATE OPEN_SUBJECT
    SET TUTOR_ID = :NEW.TUTOR_ID
    WHERE TUTOR_ID = :OLD.TUTOR_ID;
END;
--==>> Trigger TRG_TUTOR_ID_UPDATE이(가) 컴파일되었습니다.


--관리자가 학생ID 변경 트리거
CREATE OR REPLACE TRIGGER TRG_STUDENT_ID_UPDATE
                    AFTER
                    UPDATE ON STUDENT
                    FOR EACH ROW
BEGIN
    UPDATE REGISTRATION
    SET STUDENT_ID = :NEW.STUDENT_ID
    WHERE STUDENT_ID = :OLD.STUDENT_ID;
END;
--==>> Trigger TRG_STUDENT_ID_UPDATE이(가) 컴파일되었습니다.


--관리자가 과정ID 변경 트리거
CREATE OR REPLACE TRIGGER TRG_COURSE_ID_UPDATE
                AFTER
                UPDATE ON COURSE
                FOR EACH ROW
BEGIN
    UPDATE OPEN_COURSE
    SET COURSE_ID = :NEW.COURSE_ID
    WHERE  COURSE_ID = :OLD.COURSE_ID;
END;
--==>> Trigger TRG_COURSE_ID_UPDATE이(가) 컴파일되었습니다.


--관리자가 과목ID 변경 트리거
CREATE OR REPLACE TRIGGER TRG_SUBJECT_ID_UPDATE
                AFTER
                UPDATE ON SUBJECT
                FOR EACH ROW
BEGIN
    UPDATE OPEN_SUBJECT
    SET SUBJECT_ID = :NEW.SUBJECT_ID
    WHERE SUBJECT_ID = :OLD.SUBJECT_ID;
END;
--==>> Trigger TRG_SUBJECT_ID_UPDATE이(가) 컴파일되었습니다.













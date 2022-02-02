SELECT USER
FROM DUAL;
--==>> SCOTT


--■■■ 암호화 복호화 확인 실습 ■■■--

--○ 테이블 생성
CREATE TABLE TBL_EXAM
( ID    NUMBER
, PW    VARCHAR2(20)
);
--==>> Table TBL_EXAM이(가) 생성되었습니다.


--○ 데이터 입력(암호화)
--INSERT INTO TBL_EXAM(ID, PW) VALUES(1, 'java006$');
INSERT INTO TBL_EXAM(ID, PW) VALUES(1, CRYPTPACK.ENCRYPT('java006$', '1234'));
--==>> 1 행 이(가) 삽입되었습니다.

--○ 데이터 조회
SELECT *
FROM TBL_EXAM;
--==>> 1	j??s


--○ 데이터 조회
SELECT ID, CRYPTPACK.DECRYPT(PW,'1111')
FROM TBL_EXAM;
--==>> 1	???


SELECT ID, CRYPTPACK.DECRYPT(PW,'2222')
FROM TBL_EXAM;
--==>> 1	??D?

SELECT ID, CRYPTPACK.DECRYPT(PW,'1234')
FROM TBL_EXAM;
--==>> 1	java006$
--> 암호화 했던 1234로 복호화 해야 제대로 됨.





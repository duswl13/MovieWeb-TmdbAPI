DROP TABLE USERS;

CREATE TABLE USERS(
USER_ID VARCHAR2(40) PRIMARY KEY,/*회원 아이디*/
USER_PASS VARCHAR2(40),/*회원 비밀번호*/
USER_EMAIL VARCHAR2(30),/*회원 이메일*/
USER_JOIN_DATE DATE,/*가입날짜*/
USER_PHONE VARCHAR2(30),/*회원 핸드폰번호*/
USER_TYPE CHAR(1) CHECK (USER_TYPE IN('y', 'n')) /*관리자 여부 */
);


/* 컬럼명 바꾸는거
 ALTER TABLE USERS MODIFY(USER_TYPE CHAR(1) CHECK (USER_TYPE IN('y', 'n')));
*/

INSERT INTO USERS VALUES('admin1','1234','admin1@voshu.com',sysdate,'','y');
INSERT INTO USERS VALUES('admin2','1234','admin2@voshu.com',sysdate,null,'y');
INSERT INTO USERS VALUES('admin3','1234','admin3@voshu.com',sysdate,null,'y');
INSERT INTO USERS VALUES('admin4','1234','admin4@voshu.com',sysdate,null,'y');

INSERT INTO USERS VALUES('duswl13','1234','plain64@naver.com',sysdate,null,'n');
INSERT INTO USERS VALUES('sonyeonsoo','1234','sonyeonsoo@naver.com',sysdate,null,'n');
INSERT INTO USERS VALUES('jiyeon','1234','jiyeon@naver.com',sysdate,null,'n');

select* from users;



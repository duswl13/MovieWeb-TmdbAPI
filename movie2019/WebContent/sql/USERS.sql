DROP TABLE USERS;

CREATE TABLE USERS(
USER_ID VARCHAR2(40) PRIMARY KEY,
USER_PASS VARCHAR2(40),
USER_EMAIL VARCHAR2(30),
USER_JOIN_DATE DATE,
USER_PHONE VARCHAR2(30),
USER_TYPE CHAR(1) CHECK (USER_TYPE IN('y', 'n')) 
);


/* 
 ALTER TABLE USERS MODIFY(USER_TYPE CHAR(1) CHECK (USER_TYPE IN('y', 'n')));
*/

INSERT INTO USERS VALUES('admin1','1234','admin1@voshu.com',sysdate,'','y');
INSERT INTO USERS VALUES('admin2','1234','admin2@voshu.com',sysdate,null,'y');
INSERT INTO USERS VALUES('admin3','1234','admin3@voshu.com',sysdate,null,'y');
INSERT INTO USERS VALUES('admin4','1234','admin4@voshu.com',sysdate,null,'y');



INSERT INTO USERS VALUES('kim1234','1234','asdjkl13@naver.com',sysdate,null,'n');
INSERT INTO USERS VALUES('plain64','1234','asdjkl13@naver.com',sysdate,null,'n');
INSERT INTO USERS VALUES('asdjkl13','1234','asdjkl13@naver.com',sysdate,null,'n');
INSERT INTO USERS VALUES('duswl13','1234','plain64@naver.com',sysdate,null,'n');
INSERT INTO USERS VALUES('sonyeonsoo','1234','sonyeonsoo@naver.com',sysdate,null,'n');
INSERT INTO USERS VALUES('jiyeon','1234','jiyeon@naver.com',sysdate,null,'n');

select* from users;



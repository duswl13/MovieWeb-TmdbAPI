DROP TABLE USER_GENRES;

CREATE TABLE USER_GENRES(
USER_GENRES_NUMBER NUMBER PRIMARY KEY,
GENRES_ID NUMBER REFERENCES GENRES (GENRES_ID),
USER_ID VARCHAR2(40) REFERENCES USERS (USER_ID)
);


INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
16,'duswl13');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
14,'duswl13');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
10749,'duswl13');


INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
10749,'sonyeonsoo');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
36,'sonyeonsoo');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
10402,'sonyeonsoo');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
35,'sonyeonsoo');


INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
28,'jiyeon');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
35,'jiyeon');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
10751,'jiyeon');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
27,'jiyeon');
INSERT INTO USER_GENRES VALUES((select nvl(max(USER_GENRES_NUMBER),0) from USER_GENRES)+1,
9648,'jiyeon');


DROP TABLE review;

CREATE TABLE review(
REVIEW_NUMBER NUMBER UNIQUE,
MOVIE_ID NUMBER REFERENCES MOVIE (MOVIE_ID),
USER_ID VARCHAR2(40) REFERENCES USERS (USER_ID),
REVIEW_TITLE VARCHAR2(100),
REVIEW_CONTENT VARCHAR2(1000),
REVIEW_DATE DATE,
CONSTRAINT review_primarykey PRIMARY KEY (MOVIE_ID, USER_ID)
);

INSERT INTO review VALUES ((select nvl(max(REVIEW_NUMBER),0) from review)+1,
330457,'duswl13','생각보단 별로','너무 기대하고 본것같아요ㅠㅠ 전작보다 별로임ㅠㅠㅠ',sysdate);


INSERT INTO review VALUES ((select nvl(max(REVIEW_NUMBER),0) from review)+1,
330457,'sonyeonsoo','재밌었어욯ㅎㅎㅎㅎㅎ','너무재밌어영 ㅎㅎㅎㅎ',sysdate);


INSERT INTO review VALUES ((select nvl(max(REVIEW_NUMBER),0) from review)+1,
330457,'jiyeon','음...','음....',sysdate);

/* 별점 또는 얼굴 평가정보가 있는 경우에만 리뷰 남길수있게 하기*/


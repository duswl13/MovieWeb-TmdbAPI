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


SELECT * FROM review;
INSERT INTO review VALUES ((select nvl(max(REVIEW_NUMBER),0) from review)+1,
330457,'duswl13','�������� ����','�ʹ� ����ϰ� ���Ͱ��ƿ�Ф� ���ۺ��� �����ӤФФ�',sysdate);


INSERT INTO review VALUES ((select nvl(max(REVIEW_NUMBER),0) from review)+1,
330457,'sonyeonsoo','��վ���G����������','�ʹ���վ ��������',sysdate);


INSERT INTO review VALUES ((select nvl(max(REVIEW_NUMBER),0) from review)+1,
330457,'jiyeon','��...','��....',sysdate);

/* ���� �Ǵ� �� �������� �ִ� ��쿡�� ���� ������ְ� �ϱ�*/
SELECT * FROM
(SELECT REVIEW_NUMBER, review.MOVIE_ID,movie.MOVIE_NAME, movie.movie_poster,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE, (SELECT rating_star_value 
					FROM RATING_STAR 
					WHERE USER_ID = review.user_id 
					and MOVIE_ID = review.movie_id) star,
					(SELECT rating_face_value 
					FROM RATING_FACE 
					WHERE USER_ID = review.user_id 
					and MOVIE_ID = review.movie_id) face
	FROM review,movie 
	where review.movie_id = movie.movie_id  
	order by REVIEW_DATE DESC) ;
	

	SELECT * FROM REVIEW WHERE USER_ID='duswl13';
	
	
	
	
	


	SELECT * FROM(
	SELECT ROWNUM R, REVIEW_NUMBER, id,name, poster ,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE,
	star, face, likes,mylike FROM
(SELECT REVIEW_NUMBER, review.MOVIE_ID id ,movie.MOVIE_NAME name, movie.movie_poster poster,USER_ID,REVIEW_TITLE,REVIEW_CONTENT,REVIEW_DATE, 
					(SELECT rating_star_value 
					FROM RATING_STAR 
					WHERE USER_ID = review.user_id 
					and MOVIE_ID = review.movie_id) star,
					
					(SELECT rating_face_value 
					FROM RATING_FACE 
					WHERE USER_ID = review.user_id 
					and MOVIE_ID = review.movie_id) face,
					
					(SELECT count(*) 
					FROM review_like 
					WHERE USER_ID = review.user_id 
					and MOVIE_ID = review.movie_id) likes,
					
						
					(SELECT count(*) 
					FROM review_like 
					WHERE USER_ID = review.user_id 
					and MOVIE_ID = review.movie_id and like_id='duswl13') mylike
	FROM review,movie 
	where review.movie_id = movie.movie_id  and review.user_id='duswl13'
	order by REVIEW_DATE DESC));
	
	

DROP TABLE FAQ;

CREATE TABLE FAQ(
FAQ_NUMBER NUMBER PRIMARY KEY,
FAQ_NAME VARCHAR2(40) REFERENCES  USERS (USER_ID) on delete cascade,
FAQ_SUBJECT VARCHAR2(100),
FAQ_CONTENT VARCHAR2(300),
FAQ_DATE DATE
);	


INSERT INTO FAQ VALUES((select nvl(max(FAQ_NUMBER),0) from FAQ)+1,
'admin1','¿ÃΩŒ¿Ã∆Æ π∫∞°ø©?','∫∏Ω¥¿‘¥œ¥Ÿ.',sysdate
);

INSERT INTO FAQ VALUES((select nvl(max(FAQ_NUMBER),0) from FAQ)+1,
'admin1','¿ÃΩŒ¿Ã∆Æ π∫∞°ø©?1','∫∏Ω¥¿‘¥œ¥Ÿ.1',sysdate
);

INSERT INTO FAQ VALUES((select nvl(max(FAQ_NUMBER),0) from FAQ)+1,
'admin2','¿ÃΩŒ¿Ã∆Æ π∫∞°ø©?2','∫∏Ω¥¿‘¥œ¥Ÿ.2',sysdate
);
INSERT INTO FAQ VALUES((select nvl(max(FAQ_NUMBER),0) from FAQ)+1,
'admin3','¿ÃΩŒ¿Ã∆Æ π∫∞°ø©?3','∫∏Ω¥¿‘¥œ¥Ÿ.3',sysdate
);

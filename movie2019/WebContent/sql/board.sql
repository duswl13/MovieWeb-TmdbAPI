
DROP TABLE MBOARD;
CREATE TABLE MBOARD(
	BOARD_NUM NUMBER(5), --�� ��ȣ
	BOARD_NAME VARCHAR2(30), --�ۼ���
	BOARD_PASS VARCHAR2(30), --��й�ȣ
	BOARD_SUBJECT VARCHAR2(300), --����
	BOARD_CONTENT VARCHAR2(4000), --����
	BOARD_FILE VARCHAR2(50),--÷������
	BOARD_RE_REF NUMBER(5), --�亯 �� �ۼ� �� �����Ǵ� �� ��ȣ
	BOARD_RE_LEV NUMBER(5), --�亯 ���� ����
	BOARD_RE_SEQ NUMBER(5), --�亯 ���� ����
	BOARD_READCOUNT NUMBER(5), --���� ��ȸ��
	BOARD_DATE DATE, --���� �ۼ� ��¥
	PRIMARY KEY(BOARD_NUM)
);

SELECT * FROM MBOARD;

INSERT INTO MBOARD (BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, 
    BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE) 
 VALUES((select nvl(max(BOARD_NUM),0)+1 from mboard), 'jiyeon', '1234', '글을 써볼까', '제발', NULL,
        (select nvl(max(BOARD_NUM),0)+1 from mboard), 0, 0, 0, sysdate);
        
        
INSERT INTO MBOARD (BOARD_NUM, BOARD_NAME, BOARD_PASS, BOARD_SUBJECT, BOARD_CONTENT, 
    BOARD_FILE, BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_READCOUNT, BOARD_DATE) 
 VALUES((select nvl(max(BOARD_NUM),0)+1 from mboard), 'jiyeon', '1234', '파일도 올려볼까', '과연', 
         NULL,
        (select nvl(max(BOARD_NUM),0)+1 from mboard), 0, 0, 0, sysdate);
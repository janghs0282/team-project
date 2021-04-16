DROP TABLE MEMBER
CASCADE CONSTRAINTS;

DROP TABLE BBS
CASCADE CONSTRAINTS;


 SELECT B.MEMBERID, B.SEQ, REF, STEP, DEPTH,
	 TITLE, CONTENT, WDATE, DEL, READCOUNT, LIKECOUNT,
	IMG, DIVISION, BBSTYPE, M.PROFILEIMG, T.PRICE10
	 FROM (SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM,
				MEMBERID, SEQ, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT, 
				 LIKECOUNT, IMG, DIVISION, BBSTYPE 
				FROM BBS 
				WHERE BBSTYPE=3
		 ORDER BY REF DESC, STEP ASC ) B, MEMBER M, TRAINER T
		 WHERE M.MEMBERID = B.MEMBERID AND B.SEQ = T.SEQ 
		 AND DEL=0 AND RNUM >= 1 AND RNUM <= 10
		 ORDER BY B.SEQ DESC


		 
SELECT *
FROM BBS
WHERE BBSTYPE = 0
		 
		 
		 
		 
		 SELECT B.MEMBERID, B.SEQ, REF, STEP, DEPTH, 
		TITLE, CONTENT, WDATE, DEL, READCOUNT, LIKECOUNT, 
		IMG, DIVISION, BBSTYPE, M.PROFILEIMG, T.PRICE10  
		 FROM 
		
		(SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM,
				 MEMBERID, SEQ, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT, 
				 LIKECOUNT, IMG, DIVISION, BBSTYPE 
				FROM BBS 
				WHERE BBSTYPE=3 
				ORDER BY REF DESC, STEP ASC) 
				WHERE DEL=0 AND RNUM >= 1 AND RNUM <= 10		 
		 
		 
		 
		 
		 
		 
--안됨 
UPDATE
	(
	SELECT M.MEMTYPE, B.BBSTYPE
	FROM MEMBER M , BBS B
	WHERE M.MEMBERID = B.MEMBERID
	AND SEQ = 218
	)
SET MEMTYPE = 5, BBSTYPE = 3

--안됨	 
UPDATE BBS		 
SET BBSTYPE = 3,
	(SELECT M.MEMTYPE
	 FROM MEMBER M, BBS B
	 WHERE M.MEMBERID = B.MEMBERID
	 AND B.SEQ = 218
	) = 5
WHERE SEQ = 218
	

--안됨
UPDATE MEMBER M, BBS B
SET M.MEMTYPE = 5,
	B.BBSTYPE = 3
WHERE M.MEMBERID = B.MEMBERID
	AND B.SEQ = 218


--트레이너 5로 변환
UPDATE MEMBER
SET MEMTYPE = 5
WHERE MEMBERID = (
	SELECT MEMBERID
	FROM BBS
	WHERE SEQ = 218
	)
	
	
SELECT *
FROM BBS
WHERE BBSTYPE = 3
	
	
	
	
UPDATE MEMBER
SET MEMLEVEL = 1
WHERE NAME = '홍길동'
	
	
UPDATE MEMBER
SET MEMLEVEL = 101
WHERE NAME = 'ccc';
		 
		 
SELECT BBSTYPE
FROM BBS
WHERE SEQ=121
		 
		 
SELECT *
FROM MEMBER

		 
UPDATE MEMBER
SET MEMLEVEL = 100
WHERE MEMTYPE = 5
		 


SELECT *
FROM BBS
WHERE BBSTYPE = 0
ORDER BY WDATE DESC

SELECT *
FROM TRAINER;


UPDATE BBS
SET BBSTYPE = 3
WHERE SEQ = ?


DELETE FROM BBS
WHERE SEQ = 232


UPDATE MEMBER
SET MEMLEVEL = 101
WHERE MEMTYPE = 2





-- 작성자의 프로필 가져오기
SELECT M.MEMBERID, EMAIL, NAME, PHONENUM, GENDER, TRAINERID, PROFILEIMG, AGE, 
		HEIGHT, GWEIGHT, MEMLEVEL, MEMTYPE, GYMNAME, TRAINERCONTENT, WEIGHT, COUNT 
		FROM MEMBER M, BBS B 
		WHERE M.MEMBERID = B.MEMBERID 
		AND B.SEQ = 202








INSERT INTO MEMBER(
MEMBERID, PWD, EMAIL, NAME, PHONENUM, GENDER,
TRAINERID, PROFILEIMG, AGE, HEIGHT, GWEIGHT, MEMLEVEL,
MEMTYPE, GYMNAME, TRAINERCONTENT, WEIGHT
)
VALUES(
'aaa', 'aaa', 'a@a.com', '홍길동', 01012345678, 'Male',
'ccc', NULL, 23, 170, 65, 30, 
0, NULL, NULL, 70);




INSERT INTO MEMBER
VALUES ('admin', 'admin', 'admin@gmail.com', 'admin','01012345678' , 'A', NULL, 
		NULL, 0, 0, 0, 0, 2, NULL, NULL, 0, 0)

		
INSERT INTO BBS
VALUES ('admin', SEQ_BBS.NEXTVAL, (SELECT NVL(MAX(REF), 0)+1 FROM BBS), 0, 0, '테스트입니다', '테스틋테스트', SYSDATE, 0, 0, 0, NULL, NULL, 4)

		
		






INSERT INTO BBS
(SEQ, MEMBERID, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT, LIKECOUNT, IMG, DIVISION, BBSTYPE) 
VALUES( SEQ_BBS.NEXTVAL, ?, (SELECT NVL(MAX(REF), 0)+1 FROM BBS), 0, 0, ?, ?, SYSDATE, 0, 0, 0, ?, ?, ?)



INSERT INTO TRAINER
(SEQ, PRICE1, PRICE10, PRICE30, GYMLOC, INSTALINK, FACELINK)
VALUES((
	SELECT SEQ
	FROM (SELECT * FROM BBS ORDER BY WDATE DESC)
	WHERE ROWNUM = 1 AND MEMBERID = 'admin')
,?, ?, ?, ?, ?, ?)






CREATE TABLE "HR"."MEMBER" (	
	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PWD" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EMAIL" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PHONENUM" NUMBER(20,0) NOT NULL ENABLE, 
	"GENDER" VARCHAR2(5 BYTE) NOT NULL ENABLE, 
	"TRAINERID" VARCHAR2(20 BYTE), 
	"PROFILEIMG" VARCHAR2(50 BYTE), 
	"AGE" NUMBER(5,0), 
	"HEIGHT" NUMBER(5,0), 
	"GWEIGHT" NUMBER(5,0), 
	"MEMLEVEL" NUMBER(30,0) NOT NULL ENABLE, 
	"MEMTYPE" NUMBER(3,0) NOT NULL ENABLE, 
	"GYMNAME" VARCHAR2(100 BYTE), 
	"TRAINERCONTENT" VARCHAR2(400 BYTE), 
	"WEIGHT" NUMBER(5,0), 
	 CONSTRAINT "MEMBER_PK" PRIMARY KEY ("MEMBERID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


  
  
  
  
------------------------------------------------------------------------------------------------------------------------------------

 CREATE TABLE "HR"."BBS" (	
    "MEMBERID" VARCHAR2(20 BYTE), 
	"SEQ" NUMBER(8,0) NOT NULL ENABLE, 
	"REF" NUMBER(8,0) NOT NULL ENABLE, 
	"STEP" NUMBER(8,0) NOT NULL ENABLE, 
	"DEPTH" NUMBER(8,0) NOT NULL ENABLE, 
	"TITLE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"WDATE" DATE NOT NULL ENABLE, 
	"DEL" NUMBER(1,0) NOT NULL ENABLE, 
	"READCOUNT" NUMBER(8,0) NOT NULL ENABLE, 
	"LIKECOUNT" NUMBER(8,0) NOT NULL ENABLE, 
	"IMG" VARCHAR2(20 BYTE), 
	"DIVISION" VARCHAR2(20 BYTE),
	"BBSTYPE" NUMBER(2,0) NOT NULL ENABLE,
	 CONSTRAINT "BBS_PK" PRIMARY KEY ("SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_BBS_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

------------------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE "HR"."CALENDAR" 
   (	"SEQ" NUMBER(8,0), 
	"ID" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"TITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"RDATE" VARCHAR2(12 BYTE) NOT NULL ENABLE, 
	"WDATE" DATE NOT NULL ENABLE, 
	 PRIMARY KEY ("SEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------


 CREATE TABLE "HR"."BADGE" 
   (	"MEMBERID" VARCHAR2(20 BYTE), 
	"BADGE" VARCHAR2(20 BYTE), 
	 CONSTRAINT "FK_BADGE_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE "HR"."EXERCALENDAR" 
   (	"CALSEQ" NUMBER(8,0) NOT NULL ENABLE, 
	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"CALTITLE" VARCHAR2(200 BYTE) NOT NULL ENABLE, 
	"CALCONTENT" VARCHAR2(4000 BYTE) NOT NULL ENABLE, 
	"CALWDATE" DATE NOT NULL ENABLE, 
	"CALRDATE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "EXERCALENDAR_PK" PRIMARY KEY ("CALSEQ")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE, 
	 CONSTRAINT "FK_EXERCALENDAR_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

------------------------------------------------------------------------------------------------------------------------------------



  CREATE TABLE "HR"."EXERCISE" 
   (	"EXID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"PART" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"DIFFICULTY" NUMBER(10,0) NOT NULL ENABLE, 
	"TYPE" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXCONTENT" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXIMG" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"EXADDRESS" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "MOVIETABLE_PK" PRIMARY KEY ("EXID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------


  CREATE TABLE "HR"."MYROUTINE" 
   (	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "FK_MYROOTIN_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE, 
	 CONSTRAINT "FK_MYROOTIN_VIDEOID" FOREIGN KEY ("EXID")
	  REFERENCES "HR"."EXERCISE" ("EXID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;


------------------------------------------------------------------------------------------------------------------------------------

  CREATE TABLE "HR"."WCHART" 
   (	"MEMBERID" VARCHAR2(20 BYTE), 
	"WDATE" DATE, 
	"DWEIGHT" NUMBER(5,0), 
	 CONSTRAINT "FK_SCHEDULES_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

------------------------------------------------------------------------------------------------------------------------------------


  CREATE TABLE "HR"."REVIEW" 
   (	"TRAINERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"TRAINERCOMMENT" VARCHAR2(400 BYTE) NOT NULL ENABLE, 
	"MEMBERID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXID" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"EXCOMMENT" VARCHAR2(400 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "FK_TRAINERREVIEW_MEMBERID" FOREIGN KEY ("MEMBERID")
	  REFERENCES "HR"."MEMBER" ("MEMBERID") ENABLE, 
	 CONSTRAINT "FK_REVIEW_VIDEOID" FOREIGN KEY ("EXID")
	  REFERENCES "HR"."EXERCISE" ("EXID") ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;




  
  
  
  
  
  
  
SELECT B. MEMBERID, B.SEQ, B.REF, B.STEP,B. DEPTH, 
B.TITLE, B.CONTENT, B.WDATE, B.DEL, B.READCOUNT, B.LIKECOUNT, 
B.IMG, B.DIVISION, B.BBSTYPE, M.MEMLEVEL 
FROM 
(SELECT ROW_NUMBER()OVER(ORDER BY REF DESC, STEP ASC) AS RNUM, 
MEMBERID, SEQ, REF, STEP, DEPTH, TITLE, CONTENT, WDATE, DEL, READCOUNT,
LIKECOUNT, IMG, DIVISION, BBSTYPE 
FROM BBS 
WHERE DEL = 0 AND BBSTYPE=1
ORDER BY REF DESC, STEP ASC) B, MEMBER M		
WHERE  B.MEMBERID = M.MEMBERID AND RNUM >= 1 AND RNUM <= 10 
  
  
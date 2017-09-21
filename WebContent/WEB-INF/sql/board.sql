select * from tab WHERE TNAME LIKE '%'||'EH_'||'%';


drop table EH_BBS;
drop table eh_reply;
drop table eh_bf;


--BBS
--PK / 제목 / 작성자(table user의 pk id값을 fk로) / 내용 / 파일 / 조회수 / 작성날짜 / 작성밴드(table band의 pk band id 값을 fk로) 

CREATE TABLE EH_BBS(
	BBS_NO		NUMBER		NOT NULL,
    BBS_UBSEQ   NUMBER		NOT NULL,
	TITLE	 	VARCHAR2(80)	NOT NULL,
	CONTENT		VARCHAR2(1000)	NOT NULL,
	VCNT 		NUMBER		DEFAULT 0 NOT NULL,
	WDATE 		DATE		NOT NULL,
	
	CONSTRAINT EH_BBS_PK PRIMARY KEY (BBS_NO),
	CONSTRAINT EH_BBS_UBSEQ FOREIGN KEY (BBS_UBSEQ) REFERENCES EH_UB (UB_SEQ)
);

--REPLY
--PK / 작성자(table user의 pk id값을 fk로) / 내용 / 작성날짜 / 작성게시글(table board의 pk값을 fk로) / indent / grpno / ansnum 
CREATE TABLE EH_REPLY(
	R_NO		NUMBER		NOT NULL,
	R_UID 		VARCHAR2(20)	NOT NULL,
	CONTENT 	VARCHAR2(1000)	NOT NULL,
	WDATE 		DATE		NOT NULL,
	R_BBSNO 	NUMBER		NOT NULL,
	INDENT 		NUMBER		DEFAULT 0 NOT NULL,
	GRPNO 		NUMBER		DEFAULT 0 NOT NULL,
	ANSNUM		NUMBER		DEFAULT 0 NOT NULL,

	CONSTRAINT EH_REPLY_PK PRIMARY KEY (R_NO),
	CONSTRAINT EH_REPLY_UID_FK FOREIGN KEY (R_UID) REFERENCES EH_USER (ID),
	CONSTRAINT EH_REPLY_BBSNO_FK FOREIGN KEY (R_BBSNO) REFERENCES EH_BBS (BBS_NO)
);

--BF
--PK / 작성게시글(table board의 pk값을 fk로) / 파일이름 / 파일사이즈 / 파일유형 / 파일업로드날짜
CREATE TABLE EH_BF(
	BF_NO		NUMBER		    NOT NULL,
	BF_BBSNO 	NUMBER		    NOT NULL,
	BF_NAME		VARCHAR2(200)	NOT NULL,
	BF_SIZE		NUMBER		    NOT NULL,
	BF_TYPE		VARCHAR2(40)	NOT NULL,
	BF_DATE		DATE		    NOT NULL,
	
	CONSTRAINT EH_BF_PK PRIMARY KEY (BF_NO),
	CONSTRAINT EH_BF_BBSNO_FK FOREIGN KEY (BF_BBSNO) REFERENCES EH_BBS (BBS_NO)
);

------------------------------------------------------------------------------bbs
--select list
SELECT bbs_no, title, vcnt, ub_uid, (select count(*) from reply where r_bbsno) rcnt,wdate
from eh_bbs b, eh_ub u
where bbs_ubseq=ub_seq and ub_bid = ?;

--select one
SELECT bbs_no, title, content, vcnt, ub_uid, (select count(*) from reply where r_bbsno) rcnt, wdate
from eh_bbs b, eh_ub u
where bbs_ubseq=ub_seq and ub_bid = ?;

--insert

--update

--delete

commit;

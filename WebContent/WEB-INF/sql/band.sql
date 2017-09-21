select * from tab;
drop table EH_UB;
drop table EH_BAND;

CREATE TABLE EH_BAND(
	B_ID		varchar(20),
	B_TITLE		varchar(80) not null,
	B_CATEGORY 	varchar(200) not null,
	B_EXP		varchar(1000),
	B_INFOP		varchar(10) default 'Public',
	B_FNAME 	varchar(80) not null,
	B_DATE		DATE not null,
	CONSTRAINT EH_BAND_PK PRIMARY KEY(B_ID)
);

create table EH_UB(
	UB_SEQ NUMBER,
	UB_BID varchar(20),
	UB_UID varchar(20),
	GRADE varchar(2) default 'U', --U :: 일반 회원 M:: 밴드장(manager)
	UB_RDATE DATE not null,
	CONSTRAINT EH_UB_PK PRIMARY KEY(UB_SEQ),
	CONSTRAINT EH_UB_BID_FK FOREIGN KEY(UB_BID) REFERENCES EH_BAND(B_ID),
	CONSTRAINT EH_UB_UID_FK FOREIGN KEY(UB_UID) REFERENCES EH_USER(ID)
);


insert into EH_BAND
(b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date)
values('B00001','여행을 좋아하는 사람들','Travel',null,'Public','travelBasic.jpg',sysdate);

--select band one
select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,grade 
from eh_band b join eh_ub ub 
on(b_id=ub_bid) where b_id='B00001' and grade='M';

select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,grade 
from eh_band b join eh_ub ub 
on(b_id=ub_bid) where ub_uid='testUser' and grade='M';

--select band list
select b_id,b_title,b_category,b_exp,b_infop,b_fname from eh_band where b_id='B00003';
select ub_seq, ub_bid,ub_uid,grade from eh_ub;
--mssql query
--select top 1 'A'+replicate('0',4-len(substring(bookid,2,len(bookid))+1))+cast(substring(bookid,2,len(bookid))+1 as char(4)) from book where bookid like('A%') order by bookid desc
select 'B'||lpad(NVL(max(REGEXP_REPLACE(b_id,'[^0-9]')),0)+1,5,'0') from eh_band;

--create band
insert into EH_BAND
(b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date)
values((select 'B'||lpad(NVL(max(REGEXP_REPLACE(b_id,'[^0-9]')),0)+1,5,'0') from eh_band),
'솔데스크Class#3','Study','솔데스크 3강의장 밴드','Public','studyBasic.jpg',sysdate);

insert into eh_ub
(ub_seq, ub_bid,ub_uid,grade,ub_rdate)
values((select nvl(max(ub_seq),0)+1 from eh_ub),(select 'B'||lpad(NVL(max(REGEXP_REPLACE(b_id,'[^0-9]')),0),5,'0') from eh_band),'testUser','M',sysdate);

--MODI BAND INFO
update eh_band set
	b_title='Garam_BAND'
	b_category='',
	b_exp='',
	b_infop=''
where b_id='B00003';

--MODI BAND FNAME

--UPSIGN MEMBER 

--DELETE BAND 
delete from eh_ub
where ub_bid='B00001';

delete from eh_band
where b_id='B00002';

--최신 밴드 top5
select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,r
from(
	select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,rownum as r
	from(
		select b_id,b_title,b_category,b_exp,b_infop,b_fname,b_date,ub_uid,rownum 
		from eh_band join eh_ub on(b_id=ub_bid)
		where b_infop='Public' and grade='M'
		order by b_id desc
))where r between 1 and 5;
--활동 多 밴드 top5




select ub_seq, ub_bid,ub_uid,grade from eh_ub where ub_bid='B00011';

delete from eh_ub where ub_bid='B00011' and ub_uid='sol';


select ub_seq, ub_bid,ub_uid,grade,ub_rdate from eh_ub where ub_bid='B00012' order by grade;





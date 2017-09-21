select * from tab;
drop table EH_USER;

CREATE TABLE EH_USER(
	ID		varchar(20),
	PW		varchar(40) not null,
	U_NAME	varchar(20) not null,
	EMAIL	varchar(50),
	U_INFOP	varchar(10) default 'Public', -- Public :: 사용자 정보 공개   Private :: 사용자 정보 비공개  _name, email
	U_GRADE varchar(2) default 'U', -- U :: 일반사용자(User)  A :: 관리자 (Admin)
	U_DATE varchar(20) not null,
	CONSTRAINT EH_USER_PK PRIMARY KEY(ID),
	CONSTRAINT EH_USER_EAMIL_UNQ UNIQUE(EMAIL)
);

alter table EH_USER modify(U_INFOP	varchar(10) default 'Public');

--select one
SELECT ID, U_NAME, EMAIL, U_INFOP, U_GRADE
FROM EH_USER
WHERE ID = 'testUser';

--select list
SELECT ID, U_NAME, EMAIL, U_INFOP, U_GRADE
FROM EH_USER
WHERE U_GRADE = 'U';

--insert one
INSERT INTO EH_USER
(ID, PW, U_NAME,EMAIL, U_INFOP, U_GRADE, u_date)
VALUES('testUser','test1234','Test Jone','test1234@email.com','y','U',sysdate);

INSERT INTO EH_USER
(ID, PW, U_NAME,EMAIL, U_INFOP, U_GRADE,u_Date)
VALUES('admin','admin','Admin Jone','admin1234@email.com','n','A',sysdate);

--update PW
UPDATE EH_USER SET
	PW='test123'
WHERE ID='testUser';

--update name
UPDATE EH_USER SET
	U_NAME='User Jone'
WHERE ID='testUser';

--update email
UPDATE EH_USER SET
	EMAIL='test123@email.com'
WHERE ID='testUser';

--update infop
UPDATE EH_USER SET
	U_INFOP='Private'
WHERE ID='admin';

--delete one
DELETE FROM EH_USER WHERE ID='testUser';

--check pw
SELECT COUNT(ID)
FROM EH_USER
WHERE ID='testUser' and PW='test123';

--check id
SELECT COUNT(ID) FROM EH_USER
WHERE ID='test';

--check email 
SELECT COUNT(EMAIL) FROM EH_USER
WHERE EMAIL='test1234@email.com';

--test
SELECT * FROM 
				(SELECT ROWNUM RN, N.* FROM 
					(SELECT * FROM customer1 ORDER BY c_id DESC) N
				) WHERE RN BETWEEN 1 + (1-1)*10 AND 10 + (1-1)*10;

				
				
				
				
				
				
				
--monologue				
create table monologue(
mo_num number(38) primary key,
c_id varchar2(100) references customer(c_id),
mo_content varchar2(500),
mo_good number(38),
mo_regdate date,
mo_del char(1));
create sequence monologue_seq;
--monologue good ck
create table mogoodck(
mo_num number(38),
c_id varchar2(100),
CONSTRAINT PK_bg primary key(mo_num,c_id),
CONSTRAINT FK_bg FOREIGN KEY(mo_num) REFERENCES monologue(mo_num),
CONSTRAINT FK_bg2 FOREIGN KEY(c_id) REFERENCES customer1(c_id)
);
drop table mogoodck;
select * from mogoodck where mo_num=1 and c_id='pppp';
insert into mogoodck values(3,'aaaa');
--cgv 극장 코드
create table cgvcode(
theatercode varchar2(10),
areacode varchar2(10),
local varchar2(50),
CONSTRAINT PK_cc primary key(theatercode ,areacode));
insert into cgvcode values('0056','01','강남');
insert into cgvcode values('0001','01','강변');
--취향집
create table favoritezip(
 zip_num number(38) primary key,
 fz_good number(38),
 c_id varchar2(100) references customer1(c_id)
);
create sequence favoritezip_seq;
-- movie 영화 테이블 
create table movie(
mv_num number(15) primary key,
mv_name varchar2(300),
mv_direct varchar2(100),
mv_genre varchar2(100),
mv_content varchar2(1000),
mv_mjactor varchar2(100),
mv_minactor varchar2(300),
mv_reldate varchar2(100),
mv_rate number(3,1),
mv_runtime number(4),
mv_imageurl varchar2(300));
select * from movie;
drop table movie;
create table monologue(
mo_num number(38) primary key,
c_id varchar2(100) references customer1(c_id),
mo_content varchar2(500),
mo_good number(38),
mo_regdate date,
mo_del char(1));
create sequence monologue_seq;

-- customer1 고객 테이블 
create table CUSTOMER1(
c_id varchar2(100) primary key,
c_password varchar2(100),
c_name varchar2(100),
c_address varchar2(500),
c_tel varchar2(50),
c_email varchar2(100),
c_del char(1),
c_regdate date,
c_nickname varchar2(100),
c_proimg varchar2(500),
c_headerimg varchar2(500),
c_probio varchar2(500));

select *  from CUSTOMER1;
drop table CUSTOMER1;

-- master 값 입력 --0828:입력보류
insert into CUSTOMER1 values('master','*1234a','관리자',null,'010-1234-1234',
'cinephile_master@gmail.com','n',sysdate,'관리자',null,null,null);


-- board 테이블
create table board(
B_NUM number(38) primary key,
B_GOOD number(38),
C_ID varchar2(100) references CUSTOMER1(c_id),
B_SUBJECT varchar2(300),
B_CONTENT varchar2(4000),
B_READCOUNT number(38),
ref number(38),
re_step number(38),
re_level number(38),
ip varchar2(100),
B_REGDATE date,
B_DEL char(1),
B_TYPE varchar2(50),
B_CATEGORY varchar2(100)
);
insert into board values ('1','제목','내용','2',sysdate,'n','master','5','리뷰게시판','상영중');
select * from board;
drop table board;

--

create table cfavorite(
mv_num number(15),
zip_num number(38),
CONSTRAINT PK_cf primary key(mv_num,zip_num),
CONSTRAINT FK_cf FOREIGN KEY(mv_num) REFERENCES movie(mv_num),
CONSTRAINT FK_cf2 FOREIGN KEY(zip_num) REFERENCES favoritezip(zip_num)
);
drop table cfavorite;


delete customer1;
select * from customer1;
delete monologue where mo_num=3;
select * from monologue;

--test
SELECT * FROM 
				(SELECT ROWNUM RN, N.* FROM 
					(SELECT * FROM customer1 ORDER BY c_id DESC) N
				) WHERE RN BETWEEN 1 + (1-1)*10 AND 10 + (1-1)*10;
			
				
				
-- <<테이블 생성 순서>>		
-- 1. customer1 고객 테이블 
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


-- 1-2. master 값 입력 /0828:입력보류
insert into CUSTOMER1 values('master','*1234a','관리자',null,'010-1234-1234','cinephile_master@gmail.com','n',sysdate,'관리자',null,null,null);
delete from customer1 where c_id='master';

-- select/drop/etc
select *  from CUSTOMER1;
drop table CUSTOMER1;
delete customer1;

----------------------------------------

-- 2. monologue	 모놀로그
create table monologue(
mo_num number(38) primary key,
c_id varchar2(100) references customer1(c_id),
mo_content varchar2(500),
mo_good number(38),
mo_regdate date,
mo_del char(1));

-- 2-1. 모놀로그 시퀀스
create sequence monologue_seq;

-- etc
select * from monologue;
delete monologue where mo_num=3;

-------------------------------------

--3. monologue good ck  모놀로그 좋아요
create table mogoodck(
mo_num number(38),
c_id varchar2(100),
CONSTRAINT PK_bg primary key(mo_num,c_id),
CONSTRAINT FK_bg FOREIGN KEY(mo_num) REFERENCES monologue(mo_num),
CONSTRAINT FK_bg2 FOREIGN KEY(c_id) REFERENCES customer1(c_id)
);

-- etc
drop table mogoodck;
select * from mogoodck where mo_num=1 and c_id='pppp';
insert into mogoodck values(3,'aaaa');

----------------------------------------


--4.mo good chk 모놀로그 좋아요 체크  
create table mogoodck(
mo_num number(38),
c_id varchar2(100),
CONSTRAINT PK_bg primary key(mo_num,c_id),
CONSTRAINT FK_bg FOREIGN KEY(mo_num) REFERENCES monologue(mo_num),
CONSTRAINT FK_bg2 FOREIGN KEY(c_id) REFERENCES customer(c_id)
);

----------------------------------------

--5. cgvcode  cgv극장 코드
create table cgvcode(
theatercode varchar2(10),
areacode varchar2(10),
local varchar2(50),
CONSTRAINT PK_cc primary key(theatercode ,areacode));

-- etc
insert into cgvcode values('0056','01','강남');
insert into cgvcode values('0001','01','강변');

----------------------------------------

--6. favoritezip 취향집
create table favoritezip(
 zip_num number(38) primary key,
 fz_good number(38),
 c_id varchar2(100) references customer1(c_id)
);

--6-1. 취향집 시퀀스
create sequence favoritezip_seq;

----------------------------------------

-- 7. movie 영화 테이블 
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

-- etc
select * from movie;
drop table movie;

----------------------------------------

-- 8. board 게시판
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

-- etc
insert into board values ('1','5','master','제목subject','내용content','3',null,null,null,'아이피주소',sysdate,'n','리뷰게시판','상영중');
select * from board;
drop table board;

----------------------------------------


--9. comment 댓글
create table comment(
co_num number(38) primary key,
b_num number(38),
co_content varchar2(500),
co_del char(1),
co_regdate date,
c_id varchar2(100),
CONSTRAINT FK_c FOREIGN KEY(c_id) REFERENCES customer(c_id),
CONSTRAINT FK_c2 FOREIGN KEY(b_num) REFERENCES board(b_num)
);


----------------------------------------

-- 10. cfavorite 취향집 
create table cfavorite(
mv_num number(15),
zip_num number(38),
CONSTRAINT PK_cf primary key(mv_num,zip_num),
CONSTRAINT FK_cf FOREIGN KEY(mv_num) REFERENCES movie(mv_num),
CONSTRAINT FK_cf2 FOREIGN KEY(zip_num) REFERENCES favoritezip(zip_num)
);

-- etc
drop table cfavorite;

----------------------------------------

--11. book 예약 
create table book(
book_num number(38) primary key,
c_id varchar2(100),
mv_num number(15),
book_cnt number(10),
book_pay varchar2(50),
book_loc varchar2(500),
book_date date,
book_humantype varchar2(100),
book_price number(10),
mv_name varchar2(300),
book_del char(1),
CONSTRAINT FK_bk FOREIGN KEY(c_id) REFERENCES customer1(c_id),
CONSTRAINT FK_bk2 FOREIGN KEY(mv_num) REFERENCES movie(mv_num)
);

--11-. 예약 시퀀스
create sequence book_seq;

----------------------------------------


-- 12. monologue tag link 모놀로그 태그 
create table motaglink(
link_id number(38),
tag_num number(38),
mo_num number(38)
CONSTRAINT PK_motag primary key(linkid,tag,mo_num),
CONSTRAINT FK_motag FOREIGN KEY(tag) REFERENCES tag(tag),
CONSTRAINT FK_motag2 FOREIGN KEY(mo_num) REFERENCES monologue(mo_num)
);

----------------------------------------

-- 13. favoritezip good chk 취향집 추천

create table fzgoodck(
zip_num number(38),
c_id varchar2(100),
CONSTRAINT PK_fz primary key(zip_num,c_id),
CONSTRAINT FK_fz FOREIGN KEY(zip_num) REFERENCES favoritezip(zip_num),
CONSTRAINT FK_fz2 FOREIGN KEY(c_id) REFERENCES customer1(c_id)
);  
----------------------------------------


-- 회원 테이블
create table tbl_member (
    userId      varchar2(50)    not null, 
    userPass    varchar2(100)   not null, 
    PassQuiz	varchar2(100)	not null, 
    QuizAnswer	varchar2(100)	not null, 
    userName    varchar2(30)    not null, 
    userPhone   varchar2(20)    not null, 
    email		varchar2(100) 	null, 
    userAddr1   varchar2(100)   null, 
    userAddr2   varchar2(100)   null, 
    userAddr3   varchar2(100)   null, 
    regiDate    date            default sysdate, 
    birthday	date 			not null, 
    mileage		number			default 0, 
    verify      number          default 0, 
    primary key(userId)
);

create sequence tbl_member_seq;

-- 카테고리 테이블
create table goods_category (
	cateLevel	 varchar2(20)	 not null,
    cateName     varchar2(20)    not null,
    cateCode     varchar2(30)    not null,
    cateCodeRef  varchar2(30)    null,
    primary key(cateCode),
    foreign key(cateCodeRef) references goods_category(cateCode)
);

--<level1 카테고리 예시>
insert into goods_category values('1', '악세서리', '100', '');
insert into goods_category values('1', '여성의류', '200', '');
insert into goods_category values('1', '남성의류', '300', '');

--<level2 카테고리 예시>
insert into goods_category values('2', '반지', '101', '100');
insert into goods_category values('2', '귀걸이', '102', '100');
insert into goods_category values('2', '목걸이', '103', '100');

create sequence goods_category_seq;

-- 상품 테이블
create table tbl_items (
    itemNum       number          not null,
    itemName      varchar2(50)    not null,
    cateCode     varchar2(30)    not null,
    itemPrice     number          not null,
    itemCount     number          default 0,
    itemDes       varchar(4000)    null,
    itemImg       varchar(200)    null,
    itemDate      date            default sysdate,
    itemThumbImg varchar2(300),
    itemGetCount number default 0,
    primary key(itemNum)
);

alter table tbl_items add
    constraint goods_category
    foreign key (cateCode)
        references goods_category(cateCode) on delete cascade;

create sequence tbl_item_seq;

-- 공지 게시판
CREATE TABLE board_notice(
	num Number PRIMARY key,
	noticeNum number not null,
	writer VARCHAR2(100) not null, -- 글 작성자의 id
	title VARCHAR2(100) not null,
	content CLOB,
	viewCount NUMBER, -- 조회수
	regdate DATE
);

CREATE SEQUENCE board_notice_seq;

-- Q&A 게시판
CREATE TABLE board_qna(
	num NUMBER PRIMARY KEY,
	itemNum number,
	writer VARCHAR2(100) NOT NULL, -- 글 작성자의 id 
	title VARCHAR2(100) NOT NULL,
	content CLOB,
	viewCount NUMBER, -- 조회수
	regdate DATE
);

CREATE SEQUENCE board_qna_seq;

-- Q&A 게시판 댓글
CREATE TABLE board_qna_comment(
	num NUMBER PRIMARY KEY, -- 댓글의 글번호
	writer VARCHAR2(100), -- 댓글 작성자
	content VARCHAR2(500), -- 댓글 내용
	target_id VARCHAR2(100), -- 댓글의대상이되는아이디(글작성자)
	ref_group NUMBER, -- 댓글 그룹번호
	comment_group NUMBER, -- 원글에 달린 댓글 내에서의 그룹번호
	deleted CHAR(3) DEFAULT 'no', -- 댓글이 삭제 되었는지 여부 
	regdate DATE -- 댓글 등록일 
);

CREATE SEQUENCE board_qna_comment_seq;

--리뷰 테이블
create table board_review(
	reviewNum number primary key,
	reviewWriter varchar2(50) not null,
	itemNum number not null,
	reviewContent CLOB not null,
	likeCount number,
	upCount number,
	regdate date
);

-- 리뷰 댓글 테이블
	CREATE TABLE board_review_comment(
	num NUMBER PRIMARY KEY, 
	writer VARCHAR2(100), 
	content VARCHAR2(500), 
	target_id VARCHAR2(100), 
	ref_group NUMBER, 
	comment_group NUMBER, 
	deleted CHAR(3) DEFAULT 'no', 
	regdate DATE 
);

CREATE SEQUENCE board_review_comment_seq;

-- 리뷰 좋아요 테이블
create table review_upCount(
	num number, 
	id varchar2(100), 
	reviewNum number,
	regdate date,
	itemNum number
	);
	
create sequence reviewUpCount_seq;


--리뷰 likeCount (1부터 10까지만 입력하는 제약 조건)
alter table board_review 
add constraint review_likeCount_ch check(likeCount>=1 and likeCount<=10);

create sequence board_review_seq;

-- 카트 테이블
create table cartList(
	cartNum number not null,
	userId varchar2(50) not null,
	itemNum number not null,
	cartStock number default 1, -- 카트 수량 -- 
	addDate date default sysdate,
	num number,
	itemName varchar2(50),
	itemPrice number,
	itemImg varchar(200) null,
	money number,
	primary key(cartNum)
);

alter table cartList
add constraint cartList_userId foreign key(userId)
references tbl_member(userId) on delete cascade;

alter table cartList
add constraint cartList_itemNum foreign key(itemNum)
references tbl_items(itemNum)  on delete cascade;

create sequence cartList_seq;

--위시 리스트
create table wishlist(
	wishNum number not null,
	userId varchar2(50) not null,
	itemNum number not null,
	addDate date default sysdate,
	num number,
	itemName varchar2(50),
	itemPrice number,
	itemImg varchar(200) null,
	primary key(itemNum, userId)
);

create sequence wishlist_seq;

	alter table wishlist
	add constraint wishlist_userId foreign key(userId)
	references tbl_member(userId) on delete cascade;
	
	alter table wishlist
	add constraint wishlist_itemNum foreign key(itemNum)
	references tbl_items(itemNum) on delete cascade;

-- 배송 테이블
create table orders(
   orderNum number primary key,
   userId varchar2(50) not null,
   orderRec varchar2(50) not null,   --수신자
   userAddr1 varchar2(100) not null,
   userAddr2 varchar2(100) not null,
   userAddr3 varchar2(100) ,
   orderPhone1 varchar2(20),
   orderPhone2 varchar2(20),
   orderDate date default sysdate,
   delivery varchar2(30) default '배송준비',    --배송 처리여부
   msg varchar2(100),
   payment varchar2(30),
   allPrice number
);

create sequence orders_seq;

alter table orders
    add constraint orders_userId_fk foreign key(userId)
    references tbl_member(userId) on delete cascade;

-- 배송 정보 자세히보기 테이블

create table order_detail(
	odNum number primary key,
	orderNum number,
	itemNum number,
	quantity number,
	result varchar2(30) default '미처리'       --상품 처리여부
);

create sequence order_detail_seq;

alter table order_detail 
	add constraint order_detail_orderNum_fk foreign key(orderNum)
	references orders(orderNum) on delete cascade;

alter table order_detail
	add constraint order_detail_itemNum_fk foreign key(itemNum)
	references tbl_items(itemNum) on delete cascade;





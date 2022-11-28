-- 카트
create table cartList(
	cartNum number not null,
	userId varchar2(50) not null,
	itemNum number not null,
	cartStock number not null, -- 카트 수량 -- 
	addDate date default sysdate,
	num number,
	itemName varchar2(50),
	itemPrice number,
	itemImg varchar(200) null,
	money number,
	primary key(cartNum)
);

create sequence cartList_seq;

alter table cartList
add constraint cartList_userId foreign key(userId)
references tbl_member(userId);

alter table cartList
add constraint cartList_itemNum foreign key(itemNum)
references tbl_items(itemNum);

-- 위시리스트
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
references tbl_member(userId);

alter table wishlist
add constraint wishlist_itemNum foreign key(itemNum)
references tbl_items(itemNum);

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

--리뷰 likeCount 제약조건 (1부터 10까지만 입력가능하게) 
alter table board_review 
add constraint review_likeCount_ch check(likeCount>=1 and likeCount<=10);

--리뷰 테이블의 시퀀스
create sequence board_review_seq;

--review comment table
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

--review comment sequence
CREATE SEQUENCE board_review_comment_seq;

--orders table
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

-- orders sequence
create sequence orders_seq;

alter table orders
    add constraint orders_userId_fk foreign key(userId)
    references tbl_member(userId);
    
--order_detail table
create table order_detail(
	odNum number primary key,
	orderNum number,
	itemNum number,
	quantity number,
	result varchar2(30) default '미처리'       --상품 처리여부
);

-- order_detail sequence
create sequence order_detail_seq;

alter table order_detail 
	add constraint order_detail_orderNum_fk foreign key(orderNum)
	references orders(orderNum);

alter table order_detail
	add constraint order_detail_itemNum_fk foreign key(itemNum)
	references tbl_items(itemNum);


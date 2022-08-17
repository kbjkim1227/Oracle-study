create table member (
    member_uid NUMBER(10) NOT NULL,
    id varchar2(20),
    pw varchar2(100),
    name varchar2(40),
    email varchar2(40),
    phonenum varchar2(20),
    address varchar2(100),
    age varchar2(10),
    gender varchar2(10),
    primary key(member_uid)
    );

--drop table member;
   
create sequence member_seq start with 1 increment by 1;
--drop sequence member_seq;

create table review (
    review_uid number(10) not null,
    member_uid number(10) not null,
    writer varchar2(40),
    category varchar2(100),
    title varchar2(100),
    content varchar2(100),
    img varchar2(100),
    view_count number(10),
    regdate varchar2(100),
    primary key(review_uid),
    foreign key (member_uid) references member (member_uid)
    --constraint review_member_uid_uk unique(member_uid)
    );
    
create sequence review_seq start with 1 increment by 1;
--drop table review;
--drop sequence review_seq;

create table reply (
    reply_uid number(10) not null,
    review_uid number(10) not null,
    member_uid number(10) not null,
    group_id number(10),
    writer varchar2(100),
    content varchar2(100),
    regdate varchar2(100),
    primary key(reply_uid),
    foreign key (review_uid) references review (review_uid)
    --foreign key (member_uid) references review (member_uid)
    );
    
create sequence reply_seq start with 1 increment by 1;

--drop table reply;
--drop sequence reply_seq;

--select * from member;
--select * from REPLY;
--select * from REVIEW;

--desc review;
SELECT
    *
FROM member;
commit;

SELECT
    *
FROM review;
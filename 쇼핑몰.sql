create sequence exhbn_seq start with 1 increment by 1;

create table exhbn
(
    e_id        int          not null primary key,
    title       varchar(45)  not null,
    category    varchar(45)  not null,
    description varchar(45)  null,
    price       varchar(45)  not null,
    location    varchar(45)  not null,
    period 		varchar(45) 	 not null,
    time        varchar(45)  not null,
    image       varchar(100) null
);

create sequence bbs_seq start with 1 increment by 1;
create sequence board_seq start with 1 increment by 1;

create table BBS
(
    NUM       NUMBER         not null primary key,
    WRITER    VARCHAR2(30)   not null,
    SUBJECT   VARCHAR2(100)  not null,
    CONTENT   VARCHAR2(2048) not null,
    READCOUNT NUMBER default 0,
    PASSWORD  VARCHAR2(20)   not null,
    REG_DATE  DATE   default sysdate,
    IP        VARCHAR2(30)   not null,
    REF       NUMBER         not null,
    RE_STEP   NUMBER         not null,
    RE_LEVEL  NUMBER         not null
);

commit;
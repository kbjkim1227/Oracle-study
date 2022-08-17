CREATE TABLE WORKER (
        id varchar2(20) NOT NULL Primary Key,
        pwd varchar2(20),
        name varchar2(40),
        phone varchar2(20)
);

SELECT
    *
FROM WORKER;

CREATE TABLE ADDRESS (
        zip_num varchar2(7),
        sido varchar2(30),
        gugun varchar2(30),
        dong varchar2(100),
        zip_code varchar2(30),
        bunji varchar2(30)
);
SELECT
    *
FROM address;

CREATE TABLE MEMBER (
        id varchar2(20) NOT NULL Primary Key,
        pwd varchar2(20),
        name varchar2(40),
        email varchar2(40),
        zip_num varchar2(7),
        address varchar2(100),
        phone varchar2(20),
        useyn char(1) default 'y',
        indate date default sysdate
);

SELECT
    *
FROM member;

CREATE TABLE PRODUCT (
        pseq number(5) NOT NULL Primary Key,
        name varchar2(100) DEFAULT 0,
        kind char(1),
        price1 number(7) DEFAULT 0,
        price2 number(7) DEFAULT 0,
        price3 number(7) DEFAULT 0,
        content varchar2(1000) DEFAULT NULL,
        image varchar2(50) DEFAULT 'default.jpg',
        useyn char(1) DEFAULT 'y',
        bestyn char(1) DEFAULT 'n',
        indate date DEFAULT sysdate
);

create sequence product_seq start with 1 increment by 1;

CREATE TABLE CART (
        cseq number(10) NOT NULL, 
        id varchar2(20),
        pseq number(5),
        quantity number(5) default 1,
        result char(1) default 1,
        indate date default sysdate,
        primary key(cseq),
        foreign key (id) references member(id),
        foreign key (pseq) references product(pseq)
);

create sequence cart_seq start with 1 increment by 1;

CREATE TABLE ORDERS (
        OSEQ NUMBER(10) NOT NULL,
        ID VARCHAR2(20),
        INDATE DATE DEFAULT SYSDATE,
        PRIMARY KEY (OSEQ),
        FOREIGN KEY (ID) REFERENCES MEMBER(ID)
);
create sequence ORDERS_seq start with 1 increment by 1;

CREATE TABLE ORDER_DETAIL (
        ODSEQ NUMBER(10) NOT NULL,
        OSEQ NUMBER(10),
        PSEQ NUMBER(5),
        QUANTITY NUMBER(5),
        RESULT CHAR(1) DEFAULT 1,
        INDATE DATE DEFAULT SYSDATE,
        PRIMARY KEY (OSEQ),
        FOREIGN KEY (OSEQ) REFERENCES ORDERS(OSEQ),
        FOREIGN KEY (PSEQ) REFERENCES PRODUCT(PSEQ)
);

create sequence ORDER_DETAIL_seq start with 1 increment by 1;

CREATE TABLE QNA (
        QSEQ NUMBER(5) NOT NULL,
        SUBJECT VARCHAR2(30),
        CONTENT VARCHAR2(1000),
        REPLY VARCHAR2(1000),
        ID VARCHAR2(20),
        REP CHAR(1) DEFAULT 1,
        INDATE DATE DEFAULT SYSDATE,
        PRIMARY KEY (OSEQ),
        FOREIGN KEY (ID) REFERENCES MEMBER(ID)
);

create sequence QNA_seq start with 1 increment by 1;


COMMIT;
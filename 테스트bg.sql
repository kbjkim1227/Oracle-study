drop TABLE member;


CREATE TABLE MEMBER (

        member_uid number primary key,
        id varchar2(20), 
        pw varchar2(20),
        name varchar2(40),
        email varchar2(40),
        phonenum varchar2(20),
        address varchar2(100),
        age varchar2(20),
        gender varchar2(20)
        );
        
create sequence member_seq start with 1 INCREMENT by 1;

INSERT INTO member VALUES(member_seq.nextval, 'pinkbong', '1234', '김봉재', 'kbjkim@naver.com', '010-2472-5518',
'경기도안산시상록구이동611-8', '35', 'men');
INSERT INTO member VALUES(member_seq.nextval, 'pinksu', '1234', '이희수', 'lee@naver.com', '010-0000-4518',
'경기도안산시상록구이동611-8', '35', 'men');

SELECT
    *
FROM member;    

CREATE TABLE review (
        review_uid number(10) primary key,
        writer varchar2(100),
        category varchar2(40),
        title varchar2(500) not null,
        content varchar2(4000),
        img varchar2(30),
        view_count number(10),
        regdate varchar2(100),
        CONSTRAINT fk_id FOREIGN key(member_uid)
        REFERENCES MEMBER(member_uid)
        );        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
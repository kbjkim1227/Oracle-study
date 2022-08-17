drop TABLE t_board cascade constraints;
create TABLE t_board(
articleno NUMBER(10) PRIMARY key,
parentno NUMBER(10) default 0,
title VARCHAR2(500) not null,
content VARCHAR2(4000),
imageFilename VARCHAR2(30),
writedate date default sysdate not null,
id VARCHAR2(10),
CONSTRAINT fk_id FOREIGN key(id)
REFERENCES t_member(id)
);


INSERT INTO t_board(articleno, parentno, title, content, imageFilename, writedate, id)
VALUES(1, 0, '테스트글입니다.', '테스트글입니다.', null, sysdate, 'LEE');



insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(2, 0, '안녕하세요.', '상품 후기입니다.', null, sysdate, 'LEE');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(3, 2, '답변입니다.', '상품 후기에 대한 답변입니다.', null, sysdate, 'LEE');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(5, 3, '답변입니다.', '상품 좋습니다.', null, sysdate, 'KIM');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(4, 0, '박재상입니다.', '테스트글입니다.', null, sysdate, 'PARK');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(6, 2, '상품후기입니다.', '김유신의 상품후기 호로록~', null, sysdate, 'KIM');

SELECT
    *
FROM t_board;

commit;

SELECT
    *
FROM t_member;
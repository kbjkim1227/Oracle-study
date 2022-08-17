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
VALUES(1, 0, '�׽�Ʈ���Դϴ�.', '�׽�Ʈ���Դϴ�.', null, sysdate, 'LEE');



insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(2, 0, '�ȳ��ϼ���.', '��ǰ �ı��Դϴ�.', null, sysdate, 'LEE');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(3, 2, '�亯�Դϴ�.', '��ǰ �ı⿡ ���� �亯�Դϴ�.', null, sysdate, 'LEE');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(5, 3, '�亯�Դϴ�.', '��ǰ �����ϴ�.', null, sysdate, 'KIM');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(4, 0, '������Դϴ�.', '�׽�Ʈ���Դϴ�.', null, sysdate, 'PARK');

insert into t_board(articleno, parentno, title, content, imageFilename, writedate, id)
values(6, 2, '��ǰ�ı��Դϴ�.', '�������� ��ǰ�ı� ȣ�η�~', null, sysdate, 'KIM');

SELECT
    *
FROM t_board;

commit;

SELECT
    *
FROM t_member;
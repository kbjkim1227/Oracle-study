SELECT
    level,
    articleno,
    parentno,
    lpad(' ', 4 *(level - 1))
    || title,
    title,
    content,
    writedate,
    id
FROM
    t_board
START WITH
    parentno = 0
CONNECT BY
    PRIOR articleno = parentno
ORDER SIBLINGS BY
    articleno DESC;

DROP TABLE t_board;

CREATE TABLE t_board(
    articleNO number(10) primary key,
    parentNO number(10) DEFAULT 0,
    title VARCHAR2(500) NOT NULL,
    content VARCHAR2(4000),
    imageFileName VARCHAR2(30),
    writedate DATE DEFAULT SYSDATE NOT NULL,
    id VARCHAR2(10),
    CONSTRAINT fk_id FOREIGN KEY(id) 
    REFERENCES t_member(id)
);

DROP TABLE t_member;
-- 회원 테이블 생성
CREATE TABLE t_member(
    id VARCHAR2(20) primary key,
    pwd VARCHAR2(10),
    name VARCHAR2(50),
    email VARCHAR2(50),
    joinDate DATE DEFAULT SYSDATE
);

--회원 정보 추가
INSERT INTO t_member
VALUES('hong', '1212', '홍길동', 'hong@gmail.com', sysdate);

INSERT INTO t_member
VALUES('lee', '1212', '이순신', 'lee@test.com', sysdate);

INSERT INTO t_member
VALUES('kim', '1212', '김유신', 'kim@jweb.com', sysdate);
COMMIT;

SELECT * FROM t_member;

INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
VALUES(1, 0, '테스트글입니다.', '테스트글입니다.', NULL, SYSDATE, 'hong');

INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
VALUES(2, 0, '테스트글입니다.', '상품후기입니다.', NULL, SYSDATE, 'hong');

INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
VALUES(3, 2, '안녕하세요.', '상품 후기에 대한 답변입니다.', NULL, SYSDATE, 'hong');

INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
VALUES(5, 3, '답변입닌다.', '상품 좋습니다.', NULL, SYSDATE, 'lee');

INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
VALUES(4, 0, '김유신입니다.', '김유신 테스트글입니다.', NULL, SYSDATE, 'kim');

INSERT INTO t_board(articleNO, parentNO, title, content, imageFileName, writedate, id)
VALUES(6, 2, '상품 후기입니다..', '이순씬씨의 상품 사용 후기를 올립니다.', NULL, SYSDATE, 'lee');

COMMIT;
SELECT * FROM t_board;
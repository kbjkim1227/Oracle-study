--애스터리스크처럼 별도의 칼럼 순서를 지정하지 않으면 NATURAL JOIN의 기준이 되는 칼럼들이 다른 칼럼보다 먼저 출력된다
--EX)DEPTNO가 첫 번째 칼럼이 된다. NATURAL JOIN은 조인에 사용된 같은 이름의 칼럼을 하나로 처리한다.
SELECT
    *
FROM EMP A NATURAL JOIN DEPT B;

--INNER JOIN의 경우 첫 번째 테이블, 두 번째 테이블의 칼럼 순서대로 데이터가 출력된다. 이때 NATURAL 조인에 사용된
--같은 이름의 칼럼을 하나로 처리하지만, INNER JOIN은 별개의 칼럼으로 표시한다.

SELECT
    *
FROM EMP A INNER JOIN dept B 
ON b.deptno = a.deptno;

--NATURAL JOIN과 INNER JOIN의 차이를 설명하기위해 테이블 임시 생성
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

UPDATE DEPT_TEMP
SET DNAME = 'CONSULTING'
WHERE DNAME = 'RESEARCH';

UPDATE DEPT_TEMP
SET DNAME = 'MARKETING'
WHERE DNAME = 'SALES';

SELECT
    *
FROM dept_temp;

-- 세 개의 칼럼명이 모두 가은 DEPT와 DEPT_TEMP 테이블을 (NATURAL,INNER) JOIN으로 수행한다.
SELECT
    *
FROM dept A NATURAL INNER JOIN dept_temp B;
--INNER는 DEFAULT 옵션으로 아래와 같이 생략 가능하므로 위 SQL과 똑같은 결과를 얻을 수 있다.
SELECT
    *
FROM DEPT A NATURAL JOIN dept_temp B;

-- 다음에는 같은 조건이지만 출력 칼럼에서 차이가 나는 일반적인 INNER JOIN을 수행한다.
SELECT
    *
FROM DEPT A JOIN dept_temp B
ON b.deptno = a.deptno
AND b.dname = a.dname
AND B.LOC = A.LOC;

-- 세 개의 칼럼명이 모두 같은 DEPT와 DEPT_TEMP 테이블을 DEPTNO 칼럼을 이용한 INNER JOIN의 USING 조건절로 수행한다.
SELECT
    *
FROM dept A JOIN DEPT_TEMP B
USING (DEPTNO);

--USING 조건절을 이용한 EQUI JOIN에서도 NATURAL JOIN과 마찬가지로 조인 칼럼에 대해서는 ALIAS나 테이블 이름과 같은 접두사를 붙일 수 없다.
SELECT A.DEPTNO, A.DNAME, A.LOC, B.DNAME, B.LOC
FROM DEPT A JOIN DEPT_TEMP B
USING (DEPTNO); --에러남

--A.DEPTNO ->DEPTNO로 바꿈
SELECT DEPTNO, A.DNAME, A.LOC, B.DNAME, B.LOC
FROM DEPT A JOIN DEPT_TEMP B
USING (DEPTNO);

--두개의 테이블의 일부 데이터 내용이 변경됐던 DNAME 칼럼을 조인 조건으로 INNER JOIN의 USING 조건절을 수행한다.
SELECT
    *
FROM DEPT A JOIN dept_temp B
USING (dname) ;

-- 세 개의 칼럼명이 모두 같은 두 테이블을 LOC와 DEPTNO 2개 칼럼을 이용한 INNER JOIN의 USING 조건절로 수행한다.
SELECT
    *
FROM DEPT A JOIN dept_temp B
USING (LOC, DEPTNO) ;


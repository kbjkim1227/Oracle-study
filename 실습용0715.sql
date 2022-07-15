SELECT
    *
FROM
    emp;

--열 이름을 비교하는 조건식으로 조인하기

SELECT
    *
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno
ORDER BY
    empno;

SELECT
    job
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    sal IN (
        SELECT
            MAX(sal)
        FROM
            emp
        GROUP BY
            deptno
    );

SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            MAX(sal)
        FROM
            emp
        WHERE
            deptno = 30
    );

SELECT
    *
FROM
    emp
WHERE
    sal > ANY (
        SELECT
            MIN(sal)
        FROM
            emp
    );

CREATE TABLE dept_tcl
    AS
        SELECT
            *
        FROM
            dept;

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    dept_tcl;

INSERT INTO dept_tcl VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

UPDATE dept_tcl
SET
    loc = 'BUSAN'
WHERE
    deptno = 40;

DELETE FROM dept_tcl
WHERE
    dname = 'RESEARCH';

ROLLBACK;

ROLLBACK TO savepoint;

COMMIT;

SELECT
    *
FROM
    dept_tcl;

CREATE VIEW vw_emp20 AS
    ( SELECT
        empno,
        ename,
        job,
        deptno
    FROM
        emp
    WHERE
        deptno = 20
    );

SELECT
    *
FROM
    vw_emp20;
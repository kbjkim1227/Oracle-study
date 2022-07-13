/*
    사원 Table 삭제
*/
-- DROP TABLE EMP;

/*
    부서 Table 삭제
*/
-- DROP TABLE DEPT;


/* 
    Create DEPT table which will be the parent table of the EMP table. 
*/
create table dept(  
  deptno     number(2,0),  
  dname      varchar2(14),  
  loc        varchar2(13),  
  constraint pk_dept primary key (deptno)  
);

/*
    Create the EMP table which has a foreign key reference to the DEPT table. 
    The foreign key will require that the DEPTNO in the EMP table exist in the DEPTNO column in the DEPT table. 
*/
create table emp(  
  empno    number(4,0),  
  ename    varchar2(10),  
  job      varchar2(9),  
  mgr      number(4,0),  
  hiredate date,  
  sal      number(7,2),  
  comm     number(7,2),  
  deptno   number(2,0),  
  constraint pk_emp primary key (empno),  
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
);

/*
    Insert row into DEPT table using named columns. 
*/
insert into DEPT (DEPTNO, DNAME, LOC)
values(10, 'ACCOUNTING', 'NEW YORK');

/*
    Insert a row into DEPT table by column position. 
*/
insert into dept  
values(20, 'RESEARCH', 'DALLAS');

insert into dept  
values(30, 'SALES', 'CHICAGO');

insert into dept  
values(40, 'OPERATIONS', 'BOSTON');

/*
    Insert EMP row, using TO_DATE function to cast string literal into an oracle DATE format.
*/
insert into emp  
values(  
 7839, 'KING', 'PRESIDENT', null,  
 to_date('17-11-1981','dd-mm-yyyy'),  
 5000, null, 10  
);

insert into emp  
values(  
 7698, 'BLAKE', 'MANAGER', 7839,  
 to_date('1-5-1981','dd-mm-yyyy'),  
 2850, null, 30  
);

insert into emp  
values(  
 7782, 'CLARK', 'MANAGER', 7839,  
 to_date('9-6-1981','dd-mm-yyyy'),  
 2450, null, 10  
);

insert into emp  
values(  
 7566, 'JONES', 'MANAGER', 7839,  
 to_date('2-4-1981','dd-mm-yyyy'),  
 2975, null, 20  
);

insert into emp  
values(  
 7788, 'SCOTT', 'ANALYST', 7566,  
 to_date('13-07-1987','dd-mm-yyyy') - 85,  
 3000, null, 20  
);

insert into emp  
values(  
 7902, 'FORD', 'ANALYST', 7566,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 3000, null, 20  
);

insert into emp  
values(  
 7369, 'SMITH', 'CLERK', 7902,  
 to_date('17-12-1980','dd-mm-yyyy'),  
 800, null, 20  
);

insert into emp  
values(  
 7499, 'ALLEN', 'SALESMAN', 7698,  
 to_date('20-2-1981','dd-mm-yyyy'),  
 1600, 300, 30  
);

insert into emp  
values(  
 7521, 'WARD', 'SALESMAN', 7698,  
 to_date('22-2-1981','dd-mm-yyyy'),  
 1250, 500, 30  
);

insert into emp  
values(  
 7654, 'MARTIN', 'SALESMAN', 7698,  
 to_date('28-9-1981','dd-mm-yyyy'),  
 1250, 1400, 30  
);

insert into emp  
values(  
 7844, 'TURNER', 'SALESMAN', 7698,  
 to_date('8-9-1981','dd-mm-yyyy'),  
 1500, 0, 30  
);

insert into emp  
values(  
 7876, 'ADAMS', 'CLERK', 7788,  
 to_date('13-07-87', 'dd-mm-yyyy') - 51,  
 1100, null, 20  
);

insert into emp  
values(  
 7900, 'JAMES', 'CLERK', 7698,  
 to_date('3-12-1981','dd-mm-yyyy'),  
 950, null, 30  
);

insert into emp  
values(  
 7934, 'MILLER', 'CLERK', 7782,  
 to_date('23-1-1982','dd-mm-yyyy'),  
 1300, null, 10  
);

/*
   부서, 사원 테이블을 조인하여 사원별 부서 정보를 조회 
*/
select ename, dname, job, empno, hiredate, loc  
from emp, dept  
where emp.deptno = dept.deptno  
order by ename;

/*
   부서별 사원수 조회를 조회하여
   사원이 많은 부서별로 정렬한다.
*/
select dname, count(*) count_of_employees
from dept, emp
where dept.deptno = emp.deptno
group by DNAME
order by 2 desc;


SELECT * FROM emp;
SELECT * FROM dept;

--emp 테이블에서 사원번호, 이름, 사원이 소속 부서 번호만 조회
SELECT empno, ename, deptno FROM emp; 

--emp 테이블의 부서 번호 종류를 확인
-- DISTINCT(중복제거)
-- 부서코드 테이블과 사원의 부서코드 종류가 일치 하지 않을 수도 있음
-- (부서코드는 있지만 직원이 한명도 없는 경우 - 신설 or 폐쇄)
SELECT DISTINCT deptno FROM emp;

--곱하기를 사용하지 않고 사원의 연간 총 수입 출력
-- null에 어떠한 값을 계산해도 그 결과는 null이 된다.
SELECT ename, sal, sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+sal+comm,comm
FROM emp;

SELECT ename, sal, sal*12+comm as 연수입, comm FROM emp;

-- 급여 기준으로 내림차순 정렬
SELECT * FROM emp order by sal desc;

-- emp 테이블의 전체 열을 부서번호(오름차순)와 급여(내림차순)로 정렬
SELECT * FROM emp order by deptno asc, sal desc;

SELECT ename, sal, deptno FROM emp order by deptno asc, sal desc;

-- where문 부서 번호가 30인 직원만 출력
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7900인 직원만 출력
SELECT * FROM emp WHERE empno = 7900;

-- 부서번호가 30이면서 job이 CLERK인 직원 출력
SELECT * FROM emp WHERE deptno = 30 and job = 'CLERK';

-- 곱셈 산술 연산자를 사용한 예
-- 급여 열에 12를 곱한 값이 36000인 직원들만 출력
SELECT * FROM emp where sal * 12 = 36000;

--문자를 대소 비교 연산자로 비교하기 (비교 문자열이 문자 하나일 때)
SELECT * FROM EMP WHERE ENAME >= 'F';

SELECT * FROM EMP WHERE ENAME <='FORZ';

--NOT 연산자를 사용하여 출력하기
SELECT * FROM EMP WHERE NOT SAL = 3000;
SELECT * FROM EMP WHERE SAL != 3000;
SELECT * FROM EMP WHERE SAL <> 3000;
SELECT * FROM EMP WHERE SAL ^= 3000;

--OR 연산자를 사용하여 여러 개 조건을 만족하는 데이터 출력
SELECT * FROM EMP WHERE JOB = 'MANAGER'
                     OR JOB = 'SALESMAN'
                     OR JOB = 'CLERK';
SELECT * FROM EMP WHERE JOB IN('MANAGER','SALESMAN','CLERK');


commit;

--대소 비교 연산자와 AND 연산자를 사용하여 출력
SELECT * FROM EMP WHERE SAL >= 2000
                    AND SAL <= 3000; 
                    
--LIKE 연산자 사용하여 출력하기                  
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

--사원 이름의 두 번째 글자가 L인 사원만 출력하기
SELECT * FROM EMP WHERE ENAME LIKE '_L%';

--사원 이름에 AM이 포함된 사원 데이터만 출력
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';

--사원 이름을 대,소 첫글자 대문자로 출력
SELECT ENAME, UPPER(ENAME), LOWER(ENAME),INITCAP(ENAME) FROM EMP;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'A%';
    
--UPPER 함수로 문자열 비교

SELECT
    *
FROM
    emp
WHERE
    upper(ename) = upper('scott');

-- upper 함수로 문자열 비교

SELECT
    *
FROM
    emp
WHERE
    upper(ename) LIKE upper('%scott');

--LENGTH : 문자열길이

SELECT
    ename,
    length(ename)
FROM
    emp;  

--사원이름의 길이가 5이상인 행 출력

SELECT
    ename,
    length(ename)
FROM
    emp
WHERE
    length(ename) >= 5;  

--한글은 글자단위와 바이트 단위이다.

SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;
    
--SUBSTR : 문자열 일부 추출함수

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

SELECT
    job,
    substr(job, - length(job)),
    substr(job, - length(job), 2),
    substr(job, - 3)
FROM
    emp;

--문자열 데이터 안에서 특정 문자 위치를 찾는함수 INSTR
SELECT
    instr('HELLO ORACLE!', 'L') AS instr_1,
    instr('HELLO ORACLE!', 'L', 5) AS instr_2,
    instr('HELLO ORACLE!', 'L', 2, 2) AS instr_3
FROM
    dual;

--사원 이름에 문자 s가 있는 행 조회
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;
    
--특정문자를 다른문자로 바꾸는 REPLACE 함수    
SELECT '010-1234-5678' AS REPLACE_BEFORE,
       REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
       REPLACE('010-1234-5678', '-') AS REPLACE_2
  FROM DUAL;  

--데이터의 빈 공간을 특정 문자로 채우는 LPAD, RPAD 함수  
SELECT 'Oracle',
       LPAD('Oracle', 10, '#') AS LPAD_1,  --LPAD문자열 앞쪽으로 채움
       RPAD('Oracle', 10, '*') AS RPAD_1,  --RPAD문자열 뒤쪽으로 채움
       LPAD('Oracle', 10) AS LPAD_2,
       RPAD('Oracle', 10) AS RPAD_2
  FROM DUAL;  

--RPAD로 개인정보 뒷자리 *로 표시 출력  
SELECT RPAD('971225-', 14, '*') AS RPAD_JMNO,
       RPAD('010-1234-', 13, '*') AS RPAD_PHONE 
  FROM DUAL;  

--두 문자열데이트를 합치는 CONCAT 함수  
SELECT CONCAT(EMPNO, ENAME),
       CONCAT(EMPNO, CONCAT(' : ', ENAME))
  FROM EMP
 WHERE ENAME = 'SCOTT'; 
 
--TRIM함수로 공백 제거 
SELECT '[' || TRIM(' _ _Oracle_ _ ') || ']' AS TRIM,
       '[' || TRIM(LEADING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING FROM ' _ _Oracle_ _ ') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH FROM ' _ _Oracle_ _ ') || ']' AS TRIM_BOTH
  FROM DUAL;  

--TRIM함수로 _ 제거  
SELECT '[' || TRIM('_' FROM '_ _Oracle_ _') || ']' AS TRIM,
       '[' || TRIM(LEADING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_LEADING,
       '[' || TRIM(TRAILING '_' FROM '_ _Oracle_ _') || ']' AS TRIM_TRAILING,
       '[' || TRIM(BOTH '_' FROM '_ _Oracle_ _') || ']' AS TRIM_BOTH
  FROM DUAL;   

-- 특정문자를 지우는 TRIM,LTRIM,RTRIM 함수  
SELECT '[' || TRIM(' _Oracle_ ') || ']' AS TRIM,
       '[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM,
       '[' || LTRIM('<_Oracle_>', '_<') || ']' AS LTRIM_2,
       '[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM,
       '[' || RTRIM('<_Oracle_>', '>_') || ']' AS RTRIM_2
  FROM DUAL;    
  
 --특정 위치에서 반올림하는 ROUND 함수 
SELECT ROUND(1234.5678) AS ROUND,
       ROUND(1234.5678, 0) AS ROUND_0,
       ROUND(1234.5678, 1) AS ROUND_1,
       ROUND(1234.5678, 2) AS ROUND_2,
       ROUND(1234.5678, -1) AS ROUND_MINUS1,
       ROUND(1234.5678, -2) AS ROUND_MINUS2
  FROM DUAL;  

-- 특정 위치에서 버리는 TRUNC 함수  
SELECT TRUNC(1234.5678) AS TRUNC,
       TRUNC(1234.5678, 0) AS TRUNC_0,
       TRUNC(1234.5678, 1) AS TRUNC_1,
       TRUNC(1234.5678, 2) AS TRUNC_2,
       TRUNC(1234.5678, -1) AS TRUNC_MINUS1,
       TRUNC(1234.5678, -2) AS TRUNC_MINUS2
  FROM DUAL;  

--지정한 숫자와 가까운 정수를 찾는 함수
SELECT CEIL(3.14),
       FLOOR(3.14),
       CEIL(-3.14),
       FLOOR(-3.14)
  FROM DUAL; 
  
 --숫자를 나눈 나머지 값을 구하는 MOD함수 
SELECT MOD(15,6), MOD(10,2), MOD(11,2) FROM DUAL;  

--날짜 출력함수
SELECT SYSDATE AS NOW,
       SYSDATE-1 AS YESTERDAY,
       SYSDATE+1 AS TOMORROW
  FROM DUAL;  

--3개월 후 날짜  
SELECT SYSDATE,
       ADD_MONTHS(SYSDATE, 3)
  FROM DUAL;  

--입사 10주년 사원 데이터  
SELECT EMPNO, ENAME, HIREDATE,
       ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
  FROM EMP;    
  
--날짜, 숫자 데이터를 문자 데이터로 변환하는 TO_CHAR 함수   
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI;SS') AS 현재날짜시간
  FROM DUAL;   

--월과 요일을 다양한 형식으로 출력하기  
SELECT SYSDATE,
       TO_CHAR(SYSDATE, 'MM') AS MM,
       TO_CHAR(SYSDATE, 'MON') AS MON,
       TO_CHAR(SYSDATE, 'MONTH') AS MONTH,
       TO_CHAR(SYSDATE, 'DD') AS DD,
       TO_CHAR(SYSDATE, 'DY') AS DY,
       TO_CHAR(SYSDATE, 'DAY') AS DAY
  FROM DUAL; 
  
  COMMIT WORK;

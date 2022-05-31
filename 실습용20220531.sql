SELECT COUNT(salary) salary행수
FROM   employees;

SELECT SUM(salary) 합계, AVG(salary) 평균, SUM(salary)/COUNT(salary) 계산된평균
FROM   employees;

SELECT MAX(salary) 최댓값, MIN(salary) 최솟값, MAX(first_name) 최대문자값, MIN(first_name) 최소문자값
FROM   employees;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP  BY job_id
ORDER  BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT job_id 직무, SUM(salary) 직무별_총급여, AVG(salary) 직무별_평균급여
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id
HAVING   SUM(salary) > 30000
ORDER BY 직무별_총급여 DESC, 직무별_평균급여;

SELECT A.first_name, A.last_name, B.*
FROM   employees A, job_history B
WHERE  A.employee_id = B.employee_id
AND    A.employee_id = 101;

SELECT a.employee_id, a.department_id, b.department_name, c.location_id, c.city 
FROM employees A, departments B, locations C
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id;

SELECT  COUNT(*) 조인된건수
FROM    employees A, departments B
WHERE   A.department_id = B.department_id;

SELECT COUNT(*)
FROM employees;



SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
FROM   employees A, departments B
WHERE  A.department_id = B.department_id(+)
ORDER BY A.employee_id;

SELECT A.employee_id, A.first_name, A.last_name, B.department_id, B.department_name
FROM   employees A, departments B
WHERE  A.department_id(+) = B.department_id
ORDER BY A.employee_id;
--null이 많이 생성. A쪽이 데이터가 적다

SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
       B.first_name||'  '||B.last_name manager_name
FROM   employees A, employees B
WHERE  A.manager_id = B.employee_id
ORDER BY A.employee_id;


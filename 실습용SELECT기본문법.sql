SELECT employee_id, first_name, last_name 
FROM employees;
--ORDER BY employee_id DESC;

SELECT job_id, first_name, last_name
FROM employees;

SELECT employee_id AS 사원번호, first_name AS 이름, last_name AS 성
FROM employees;

SELECT employee_id, first_name||last_name
FROM   employees;

SELECT employee_id,
       first_name||' '||last_name,
       email||'@'||'company.com' 
FROM   employees;
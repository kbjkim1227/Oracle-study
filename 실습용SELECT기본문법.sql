SELECT employee_id, first_name, last_name 
FROM employees;
--ORDER BY employee_id DESC;

SELECT job_id, first_name, last_name
FROM employees;

SELECT employee_id AS �����ȣ, first_name AS �̸�, last_name AS ��
FROM employees;

SELECT employee_id, first_name||last_name
FROM   employees;

SELECT employee_id,
       first_name||' '||last_name,
       email||'@'||'company.com' 
FROM   employees;
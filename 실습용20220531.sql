SELECT COUNT(salary) salary���
FROM   employees;

SELECT SUM(salary) �հ�, AVG(salary) ���, SUM(salary)/COUNT(salary) �������
FROM   employees;

SELECT MAX(salary) �ִ�, MIN(salary) �ּڰ�, MAX(first_name) �ִ빮�ڰ�, MIN(first_name) �ּҹ��ڰ�
FROM   employees;

SELECT job_id ����, SUM(salary) ������_�ѱ޿�, AVG(salary) ������_��ձ޿�
FROM   employees
WHERE  employee_id >= 10
GROUP  BY job_id
ORDER  BY ������_�ѱ޿� DESC, ������_��ձ޿�;

SELECT job_id ����, SUM(salary) ������_�ѱ޿�, AVG(salary) ������_��ձ޿�
FROM   employees
WHERE  employee_id >= 10
GROUP BY job_id
HAVING   SUM(salary) > 30000
ORDER BY ������_�ѱ޿� DESC, ������_��ձ޿�;

SELECT A.first_name, A.last_name, B.*
FROM   employees A, job_history B
WHERE  A.employee_id = B.employee_id
AND    A.employee_id = 101;

SELECT a.employee_id, a.department_id, b.department_name, c.location_id, c.city 
FROM employees A, departments B, locations C
WHERE a.department_id = b.department_id
AND b.location_id = c.location_id;

SELECT  COUNT(*) ���εȰǼ�
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
--null�� ���� ����. A���� �����Ͱ� ����

SELECT A.employee_id, A.first_name, A.last_name, A.manager_id,
       B.first_name||'  '||B.last_name manager_name
FROM   employees A, employees B
WHERE  A.manager_id = B.employee_id
ORDER BY A.employee_id;


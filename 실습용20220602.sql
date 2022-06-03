SELECT department_id
FROM   employees
UNION
SELECT department_id
FROM   departments;

SELECT department_id
FROM   employees
UNION ALL
SELECT department_id
FROM   departments;

SELECT department_id
FROM   employees
UNION  ALL
SELECT department_id
FROM   departments
ORDER BY department_id;

SELECT department_id
FROM   employees
INTERSECT
SELECT department_id
FROM   departments
ORDER BY department_id;

SELECT department_id
FROM   departments
MINUS
SELECT department_id
FROM   employees;

--
SELECT *
FROM employees A
WHERE A.salary = (
                  SELECT salary
                  FROM employees
                  WHERE last_name = 'De Haan'
                  );
                  
-- �������̶� ������                
SELECT *
FROM employees A
WHERE A.salary = (  -- =�� IN���� ���������ν� ����Taylor�� �޿� Ȯ�� ���� 
                  SELECT salary
                  FROM employees
                  WHERE last_name = 'Taylor'
                  );
                  

SELECT *
FROM employees A
WHERE A.salary IN (
                  SELECT MIN(salary)
                  FROM employees
                  GROUP BY department_id
                  )
ORDER BY A.salary DESC;

SELECT *
FROM employees A
WHERE (A.job_id, A.salary) IN (
                               SELECT job_id, MIN(salary) �׷캰�޿�
                               FROM employees
                               GROUP BY job_id
                              )
ORDER BY A.salary DESC;


SELECT *

FROM employees A,
                  ( SELECT department_id
                    FROM departments
                    WHERE department_name = 'IT') B --B�� �����(�ζ��κ�����)
WHERE A.department_id = B.department_id;

INSERT INTO departments ( department_id, department_name, manager_id, location_id)
VALUES
(271, 'Sample_Dept', 200, 1700);


INSERT INTO departments
VALUES
(272, 'Sample_Dept', 200, 1700);


UPDATE departments
SET    manager_id = 201,
       location_id = 1800
WHERE  department_name = 'Sample_Dept';


SELECT * FROM departments
order by department_id DESC;

UPDATE departments
SET    (manager_id, location_id) = ( SELECT manager_id, location_id
                                     FROM departments
                                     WHERE department_id = 40)
WHERE  department_name = 'Sample_Dept';

commit;





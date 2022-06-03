SELECT * FROM departments
order by department_id DESC;

UPDATE departments
SET    (manager_id, location_id) = ( SELECT manager_id, location_id
                                     FROM departments
                                     WHERE department_id = 40)
WHERE  department_name = 'Sample_Dept';

UPDATE departments
SET    department_id = null
WHERE  department_name = 'Sample_Dept';


DELETE FROM departments
WHERE department_name = 'Sample_Dept';
DELETE FROM departments
WHERE department_id IN (SELECT department_id
                         FROM departments
                         WHERE department_name = 'Sample_Dept');
                         
INSERT INTO departments
VALUES
(100 --�ߺ������Ͱ�
,'Sample_Dept', 200, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES
(273, 'Sample_Dept', 200, 
1111--�������� ����
);

SELECT *
FROM employees;


CREATE TABLE sample_product
       ( product_id number,
         product_name varchar2(30),--�ڸ���
         manu_date date);
         
INSERT INTO sample_product VALUES ( 1, 'television', to_date('140101','YYMMDD'));

INSERT INTO sample_product VALUES ( 2, 'washer', to_date('150101', 'YYMMDD'));

INSERT INTO sample_product VALUES ( 3, 'cleaner', to_date('160101', 'YYMMDD'));

SELECT *
FROM sample_product;

ALTER TABLE sample_product ADD (factory varchar(10));

ALTER TABLE sample_product MODIFY ( factory char(8));

ALTER TABLE sample_product RENAME COLUMN factory to factory_name;--���̸� ����

ALTER TABLE sample_product DROP COLUMN factory_name; --������

TRUNCATE TABLE sample_product;--���̺��� �����͸� ��� ����

DROP TABLE sample_product; --���̺����

 
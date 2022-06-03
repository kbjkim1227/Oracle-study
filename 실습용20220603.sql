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
(100 --중복데이터값
,'Sample_Dept', 200, 1700);

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES
(273, 'Sample_Dept', 200, 
1111--참조값이 없음
);

SELECT *
FROM employees;


CREATE TABLE sample_product
       ( product_id number,
         product_name varchar2(30),--자릿수
         manu_date date);
         
INSERT INTO sample_product VALUES ( 1, 'television', to_date('140101','YYMMDD'));

INSERT INTO sample_product VALUES ( 2, 'washer', to_date('150101', 'YYMMDD'));

INSERT INTO sample_product VALUES ( 3, 'cleaner', to_date('160101', 'YYMMDD'));

SELECT *
FROM sample_product;

ALTER TABLE sample_product ADD (factory varchar(10));

ALTER TABLE sample_product MODIFY ( factory char(8));

ALTER TABLE sample_product RENAME COLUMN factory to factory_name;--열이름 변경

ALTER TABLE sample_product DROP COLUMN factory_name; --열삭제

TRUNCATE TABLE sample_product;--테이블의 데이터를 모두 삭제

DROP TABLE sample_product; --테이블삭제

 
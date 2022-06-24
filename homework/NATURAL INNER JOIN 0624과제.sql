--�ֽ��͸���ũó�� ������ Į�� ������ �������� ������ NATURAL JOIN�� ������ �Ǵ� Į������ �ٸ� Į������ ���� ��µȴ�
--EX)DEPTNO�� ù ��° Į���� �ȴ�. NATURAL JOIN�� ���ο� ���� ���� �̸��� Į���� �ϳ��� ó���Ѵ�.
SELECT
    *
FROM EMP A NATURAL JOIN DEPT B;

--INNER JOIN�� ��� ù ��° ���̺�, �� ��° ���̺��� Į�� ������� �����Ͱ� ��µȴ�. �̶� NATURAL ���ο� ����
--���� �̸��� Į���� �ϳ��� ó��������, INNER JOIN�� ������ Į������ ǥ���Ѵ�.

SELECT
    *
FROM EMP A INNER JOIN dept B 
ON b.deptno = a.deptno;

--NATURAL JOIN�� INNER JOIN�� ���̸� �����ϱ����� ���̺� �ӽ� ����
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;

UPDATE DEPT_TEMP
SET DNAME = 'CONSULTING'
WHERE DNAME = 'RESEARCH';

UPDATE DEPT_TEMP
SET DNAME = 'MARKETING'
WHERE DNAME = 'SALES';

SELECT
    *
FROM dept_temp;

-- �� ���� Į������ ��� ���� DEPT�� DEPT_TEMP ���̺��� (NATURAL,INNER) JOIN���� �����Ѵ�.
SELECT
    *
FROM dept A NATURAL INNER JOIN dept_temp B;
--INNER�� DEFAULT �ɼ����� �Ʒ��� ���� ���� �����ϹǷ� �� SQL�� �Ȱ��� ����� ���� �� �ִ�.
SELECT
    *
FROM DEPT A NATURAL JOIN dept_temp B;

-- �������� ���� ���������� ��� Į������ ���̰� ���� �Ϲ����� INNER JOIN�� �����Ѵ�.
SELECT
    *
FROM DEPT A JOIN dept_temp B
ON b.deptno = a.deptno
AND b.dname = a.dname
AND B.LOC = A.LOC;

-- �� ���� Į������ ��� ���� DEPT�� DEPT_TEMP ���̺��� DEPTNO Į���� �̿��� INNER JOIN�� USING �������� �����Ѵ�.
SELECT
    *
FROM dept A JOIN DEPT_TEMP B
USING (DEPTNO);

--USING �������� �̿��� EQUI JOIN������ NATURAL JOIN�� ���������� ���� Į���� ���ؼ��� ALIAS�� ���̺� �̸��� ���� ���λ縦 ���� �� ����.
SELECT A.DEPTNO, A.DNAME, A.LOC, B.DNAME, B.LOC
FROM DEPT A JOIN DEPT_TEMP B
USING (DEPTNO); --������

--A.DEPTNO ->DEPTNO�� �ٲ�
SELECT DEPTNO, A.DNAME, A.LOC, B.DNAME, B.LOC
FROM DEPT A JOIN DEPT_TEMP B
USING (DEPTNO);

--�ΰ��� ���̺��� �Ϻ� ������ ������ ����ƴ� DNAME Į���� ���� �������� INNER JOIN�� USING �������� �����Ѵ�.
SELECT
    *
FROM DEPT A JOIN dept_temp B
USING (dname) ;

-- �� ���� Į������ ��� ���� �� ���̺��� LOC�� DEPTNO 2�� Į���� �̿��� INNER JOIN�� USING �������� �����Ѵ�.
SELECT
    *
FROM DEPT A JOIN dept_temp B
USING (LOC, DEPTNO) ;


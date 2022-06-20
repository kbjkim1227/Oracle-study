-- �Ϲ������� �����Լ��� GROUP BY ���� ���� �������� �Ʒ��� ���� ���̺� ��ü�� �ϳ��� �׷��� �Ǵ� ��쿡�� 
-- GROUP BY �� ���� �ܵ����� ��� ����
SELECT COUNT (*) AS ��ü���, COUNT (HEIGHT) AS Ű�Ǽ�,
            MAX (HEIGHT) AS �ִ�Ű, MIN(HEIGHT) AS �ּ�Ű, ROUND(AVG (HEIGHT), 2) AS ���Ű
FROM PLAYER;

-- ���̸��� �������� �����Ǻ� ���Ű�� ��� �Ǵ°�?�� �䱸 ������ ����
-- GROUP BY ���� ������� �ʰ� �����Լ��� ������� �� � ����� ���̴��� �����Ǻ� ���Ű ���϶�
SELECT POSITION AS ������, AVG (HEIGHT) AS ���Ű
FROM PLAYER;
-- ���� �߻� '���� �׷��� �׷� �Լ��� �ƴ�'
-- SELECT ������ ���� �������̶�� �ѱ� ALIAS�� GROUP BY ���� �������� ���
SELECT POSITION AS ������, AVG (HEIGHT) AS ���Ű
FROM PLAYER
GROUP BY ������;
-- ���� �߻� "������" : �������� �ĺ��� 

-- �����Ǻ� �ִ�Ű, �ּ�Ű, ���Ű ���(�����Ǻ��̶� �ұ׷��� ������ �����߱� ������ GROUP BY �� ���
SELECT POSITION AS ������, COUNT(*) AS �ο���, COUNT (HEIGHT) AS Ű���,
       MAX(HEIGHT) AS �ִ�Ű, MIN(HEIGHT) AS �ּ�Ű, 
       ROUND(AVG(HEIGHT), 2) AS ���Ű
FROM PLAYER
GROUP BY POSITION;

-- ���̸��� �������� �����Ǻ� ���Ű�� ���ϴµ�, ���Ű�� 180CM �̻��� ������ ǥ�� 
SELECT POSITION AS ������, ROUND(AVG(HEIGHT), 2) AS ���Ű
FROM PLAYER
WHERE AVG (HEIGHT) >= 180
GROUP BY POSITION;
-- ���� �߻� : �׷� �Լ��� �㰡���� �ʽ��ϴ�

-- HAVING ���������� GROUP BY ������ ������ �ұ׷��� �����Լ��� �̿��� ������ ǥ���� �� ����
SELECT POSITION AS ������, ROUND(AVG(HEIGHT), 2) AS ���Ű
FROM PLAYER
GROUP BY POSITION
    HAVING AVG (HEIGHT) >= 180;

-- SQL ������ GROUP BY ���� HAVING ���� ������ �ٲپ ����
SELECT POSITION AS ������, ROUND(AVG(HEIGHT), 2) AS ���Ű
FROM PLAYER
    HAVING AVG (HEIGHT) >= 180
GROUP BY POSITION;

-- ���̸����� ������ �� �Ｚ�������� FC������ �ο����� ���ΰ��� �䱸���� ���� 
SELECT TEAM_ID AS ��ID, COUNT (*) AS �ο���
FROM PLAYER
WHERE TEAM_ID IN ('K09', 'K02')
GROUP BY TEAM_ID;

SELECT TEAM_ID AS ��ID, COUNT (*) AS �ο���
    FROM PLAYER
GROUP BY TEAM_ID
    HAVING TEAM_ID IN ('K09', 'K02');

-- �����Ǻ� ���Ű�� ����ϴµ� �ִ�Ű�� 190CM �̻��� ������ ���� �ִ� �������� ������ ���
SELECT POSITION AS ������, ROUND(AVG (HEIGHT), 2) AS ���Ű
    FROM PLAYER
GROUP BY POSITION
    HAVING MAX (HEIGHT) >= 190;
    
-- ���� ���� �Ի��������� ���� �����͸� �����ϴ� �۾��� ����, ���� ������ �ִٸ� ���� ����
SELECT ENAME AS �����, DEPTNO AS �μ���ȣ,
       EXTRACT (MONTH FROM HIREDATE) AS �Ի��, SAL AS �޿�
FROM EMP;
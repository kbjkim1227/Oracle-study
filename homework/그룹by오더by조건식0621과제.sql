-- MONTH �����͸� Simple Case Expression�� �̿��� 12���� Į������ ����
-- ���� ������� �����ִ� �����(ENAME)�� ������ �帧�� �����ϱ� ���� �ΰ������� �����ִ� �ӽ� ����
SELECT ENAME AS �����, DEPTNO AS �μ���ȣ, 
       CASE MONTH WHEN 1 THEN SAL END AS M01, CASE MONTH WHEN 2 THEN SAL END AS M02,
       CASE MONTH WHEN 3 THEN SAL END AS M03, CASE MONTH WHEN 4 THEN SAL END AS M04,
       CASE MONTH WHEN 5 THEN SAL END AS M05, CASE MONTH WHEN 6 THEN SAL END AS M06,
       CASE MONTH WHEN 7 THEN SAL END AS M07, CASE MONTH WHEN 8 THEN SAL END AS M08,
       CASE MONTH WHEN 9 THEN SAL END AS M09, CASE MONTH WHEN 10 THEN SAL END AS M10,
       CASE MONTH WHEN 11 THEN SAL END AS M11, CASE MONTH WHEN 12 THEN SAL END AS M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) AS MONTH, SAL FROM EMP);

-- �μ����� ���� �Ի����� ��� �޿��� �˰� �ʹٴ� �䱸���� : �μ��� ��հ� ���ϱ�
-- ���� ���ο� ���� ������ �ʿ� �����Ƿ� ����
SELECT DEPTNO AS �μ���ȣ,
       AVG (CASE MONTH WHEN 1 THEN SAL END) AS M01, AVG (CASE MONTH WHEN 2 THEN SAL END) AS M02,
       AVG (CASE MONTH WHEN 3 THEN SAL END) AS M03, AVG (CASE MONTH WHEN 4 THEN SAL END) AS M04,
       AVG (CASE MONTH WHEN 5 THEN SAL END) AS M05, AVG (CASE MONTH WHEN 6 THEN SAL END) AS M06,
       AVG (CASE MONTH WHEN 7 THEN SAL END) AS M07, AVG (CASE MONTH WHEN 8 THEN SAL END) AS M08,
       AVG (CASE MONTH WHEN 9 THEN SAL END) AS M09, AVG (CASE MONTH WHEN 10 THEN SAL END) AS M10,
       AVG (CASE MONTH WHEN 11 THEN SAL END) AS M11, AVG (CASE MONTH WHEN 12 THEN SAL END) AS M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) AS MONTH, SAL FROM EMP)
GROUP BY DEPTNO;

-- Simple Case Expression���� ǥ���� ���� SQL�� ���� �������� Oracle�� DECODE �Լ��� ����� SQL ���� �ۼ�
SELECT DEPTNO AS �μ���ȣ,
       AVG (DECODE (MONTH, 1, SAL)) AS M01, AVG (DECODE (MONTH, 2, SAL)) AS M02,
       AVG (DECODE (MONTH, 3, SAL)) AS M03, AVG (DECODE (MONTH, 4, SAL)) AS M04,
       AVG (DECODE (MONTH, 5, SAL)) AS M05, AVG (DECODE (MONTH, 6, SAL)) AS M06,
       AVG (DECODE (MONTH, 7, SAL)) AS M07, AVG (DECODE (MONTH, 8, SAL)) AS M08,
       AVG (DECODE (MONTH, 9, SAL)) AS M09, AVG (DECODE (MONTH, 10, SAL)) AS M10,
       AVG (DECODE (MONTH, 11, SAL)) AS M11, AVG (DECODE (MONTH, 12, SAL)) AS M12
FROM (SELECT ENAME, DEPTNO, EXTRACT (MONTH FROM HIREDATE) AS MONTH, SAL FROM EMP)
GROUP BY DEPTNO;


-- ���� �����Ǻ� FW, MF, DF, GK �������� �ο����� ���� ��ü �ο����� ���ϴ� SQL ������ �ۼ�(�����Ͱ� ���� ��� 0)
SELECT TEAM_ID,
        NVL (SUM (CASE POSITION WHEN 'FW' THEN 1 ELSE 0 END), 0) AS FW,
        NVL (SUM (CASE POSITION WHEN 'MF' THEN 1 ELSE 0 END), 0) AS MF,
        NVL (SUM (CASE POSITION WHEN 'DF' THEN 1 ELSE 0 END), 0) AS DF,
        NVL (SUM (CASE POSITION WHEN 'GK' THEN 1 ELSE 0 END), 0) AS GK,
        COUNT(*) AS SUM
FROM PLAYER
GROUP BY TEAM_ID;

-- CASE ǥ���� ELSE 0, ELSE NULL ������ ���� ����, �� ª�� SQL ���� �ۼ� ��������
SELECT TEAM_ID,
        NVL (SUM (CASE WHEN POSITION = 'FW' THEN 1 END), 0) AS FW,
        NVL (SUM (CASE WHEN POSITION = 'MF' THEN 1 END), 0) AS MF,
        NVL (SUM (CASE WHEN POSITION = 'DF' THEN 1 END), 0) AS DF,
        NVL (SUM (CASE WHEN POSITION = 'GK' THEN 1 END), 0) AS GK,
        COUNT(*) AS SUM
FROM PLAYER
GROUP BY TEAM_ID;

-- GROUP BY �� ���� ��ü �������� �����Ǻ� ���Ű �� ��ü ���Ű ��� ����
SELECT 
    ROUND (AVG (CASE WHEN POSITION = 'MF' THEN HEIGHT END), 2) AS �̵��ʴ�,
    ROUND (AVG (CASE WHEN POSITION = 'FW' THEN HEIGHT END), 2) AS ������,
    ROUND (AVG (CASE WHEN POSITION = 'DF' THEN HEIGHT END), 2) AS �����,
    ROUND (AVG (CASE WHEN POSITION = 'GK' THEN HEIGHT END), 2) AS �����,
    ROUND (AVG (HEIGHT), 2) ��ü���Ű
FROM PLAYER;

-- ���� ���̺��� �������� �̸�, ������, ��ѹ��� ����ϴµ� ��� �̸��� ������������ ����(ORDER BY ���)
SELECT PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�
FROM player
ORDER BY PLAYER_NAME DESC;

-- ���� ���̺��� �������� �̸�, ������, ��ѹ��� ����ϴµ� ��� �̸��� ������������ ����(Į���� �ƴ� ALIAS ���)
SELECT PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�
FROM player
ORDER BY ������ DESC;

-- �� ���� Į���� �ƴ� ���� ���� Į���� �������� ���� 
-- Ű�� ū �������, Ű�� ���� ��� ��ѹ� ������, Ű�� NULL�� �����ʹ� ����(ORDER BY ���)
SELECT PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY HEIGHT DESC, BACK_NO;

-- ���� ���̺��� �������� �̸�, ������, ��ѹ��� ����ϴµ� ��� �̸��� ������������ ����(ORDER BY ���)
SELECT PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE HEIGHT IS NOT NULL
ORDER BY 3 DESC, 2, 1;
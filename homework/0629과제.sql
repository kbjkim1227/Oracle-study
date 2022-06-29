SELECT B.TEAM_NAME AS ����, A.PLAYER_NAME AS ������, A.BACK_NO AS ��ѹ�
FROM (SELECT TEAM_ID, PLAYER_NAME, BACK_NO FROM PLAYER WHERE POSITION = 'MF') A, TEAM B
WHERE B.TEAM_ID = A.TEAM_ID
ORDER BY ������;

SELECT PLAYER_NAME ������, POSITION ������,
       BACK_NO ��ѹ�, HEIGHT Ű
FROM(SELECT PLAYER_NAME, POSITION, BACK_NO, 
     HEIGHT FROM PLAYER WHERE HEIGHT IS NOT NULL
    ORDER BY HEIGHT DESC)
WHERE ROWNUM <= 5;

SELECT A.TEAM_ID ���ڵ�, B.TEAM_NAME ����, ROUND(AVG(A.HEIGHT), 3) ���Ű
FROM PLAYER A, TEAM B
WHERE B.TEAM_ID = A.TEAM_ID
GROUP BY A.TEAM_ID, B.TEAM_NAME
HAVING AVG (A.HEIGHT) < (SELECT AVG(X.HEIGHT)
                        FROM PLAYER X
                        WHERE X.TEAM_ID IN (SELECT TEAM_ID FROM TEAM WHERE TEAM_NAME = '�Ｚ�������'));
                        
                        
SELECT PLAYER_NAME, POSITION, BACK_NO, TEAM_ID, TEAM_NAME
FROM V_PLAYER_TEAM
WHERE PLAYER_NAME LIKE 'Ȳ%';

-- ���̸��� �Ҽ� ������ �߿��� �Ҽ��� �Ｚ������� ���� �����巡�������� �����鿡 ���� ���� ��� �������
-- ���̸��� �Ҽ� ���� �� �Ｚ������� ���� ������� �����巡�������� �������� ������ ����
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
UNION
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K07';

-- ���̸��� �Ҽ� ������ �߿��� �Ҽ��� �Ｚ������� ���� ������� �������� ������� ������ ��ƺ���
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
UNION
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'GK';

-- ���� sql������ union all �̶�� ���� �����ڸ� �� ���
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
UNION ALL
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'GK';

SELECT ���ڵ�, ������, ������, ��ѹ�, Ű, COUNT(*) AS �ߺ���
FROM (SELECT TEAM_ID ���ڵ�, PLAYER_NAME AS ������, POSITION AS ������, BACK_NO AS ��ѹ�, HEIGHT AS Ű
FROM PLAYER
WHERE TEAM_ID = 'K02'
UNION ALL
SELECT TEAM_ID ���ڵ�, PLAYER_NAME ������, POSITION ������, BACK_NO ��ѹ�, HEIGHT Ű
FROM PLAYER
WHERE TEAM_ID = 'GK')
GROUP BY ���ڵ�, ������, ������, ��ѹ�, Ű 
HAVING COUNT (*) > 1;
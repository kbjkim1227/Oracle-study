SELECT 
PLAYER_NAME AS ������,
POSITION AS ��ġ,
HEIGHT AS Ű,
WEIGHT AS ������
FROM player;


SELECT 
PLAYER_NAME AS "���� ��",
POSITION AS ��ġ,
HEIGHT AS Ű,
WEIGHT AS ������
FROM player;


SELECT 
PLAYER_NAME AS ������,
HEIGHT - WEIGHT AS "Ű-������"
FROM player;


SELECT 
PLAYER_NAME AS ������,
ROUND (WEIGHT / ((HEIGHT / 100) * (HEIGHT / 100)), 2)
AS BMI������
FROM player;


SELECT 
PLAYER_NAME ||'����,'||HEIGHT||'cm,'||WEIGHT||'kg' AS ü������
FROM player;


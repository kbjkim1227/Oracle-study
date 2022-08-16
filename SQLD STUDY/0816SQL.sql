SELECT
    player_name   AS 선수명,
    position      AS 포지션,
    nvl(position, '업슴') AS nl포지션
FROM
    player
WHERE
    team_id = 'K08';

SELECT
    *
FROM
    emp
WHERE
    ename = 'FORD';

SELECT
    ename,
    empno,
    mgr,
    nullif(mgr, 7698) AS nuif
FROM
    emp;

SELECT
    SYSDATE + 2
FROM
    dual;

SELECT
    ename      AS 사원명,
    hiredate   AS 입사일자,
    EXTRACT(YEAR FROM hiredate) AS 입사년도,
    to_number(TO_CHAR(hiredate, 'MM')) AS 입사월
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    ename = 'KING';

SELECT
    ename,
    comm,
    sal,
    coalesce(SAL, COMM) AS coal 
    --coalesce괄호에 앞에 있는 숫자를 리턴, 앞이 NULL인 경우 뒤에 숫자 리턴, 둘다 NULL인 경우 NULL값으로 리턴--
FROM
    emp;
    
SELECT TEAM_ID AS 팀아이디, PLAYER_NAME AS 선수명, POSITION AS 포지션, BACK_NO AS 백넘버, HEIGHT AS 키 FROM PLAYER
WHERE TEAM_ID IN ('K02', 'K07');

SELECT * FROM PLAYER
WHERE TEAM_ID IN ('K02', 'K07');

SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '장_우'; --장 * 우가 일치하는 결과가 리턴--

SELECT * FROM PLAYER
WHERE PLAYER_NAME LIKE '장%';--장으로 시작하는 이름 리턴 

SELECT COUNT(*) AS 인원수, POSITION AS 포지션, AVG(HEIGHT) AS 평균키 FROM player GROUP BY position;

SELECT * FROM PLAYER WHERE position IS NULL ;


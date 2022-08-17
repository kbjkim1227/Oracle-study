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
    coalesce(sal, comm) AS coal 
    --coalesce괄호에 앞에 있는 숫자를 리턴, 앞이 NULL인 경우 뒤에 숫자 리턴, 둘다 NULL인 경우 NULL값으로 리턴--
FROM
    emp;

SELECT
    team_id       AS 팀아이디,
    player_name   AS 선수명,
    position      AS 포지션,
    back_no       AS 백넘버,
    height        AS 키
FROM
    player
WHERE
    team_id IN (
        'K02',
        'K07'
    );

SELECT
    *
FROM
    player
WHERE
    team_id IN (
        'K02',
        'K07'
    );

SELECT
    *
FROM
    player
WHERE
    player_name LIKE '장_우'; --장 * 우가 일치하는 결과가 리턴--

SELECT
    *
FROM
    player
WHERE
    player_name LIKE '장%';--장으로 시작하는 이름 리턴 

SELECT
    COUNT(*) AS 인원수,
    position   AS 포지션,
    AVG(height) AS 평균키
FROM
    player
GROUP BY
    position;

SELECT
    *
FROM
    player
WHERE
    position IS NULL;

SELECT
    position   AS 포지션,
    COUNT(*) AS 인원수,
    COUNT(height) AS 키대상선수,
    MIN(height) AS 최소키,
    MAX(height) AS 최대키,
    round(AVG(height), 2) AS 평균키
FROM
    player
GROUP BY
    position;

SELECT
    position   AS 포지션,
    round(AVG(height), 2) AS 평균키
FROM
    player
GROUP BY
    position
HAVING
    AVG(height) >= 180;

SELECT
    deptno   AS 부서번호,
    nvl(AVG(CASE month
        WHEN 1   THEN sal
    END), 0) AS m01,
    AVG(CASE month
        WHEN 2   THEN sal
    END) AS m02,
    AVG(CASE month
        WHEN 3   THEN sal
    END) AS m03,
    AVG(DECODE(month, 4, sal)) AS m04,
    AVG(DECODE(month, 5, sal)) AS m05,
    AVG(DECODE(month, 6, sal)) AS m06
FROM
    (
        SELECT
            ename,
            deptno,
            EXTRACT(MONTH FROM hiredate) AS month,
            sal
        FROM
            emp
    )
GROUP BY
    deptno
ORDER BY
    deptno ASC;

SELECT
    player_name   AS 선수명,
    position      AS 포지션,
    back_no       AS 백넘버,
    height        AS 키
FROM
    player
WHERE
    height IS NOT NULL
ORDER BY
    height DESC,
    back_no;

SELECT
    player_name   AS 선수명,
    position      AS 포지션,
    back_no       AS 백넘버
FROM
    player
WHERE
    back_no IS NOT NULL
ORDER BY
    3 DESC,
    2,
    3;
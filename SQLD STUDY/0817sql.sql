SELECT * FROM emp ORDER by mgr desc;

select job, sum(sal) as SUM
from emp group by job
--HAVING sum(sal)>5000
ORDER by sum(sal);

SELECT player.player_name, player.team_id,team.team_name, team.region_name
from player, team WHERE team.team_id = player.team_id;
ORDER BY team.region_name;

SELECT
    *
FROM emp a natural join dept b ;

SELECT
    *
FROM dept b inner join emp a
on a.deptno=b.deptno;

SELECT
    count(*)
FROM emp where 1=0;


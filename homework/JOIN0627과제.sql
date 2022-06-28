--deptno,dname 2���� Į���� �̿��� INNER JOIN�� USING �������� �����Ѵ�.
SELECT *
FROM dept A JOIN dept_temp B 
USING (deptno,dname);

--��� ���̺�� �μ� ���̺��� ��� ��ȣ�� ��� �̸�, �ҼӺμ� �ڵ�, �ҼӺμ� �̸��� ����Ѵ�.
SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a JOIN dept b
ON (b.deptno = a.deptno);

--ON �������� WHERE �˻� ������ �浹 ���� ����� �� �ִ�.
--�μ���ȣ 30�� �μ��� �Ҽӻ�� �̸� �� �Ҽ� �μ���ȣ, �μ���
SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
WHERE b.deptno = 30;

--�Ŵ��� ���ʹ�ȣ�� 7698���� ������� �̸�, �Ŵ��� �����ȣ, �Ҽ� �μ���ȣ, �μ� �̸��� ã�ƺ���.
SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
AND a.mgr = 7698;

SELECT a.empno, a.ename, b.deptno, b.dname
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
WHERE a.mgr = 7698;

--���� ����� ���̺��� �����ID�� ������ ���̸�, �����ID, �������� ã�ƺ���.
SELECT a.team_name, a.stadium_id, b.stadium_name
FROM team a JOIN stadium b
ON (b.stadium_id = a.stadium_id)
ORDER BY a.stadium_id;

--USING �������� ������ �� �ִ�.
SELECT a.team_name, stadium_id, b.stadium_name
FROM team a JOIN stadium b
USING (stadium_id)
ORDER BY stadium_id;

--���� ����� ���̺��� ��ID�� ������ ���̸�,��ID,�������� ã�ƺ���. 
--����忡�� ��ID�� HOMETEAM_ID��� Į������ ǥ�õȴ�.
--USING �������� ����� �� ����.
SELECT a.team_name, a.team_id, b.stadium_name
FROM team a JOIN stadium b
ON (b.hometeam_id = a.team_id)
ORDER BY a.team_id;

--����� DEPT ���̺��� �Ҽ� �μ���, DEPT_TEMP ���̺��� �ٲ� �μ��� ������ ����Ѵ�.
SELECT a.empno, a.deptno, b.dname, c.dname AS NEW_DNAME
FROM emp a JOIN dept b
ON (b.deptno = a.deptno)
JOIN dept_temp c
ON c.deptno = b.deptno;

--GK �������� ������ ��������, ����, ������� ����Ѵ�.
SELECT a.player_name ������, a.position ������, b.team_name ��������, b.team_name ����, c.stadium_name ���ܸ�
FROM player a JOIN team b
ON (b.team_id = a.team_id)
JOIN stadium c
ON c.stadium_id = b.stadium_id
WHERE a.position = 'GK'
ORDER BY ������;

--Ȩ���� 3�� �̻� ���̷� �¸��� ����� ����� �̸�, �������, Ȩ�� �̸��� ������ �̸� ������ ����Ѵ�.
SELECT b.stadium_name, b.stadium_id, a.sche_date, c.team_name, c.team_name, a.home_score, a.away_score
FROM schedule a JOIN stadium b
ON b.stadium_id = a.stadium_id
JOIN team c
ON c.team_id = a.hometeam_id
JOIN team d
ON d.team_id = a.awayteam_id
WHERE a.home_score >= a.away_score + 3;

���, �μ� ���̺��� CROSS JOIN �� ��� �̸� �� �Ҽ� �μ� �̸��� ��ȸ�غ���.
SELECT a.ename, b.dname
FROM emp a CROSS JOIN dept b
ORDER BY a.ename;














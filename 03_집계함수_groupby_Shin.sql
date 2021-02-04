/* **************************************************************************
����(Aggregation) �Լ��� GROUP BY, HAVING
************************************************************************** */

select emp_name
from emp
where salary < 10000;
/* ************************************************************
�����Լ�, �׷��Լ�, ������ �Լ�
- �μ�(argument)�� �÷�.
  - sum(): ��ü�հ�
  - avg(): ���
  - min(): �ּҰ�
  - max(): �ִ밪
  - stddev(): ǥ������
  - variance(): �л�
  - count(): ����
        - �μ�: 
            - �÷���: null�� ������ �������� ����
            -  *: ��ü ���(null�� ����)

- count(*)�Լ��� ������ ��� �����Լ��� null�� ���� ����Ѵ�.
- sum, avg, stddev, variance: number Ÿ�Կ��� ��밡��.
- min, max, count :  ��� Ÿ�Կ� �� ��밡��.
************************************************************* */

-- EMP ���̺��� �޿�(salary)�� ���հ�, ���, �ּҰ�, �ִ밪, ǥ������, �л�, ���������� ��ȸ 
select sum(salary), 
       round(avg(salary),2),
       min(salary),
       max(salary),
       round(STDDEV(salary),2) as ǥ������, 
       round(VARIANCE(salary),2) as �л�, 
       count(*)
from emp;

-- EMP ���̺��� ���� �ֱ� �Ի���(hire_date)�� ���� ������ �Ի����� ��ȸ
select max(hire_date), min(hire_date)
from emp;


-- EMP ���̺��� �μ�(dept_name) �� ������ ��ȸ

select count(DISTINCT(dept_name))
from emp;
select count(DISTINCT nvl(dept_name, '�̹�ġ'))
from emp;
-- emp ���̺��� job ������ ���� ��ȸ

select count(DISTINCT job)
from emp;

select count(DISTINCT nvl(job, '�̹�ġ'))
from emp;

--TODO:  Ŀ�̼� ����(comm_pct)�� �ִ� ������ ���� ��ȸ

SELECT COUNT(COMM_PCT)
FROM EMP;

--TODO: Ŀ�̼� ����(comm_pct)�� ���� ������ ���� ��ȸ

SELECT COUNT(*) - COUNT(COMM_PCT)
FROM EMP;

--TODO: ���� ū Ŀ�̼Ǻ���(comm_pct)�� �� ���� ���� Ŀ�̼Ǻ����� ��ȸ

SELECT MAX(COMM_PCT), MIN(COMM_PCT)
FROM EMP;

--TODO:  Ŀ�̼� ����(comm_pct)�� ����� ��ȸ. 
--�Ҽ��� ���� 2�ڸ����� ���

SELECT ROUND(AVG(COMM_PCT),3),--Ŀ�̼��� �����ϴ� �����鸸�� ���.
       round(avg(nvl(comm_pct, 0)),3) as avg -- ��ü������ ���, nvl�� null�λ���� 0���� ����.
FROM EMP;

--TODO: ���� �̸�(emp_name) �� ���������� �����Ҷ� ���� ���߿� ��ġ�� �̸��� ��ȸ.

SELECT MAX(EMP_NAME), min(emp_name)
FROM EMP;

select emp_name
from emp
order by 1 desc;

--TODO: �޿�(salary)���� �ְ� �޿��װ� ���� �޿����� ������ ���

SELECT MAX(SALARY) - MIN(SALARY),MAX(SALARY),  MIN(SALARY)
FROM EMP;

--TODO: ���� �� �̸�(emp_name)�� ����� ���� ��ȸ.

SELECT MAX(LENGTH(EMP_NAME))
FROM EMP;

SELECT EMP_NAME
FROM EMP
where length(emp_name) = (select max(length(emp_name)) from emp); -- subquery
-- where length(emp_name) = max(length(emp_name)); -- where �������� ����(�׷�)�Լ��� ��� ����.

--TODO: EMP ���̺��� �μ�(dept_name)�� �������� �ִ��� ��ȸ. 
-- ���������� ����

SELECT count(distinct nvl(dept_name, 'a')) as null����, --null�� a�� �־ null�����ؼ� ��.
       COUNT(DISTINCT DEPT_NAME) as null���� ---null ������ ��.
FROM EMP;

SELECT DISTINCT DEPT_NAME
FROM EMP;


/* *****************************************************
group by ��
- Ư�� �÷�(��)�� ������ ���� ������ �� ������ �����÷��� �����ϴ� ����.
	- ��) ������ �޿����. �μ�-������ �޿� �հ�. ���� �������
- ����: group by �÷��� [, �÷���]
	- �÷�: �з���(������, �����) - �μ��� �޿� ���, ���� �޿� �հ�
	- select�� where �� ������ ����Ѵ�.
	- select ������ group by ���� ������ �÷��鸸 �����Լ��� ���� �� �� �ִ�
*******************************************************/

-- ����(job)�� �޿��� ���հ�, ���, �ּҰ�, �ִ밪, ǥ������, �л�, �������� ��ȸ

select job, sum(salary) as sum, 
       round(avg(salary),2) as avg,
       min(salary) as min,
       max(salary) as max,
       round(STDDEV(salary),2) as ǥ������, 
       round(VARIANCE(salary),2) as �л�, 
       count(*) as ������
from emp
group by job
order by avg(salary) desc;

select DISTINCT job from emp;
-- �Ի翬�� �� �������� �޿� ���.
select EXTRACT(year from hire_date), round(avg(salary),2) as avg
from emp
group by EXTRACT(year from hire_date)
order by 1;

-- �μ���(dept_name) �� 'Sales'�̰ų� 'Purchasing' �� �������� ������ (job) �������� ��ȸ
select dept_name, job, count(job) as ������
from emp
where dept_name in ('Sales', 'Purchasing')
group by dept_name,job
order by 1;

-- �μ�(dept_name), ����(job) �� �ִ� ��ձ޿�(salary)�� ��ȸ.
select dept_name, job, max(salary)
from emp
group by dept_name, job
order by 1;

-- �޿�(salary) ������ �������� ���. �޿� ������ 10000 �̸�,  10000�̻� �� ����.
select case when salary >= 10000 then '10000 �̻�'
            else '10000 �̸�' end as sal, count(*)
from emp
group by case when salary >= 10000 then '10000 �̻�' 
              else '10000 �̸�' end;


select salary, case when salary >= 10000 then '10000 �̻�'
              else '10000 �̸�' end
from emp;

--TODO: �μ���(dept_name) �������� ��ȸ

SELECT DEPT_NAME, COUNT(*)
FROM EMP
GROUP BY DEPT_NAME
order by 2 desc;

--TODO: ������(job) �������� ��ȸ. �������� ���� �ͺ��� ����.
SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
ORDER BY 2 DESC;


--TODO: �μ���(dept_name), ����(job)�� ������, �ְ�޿�(salary)�� ��ȸ. �μ��̸����� �������� ����.

SELECT DEPT_NAME, JOB,count(*), MAX(SALARY)
FROM EMP
GROUP BY DEPT_NAME, JOB
ORDER BY DEPT_NAME;

--TODO: EMP ���̺��� �Ի翬����(hire_date) �� �޿�(salary)�� �հ��� ��ȸ. 
--(�޿� �հ�� �ڸ������� , �� �����ÿ�. ex: 2,000,000)

SELECT EXTRACT(YEAR FROM HIRE_DATE), TO_CHAR(SUM(SALARY),'FM9,999,999')
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIRE_DATE);

SELECT TO_CHAR(HIRE_DATE, 'YYYY') AS �Ի�⵵, TO_CHAR(SUM(SALARY), 'FM9,999,999') AS �޿��հ�
FROM EMP
GROUP BY TO_CHAR(HIRE_DATE, 'YYYY');

--TODO: ����(job)�� �Ի�⵵(hire_date)�� ��� �޿�(salary)�� ��ȸ

SELECT JOB, EXTRACT(YEAR FROM HIRE_DATE), ROUND(AVG(SALARY),2)
FROM EMP
GROUP BY JOB, EXTRACT(YEAR FROM HIRE_DATE)
ORDER BY 1;

--TODO: �μ���(dept_name) ������ ��ȸ�ϴµ� �μ���(dept_name)�� null�� ���� �����ϰ� ��ȸ.
---?????
SELECT COUNT(*), DEPT_NAME
FROM EMP
WHERE dept_name IS NOT NULL
GROUP BY DEPT_NAME;

--TODO �޿� ������ �������� ���. �޿� ������ 5000 �̸�, 5000�̻� 10000 �̸�, 10000�̻� 20000�̸�, 20000�̻�. 
SELECT CASE WHEN SALARY <5000 THEN '5000 �̸�'
            WHEN SALARY BETWEEN 5000 AND 9999.99  THEN '5000�̻� 10000 �̸�'
            WHEN SALARY BETWEEN 10000 AND 19999.99 THEN '10000�̻� 20000�̸�'
            ELSE '20000 �̻�' END AS "�޿�����", COUNT(*)
FROM EMP
GROUP BY CASE WHEN SALARY <5000 THEN '5000 �̸�'
            WHEN SALARY BETWEEN 5000 AND 9999.99  THEN '5000�̻� 10000 �̸�'
            WHEN SALARY BETWEEN 10000 AND 19999.99 THEN '10000�̻� 20000�̸�'
            ELSE '20000 �̻�' END
ORDER BY 2 DESC;


/* **************************************************************
having ��
- �������� ���� �� ���� ����
- group by ���� order by ���� �´�.
- ����
    having ��������  --�����ڴ� where���� �����ڸ� ����Ѵ�. �ǿ����ڴ� �����Լ�(�� ���)
************************************************************** */
-- �������� 10 �̻��� �μ��� �μ���(dept_name)�� �������� ��ȸ

SELECT DEPT_NAME, TO_CHAR(SUM(SALARY),'$999,999'), COUNT(*)
FROM EMP
GROUP BY dept_name
HAVING COUNT(*)>=10
ORDER BY 2 DESC;

--TODO: 15�� �̻��� �Ի��� �⵵�� (�� �ؿ�) �Ի��� �������� ��ȸ.

SELECT EXTRACT(YEAR FROM HIRE_DATE), COUNT(*), MAX(SALARY)
FROM EMP
GROUP BY EXTRACT(YEAR FROM HIRE_DATE)
HAVING COUNT(*)>=15;

SELECT TO_CHAR(HIRE_DATE, 'YYYY'), COUNT(*), MAX(SALARY)
FROM EMP
GROUP BY TO_CHAR(HIRE_DATE,'YYYY')
HAVING COUNT(*)>=15;
--TODO: �� ����(job)�� ����ϴ� ������ ���� 10�� �̻��� ����(job)��� ��� �������� ��ȸ

SELECT JOB, COUNT(*)
FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 10;


--TODO: ��� �޿���(salary) $5000�̻��� �μ��� �̸�(dept_name)�� ��� �޿�(salary), �������� ��ȸ

SELECT DEPT_NAME, ROUND(AVG(SALARY),2), COUNT(*)
FROM EMP
GROUP BY DEPT_NAME
HAVING AVG(SALARY)>= 5000;


--TODO: ��ձ޿��� $5,000 �̻��̰� �ѱ޿��� $50,000 �̻��� �μ��� �μ���(dept_name), ��ձ޿��� �ѱ޿��� ��ȸ

SELECT DEPT_NAME, ROUND(AVG(SALARY),2), SUM(SALARY)
FROM EMP
GROUP BY DEPT_NAME
HAVING AVG(SALARY)>=5000 AND SUM(SALARY)>=50000;


--TODO ������ 2�� �̻��� �μ����� �̸��� �޿��� ǥ�������� ��ȸ

SELECT DEPT_NAME, ROUND(STDDEV(SALARY),2), COUNT(*)
FROM EMP
GROUP BY DEPT_NAME
HAVING COUNT(*)>=2
ORDER BY 3 DESC;



/* **************************************************************
- rollup : group by�� Ȯ��. # �߰����質 �����踦 ���鶧 ���.
  - �ΰ� �̻��� �÷��� group by�� ���� ��� ��������(�߰����質 ������)�� �κ� ���迡 �߰��ؼ� ��ȸ�Ѵ�.
  - ���� : group by rollup(�÷��� [,�÷���,..])



- grouping(), grouping_id()
  - rollup �̿��� ����� �÷��� �� ���� ���迡 �����ߴ��� ���θ� ��ȯ�ϴ� �Լ�.
  - case/decode�� �̿��� ���̺��� �ٿ� �������� ���� �� �ִ�.
  - ��ȯ��
	- 0 : ������ ���
	- 1 : ���� ���� ���.
 

- grouping() �Լ� 
 - ����: grouping(groupby�÷�)
 - select ���� ���Ǹ� rollup�̳� cube�� �Բ� ����ؾ� �Ѵ�.
 - group by�� �÷��� �����Լ��� ���迡 �����ߴ��� ���θ� ��ȯ
	- ��ȯ�� 0 : ������(�κ������Լ� ���), ��ȯ�� 1: ���� ����(���������� ���)
 - ���� �������� �κ������� ��������� �˷��ִ� �� �� �ִ�. 



- grouping_id()
  - ����: grouping_id(groupby �÷�, ..)
  - ������ �÷��� ���迡 ���Ǿ����� ���� 2����(0: ���� ����, 1: ������)�� ��ȯ �ѵ� 10������ ��ȯ�ؼ� ��ȯ�Ѵ�.
 
************************************************************** */

-- EMP ���̺��� ����(job) �� �޿�(salary)�� ��հ� ����� �Ѱ赵 ���̳������� ��ȸ.
SELECT JOB, ROUND(AVG(SALARY),2) AS "���"
FROM EMP
GROUP BY ROLLUP(JOB); -- ROLLUP ����հ�.


-- EMP ���̺��� ����(JOB) �� �޿�(salary)�� ��հ� ����� �Ѱ赵 ���̳������� ��ȸ.
-- ���� �÷���  �Ұ質 �Ѱ��̸� '�����'��  �Ϲ� �����̸� ����(job)�� ���

SELECT DECODE(GROUPING(JOB),0, JOB, 1, '�����'), COUNT(*), ROUND(AVG(SALARY),2) AS "���", SUM(SALARY)
FROM EMP
GROUP BY ROLLUP(JOB);

SELECT DECODE(GROUPING_ID(JOB),0, JOB, 1, '�����'), COUNT(*), ROUND(AVG(SALARY),2) AS "���", SUM(SALARY)
FROM EMP
GROUP BY ROLLUP(JOB);

-- EMP ���̺��� �μ�(dept_name), ����(job) �� salary�� �հ�� �������� �Ұ�� �Ѱ谡 �������� ��ȸ
SELECT DECODE(GROUPING(DEPT_NAME),0,DEPT_NAME,1,'�Ѱ�'), 
       DECODE(GROUPING(JOB),0,JOB,1,'�Ұ�'),  COUNT(*), SUM(SALARY)
FROM EMP
GROUP BY ROLLUP(DEPT_NAME, JOB)
ORDER BY DEPT_NAME;

SELECT GROUPING_ID(DEPT_NAME, JOB),  COUNT(*), SUM(SALARY)
FROM EMP
GROUP BY ROLLUP(DEPT_NAME, JOB)
ORDER BY DEPT_NAME;

SELECT DECODE(GROUPING_ID(DEPT_NAME,JOB),0,nvl(dept_name,'�̹�ġ')||'-'||job,
                                         1,nvl(dept_name,'�̹�ġ')||' �Ұ�',
                                         3,'�Ѱ�'), COUNT(*), SUM(SALARY)
FROM EMP
GROUP BY ROLLUP(DEPT_NAME, JOB)
ORDER BY dept_name;

--# �Ѱ�/�Ұ� ���� ��� :  �Ѱ�� '�Ѱ�', �߰������ '��' �� ���
--TODO: �μ���(dept_name) �� �ִ� salary�� �ּ� salary�� ��ȸ

SELECT decode(grouping_id(dept_name),0,nvl(DEPT_NAME,'�̹�ġ'),
                                     1,'�Ѱ�') as �μ�, MAX(SALARY), MIN(SALARY)
FROM EMP
GROUP BY ROLLUP(DEPT_NAME);


SELECT NVL(decode(grouping_id(dept_name),0,DEPT_NAME,
                                     1,'�Ѱ�'),'�̹�ġ') as �μ�, MAX(SALARY), MIN(SALARY)
FROM EMP
GROUP BY ROLLUP(DEPT_NAME);

--TODO: ���_id(mgr_id) �� ������ ���� �Ѱ踦 ��ȸ�Ͻÿ�.

select decode(grouping_id(mgr_id),0,nvl(to_char(mgr_id),'������'),
                                  1,'�Ѱ�') as ���ID, COUNT(*),max(salary)
from emp
group by rollup(mgr_id);

select NVL(decode(grouping_id(mgr_id),0,TO_CHAR(mgr_id),
                                      1,'�Ѱ�'),'������') as ���ID, COUNT(*), max(salary)
from emp
group by rollup(mgr_id);

select NVL(decode(grouping_id(mgr_id),1,'�Ѱ�', --DECODE��ȯ������ ���ڿ��� �ٸ�Ÿ���� ����Ұ�� ���ڿ��� ���� ���.
                                      0,mgr_id),'������') as ���ID, COUNT(*), max(salary)
from emp
group by rollup(mgr_id);

--TODO: �Ի翬��(hire_date�� year)�� �������� ���� ���� �հ� �׸��� �Ѱ谡 ���� ��µǵ��� ��ȸ.

select decode(grouping_id(EXTRACT(year from hire_date)),0,TO_CHAR(EXTRACT(year from hire_date)),
                                                        1,'�Ѱ�')as �Ի�⵵, count(*), sum(salary)
from emp
group by rollup(EXTRACT(year from hire_date));


SELECT DECODE(GROUPING_ID(TO_CHAR(HIRE_DATE,'YYYY')),1,'�Ѱ�',TO_CHAR(HIRE_DATE,'YYYY')),
       COUNT(*),
       SUM(SALARY)
FROM EMP
GROUP BY ROLLUP(TO_CHAR(HIRE_DATE,'YYYY'));

--TODO: �μ���(dept_name), �Ի�⵵�� ��� �޿�(salary) ��ȸ. �μ��� ����� �����谡 ���� �������� ��ȸ

select decode(grouping_id(dept_name, EXTRACT(year from hire_date)),0,nvl(dept_name,'�̹�ġ')||'-'||EXTRACT(year from hire_date),
                                                                   1,nvl(dept_name,'�̹�ġ')||' ����',
                                                                   3,'�Ѱ�')as �μ���, round(avg(salary),2)
from emp
group by rollup(dept_name, EXTRACT(year from hire_date))
order by dept_name;

SELECT DECODE(GROUPING_ID(DEPT_NAME, TO_CHAR(HIRE_DATE,'YYYY')),0, NVL(DEPT_NAME, '�̹�ġ')||'-'||TO_CHAR(HIRE_DATE,'YYYY'),
                                                                1, NVL(DEPT_NAME, '�̹�ġ')||' �߰�����',
                                                                '�Ѱ�'),
       ROUND(AVG(SALARY),2)
FROM EMP
GROUP BY ROLLUP(DEPT_NAME, TO_CHAR(HIRE_DATE,'YYYY'))
ORDER BY DEPT_NAME;


SELECT GROUPING_ID(DEPT_NAME, TO_CHAR(HIRE_DATE,'YYYY')),
       ROUND(AVG(SALARY),2)
FROM EMP
GROUP BY ROLLUP(DEPT_NAME, TO_CHAR(HIRE_DATE,'YYYY'))
ORDER BY DEPT_NAME;
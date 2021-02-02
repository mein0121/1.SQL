/* ****************************************
����(JOIN) �̶�
- 2�� �̻��� ���̺� �ִ� �÷����� ���ļ� ������ ���̺��� ����� ��ȸ�ϴ� ����� ���Ѵ�.
 	- �ҽ����̺� : ���� ���� �о�� �Ѵٰ� �����ϴ� ���̺�
	- Ÿ�����̺� : �ҽ��� ���� �� �ҽ��� ������ ����� �Ǵ� ���̺�
 
- �� ���̺��� ��� ��ĥ���� ǥ���ϴ� ���� ���� �����̶�� �Ѵ�.
    - ���� ���꿡 ���� ��������
        - Equi join , non-equi join
- ������ ����
    - Inner Join 
        - ���� ���̺��� ���� ������ �����ϴ� ��鸸 ��ģ��. 
    - Outer Join
        - ���� ���̺��� ����� ��� ����ϰ� �ٸ� �� ���̺��� ���� ������ �����ϴ� �ุ ��ģ��. ���������� �����ϴ� ���� ���� ��� NULL�� ��ģ��.
        - ���� : Left Outer Join,  Right Outer Join, Full Outer Join
    - Cross Join
        - �� ���̺��� �������� ��ȯ�Ѵ�. 
- ���� ����
    - ANSI ���� ����
        - ǥ�� SQL ����
        - ����Ŭ�� 9i ���� ����.
    - ����Ŭ ���� ����
        - ����Ŭ ���� �����̸� �ٸ� DBMS�� �������� �ʴ´�.
**************************************** */        
        

/* ****************************************
-- inner join : ANSI ���� ����
FROM  ���̺�a INNER JOIN ���̺�b ON �������� 

- inner�� ���� �� �� �ִ�.
**************************************** */
-- ������ ID(emp.emp_id), �̸�(emp.emp_name), �Ի�⵵(emp.hire_date), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ

--- ansi
select emp_id, emp_name, hire_date, dept_name
from emp inner join dept on emp.dept_id = dept.dept_id (+);



select emp_id, emp_name, hire_date, dept_name
from emp e, dept d
where e.dept_id = d.dept_id (+)
order by emp_id;


select * from emp;

-- ������ ID(emp.emp_id)�� 100�� ������ ����_ID(emp.emp_id), �̸�(emp.emp_name), �Ի�⵵(emp.hire_date), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ.
select emp_id, emp_name, to_char(hire_date,'yyyy"��"'),dept_name
from emp e inner join dept d on e.dept_id = d.dept_id 
where e.emp_id = 100;



select emp_id, emp_name, EXTRACT(year from hire_date),dept_name
from emp e, dept d
where e.dept_id = d.dept_id and e.emp_id = 100;

-- ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), ��������(job.job_title), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ
 select emp_id, emp_name,salary, j.job_title, d.dept_name
 from emp e join job j on e.job_id = j.job_id
            join dept d on e.dept_id = d.dept_id;
 
 
 
 select emp_id, emp_name, salary, job_title, dept_name
 from emp e, dept d, job j
 where e.job_id = j.job_id and e.dept_id = d.dept_id;


-- �μ�_ID(dept.dept_id)�� 30�� �μ��� �̸�(dept.dept_name), ��ġ(dept.loc), �� �μ��� �Ҽӵ� ������ �̸�(emp.emp_name)�� ��ȸ.
select d.dept_name, d.loc, e.emp_name
from dept d join emp e on d.dept_id = e.dept_id
where d.dept_id = 30;



-- ������ ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), �޿����(salary_grade.grade) �� ��ȸ. �޿� ��� ������������ ����

select e.emp_id, e.emp_name, e.salary, s.grade
from emp e join salary_grade s on e.salary between s.low_sal and s.high_sal
order by s.grade;

select e.emp_id, e.emp_name, e.salary, s.grade
from emp e, salary_grade s
where e.salary between s.low_sal and s.high_sal
order by s.grade;

--TODO 200����(200 ~ 299) ���� ID(emp.emp_id)�� ���� �������� ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), 
--     �ҼӺμ��̸�(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ. ����_ID�� ������������ ����.
select emp_id, salary, dept_name, loc
FROM emp e join dept d on e.dept_id = d.dept_id
where e.emp_id between 200 and 299
order by emp_id desc;

select emp_id, salary, dept_name, loc
FROM emp e, dept d 
where e.dept_id = d.dept_id and  e.emp_id between 200 and 299
order by emp_id desc;

--TODO ����(emp.job_id)�� 'FI_ACCOUNT'�� ������ ID(emp.emp_id), �̸�(emp.emp_name), ����(emp.job_id), 
--     �ҼӺμ��̸�(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ.  ����_ID�� ������������ ����.

select e.job_id, e.emp_id, e.emp_name, d.dept_name, d.loc
from emp e join dept d on  e.dept_id = d.dept_id
where e.job_id in 'FI_ACCOUNT'
order by 1;


--TODO Ŀ�̼Ǻ���(emp.comm_pct)�� �ִ� �������� ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), Ŀ�̼Ǻ���(emp.comm_pct), 
--     �ҼӺμ��̸�(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ. ����_ID�� ������������ ����.

select emp_id, emp_name, salary, comm_pct, dept_name, loc
from emp e JOIN dept d ON e.dept_id = d.dept_id
where e.comm_pct is not null 
order by 1;





--TODO 'New York'�� ��ġ��(dept.loc) �μ��� �μ�_ID(dept.dept_id), �μ��̸�(dept.dept_name), ��ġ(dept.loc), 
--     �� �μ��� �Ҽӵ� ����_ID(emp.emp_id), ���� �̸�(emp.emp_name), ����(emp.job_id)�� ��ȸ. �μ�_ID �� ������������ ����.

select d.dept_id, d.dept_name, d.loc, e.emp_id, e.emp_name, e.job_id
from dept d join emp e on e.dept_id = d.dept_id
where d.loc in 'New York'
order by 1;

--TODO ����_ID(emp.emp_id), �̸�(emp.emp_name), ����_ID(emp.job_id), ������(job.job_title) �� ��ȸ.

select e.emp_id, e.emp_name, e.job_id, j.job_title
from emp e join job j on e.job_id = j.job_id
order by 1;

select e.emp_id, e.emp_name, e.job_id, j.job_title
from emp e join job j on e.job_id = j.job_id (+)
order by 1;
              
-- TODO: ���� ID �� 200 �� ������ ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), 
--       ��������(job.job_title), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ              

select e.emp_id, e.salary, j.job_title, d.dept_name
from emp e join dept d on e.dept_id = d.dept_id join job j on e.job_id = j.job_id 
where e.emp_id = 200;




-- TODO: 'Shipping' �μ��� �μ���(dept.dept_name), ��ġ(dept.loc), �Ҽ� ������ �̸�(emp.emp_name), ������(job.job_title)�� ��ȸ. 
--       �����̸� ������������ ����
select d.dept_name, d.loc, e.emp_name, j.job_title
from emp e join dept d  on e.dept_id = d.dept_id join job j on e.job_id = j.job_id
where d.dept_name in 'Shipping'
order by 3;



-- TODO:  'San Francisco' �� �ٹ�(dept.loc)�ϴ� ������ id(emp.emp_id), �̸�(emp.emp_name), �Ի���(emp.hire_date)�� ��ȸ
--         �Ի����� 'yyyy-mm-dd' �������� ���

select e.emp_id, e.emp_name, to_char(e.hire_date, 'yyyy"-"mm"-"dd') as "�Ի���", d.loc
from dept d join emp e on e.dept_id = d.dept_id 
WHERE d.loc in 'San Francisco'
order by 1;


-- TODO �μ��� �޿�(salary)�� ����� ��ȸ. �μ��̸�(dept.dept_name)�� �޿������ ���. �޿� ����� ���� ������ ����.
-- �޿��� , ���������ڿ� $ �� �ٿ� ���.

select to_char(avg(e.salary),'$999,999.00') as ��ձ޿�, d.dept_name
from emp e join dept d on e.dept_id = d.dept_id
group by d.dept_name, d.dept_id
order by 1 desc;


--TODO ������ ID(emp.emp_id), �̸�(emp.emp_name), ������(job.job_title), �޿�(emp.salary), 
--     �޿����(salary_grade.grade), �ҼӺμ���(dept.dept_name)�� ��ȸ. ��� ������������ ����
select e.emp_id, 
       e.emp_name, 
       j.job_title, 
       e.salary, 
       s.grade, 
       d.dept_name
from emp e join job j on e.job_id = j.job_id 
           join dept d on e.dept_id = d.dept_id 
           join salary_grade s on e.salary between s.low_sal and s.high_sal
order by 5 desc;


--TODO �μ��� �޿������(salary_grade.grade) 1�� �����ִ� �μ��̸�(dept.dept_name)�� 1����� ������ ��ȸ. �������� ���� �μ� ������� ����.
select d.dept_name, count(*)
from emp e join dept d on e.dept_id = d.dept_id 
           join salary_grade s on e.salary between s.low_sal and s.high_sal
where s.grade = 1
group by d.dept_name, d.dept_id
order by 1;


/* ###################################################################################### 
����Ŭ ���� 
- Join�� ���̺���� from���� �����Ѵ�.
- Join ������ where���� ����Ѵ�. 

###################################################################################### */
-- ������ ID(emp.emp_id), �̸�(emp.emp_name), �Ի�⵵(emp.hire_date), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ
-- �Ի�⵵�� �⵵�� ���
select e.emp_id, e.emp_name, to_char(e.hire_date,'yyyy'), d.dept_name
from emp e, dept d
where e.dept_id = d.dept_id;


-- ������ ID(emp.emp_id)�� 100�� ������ ����_ID(emp.emp_id), �̸�(emp.emp_name), �Ի�⵵(emp.hire_date), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ
-- �Ի�⵵�� �⵵�� ���
select e.emp_id, e.emp_name, to_char(e.hire_date,'yyyy'), d.dept_name
from emp e, dept d
where e.dept_id = d.dept_id and e.emp_id = 100;

-- ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), ��������(job.job_title), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ

select e.emp_id, e.emp_name, e.salary, j.job_title, d.dept_name
from emp e, job j, dept d
where e.dept_id = d.dept_id and e.job_id = j.job_id ;

--TODO 200����(200 ~ 299) ���� ID(emp.emp_id)�� ���� �������� ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), 
--     �ҼӺμ��̸�(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ. ����_ID�� ������������ ����.

select e.emp_id, e.emp_name,e.salary, d.dept_name, d.loc
from emp e, dept d
where e.dept_id = d.dept_id and e.emp_id between 200 and 299
order by 1;



--TODO ����(emp.job_id)�� 'FI_ACCOUNT'�� ������ ID(emp.emp_id), �̸�(emp.emp_name), ����(emp.job_id), 
--     �ҼӺμ��̸�(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ.  ����_ID�� ������������ ����.

select e.emp_id, 
        e.emp_name, 
        e.job_id, 
        d.dept_name, 
        d.loc
from emp e, dept d 
where e.dept_id = d.dept_id 
and   e.job_id in 'FI_ACCOUNT'
order by 1;

--TODO Ŀ�̼Ǻ���(emp.comm_pct)�� �ִ� �������� ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), Ŀ�̼Ǻ���(emp.comm_pct), 
--     �ҼӺμ��̸�(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ. ����_ID�� ������������ ����.

select e.emp_id, e.emp_name, e.salary, e.comm_pct, d.dept_name, d.loc
from emp e, dept d 
where e.comm_pct is not null 
and   e.dept_id = d.dept_id
order by 1;



--TODO 'New York'�� ��ġ��(dept.loc) �μ��� �μ�_ID(dept.dept_id), �μ��̸�(dept.dept_name), ��ġ(dept.loc), 
--     �� �μ��� �Ҽӵ� ����_ID(emp.emp_id), ���� �̸�(emp.emp_name), ����(emp.job_id)�� ��ȸ. �μ�_ID �� ������������ ����.


select d.dept_id, d.dept_name, d.loc, e.emp_id, e.emp_name, e.job_id
from dept d, emp e 
where e.dept_id = d.dept_id and d.loc in 'New York'
order by 1;


--TODO ����_ID(emp.emp_id), �̸�(emp.emp_name), ����_ID(emp.job_id), ������(job.job_title) �� ��ȸ.

select e.emp_id, e.emp_name, e.job_id, j.job_title
from emp e, job j
where e.job_id = j.job_id;

             
-- TODO: ���� ID �� 200 �� ������ ����_ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), 
--       ��������(job.job_title), �ҼӺμ��̸�(dept.dept_name)�� ��ȸ              


select e.emp_id, 
       e.salary, 
       j.job_title, 
       d.dept_name
from emp e, job j, dept d
where  e.dept_id = d.dept_id 
and    e.job_id = j.job_id 
and    e.emp_id = 200;


-- TODO: 'Shipping' �μ��� �μ���(dept.dept_name), ��ġ(dept.loc), �Ҽ� ������ �̸�(emp.emp_name), ������(job.job_title)�� ��ȸ. 
--       �����̸� ������������ ����

select d.dept_name, 
       d.loc, 
       e.emp_name, 
       j.job_title
from dept d, job j, emp e
where e.dept_id = d.dept_id 
and   e.job_id = j.job_id 
and   d.dept_name in 'Shipping'
order by 3;

-- TODO:  'San Francisco' �� �ٹ�(dept.loc)�ϴ� ������ id(emp.emp_id), �̸�(emp.emp_name), �Ի���(emp.hire_date)�� ��ȸ
--         �Ի����� 'yyyy-mm-dd' �������� ���

select e.emp_id, e.emp_name, to_char(e.hire_date, 'yyyy"-"mm"-"dd'), d.loc
from emp e, dept d
where e.dept_id = d.dept_id and d.loc in 'San Francisco';

--TODO �μ��� �޿�(salary)�� ����� ��ȸ. �μ��̸�(dept.dept_name)�� �޿������ ���. �޿� ����� ���� ������ ����.
-- �޿��� , ���������ڿ� $ �� �ٿ� ���.

select to_char(avg(e.salary), '$999,999.99') as "��ձ޿�", d.dept_name
from emp e, dept d
where e.dept_id = d.dept_id
group by d.dept_name
order by 1 desc;



select to_char(round(avg(e.salary),2), 'fm$999,999.99') as "��ձ޿�", d.dept_name
from emp e, dept d
where e.dept_id = d.dept_id
group by d.dept_name
order by avg(e.salary) desc;

--TODO ������ ID(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), �޿����(salary_grade.grade) �� ��ȸ. ���� id ������������ ����


select e.emp_id, e.emp_name, e.salary, s.grade
from emp e, salary_grade s
where e.salary between s.low_sal and s.high_sal
order by 1;

--TODO ������ ID(emp.emp_id), �̸�(emp.emp_name), ������(job.job_title), �޿�(emp.salary), 
--     �޿����(salary_grade.grade), �ҼӺμ���(dept.dept_name)�� ��ȸ. ��� ������������ ����

select e.emp_id, 
       e.emp_name, 
       j.job_title, 
       e.salary, 
       s.grade, 
       d.dept_name
from emp e, salary_grade s, job j, dept d
where e.dept_id = d.dept_id 
and   e.job_id = j.job_id 
and   e.salary between s.low_sal and s.high_sal
order by 5 desc;

--TODO �μ��� �޿������(salary_grade.grade) 1�� �����ִ� �μ��̸�(dept.dept_name)�� 1����� ������ ��ȸ. �������� ���� �μ� ������� ����.

select d.dept_name, count(*)
from dept d, emp e, salary_grade s
where e.dept_id = d.dept_id 
and   e.salary between s.low_sal and s.high_sal 
and   s.grade = 1
group by d.dept_name, d.dept_id
order by 2 desc;

/* ****************************************************
Self ����
- ���������� �ϳ��� ���̺��� �ΰ��� ���̺�ó�� �����ϴ� ��.
**************************************************** */
--������ ID(emp.emp_id), �̸�(emp.emp_name), ����̸�(emp.emp_name)�� ��ȸ
select e.emp_id, 
       e.emp_name, 
       e.mgr_id,
       b.emp_id, 
       b.emp_name,
       e.salary as ����,
       b.salary as ���
from emp e, emp b
where e.mgr_id = b.emp_id
order by e.mgr_id;


-- TODO : EMP ���̺��� ���� ID(emp.emp_id)�� 110�� ������ �޿�(salary)���� ���� �޴� �������� id(emp.emp_id), 
-- �̸�(emp.emp_name), �޿�(emp.salary)�� ���� ID(emp.emp_id) ������������ ��ȸ.

select e.emp_id, e.emp_name, e.salary
from emp e, emp a
where e.salary > a.salary and a.emp_id = 110
order by e.salary;

select emp_id, emp_name, salary
from emp
where salary > (select salary
                from emp
                where emp_id = 110)
order by 3;


/* ****************************************************
�ƿ��� ���� (Outer Join)
- �������̺� �ҽ� ���̺��� ���� ��� ���̰� Ÿ�����̺��� ���� ���ο����� �����ϴ� �͸� ���δ�.

-����� ���� (���� ����� ������ ���� ����� �ص� ���̵���) 
 - �ҽ�(�����ؾ��ϴ����̺�)�� �����̸� left join, �������̸� right join �����̸� full outer join

-ANSI ����
from ���̺�a [LEFT | RIGHT | FULL] OUTER JOIN ���̺�b ON ��������
- OUTER�� ���� ����.

-����Ŭ JOIN ����
- FROM ���� ������ ���̺��� ����
- WHERE ���� ���� ������ �ۼ�
    - Ÿ�� ���̺� (+) �� ���δ�.
    - FULL OUTER JOIN�� �������� �ʴ´�.
- OUTER�� ���� �� �� �ִ�.	
**************************************************** */
select *
from emp e left join dept d on e.dept_id = d.dept_id;

select *
from emp e right join dept d on e.dept_id = d.dept_id;

select *
from emp e full outer join dept d on e.dept_id = d.dept_id;
-- ������ id(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary), �μ���(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ. 
-- �μ��� ���� ������ ������ �������� ��ȸ. (�μ������� null). dept_name�� ������������ �����Ѵ�.

select e.emp_id, e.emp_name, e.salary, d.dept_name, d.loc
from emp e, dept d
where e.dept_id = d.dept_id (+)
order by d.dept_name desc;


-- ��� ������ id(emp.emp_id), �̸�(emp.emp_name), �μ�_id(emp.dept_id)�� ��ȸ�ϴµ�
-- �μ�_id�� 80 �� �������� �μ���(dept.dept_name)�� �μ���ġ(dept.loc) �� ���� ����Ѵ�. (�μ� ID�� 80�� �ƴϸ� null�� ��������)




--TODO: ����_id(emp.emp_id)�� 100, 110, 120, 130, 140�� ������ ID(emp.emp_id), �̸�(emp.emp_name), ������(job.job_title) �� ��ȸ. 
-- �������� ���� ��� '�̹���' ���� ��ȸ



--TODO: �μ��� ID(dept.dept_id), �μ��̸�(dept.dept_name)�� �� �μ��� ���� �������� ���� ��ȸ. 
--      ������ ���� �μ��� 0�� �������� ��ȸ�ϰ� �������� ���� �μ� ������ ��ȸ.



-- TODO: EMP ���̺��� �μ�_ID(emp.dept_id)�� 90 �� �������� id(emp.emp_id), �̸�(emp.emp_name), ����̸�(emp.emp_name), �Ի���(emp.hire_date)�� ��ȸ. 
-- �Ի����� yyyy-mm-dd �������� ���





--TODO 2003��~2005�� ���̿� �Ի��� ������ id(emp.emp_id), �̸�(emp.emp_name), ������(job.job_title), �޿�(emp.salary), �Ի���(emp.hire_date),
--     ����̸�(emp.emp_name), ������Ի���(emp.hire_date), �ҼӺμ��̸�(dept.dept_name), �μ���ġ(dept.loc)�� ��ȸ.
-- 2003�⿡�� 2005�� ���� �Ի��� ������ ��� �������� ��ȸ�Ѵ�. 





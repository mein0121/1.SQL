/* **************************************************************************
��������(Sub Query)
- �����ȿ���(insert, delete, update, select)�ȿ� select ������ ����ϴ� ��.
- ���� ���� - ��������

���������� ���Ǵ� ��
 - select��, from��, where��, having��
 
���������� ����
- ��� ������ ���Ǿ������� ���� ����
    - ��Į�� �������� - select ���� ���. �ݵ�� �������� ����� 1�� 1��(�� �ϳ�-��Į��) 0���� ��ȸ�Ǹ� null�� ��ȯ
    - �ζ��� �� - from ���� ���Ǿ� ���̺��� ������ �Ѵ�.
�������� ��ȸ��� ����� ���� ����
    - ������ �������� - ���������� ��ȸ��� ���� ������ ��.
    - ������ �������� - ���������� ��ȸ��� ���� �������� ��.
���� ��Ŀ� ���� ����
    - ����(�񿬰�) �������� - ���������� ���������� �÷��� ������ �ʴ´�. ���������� ����� ���� ���������� �����ϴ� ������ �Ѵ�.
    - ���(����) �������� - ������������ ���������� �÷��� ����Ѵ�. 
                            ���������� ���� ����Ǿ� ������ �����͸� ������������ ������ �´��� Ȯ���ϰ��� �Ҷ� �ַ� ����Ѵ�.

- ���������� �ݵ�� ( ) �� ������� �Ѵ�.
************************************************************************** */
--������ ��������

-- ����_ID(emp.emp_id)�� 120���� ������ ���� ����(emp.job_id)���� 
-- ������ id(emp_id),�̸�(emp.emp_name), ����(emp.job_id), �޿�(emp.salary) ��ȸ
select emp_id,
       emp_name,
       salary,
       job_id
from emp
where job_id in (select job_id
                 from emp
                 where emp_id = 120); --���� ��������.

-- ����_id(emp.emp_id)�� 115���� ������ ���� ����(emp.job_id)�� �ϰ� ���� �μ�(emp.dept_id)�� ���� �������� ��ȸ�Ͻÿ�.
-- pair ��� subquery
select dept_id, emp_id, emp_name, job_id
from emp
where (job_id, dept_id) in (select job_id, dept_id
                         from emp
                         where emp_id in 115);

select emp_name, DEPT_ID
from emp
where job_id in 'PU_MAN';

-- ������ �� �޿�(emp.salary)�� ��ü ������ ��� �޿����� ���� 
-- �������� id(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary)�� ��ȸ. �޿�(emp.salary) �������� ����.

select emp_id, emp_name, salary
from emp
where salary < (select avg(salary) from emp)
order by salary desc;


-- ��ü ������ ��� �޿�(emp.salary) �̻��� �޴� �μ���  �̸�(dept.dept_name), �Ҽ��������� ��� �޿�(emp.salary) ���. 
-- ��ձ޿��� �Ҽ��� 2�ڸ����� ������ ��ȭǥ��($)�� ���� ������ ���

select d.dept_name,
       to_char(round(avg(e.salary),2), '$99,999')
from emp e left join dept d on e.dept_id = d.dept_id
group by d.dept_name
having avg(salary) > (select avg(salary) from emp)
order by avg(salary);

SELECT d.DEPT_NAME, TO_CHAR(AVG(e.SALARY),'$999,999.99')
FROM EMP e, dept d
WHERE e.dept_id = d.dept_id
group by d.dept_name
having avg(salary) >(SELECT AVG(SALARY) FROM EMP)

order by AVG(e.SALARY);

-- TODO: ������ ID(emp.emp_id)�� 145�� �������� ���� ������ �޴� �������� �̸�(emp.emp_name)�� �޿�(emp.salary) ��ȸ.
-- �޿��� ū ������� ��ȸ

select emp_name, salary
from emp
where salary*12 > (select salary * 12
                    from emp
                    where emp_id = 145)
order by salary desc;


-- TODO: ������ ID(emp.emp_id)�� 150�� ������ ���� ����(emp.job_id)�� �ϰ� ���� ���(emp.mgr_id)�� ���� �������� 
-- id(emp.emp_id), �̸�(emp.emp_name), ����(emp.job_id), ���(emp.mgr_id) �� ��ȸ

select emp_id, emp_name, job_id, mgr_id
from emp
where (job_id, mgr_id) in (select job_id, mgr_id
                            from emp
                            where emp_id = 150);


-- TODO : EMP ���̺��� ���� �̸���(emp.emp_name)��  'John'�� ������ �߿��� �޿�(emp.salary)�� ���� ���� ������ salary(emp.salary)���� ���� �޴� 
-- �������� id(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary)�� ���� ID(emp.emp_id) ������������ ��ȸ.

select emp_id, emp_name, salary
from emp
WHERE salary > (select max(salary)
                from emp
                where emp_name in 'John')
order by emp_id;

select emp_id, emp_name, salary
from emp
WHERE salary > all(select salary
                from emp
                where emp_name in 'John')
order by emp_id;


-- TODO: �޿�(emp.salary)�� ���� ���� ������ ���� �μ��� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ.

select d.dept_name, d.loc
from emp e left join dept d on e.dept_id = d.dept_id
where salary = (select max(salary)
                from emp);


-- TODO: �޿�(emp.salary)�� ���� ���� �޴� �������� �̸�(emp.emp_name), �μ���(dept.dept_name), �޿�(emp.salary) ��ȸ. 
--       �޿��� �տ� $�� ���̰� ���������� , �� ���

select d.dept_name, e.emp_name, to_char(salary, 'fm$999,999.00')
from emp e join dept d on e.dept_id = d.dept_id
where salary = (select max(salary)
                from emp);


-- TODO: ��� ����ID(emp.job_id) �� 'ST_CLERK'�� �������� ��� �޿����� ���� �޿��� �޴� �������� ��� ������ ��ȸ. 
-- �� ���� ID�� 'ST_CLERK'�� �ƴ� �����鸸 ��ȸ. 

select *
from emp
where salary < (select avg(salary)
                from emp
                where job_id in 'ST_CLERK')
                and (job_id <> 'ST_CLERK' or job_id is null)
--( )����: (job_id�� null�̰ų� ST_CLERK�� �ƴ� �����߿���) salary���ǿ� ������ ����� ���϶�.
order by salary desc;

select *
from emp
where salary < (select avg(salary)
                from emp
                where job_id in 'ST_CLERK')
                and nvl(job_id,'�̹�ġ') <> 'ST_CLERK'
order by salary desc;

-- TODO: 30�� �μ�(emp.dept_id) �� ��� �޿�(emp.salary)���� �޿��� ���� �������� ��� ������ ��ȸ.

select *
from emp
where salary > (select avg(salary)
                from emp
                where dept_id = 30);

-- TODO: EMP ���̺��� ����(emp.job_id)�� 'IT_PROG' �� �������� ��� �޿� �̻��� �޴� 
-- �������� id(emp.emp_id), �̸�(emp.emp_name), �޿�(emp.salary)�� �޿� ������������ ��ȸ.

select emp_id, emp_name, salary
from emp
where salary > (select avg(salary)
                from emp
                where job_id in 'IT_PROG')
ORDER BY SALARY DESC;



-- TODO: 'IT' �μ�(dept.dept_name)�� �ִ� �޿����� ���� �޴� ������ ID(emp.emp_id), �̸�(emp.emp_name), �Ի���(emp.hire_date), �μ� ID(emp.dept_id), �޿�(emp.salary) ��ȸ
-- �Ի����� "yyyy�� mm�� dd��" �������� ���
-- �޿��� �տ� $�� ���̰� ���������� , �� ���

select emp_id, 
       emp_name, 
       TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��"')as hire_date, 
       dept_id, 
       to_char(salary, 'fm$999,999.00') as salary
from emp
where salary > (select max(e.salary)
                from emp e join dept d on e.dept_id = d.dept_id
                where dept_name in 'IT')
ORDER BY SALARY DESC;


/* ----------------------------------------------
 ������ ��������
 - ���������� ��ȸ ����� �������� ���
 - where�� ������ ������
	- in
	- �񱳿����� any : ��ȸ�� ���� �� �ϳ��� ���̸� �� (where �÷� > any(��������) )
	- �񱳿����� all : ��ȸ�� ���� ��ο� ���̸� �� (where �÷� > all(��������) )
------------------------------------------------*/
select * from emp
where salary > all(2000,3000,4000,5000,20000);
--'Alexander' �� �̸�(emp.emp_name)�� ���� ������(emp.mgr_id)�� 
-- ���� �������� ID(emp_id), �̸�(emp_name), ����(job_id), �Ի�⵵(hire_date-�⵵�����), �޿�(salary)�� ��ȸ
-- �޿��� �տ� $�� ���̰� ���������� , �� ���
select * from emp where mgr_id = 115;--emp_name = 'Alexander';

select emp_id
       emp_name,
       job_id,
       mgr_id,
       to_char(hire_date, 'yyyy') hire_year,
       to_char(salary, '$99,999') salary
from emp
where mgr_id in (select emp_id from emp where emp_name in 'Alexander');


-- ���� ID(emp.emp_id)�� 101, 102, 103 �� ������ ���� �޿�(emp.salary)�� ���� �޴� ������ ��� ������ ��ȸ.

select max(salary) from emp where emp_id in (101,102,103);

select *
from emp
where salary > all(select salary
                   from emp
                   where emp_id in (101,102,103));

select *
from emp
where salary > (select max(salary)
                from emp
                where emp_id in (101,102,103));
-- ���� ID(emp.emp_id)�� 101, 102, 103 �� ������ �� �޿��� ���� ���� �������� �޿��� ���� �޴� ������ ��� ������ ��ȸ.
select *
from emp
where salary > any(select salary
                   from emp
                   where emp_id in (101,102,103));

select *
from emp
where salary > (select min(salary)
                from emp
                where emp_id in (101,102,103));


-- TODO : �μ� ��ġ(dept.loc) �� 'New York'�� �μ��� �Ҽӵ� ������ ID(emp.emp_id), �̸�(emp.emp_name), �μ�_id(emp.dept_id) �� sub query�� �̿��� ��ȸ.

select emp_id, emp_name, dept_id
from emp 
where dept_id in (select dept_id
                from dept
                where loc in 'New York');


select e.emp_id, e.emp_name, e.dept_id
from emp e join dept d on e.dept_id = d.dept_id
where d.loc in (select loc
                from dept
                where loc in 'New York');


-- TODO : �ִ� �޿�(job.max_salary)�� 6000������ ������ ����ϴ� ����(emp)�� ��� ������ sub query�� �̿��� ��ȸ.

select *
from emp
where job_id in (select job_id
                from job
                where max_salary <= 6000);

select *
from emp e join job j on e.job_id = j.job_id
where j.max_salary < any (6000);


-- TODO: �μ�_ID(emp.dept_id)�� 20�� �μ��� ������ ���� �޿�(emp.salary)�� ���� �޴� �������� ������  sub query�� �̿��� ��ȸ.

select *
from emp
where salary > all(select salary
                    from emp
                    where dept_id = 20);
--where salary > (select max(salary) from emp where dept_id = 20);


-- TODO: �μ��� �޿��� ����� ���� ���� �μ��� ��� �޿����� ���� ���� �޴� �������� �̸�, �޿�, ������ sub query�� �̿��� ��ȸ

select emp_name, salary, job_id
from emp
where salary > any(select avg(salary) from emp group by dept_id);
--where salary > (select min(avg(salary)) from emp group by dept_id);

-- TODO: ���� id(job_id)�� 'SA_REP' �� �������� ���� ���� �޿��� �޴� �������� ���� �޿��� �޴� �������� �̸�(emp_name), �޿�(salary), ����(job_id) �� sub query�� �̿��� ��ȸ.

select emp_name, salary, job_id
from emp
where salary > all(select salary from emp where job_id in 'SA_REP');
--where salary > (select max(salary) from emp where job_id in 'SA_REP');

-- �������� ���� ����: subquery���� -> subquery�������� ������ main query����.
/* ****************************************************************
���(����) ����
������������ ��ȸ���� ���������� ���ǿ��� ����ϴ� ����.
���������� �����ϰ� �� ����� �������� ���������� �������� ���Ѵ�.
* ****************************************************************/
-- �� �μ�����(DEPT) �޿�(emp.salary)�� ���� ���� �޴� �������� id(emp.emp_id), �̸�(emp.emp_name), ����(emp.salary), �ҼӺμ�ID(dept.dept_id) ��ȸ

select e.emp_id,
       e.emp_name,
       e.salary,
       e.dept_id
from emp e
where salary = (select max(salary)
                from emp
                where nvl(dept_id,0) = nvl(e.dept_id,0))
order by e.dept_id;

/* ******************************************************************************************************************
EXISTS, NOT EXISTS ������ (���(����)������ ���� ���ȴ�)
-- ���������� ����� �����ϴ� ���� �����ϴ��� ���θ� Ȯ���ϴ� ����. ������ �����ϴ� ���� �������� ���ุ ������ ���̻� �˻����� �ʴ´�.

������ ���̺�(��,���-�θ�) -  transaction(����) ���̺�(�ֹ�, �뿩-�ڽ�)
-- ���� ���̺��� ������ ���̺��� ���� �����ǰ� �ִ���(EXISTS) ������(NOT EXISTS)
-- ���߿� (�ѹ��̻�) �ֹ��� ��?
**********************************************************************************************************************/


-- ������ �Ѹ��̻� �ִ� �μ��� �μ�ID(dept.dept_id)�� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ
SELECT d.dept_id,
        d.dept_name,
        d.loc
from dept d
where exists (select * 
              from emp e 
              where e.dept_id = d.dept_id);

-- ������ �Ѹ� ���� �μ��� �μ�ID(dept.dept_id)�� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ

select d.dept_id, d.dept_name, d.loc
from dept d
where not exists (select * from emp e where e.dept_id = d.dept_id);

-- �μ�(dept)���� ����(emp.salary)�� 13000�̻��� �Ѹ��̶� �ִ� �μ��� �μ�ID(dept.dept_id)�� �̸�(dept.dept_name), ��ġ(dept.loc)�� ��ȸ

select d.dept_id, dept_name, d.loc
from dept d
where exists (select * from emp e where  e.dept_id = d.dept_id and salary >= 13000);


/* ******************************
�ֹ� ���� ���̺�� �̿�.
******************************* */
1. from
2. where - �༱�� (������ �ະ�� üũ - True�� ���� ���)
--TODO: ��(customers) �� �ֹ�(orders)�� �ѹ� �̻� �� ������ ��ȸ.

SELECT *
FROM customers c
where exists (select * from orders o where o.cust_id = c.cust_id);

--TODO: ��(customers) �� �ֹ�(orders)�� �ѹ��� ���� ���� ������ ��ȸ.

SELECT *
FROM customers c
where not exists (select * from orders o where o.cust_id = c.cust_id);

--TODO: ��ǰ(products) �� �ѹ��̻� �ֹ��� ��ǰ ���� ��ȸ

select *
from products p 
where exists (select * from order_items oi where oi.product_id = p.product_id);


--TODO: ��ǰ(products)�� �ֹ��� �ѹ��� �ȵ� ��ǰ ���� ��ȸ

select *
from products p 
where not exists (select * from order_items oi where oi.product_id = p.product_id);


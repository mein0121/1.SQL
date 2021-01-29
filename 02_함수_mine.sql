/* *************************************
�Լ� - ���ڿ����� �Լ�
 UPPER()/ LOWER() : �빮��/�ҹ��� �� ��ȯ
 INITCAP(): �ܾ� ù���ڸ� �빮�� ������ �ҹ��ڷ� ��ȯ
 LENGTH() : ���ڼ� ��ȸ
 LPAD(��, ũ��, ä�ﰪ) : "��"�� ������ "ũ��"�� �������� ���ڿ��� ����� ���ڶ�� ���� ���ʺ��� "ä�ﰪ"���� ä���.
 RPAD(��, ũ��, ä�ﰪ) : "��"�� ������ "ũ��"�� �������� ���ڿ��� ����� ���ڶ�� ���� �����ʺ��� "ä�ﰪ"���� ä���.
 SUBSTR(��, ����index, ���ڼ�) - "��"���� "����index"��° ���ں��� ������ "���ڼ�" ��ŭ�� ���ڿ��� ����. ���ڼ� ������ ������. 
 REPLACE(��, ã�����ڿ�, �����ҹ��ڿ�) - "��"���� "ã�����ڿ�"�� "�����ҹ��ڿ�"�� �ٲ۴�.
 LTRIM(��): �ް��� ����
 RTRIM(��): �������� ����
 TRIM(��): ���� ���� ����
 ************************************* */
select upper('abc')
from dual;

select upper(emp_name)
from emp;

select emp_name from emp;

select upper('abDEF') "�ҹ��ڸ� �빮�ڷ�",
       lower('abDEF') "�빮�ڸ� �ҹ��ڷ�",
       initcap('abDEF') "�ܾ��� ù���ڸ� �빮�ڷ�"
from dual;

select length('abDEF') "���ڼ�"
from dual;

select * from emp
where length(emp_name) > 7; --Ư�����ڼ� �̻��ΰ͸�


select lpad('abc', 10) as "A",--���� ���������� ����ֱ�.
       rpad('abc', 10) as "B",
       length(rpad('abc', 10)) as "C"
from dual;


select substr('123456789', 2), --2��°���� ����������.
substr('123456789', 2,5) -- 2��° ���ں��� 5���ڸ�.
from dual;

select replace('010-1111-2222', '010', '###') from dual;

select trim('       abc       ') as "A", --��������
ltrim('       abc       ') as "B",
rtrim('       abc       ') as "C"
from dual;



--EMP ���̺��� ������ �̸�(emp_name)�� ��� �빮��, �ҹ���, ù���� �빮��, �̸� ���ڼ��� ��ȸ

select upper(emp_name) as "�빮���̸�",
lower(emp_name) as "�ҹ����̸�",
initcap(emp_name) as "ù���ڸ� �빮���̸�",
length(emp_name) as "���ڼ�"
from emp;


-- TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), �޿�(salary), �μ�(dept_name)�� ��ȸ. �� �����̸�(emp_name)�� ��� �빮��, �μ�(dept_name)�� ��� �ҹ��ڷ� ���.
-- UPPER/LOWER
SELECT emp_id, upper(emp_name), salary, lower(dept_name)
from emp;

--(�Ʒ� 2���� �񱳰��� ��ҹ��ڸ� Ȯ���� �𸣴� ����)
--TODO: EMP ���̺��� ������ �̸�(emp_name)�� PETER�� ������ ��� ������ ��ȸ�Ͻÿ�.
SELECT *
FROM EMP
WHERE UPPER(emp_name) = 'PETER';


--TODO: EMP ���̺��� ����(job)�� 'Sh_Clerk' �� ��������  ID(emp_id), �̸�(emp_name), ����(job), �޿�(salary)�� ��ȸ

SELECT emp_id, emp_name, salary, job
from emp
--where lower(job) in 'sh_clerk';
WHERE initcap(job) = 'Sh_Clerk';

--TODO: ���� �̸�(emp_name) �� �ڸ����� 15�ڸ��� ���߰� ���ڼ��� ���ڶ� ��� ������ �տ� �ٿ� ��ȸ. ���� �µ��� ��ȸ
select LPAD(emp_name,15)as emp_name
from emp;

    
--TODO: EMP ���̺��� ��� ������ �̸�(emp_name)�� �޿�(salary)�� ��ȸ.
--(��, "�޿�(salary)" ���� ���̰� 7�� ���ڿ��� �����, ���̰� 7�� �ȵ� ��� ���ʺ��� �� ĭ�� '_'�� ä��ÿ�. EX) ______5000) -LPAD() �̿�

select emp_name, lpad(salary,7,'_') AS SALARY
from emp;

-- TODO: EMP ���̺��� �̸�(emp_name)�� 10���� �̻��� �������� �̸�(emp_name)�� �̸��� ���ڼ� ��ȸ

select emp_name
from emp
where length(emp_name) >= 10;


/* *************************************
�Լ� - ���ڰ��� �Լ�

 round(��, �ڸ���) : �ڸ������Ͽ��� �ݿø� (��� - �Ǽ���, ���� - ������, �⺻�� : 0)
 trunc(��, �ڸ���) : �ڸ������Ͽ��� ����(��� - �Ǽ���, ���� - ������, �⺻��: 0)
 ceil(��) : �ø�
 floor(��) : ����
 mod(�����¼�, �����¼�) : �������� ������ ����
 
************************************* */

select round(1.2345,3),
round(1.52345,0),
trunc(1.52345,0),
trunc(1.5332, 2),
trunc(155,-2)
from dual;

--ceil/floor : �Ǽ� -> ����
select ceil(15.67),
floor(15.67),
round(16/3),
round(16/3,2),
mod(10,3)
from dual;

--TODO: EMP ���̺��� �� ������ ���� ����ID(emp_id), �̸�(emp_name), �޿�(salary) �׸��� 15% �λ�� �޿�(salary)�� ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�.
--(��, 15% �λ�� �޿��� �ø��ؼ� ������ ǥ���ϰ�, ��Ī�� "SAL_RAISE"�� ����.)

select emp_id, emp_name, salary, CEIL(salary*1.15) as SAL_RAISE
FROM EMP;

--TODO: ���� SQL������ �λ� �޿�(sal_raise)�� �޿�(salary) ���� ������ �߰��� ��ȸ (����ID(emp_id), �̸�(emp_name), 15% �λ�޿�, �λ�� �޿��� ���� �޿�(salary)�� ����)
select emp_id, emp_name, salary, ceil(salary*1.15) as "SAL_RAISE", ceil(salary*1.15)-salary as "����"
FROM EMP;


-- TODO: EMP ���̺��� Ŀ�̼��� �ִ� �������� ����_ID(emp_id), �̸�(emp_name), Ŀ�̼Ǻ���(comm_pct), Ŀ�̼Ǻ���(comm_pct)�� 8% �λ��� ����� ��ȸ.
--(�� Ŀ�̼��� 8% �λ��� ����� �Ҽ��� ���� 2�ڸ����� �ݿø��ϰ� ��Ī�� comm_raise�� ����)

select emp_id, emp_name, comm_pct, round(comm_pct*1.08,2) as comm_raise
FROM EMP;
--where comm_pct is not null;

/* *************************************
�Լ� - ��¥���� ��� �� �Լ�
sysdate: ��������� �Ͻ�
Date +- ���� : ��¥ ���.
months_between(d1, d2) -����� ������(d1�� �ֱ�, d2�� ����)
add_months(d1, ����) - �������� ���� ��¥. ������ ��¥�� 1���� �Ĵ� ���� ������ ���� �ȴ�. 
next_day(d1, '����') - d1���� ù��° ������ ������ ��¥. ������ �ѱ�(locale)�� �����Ѵ�.
last_day(d) - d ���� ��������.
extract(year|month|day from date) - date���� year/month/day�� ����
************************************* */

select sysdate, SYSDATE+10 AS "10����", SYSDATE - 10 AS "10����",
        TO_DATE(sysdate, 'yyyy/mm/dd hh24:mi:ss'),
        TO_CHAR(sysdate, 'yyyy/mm/dd hh24:mi:ss')
from dual;

SELECT MONTHS_BETWEEN(SYSDATE,'2020/12/28') || '����',
MONTHS_BETWEEN(SYSDATE,'20191028') || '����',
MONTHS_BETWEEN(SYSDATE,'2020/12/26') || '����',
CEIL(MONTHS_BETWEEN(SYSDATE,'2020/12/26')) || '����'
FROM dual;

SELECT ADD_MONTHS(SYSDATE, 2),
ADD_MONTHS(SYSDATE, -2),
ADD_MONTHS('20210131', -2),
ADD_MONTHS('20210131', 2)
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '�ݿ���'),
NEXT_DAY(SYSDATE, '������')
FROM DUAL;

SELECT LAST_DAY(SYSDATE)
FROM DUAL;

SELECT EXTRACT(YEAR FROM SYSDATE),
EXTRACT(MONTH FROM SYSDATE),
EXTRACT(DAY FROM SYSDATE)
FROM DUAL;

SELECT *
FROM EMP
WHERE EXTRACT(MONTH FROM hire_date) = 11;



--TODO: EMP ���̺��� �μ��̸�(dept_name)�� 'IT'�� �������� '�Ի���(hire_date)�� ���� 10����', �Ի��ϰ� '�Ի��Ϸ� ���� 10����',  �� ��¥�� ��ȸ. 

select DEPT_NAME, hire_date - 10 as "10����",hire_date, hire_date + 10 as "10����"
from emp
where dept_name in 'IT';

--TODO: �μ��� 'Purchasing' �� ������ �̸�(emp_name), �Ի� 6�������� �Ի���(hire_date), 6������ ��¥�� ��ȸ.
SELECT EMP_NAME, ADD_MONTHS(HIRE_DATE, -6) as "6������", hire_date, ADD_MONTHS(HIRE_DATE, 6) as "6������"
from emp
where dept_name in 'Purchasing';


--TODO: EMP ���̺��� �Ի��ϰ� �Ի��� 2�� ��, �Ի��� 2�� �� ��¥�� ��ȸ.

SELECT ADD_MONTHS(HIRE_DATE, 2) as "�Ի��� 2�� ��", ADD_MONTHS(HIRE_DATE, -2) as "�Ի��� 2�� ��"
FROM EMP;

-- TODO: �� ������ �̸�(emp_name), �ٹ� ������ (�Ի��Ͽ��� ��������� �� ��)�� ����Ͽ� ��ȸ.
--(�� �ٹ� �������� �Ǽ� �� ��� ������ �ݿø�. �ٹ������� ������������ ����.)

SELECT EMP_NAME, ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE))||' ����' as �ٹ�������
FROM EMP
--ORDER BY ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)) DESC;
--ORDER BY 2 DESC;
ORDER BY �ٹ������� DESC;

--TODO: ���� ID(emp_id)�� 100 �� ������ �Ի��� ���� ù��° �ݿ����� ��¥�� ���Ͻÿ�.
SELECT EMP_ID as ���̵�, HIRE_DATE as �Ի���, next_day(HIRE_DATE, '�ݿ���') as �ݿ���
FROM EMP
WHERE EMP_ID = 100;



/* *************************************
�Լ� - ��ȯ �Լ�

#####################################################################################
#				# = to_char() =>	#					#<=to_char()=	#			#
#   Number Ÿ��	#					#  Character Ÿ��	#				#  Date Ÿ��	#
#				# <=to_number()=    #	    			#=to_date()=>	#			#
#####################################################################################


to_char() : ������, ��¥���� ���������� ��ȯ
to_number() : �������� ���������� ��ȯ 
to_date() : �������� ��¥������ ��ȯ


����(format)���� 
���� :
    0, 9 : ���ڰ� �� �ڸ��� ����. (9: ������ �����ڸ��� �������� ä��, 0�� 0���� ä��) - �Ǽ��� ���� �ڸ��� �Ѵ� 0���� ä���.
           fm���� �����ϸ� 9�� ��� ������ ����.
    . : ����/�Ǽ��� ������.
    ,: ������ ����������
    'L', '$' : ��ȭǥ��. L; ������ȭ��ȣ
�Ͻ� :yyyy : ���� 4�ڸ�, yy: ���� 2�ڸ�(2000���), rr: ����2�ڸ�(50�̻�:90���, 50�̸�:2000���)
      mm: �� 2�ڸ�  (11, 05)
      dd: �� 2�ڸ�
      hh24: �ð�(00 ~ 23) 2�ڸ�, hh(01 ~ 12)
      mi: �� 2�ڸ�
      ss: �� 2�ڸ�
      day(����), 
      am �Ǵ� pm : ����/����
************************************* */

SELECT 10 +'10', 
10+'1000',
-- 10 + '10,000' -- ERROR.
10+ TO_NUMBER('10,000', '99,999') FROM DUAL;

SELECT 100,000,000,100000000, TO_CHAR(100000000,'999,999,999') FROM DUAL;

SELECT TO_CHAR(SALARY, 'FM9,999,999.00')
FROM EMP;

SELECT '1,000.53', TO_NUMBER('1,000.53','9,999.99')
FROM DUAL;

SELECT TO_CHAR(123456789, '999,999,999'),
TO_CHAR(123456789, 'FM999,999,999'), --FM : �ִ��ڸ����� ������� ��������. 
TO_CHAR(123456789, '999,999'), -- �ִ��ڸ����� ���ڶ���� ##���� ǥ��, �ڸ����� �������.
TO_CHAR(10000, '$999,999.00'),
TO_CHAR(10000, 'FML999,999.00')
FROM DUAL;

SELECT TO_CHAR(1234.567, '0,000.000'),
TO_CHAR(1234.56, '000,000.000'),
TO_CHAR(1234.56, 'fm000,000.000'),
TO_CHAR(1234.56, '999,999.999'),
TO_CHAR(1234.56, 'fm999,999.999')
FROM DUAL;

select to_char(sysdate, 'yy.mm.dd'),
to_char(sysdate, 'yy/mm/dd'),
to_char(sysdate, 'mm.dd.yy'),
to_char(sysdate, 'monthdd"��" yyyy"��"')
from dual;

select to_char(sysdate, 'yy/mm/dd/hh24:mi:ss'),
to_char(sysdate, 'mm/dd/yy/hh24:mi:ss'),
to_char(sysdate, 'hh24:mi:ss mm/dd/yyyy')
from dual;

select to_date('2020/01/21', 'yyyy/mm/dd')-5,
to_date('2020/01', 'yyyy/mm')-5
from dual;



-- EMP ���̺��� ����(job)�� "CLERK"�� ���� �������� ID(emp_id), �̸�(name), ����(job), �޿�(salary)�� ��ȸ
--(�޿��� ���� ������ , �� ����ϰ� �տ� $�� �ٿ��� ���.)

select emp_id, emp_name, job, to_char(salary, 'FM$999,999.00') as "salary"
from emp
where job LIKE '%CLERK%';

-- ���ڿ� '20030503' �� 2003�� 05�� 03�� �� ���.
SELECT TO_CHAR(TO_DATE('20030503', 'YYYYMMDD'),'YYYY"��" MM"��" DD"��"')
FROM DUAL;

-- TODO: �μ���(dept_name)�� 'Finance'�� �������� ID(emp_id), �̸�(emp_name)�� �Ի�⵵(hire_date) 4�ڸ��� ����Ͻÿ�. (ex: 2004);
--to_char()
SELECT EMP_ID, EMP_NAME, to_char(HIRE_DATE, 'yyyy') as "�Ի�⵵", EXTRACT(year from hire_date)
FROM EMP
WHERE DEPT_NAME IN 'Finance';

--TODO: �������� 11���� �Ի��� �������� ����ID(emp_id), �̸�(emp_name), �Ի���(hire_date)�� ��ȸ
--to_char()
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMP
WHERE TO_CHAR(HIRE_DATE,'MM') = '11';
--WHERE EXTRACT(MONTH FROM HIRE_DATE) = 11;

--TODO: 2006�⿡ �Ի��� ��� ������ �̸�(emp_name)�� �Ի���(yyyy-mm-dd ����)�� �Ի���(hire_date)�� ������������ ��ȸ
--to_char()
SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS �Ի���
FROM EMP
WHERE TO_CHAR(HIRE_DATE, 'YYYY') = 2006
--WHERE EXTRACT(YEAR FROM HIRE_DATE) = 2006
ORDER BY HIRE_DATE ASC;

--TODO: 2004�� 05�� ���� �Ի��� ���� ��ȸ�� �̸�(emp_name)�� �Ի���(hire_date) ��ȸ

SELECT EMP_NAME, HIRE_DATE
FROM EMP
WHERE TO_CHAR(HIRE_DATE, 'YYYYMM') > '200405'
--WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2004 AND EXTRACT(MONTH FROM HIRE_DATE) >= 5
ORDER BY HIRE_DATE ASC;


--TODO: ���ڿ� '20100107232215' �� 2010�� 01�� 07�� 23�� 22�� 15�� �� ���. (dual ���Ժ� ���)
SELECT TO_CHAR(TO_DATE('20100107232215','YYYYMMDDHH24MISS'), 'YYYY"��" MM"��" DD"��" HH24"��" MI"��" SS"��"')
FROM DUAL;

/* *************************************
�Լ� - null ���� �Լ� 
NVL(expr, �⺻��) : expr���� null�̸� �⺻���� null�� �ƴϸ� expr���� ��ȯ.
NVL2(expr, nn, null) - expr�� null�� �ƴϸ� nn, ���̸� ����°
nullif(ex1, ex2) ���� ������ null, �ٸ��� ex1

************************************* */
SELECT NVL(null,0),
nvl(null,'����'),
nvl(20,1),
nvl2(null, 'null�ƴ�','null��'),
nvl2(1, 'null�ƴ�','null��')
from dual;

select nvl2(null, 'null�ƴ�','null��'),
nvl2(17, 'null�ƴ�','null��')
from dual;

select nullif(10,10),
nullif(10,11)
from dual;

-- EMP ���̺��� ���� ID(emp_id), �̸�(emp_name), �޿�(salary), Ŀ�̼Ǻ���(comm_pct)�� ��ȸ. �� Ŀ�̼Ǻ����� NULL�� ������ 0�� ��µǵ��� �Ѵ�..
select emp_id, emp_name, salary, nvl(comm_pct,0) as comm_pct, 
nvl2(comm_pct, 'Ŀ�̼�����','Ŀ�̼Ǿ���') as comm_pct2
from emp;



--TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), ����(job), �μ�(dept_name)�� ��ȸ. �μ��� ���� ��� '�μ��̹�ġ'�� ���.


--TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), �޿�(salary), Ŀ�̼� (salary * comm_pct)�� ��ȸ. Ŀ�̼��� ���� ������ 0�� ��ȸ�Ƿ� �Ѵ�.



/* *************************************
DECODE�Լ��� CASE ��
- �����
decode(�÷�, [�񱳰�, ��°�, ...] , else���) 
- decode():����Ŭ
- case ǥ�� ����
case�� �����
case �÷� when �񱳰� then ��°�
              [when �񱳰� then ��°�]
              [else ��°�]
              end
              
case�� ���ǹ�
case when ���� then ��°�
       [when ���� then ��°�]
       [else ��°�]
       end
-- ����: where�� ������
************************************* */

select decode(dept_name, 'Shipping', '���', 
                         'Sales', '����', 
                         'Purchasing','����', 
                         'Marketing', '������', 
                         null,'�μ�����', 
                         dept_name) as dept, dept_name
from emp
order by dept_name desc;

select case dept_name when 'Shipping' then '���' 
                      when 'Sales' then '����'
                      when 'Purchasing' then '����' 
                      when 'Marketing' then '������' 
                      else nvl(dept_name,'�μ�����') end as dept,
                      dept_name
from emp
order by dept_name desc;

select case when dept_name is null then '�̹���'
            else dept_name end as dept, dept_name
from emp
order by dept_name desc;
--EMP���̺��� �޿��� �޿��� ����� ��ȸ�ϴµ� �޿� ����� 10000�̻��̸� '1���', 10000�̸��̸� '2���' ���� �������� ��ȸ

select case when salary>=10000 then '1���'
            else '2���' end as �޿����, salary 
from emp
order by 1;

--decode()/case �� �̿��� ����
-- �������� ��� ������ ��ȸ�Ѵ�. �� ������ ����(job)�� 'ST_CLERK', 'IT_PROG', 'PU_CLERK', 'SA_MAN' ������� ������������ �Ѵ�. (������ JOB�� �������)

select *
from emp
order by decode(job, 'ST_CLERK', '1', 
                   'IT_PROG','2', 
                   'PU_CLERK', '3',
                   'SA_MAN','4', job);

select *
from emp
order by case job when 'ST_CLERK' then '1' 
                  when 'IT_PROG' then '2' 
                  when 'PU_CLERK' then '3'
                  when 'SA_MAN' then'4'
                  else job end;

--TODO: EMP ���̺��� ����(job)�� 'AD_PRES'�ų� 'FI_ACCOUNT'�ų� 'PU_CLERK'�� �������� ID(emp_id), �̸�(emp_name), ����(job)�� ��ȸ. 
-- ����(job)�� 'AD_PRES'�� '��ǥ', 'FI_ACCOUNT'�� 'ȸ��', 'PU_CLERK'�� ��� '����'�� ��µǵ��� ��ȸ


--TODO: EMP ���̺��� �μ��̸�(dept_name)�� �޿� �λ���� ��ȸ. �޿� �λ���� �μ��̸��� 'IT' �̸� �޿�(salary)�� 10%�� 'Shipping' �̸� �޿�(salary)�� 20%�� 'Finance'�̸� 30%�� �������� 0�� ���
-- decode �� case���� �̿��� ��ȸ


--TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), �޿�(salary), �λ�� �޿��� ��ȸ�Ѵ�. 
--�� �޿� �λ����� �޿��� 5000 �̸��� 30%, 5000�̻� 10000 �̸��� 20% 10000 �̻��� 10% �� �Ѵ�.





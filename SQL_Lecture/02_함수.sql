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
select  upper('abc')
from    dual;

select  upper(emp_name)
from    emp;

select emp_name from emp;

select  upper('abcDE') "�ҹ��ڸ��빮�ڷ�",
        lower('ABCde') "�빮�ڸ��ҹ��ڷ�",
        initcap('abcde abcde abcde') "�ܾ��� ù���ڸ��빮��"
from dual;

select length('abcdef') "���ڼ�"
from dual;

select * from emp
where length(emp_name) > 7;


select lpad('abc', 10, '+') "A",
       length(lpad('abc', 10)),
       rpad('abc', 10) "B",
       rpad('123456789', 3) as "C"
from dual;

select substr('123456789', 2, 5), --2��° ���ں��� 5���ڸ� 
       substr('123456789', 2)
from dual;

select replace('010-1111-2222', '010','###') from dual;
select  trim('    abc     ')  "A",
        ltrim('    abc    ') "B",
        rtrim('    abc    ') "C"
from dual;

select * from emp
where  upper(emp_name) = 'PETER';


--EMP ���̺��� ������ �̸�(emp_name)�� ��� �빮��, �ҹ���, ù���� �빮��, �̸� ���ڼ��� ��ȸ
select  upper(emp_name) "�빮���̸�",
        lower(emp_name) "�ҹ����̸�",
        initcap(emp_name) "ù���ڸ��빮��",
        length(emp_name) "���ڼ�"
from    emp;        


-- TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), �޿�(salary), �μ�(dept_name)�� ��ȸ. �� �����̸�(emp_name)�� ��� �빮��, �μ�(dept_name)�� ��� �ҹ��ڷ� ���.
-- UPPER/LOWER


--(�Ʒ� 2���� �񱳰��� ��ҹ��ڸ� Ȯ���� �𸣴� ����)
--TODO: EMP ���̺��� ������ �̸�(emp_name)�� PETER�� ������ ��� ������ ��ȸ�Ͻÿ�.



--TODO: EMP ���̺��� ����(job)�� 'Sh_Clerk' �� ��������  ID(emp_id), �̸�(emp_name), ����(job), �޿�(salary)�� ��ȸ



--TODO: ���� �̸�(emp_name) �� �ڸ����� 15�ڸ��� ���߰� ���ڼ��� ���ڶ� ��� ������ �տ� �ٿ� ��ȸ. ���� �µ��� ��ȸ


    
--TODO: EMP ���̺��� ��� ������ �̸�(emp_name)�� �޿�(salary)�� ��ȸ.
--(��, "�޿�(salary)" ���� ���̰� 7�� ���ڿ��� �����, ���̰� 7�� �ȵ� ��� ���ʺ��� �� ĭ�� '_'�� ä��ÿ�. EX) ______5000) -LPAD() �̿�



-- TODO: EMP ���̺��� �̸�(emp_name)�� 10���� �̻��� �������� �̸�(emp_name)�� �̸��� ���ڼ� ��ȸ




/* *************************************
�Լ� - ���ڰ��� �Լ�

- ���: ����,�Ǽ�
 round(��, �ڸ���) : �ڸ������Ͽ��� �ݿø� (��� - �Ǽ���, ���� - ������, �⺻�� : 0)
 trunc(��, �ڸ���) : �ڸ������Ͽ��� ����(��� - �Ǽ���, ���� - ������, �⺻��: 0)
- ���: ���� 
 ceil(��) : �ø�
 floor(��) : ����
 
 mod(�����¼�, �����¼�) : �������� ������ ����
 
************************************* */
select round(1.2345, 2),
       round(1.5678, 2),
       round(1.5345, 0),
       round(156.12, -1)
from dual;

select trunc(1.5678, 2),
       trunc(156, -2)
from dual;

--ceil/floor : �Ǽ�->����
select ceil(15.67),
        floor(15.67)
from dual;

select round(10/3, 2)
from dual;


select mod(10,3) from dual;-- 10�� 3���� �������� ������?

--TODO: EMP ���̺��� �� ������ ���� ����ID(emp_id), �̸�(emp_name), �޿�(salary) �׸��� 15% �λ�� �޿�(salary)�� ��ȸ�ϴ� ���Ǹ� �ۼ��Ͻÿ�.
--(��, 15% �λ�� �޿��� �ø��ؼ� ������ ǥ���ϰ�, ��Ī�� "SAL_RAISE"�� ����.)



--TODO: ���� SQL������ �λ� �޿�(sal_raise)�� �޿�(salary) ���� ������ �߰��� ��ȸ (����ID(emp_id), �̸�(emp_name), 15% �λ�޿�, �λ�� �޿��� ���� �޿�(salary)�� ����)



-- TODO: EMP ���̺��� Ŀ�̼��� �ִ� �������� ����_ID(emp_id), �̸�(emp_name), Ŀ�̼Ǻ���(comm_pct), Ŀ�̼Ǻ���(comm_pct)�� 8% �λ��� ����� ��ȸ.
--(�� Ŀ�̼��� 8% �λ��� ����� �Ҽ��� ���� 2�ڸ����� �ݿø��ϰ� ��Ī�� comm_raise�� ����)




/* *************************************
�Լ� - ��¥���� ��� �� �Լ�

sysdate: ��������� �Ͻ�
Date +- ���� : ���� ���.
months_between(d1, d2) -����� ������(d1�� �ֱ�, d2�� ����)
add_months(d1, ����) - �������� ���� ��¥. ������ ��¥�� 1���� �Ĵ� ���� ������ ���� �ȴ�. 
next_day(d1, '����') - d1���� ù��° ������ ������ ��¥. ������ �ѱ�(locale)�� �����Ѵ�.
last_day(d) - d ���� ��������.
extract(year|month|day from date) - date���� year/month/day�� ����
************************************* */
select  sysdate,
        to_char(sysdate, 'yyyy/mm/dd hh24:mi:ss')
from dual;
--to_char(date��, '��¥����') : date�� ���ڿ��� ��ȯ

select  sysdate+10 "10����",
        sysdate-10 "10����"
from dual;        

select  months_between(sysdate, '2020/12/28')||'����',
        months_between(sysdate, '2019/10/28')||'����',
        ceil(months_between(sysdate, '2020/12/26'))||'����'
from dual;


select  add_months(sysdate, 2), --���: 2������
        add_months(sysdate, -2), --����: 2������
        add_months('2021/01/31', 1) 
from dual;

select  next_day(sysdate, '�ݿ���'),
        next_day(sysdate, '������')
from dual;        

select last_day(sysdate) from dual;
select  extract(year from sysdate),
        extract(month from sysdate),
        extract(day from sysdate)
from dual;        

select * from emp
where extract(month from hire_date) = 11;

--TODO: EMP ���̺��� �μ��̸�(dept_name)�� 'IT'�� �������� '�Ի���(hire_date)�� ���� 10����', �Ի��ϰ� '�Ի��Ϸ� ���� 10����',  �� ��¥�� ��ȸ. 


--TODO: �μ��� 'Purchasing' �� ������ �̸�(emp_name), �Ի� 6�������� �Ի���(hire_date), 6������ ��¥�� ��ȸ.
     

--TODO: EMP ���̺��� �Ի��ϰ� �Ի��� 2�� ��, �Ի��� 2�� �� ��¥�� ��ȸ.


-- TODO: �� ������ �̸�(emp_name), �ٹ� ������ (�Ի��Ͽ��� ��������� �� ��)�� ����Ͽ� ��ȸ.
--(�� �ٹ� �������� �Ǽ� �� ��� ������ �ݿø�. �ٹ������� ������������ ����.)


--TODO: ���� ID(emp_id)�� 100 �� ������ �Ի��� ���� ù��° �ݿ����� ��¥�� ���Ͻÿ�.


/* *************************************
�Լ� - ��ȯ �Լ�

#####################################################################################
#				# = to_char() =>	#					#<=to_char()=	#			#
#   Number Ÿ��	#					#  Character Ÿ��	#				#  Date Ÿ��	#
#				# <=to_number()=    #	    			#=to_date()=>	#			#
#####################################################################################

to_xxxx(��, ����)

to_char() : ������, ��¥���� ���������� ��ȯ
to_number() : �������� ���������� ��ȯ 
to_date() : �������� ��¥������ ��ȯ

L99999.999
  45.78
00000.000
00345.780


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

select 10+to_number('1,000', '9,999') from dual;
select to_char(100000000, '999,999,999') from dual;

select to_char(salary, 'fm9,999,999.00')
from emp;


select 10+to_number('1,000.53', '9,999.99')
from dual;

select  to_char(12345678, '999,999,999'),
        to_char(12345678, 'fm999,999,999'),
        to_char(12345678, '999,999'),
        to_char(10000, '$99,999'),
        to_char(10000, 'L99,999')
from dual;


select  to_char(1234.567, '0,000.000'),
        to_char(1234.56, '000,000.000'),
        to_char(1234.56, '999,999.999')
from dual;

select  to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'),
        to_char(sysdate, 'yyyy'),
        to_char(sysdate, 'day'),
        to_char(sysdate, 'dy'),
        to_char(sysdate, 'hh24:mi:ss'),
        to_char(sysdate, 'yyyy"��" mm"��" dd"��"')
from dual;

select  to_date('2000/10', 'yyyy/mm') from dual;

-- EMP ���̺��� ����(job)�� "CLERK"�� ���� �������� ID(emp_id), �̸�(name), ����(job), �޿�(salary)�� ��ȸ
--(�޿��� ���� ������ , �� ����ϰ� �տ� $�� �ٿ��� ���.)
select  emp_id, 
        emp_name,
        job,
        to_char(salary, 'fm$999,999.00') "salary"
from   emp
where  job like '%CLERK%';



-- ���ڿ� '20030503' �� 2003�� 05�� 03�� �� ���.
select to_char(to_date('20030503', 'yyyymmdd'), 'yyyy"��" mm"��" dd"��"')
from dual;

-- ��¥ : char(8)  yyyymmdd
-- �Ͻ� : char(15) yyyymmddhhmiss
--2021/01/28 16:50:28
--'20210128'
--'20210128165028'

-- TODO: �μ���(dept_name)�� 'Finance'�� �������� ID(emp_id), �̸�(emp_name)�� �Ի�⵵(hire_date) 4�ڸ��� ����Ͻÿ�. (ex: 2004);
--to_char()


--TODO: �������� 11���� �Ի��� �������� ����ID(emp_id), �̸�(emp_name), �Ի���(hire_date)�� ��ȸ
--to_char()


--TODO: 2006�⿡ �Ի��� ��� ������ �̸�(emp_name)�� �Ի���(yyyy-mm-dd ����)�� �Ի���(hire_date)�� ������������ ��ȸ
--to_char()


--TODO: 2004�� 05�� ���� �Ի��� ���� ��ȸ�� �̸�(emp_name)�� �Ի���(hire_date) ��ȸ



--TODO: ���ڿ� '20100107232215' �� 2010�� 01�� 07�� 23�� 22�� 15�� �� ���. (dual ���Ժ� ���)



/* *************************************
�Լ� - null ���� �Լ� 
NVL()
NVL2(expr, nn, null) - expr�� null�� �ƴϸ� nn, ���̸� ����°
nullif(ex1, ex2) ���� ������ null, �ٸ��� ex1

************************************* */

-- EMP ���̺��� ���� ID(emp_id), �̸�(emp_name), �޿�(salary), Ŀ�̼Ǻ���(comm_pct)�� ��ȸ. �� Ŀ�̼Ǻ����� NULL�� ������ 0�� ��µǵ��� �Ѵ�..


--TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), ����(job), �μ�(dept_name)�� ��ȸ. �μ��� ���� ��� '�μ��̹�ġ'�� ���.


--TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), �޿�(salary), Ŀ�̼� (salary * comm_pct)�� ��ȸ. Ŀ�̼��� ���� ������ 0�� ��ȸ�Ƿ� �Ѵ�.



/* *************************************
DECODE�Լ��� CASE ��
decode(�÷�, [�񱳰�, ��°�, ...] , else���) 

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

************************************* */
--EMP���̺��� �޿��� �޿��� ����� ��ȸ�ϴµ� �޿� ����� 10000�̻��̸� '1���', 10000�̸��̸� '2���' ���� �������� ��ȸ


--decode()/case �� �̿��� ����
-- �������� ��� ������ ��ȸ�Ѵ�. �� ������ ����(job)�� 'ST_CLERK', 'IT_PROG', 'PU_CLERK', 'SA_MAN' ������� ������������ �Ѵ�. (������ JOB�� �������)


--TODO: EMP ���̺��� ����(job)�� 'AD_PRES'�ų� 'FI_ACCOUNT'�ų� 'PU_CLERK'�� �������� ID(emp_id), �̸�(emp_name), ����(job)�� ��ȸ. 
-- ����(job)�� 'AD_PRES'�� '��ǥ', 'FI_ACCOUNT'�� 'ȸ��', 'PU_CLERK'�� ��� '����'�� ��µǵ��� ��ȸ


--TODO: EMP ���̺��� �μ��̸�(dept_name)�� �޿� �λ���� ��ȸ. �޿� �λ���� �μ��̸��� 'IT' �̸� �޿�(salary)�� 10%�� 'Shipping' �̸� �޿�(salary)�� 20%�� 'Finance'�̸� 30%�� �������� 0�� ���
-- decode �� case���� �̿��� ��ȸ


--TODO: EMP ���̺��� ������ ID(emp_id), �̸�(emp_name), �޿�(salary), �λ�� �޿��� ��ȸ�Ѵ�. 
--�� �޿� �λ����� �޿��� 5000 �̸��� 30%, 5000�̻� 10000 �̸��� 20% 10000 �̻��� 10% �� �Ѵ�.





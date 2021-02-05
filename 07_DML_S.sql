/* *********************************************************************
DML - ������(��)�� �ٷ�� SQL��
    - INSERT, SELECT(DQL), UPDATE, DELETE : CRUD

INSERT �� - �� �߰�
����
 - �����߰� :
   - INSERT INTO ���̺�� (�÷� [, �÷�]) VALUES (�� [, ��[])
   - ��� �÷��� ���� ���� ��� �÷� ���������� ���� �� �� �ִ�.

 - ��ȸ����� INSERT �ϱ� (subquery �̿�)
   - INSERT INTO ���̺�� (�÷� [, �÷�])  SELECT ����
	- INSERT�� �÷��� ��ȸ��(subquery) �÷��� ������ Ÿ���� �¾ƾ� �Ѵ�.
	- ��� �÷��� �� ���� ��� �÷� ������ ������ �� �ִ�.
	
  
************************************************************************ */
DESC DEPT;
INSERT INTO DEPT (DEPT_ID, DEPT_NAME, LOC) VALUES (1000, '��ȹ��', '����');
INSERT INTO DEPT VALUES (1100, '���ź�', '�λ�');
ROLLBACK; -- INSERT/UPDATE/DELETE �ϱ� �� ���·� ������ ��ɾ�.
COMMIT; -- COMMIT���̸� ROLLBACK���� ������ ����(����)����.

INSERT INTO DEPT VALUES (1100, '���ź�', '�λ�');
INSERT INTO DEPT VALUES (1200, '���ź�', '�λ�');
INSERT INTO DEPT VALUES (1300, '���ź�', '�λ�');


INSERT INTO EMP VALUES(1000, 'ȫ�浿', 'FI_ACCOUNT', NULL, '2020/01/02', 7000, NULL, 10);
INSERT INTO EMP(EMP_ID, EMP_NAME, HIRE_DATE, SALARY) VALUES (1100, '�̼���', '2000/01/05', 6000);
INSERT INTO EMP VALUES(1200, '���浿', 'FI_ACCOUNT', NULL,TO_DATE('2020/01', 'YYYY/MM'), 7000, NULL, 10);

INSERT INTO EMP VALUES(1300, '���浿', 'FI_ACCOUNT', 100, '2020/02/01', 9999, 0.1, 10); -- �̹� �ִ� PK���� INSERT

SELECT * FROM DEPT ORDER BY DEPT_ID DESC;


SELECT * FROM EMP ORDER BY EMP_ID DESC;
--TODO: �μ��� ������ �޿��� ���� ��� ���̺� ����. 
--      ��ȸ����� insert. ����: �հ�, ���, �ִ�, �ּ�, �л�, ǥ������
create table salary_stat(
    dept_id number(6),
    salary_sum number(15,2),
    salary_avg number(10, 2),
    salary_max number(7,2),
    salary_min number(7,2),
    salary_var number(20,2),
    salary_stddev number(7,2)
);
INSERT INTO SALARY_STAT
SELECT DEPT_ID,
       SUM(SALARY),
       ROUND(AVG(SALARY),2),
       MAX(SALARY),
       MIN(SALARY),
       ROUND(VARIANCE(SALARY),2),
       ROUND(STDDEV(SALARY),2)
FROM EMP
GROUP BY DEPT_ID
ORDER BY DEPT_ID;

SELECT * FROM SALARY_STAT;
ROLLBACK;
COMMIT;
/* *********************************************************************
UPDATE : ���̺��� �÷��� ���� ����
UPDATE ���̺��
SET    ������ �÷� = ������ ��  [, ������ �÷� = ������ ��]
[WHERE ��������]

 - UPDATE: ������ ���̺� ����
 - SET: ������ �÷��� ���� ����
 - WHERE: ������ ���� ����. 
************************************************************************ */

create table emp_copy(
        emp_id number(6) ,
        emp_name varchar2(20),
        salary number(7,2)
)
-- ���� �ִ� ���̺��� Ư�� �÷��� �����Ҷ�


-- ���� ID�� 200�� ������ �޿��� 5000���� ����

UPDATE EMP
SET SALARY = 5000
WHERE EMP_ID = 200;
COMMIT;

SELECT * FROM EMP WHERE EMP_ID = 200;

-- ���� ID�� 200�� ������ �޿��� 10% �λ��� ������ ����.

UPDATE EMP
SET SALARY = SALARY *1.1
WHERE EMP_ID = 200;
COMMIT;

-- �μ� ID�� 100�� ������ Ŀ�̼� ������ 0.2�� salary�� 3000�� ���� ������, ���_id�� 100 ����.

SELECT * FROM  EMP WHERE EMP_ID = 100;
100	Steven	AD_PRES		2003/06/17	24000		90

UPDATE EMP
SET COMM_PCT = 0.2, SALARY = SALARY + 3000, MGR_ID = 100
WHERE EMP_ID = 100;

SELECT * FROM  EMP WHERE EMP_ID = 100;
100	Steven	AD_PRES	100	2003/06/17	27000	0.2	90
COMMIT;



-- TODO: �μ� ID�� 100�� �������� �޿��� 100% �λ�
 SELECT * FROM  EMP WHERE EMP_ID = 100;
 100	Steven	AD_PRES	100	2003/06/17	27000	0.2	90
 UPDATE EMP SET SALARY = SALARY * 2 WHERE EMP_ID = 100;
100	Steven	AD_PRES	100	2003/06/17	54000	0.2	90
-- TODO: IT �μ��� �������� �޿��� 3�� �λ�
103	Alexander	IT_PROG	102	2006/01/03	9000		60
104	Bruce	IT_PROG	103	2007/05/21	6000		60
105	David	IT_PROG	103	2005/06/25	4800		60
106	Valli	IT_PROG	103	2006/02/05	4800		60
107	Diana	IT_PROG	103	2007/02/07	4200		60

SELECT * FROM  EMP WHERE DEPT_ID = 60;

103	Alexander	IT_PROG	102	2006/01/03	27000		60
104	Bruce	IT_PROG	103	2007/05/21	18000		60
105	David	IT_PROG	103	2005/06/25	14400		60
106	Valli	IT_PROG	103	2006/02/05	14400		60
107	Diana	IT_PROG	103	2007/02/07	12600		60

SELECT * FROM DEPT;
UPDATE EMP 
SET SALARY = SALARY *3 
WHERE DEPT_ID IN (SELECT DEPT_ID
                FROM DEPT
                WHERE DEPT_NAME = 'IT');
                        
ROLLBACK;

-- TODO: EMP ���̺��� ��� �����͸� MGR_ID�� NULL�� HIRE_DATE �� �����Ͻ÷� COMM_PCT�� 0.5�� ����.

UPDATE EMP
SET MGR_ID = NULL,
    HIRE_DATE = SYSDATE,
    COMM_PCT = 0.5;

SELECT * FROM EMP;

ROLLBACK;

-- TODO: COMM_PCT �� 0.3�̻��� �������� COMM_PCT�� NULL �� ����.
SELECT EMP_NAME, COMM_PCT FROM EMP;

UPDATE EMP
SET COMM_PCT = NULL
WHERE COMM_PCT > 0.3;
ROLLBACK;

-- TODO: ��ü ��ձ޿����� ���� �޴� �������� �޿��� 50% �λ�.
SELECT EMP_NAME, SALARY FROM EMP ORDER BY SALARY;
SELECT SALARY FROM EMP WHERE SALARY < (SELECT AVG(SALARY) FROM EMP);
UPDATE EMP
SET SALARY = SALARY *1.5
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMP);
ROLLBACK;
/* *********************************************************************
DELETE : ���̺��� ���� ����
���� 
 - DELETE FROM ���̺�� [WHERE ��������]
   - WHERE: ������ ���� ����
************************************************************************ */
-- �μ����̺��� �μ�_ID�� 200�� �μ� ����
DELETE FROM EMP;
SELECT * FROM EMP WHERE DEPT_ID = 200;
ROLLBACK;
-- �μ����̺��� �μ�_ID�� 10�� �μ� ����

DELETE FROM EMP WHERE DEPT_ID = 200;
SELECT * FROM EMP WHERE DEPT_ID = 10;


-- TODO: �μ� ID�� ���� �������� ����

SELECT * FROM EMP WHERE DEPT_ID IS NULL;

DELETE FROM EMP WHERE DEPT_ID IS NULL;

ROLLBACK;
-- TODO: ��� ����(emp.job_id)�� 'SA_MAN'�̰� �޿�(emp.salary) �� 12000 �̸��� �������� ����.
SELECT * FROM EMP WHERE JOB_ID IN 'SA_MAN' AND SALARY < 12000;
DELETE FROM EMP WHERE JOB_ID IN 'SA_MAN' AND SALARY < 12000;

ROLLBACK;
-- TODO: comm_pct �� null�̰� job_id �� IT_PROG�� �������� ����

SELECT * FROM EMP WHERE COMM_PCT IS NULL AND JOB_ID IN 'IT_PROG';

DELETE FROM EMP WHERE COMM_PCT IS NULL AND JOB_ID IN 'IT_PROG';
ROLLBACK;
-- TODO: job_id�� CLERK�� �� ������ �ϴ� ������ ����

SELECT * FROM EMP WHERE JOB_ID LIKE '%CLERK%';

DELETE FROM EMP WHERE JOB_ID LIKE '%CLERK%';

ROLLBACK;

-- EMP_ID 100���� JOB_ID�� ���ﶧ -- DELETE�� �ƴ� UPDATE
SELECT * FROM EMP WHERE EMP_ID = 100;

UPDATE EMP
SET JOB_ID = NULL
WHERE EMP_ID = 100;

ROLLBACK;


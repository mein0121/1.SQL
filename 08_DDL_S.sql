select * from USER_CONSTRAINTS where TABLE_NAME ='EMP';

/* ***********************************************************************************
DDL = DATABASE�� ��ü(���̺�, ����, ������ ��)�� �����Ѵ�.
- ����(CREATE), ����(ALTER), ����(DROP)
���̺� ����
- ����
create table ���̺�_�̸�(
  �÷� ����
)

�������� ���� 
- �÷� ���� ����
    - �÷� ������ ���� ����
- ���̺� ���� ����
    - �÷� �����ڿ� ���� ����

- �⺻ ���� : constraint ���������̸� ��������Ÿ��
- ���̺� ���� ���� ��ȸ
    - USER_CONSTRAINTS ��ųʸ� �信�� ��ȸ
    
���̺� ����
- ����
DROP TABLE ���̺��̸� [CASCADE CONSTRAINTS]
*********************************************************************************** */

CREATE TABLE PARENT_TB(
    NO NUMBER CONSTRAINT PK_PARENT_TB PRIMARY KEY, -- �÷� �̸��� ���� ���� 
    -- NO NUMBER PRIMARY KEY -- �÷� �̸��� ����Ʈ������ ����
    NAME NVARCHAR2(30) NOT  NULL,
    BIRTHDAY DATE DEFAULT SYSDATE, -- �⺻�� ����: INSERT�� ���� ���� ������ �⺻��(SYSDATE)����.
    EMAIL VARCHAR2(100) CONSTRAINT UK_PARENT_TB_EMAIL UNIQUE, -- ����ũŰ(�ߺ��� ���� ��������, null����) ������ �÷��̸� ����.
    -- EMAIL VARCHAR2(100) UNIQUE, -- �÷��̸��� ����Ʈ������ ����.
    GENDER CHAR(1) NOT NULL CONSTRAINT CK_PARENT_TB_GENDER CHECK(GENDER IN ('M','F'))
    -- CHECK ��������: Ư�� ���� �������ֵ��� ����.
);

insert into PARENT_TB values(1, 'ȫ�浿', '2000/01/01', 'a@a.com', 'M');
INSERT INTO parent_tb (no, name, gender) values (2, '�̼���', 'M');
insert into PARENT_TB values(3, 'ȫ�浿1', null, 'b@a.com', 'M');
select * from parent_tb;

/* ************************************************************************************
ALTER : ���̺� ����

�÷� ���� ����

- �÷� �߰�
  ALTER TABLE ���̺��̸� ADD (�߰��� �÷����� [, �߰��� �÷�����])
  - �ϳ��� �÷��� �߰��� ��� ( ) �� ��������

- �÷� ����
  ALTER TABLE ���̺��̸� MODIFY (�������÷���  ���漳�� [, �������÷���  ���漳��])
	- �ϳ��� �÷��� ������ ��� ( )�� ���� ����
	- ����/���ڿ� �÷��� ũ�⸦ �ø� �� �ִ�.
		- ũ�⸦ ���� �� �ִ� ��� : ���� ���� ���ų� ��� ���� ���̷��� ũ�⺸�� ���� ���
	- �����Ͱ� ��� NULL�̸� ������Ÿ���� ������ �� �ִ�. (�� CHAR<->VARCHAR2 �� ����.)

- �÷� ����	
  ALTER TABLE ���̺��̸� DROP COLUMN �÷��̸� [CASCADE CONSTRAINTS]
    - CASCADE CONSTRAINTS : �����ϴ� �÷��� Primary Key�� ��� �� �÷��� �����ϴ� �ٸ� ���̺��� Foreign key ������ ��� �����Ѵ�.
	- �ѹ��� �ϳ��� �÷��� ���� ����.
	
  ALTER TABLE ���̺��̸� SET UNUSED (�÷��� [, ..])
  ALTER TABLE ���̺��̸� DROP UNUSED COLUMNS
	- SET UNUSED ������ �÷��� �ٷ� �������� �ʰ� ���� ǥ�ø� �Ѵ�. 
	- ������ �÷��� ����� �� ������ ���� ��ũ���� ����� �ִ�. �׷��� �ӵ��� ������.
	- DROP UNUSED COLUMNS �� SET UNUSED�� �÷��� ��ũ���� �����Ѵ�. 

- �÷� �̸� �ٲٱ�
  ALTER TABLE ���̺��̸� RENAME COLUMN �����̸� TO �ٲ��̸�;

**************************************************************************************  
���� ���� ���� ����
-�������� �߰�
  ALTER TABLE ���̺�� ADD CONSTRAINT �������� ����

- �������� ����
  ALTER TABLE ���̺�� DROP CONSTRAINT ���������̸�
  PRIMARY KEY ����: ALTER TABLE ���̺�� DROP PRIMARY KEY [CASCADE]
	- CASECADE : �����ϴ� Primary Key�� Foreign key ���� �ٸ� ���̺��� Foreign key ������ ��� �����Ѵ�.

- NOT NULL <-> NULL ��ȯ�� �÷� ������ ���� �Ѵ�.
   - ALTER TABLE ���̺�� MODIFY (�÷��� NOT NULL),  - ALTER TABLE ���̺�� MODIFY (�÷��� NULL)  
************************************************************************************ */



--TODO: emp ���̺��� ī���ؼ� emp2�� ����(Ʋ�� ī��)

CREATE TABLE EMP2
AS 
SELECT * FROM EMP WHERE 1 !=1;

SELECT *FROM EMP2;
DESC EMP2;

--TODO: gender �÷��� �߰�: type char(1)

ALTER TABLE EMP2 ADD (GENDER CHAR(1));

--TODO: email �÷� �߰�. type: varchar2(100),  not null  �÷�

ALTER TABLE EMP2 ADD (EMAIL VARCHAR2(100) NOT NULL);

--TODO: jumin_num(�ֹι�ȣ) �÷��� �߰�. type: char(14), null ���. ������ ���� ������ �÷�.

ALTER TABLE EMP2 ADD (JUMIN_NUM CHAR(14) CONSTRAINT UK_EMP2_JUMIN UNIQUE);
DESC EMP2;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP2';

--TODO: emp_id �� primary key �� ����

ALTER TABLE EMP2 ADD CONSTRAINTS PK_EMP2 PRIMARY KEY(EMP_ID);


--TODO: gender �÷��� M, F �����ϵ���  �������� �߰�

ALTER TABLE EMP2 ADD CONSTRAINTS CK_EMP2_GENDER CHECK(GENDER IN ('M', 'F'));
 
--TODO: salary �÷��� 0�̻��� ���鸸 ������ �������� �߰�

ALTER TABLE EMP2 ADD CONSTRAINTS CK_EMP2_SALARY CHECK(SALARY > 0);


--TODO: email �÷��� null�� ���� �� �ֵ� �ٸ� ��� ���� ���� ������ ���ϵ��� ���� ���� ����

ALTER TABLE EMP2 MODIFY(EMAIL NULL);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP2';

--TODO: emp_name �� ������ Ÿ���� varchar2(100) ���� ��ȯ

ALTER TABLE EMP2 MODIFY(EMP_NAME VARCHAR2(100));
DESC EMP2;

--TODO: job_id�� not null �÷����� ����

ALTER TABLE EMP2 MODIFY(JOB_ID NOT NULL);

--TODO: dept_id�� not null �÷����� ����

ALTER TABLE EMP2 MODIFY(DEPT_ID NOT NULL);


--TODO: job_id  �� null ��� �÷����� ����

ALTER TABLE EMP2 MODIFY(JOB_ID NULL);


--TODO: dept_id  �� null ��� �÷����� ����

ALTER TABLE EMP2 MODIFY(DEPT_ID NULL);
DESC EMP2;

--TODO: ������ ������ uk_emp2_email ���� ������ ����



--TODO: ������ ������ ck_emp2_salary ���� ������ ����

alter table emp2 drop constraint ck_emp2_salary;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP2';

--TODO: primary key �������� ����

alter table emp2 drop primary key;


--TODO: gender �÷�����

alter table emp2 drop column gender;

--TODO: email �÷� ����

alter table emp2 drop column email;

desc emp2;


/* **************************************************************************************************************
������ : SEQUENCE
- �ڵ������ϴ� ���ڸ� �����ϴ� ����Ŭ ��ü
- ���̺� �÷��� �ڵ������ϴ� ������ȣ�� ������ ����Ѵ�.
	- �ϳ��� �������� ���� ���̺��� �����ϸ� �߰��� �� ������ �� �� �ִ�.

���� ����
CREATE SEQUENCE sequence�̸�
	[INCREMENT BY n]	
	[START WITH n]                		  
	[MAXVALUE n | NOMAXVALUE]   
	[MINVALUE n | NOMINVALUE]	
	[CYCLE | NOCYCLE(�⺻)]		
	[CACHE n | NOCACHE]		  

- INCREMENT BY n: ����ġ ����. ������ 1
- START WITH n: ���� �� ����. ������ 0
	- ���۰� ������
	 - ����: MINVALUE ���� ũĿ�� ���� ���̾�� �Ѵ�.
	 - ����: MAXVALUE ���� �۰ų� ���� ���̾�� �Ѵ�.
- MAXVALUE n: �������� ������ �� �ִ� �ִ밪�� ����
- NOMAXVALUE : �������� ������ �� �ִ� �ִ밪�� ���������� ��� 10^27 �� ��. ���������� ��� -1�� �ڵ����� ����. 
- MINVALUE n :�ּ� ������ ���� ����
- NOMINVALUE :�������� �����ϴ� �ּҰ��� ���������� ��� 1, ���������� ��� -(10^26)���� ����
- CYCLE �Ǵ� NOCYCLE : �ִ�/�ּҰ����� ������ ��ȯ�� �� ����. NOCYCLE�� �⺻��(��ȯ�ݺ����� �ʴ´�.)
- CACHE|NOCACHE : ĳ�� ��뿩�� ����.(����Ŭ ������ �������� ������ ���� �̸� ��ȸ�� �޸𸮿� ����) NOCACHE�� �⺻��(CACHE�� ������� �ʴ´�. )


������ �ڵ������� ��ȸ
 - sequence�̸�.nextval  : ���� ����ġ ��ȸ
 - sequence�̸�.currval  : ���� �������� ��ȸ


������ ����
ALTER SEQUENCE ������ �������̸�
	[INCREMENT BY n]	               		  
	[MAXVALUE n | NOMAXVALUE]   
	[MINVALUE n | NOMINVALUE]	
	[CYCLE | NOCYCLE(�⺻)]		
	[CACHE n | NOCACHE]	

������ �����Ǵ� ������ ������ �޴´�. (�׷��� start with ���� ��������� �ƴϴ�.)	  


������ ����
DROP SEQUENCE sequence�̸�
	
************************************************************************************************************** */

-- 1���� 1�� �ڵ������ϴ� ������
create sequence dept_id_seq; -- �̸�����: �������� ����� �÷���_seq
--seq�̸�.nextval()
select DEPT_ID_SEQ.nextval from dual;
select DEPT_ID_SEQ.currval from dual;



insert into dept values(DEPT_ID_SEQ.nextval, '���μ�', '����');

insert into dept values(DEPT_ID_SEQ.nextval, '���μ�'||DEPT_ID_SEQ.currval, '����');

select * from dept ORDER BY DEPT_ID;

-- 1���� 50���� 10�� �ڵ����� �ϴ� ������
DROP SEQUENCE EX1_SEQ;

CREATE SEQUENCE EX1_SEQ
    INCREMENT BY 10
    MAXVALUE 50;
    
SELECT EX1_SEQ.NEXTVAL FROM DUAL;



-- 100 ���� 150���� 10�� �ڵ������ϴ� ������

CREATE SEQUENCE EX2_SEQ
    INCREMENT BY 10
    START WITH 100
    MAXVALUE 150;


SELECT EX2_SEQ.NEXTVAL FROM DUAL;

-- 100 ���� 150���� 20�� �ڵ������ϵ� �ִ밪�� �ٴٸ��� ��ȯ�ϴ� ������
-- ��ȯ(CYCLE)�Ҷ� ����(INCREMENT BY ���) : MINVALUE(�⺻��:1)���� ����
-- ��ȯ(CYCLE)�Ҷ� ����(INCREMENT BY ����) : MAXVALUE(�⺻��:-1)���� ����

DROP SEQUENCE EX3_SEQ;

CREATE SEQUENCE EX3_SEQ
    INCREMENT BY 10
    START WITH 100
    MAXVALUE 150
    MINVALUE 100
    CACHE 5
    CYCLE;

SELECT EX3_SEQ.NEXTVAL FROM DUAL;

-- -1���� �ڵ� �����ϴ� ������

CREATE SEQUENCE EX4_SEQ
    INCREMENT BY -1; -- �ڵ�����: START WITH �⺻���� -1

SELECT EX4_SEQ.NEXTVAL FROM DUAL;


-- -1���� -50���� -10�� �ڵ� �����ϴ� ������

CREATE SEQUENCE EX5_SEQ
    INCREMENT BY -10
    START WITH -1
    MINVALUE -50;

SELECT EX5_SEQ.NEXTVAL FROM DUAL;

-- 100 ���� -100���� -100�� �ڵ� �����ϴ� ������

CREATE SEQUENCE EX6_SEQ
    INCREMENT BY -100
    START WITH 100
    MINVALUE -100
    MAXVALUE 100;

SELECT EX6_SEQ.NEXTVAL FROM DUAL;

-- 15���� -15���� 1�� �����ϴ� ������ �ۼ�

DROP SEQUENCE EX7_SEQ;

CREATE SEQUENCE EX7_SEQ
    INCREMENT BY -1
    START WITH 15
    MINVALUE -15
    MAXVALUE 15;

SELECT EX7_SEQ.NEXTVAL FROM DUAL;


-- -10 ���� 1�� �����ϴ� ������ �ۼ�

CREATE SEQUENCE EX8_SEQ
    INCREMENT BY 1
    START WITH -10
    MINVALUE -10; --���� MINVALUE 1�� �⺻��. ����: MINVALUE

SELECT EX8_SEQ.NEXTVAL FROM DUAL;

-- Sequence�� �̿��� �� insert







-- TODO: �μ�ID(dept.dept_id)�� ���� �ڵ����� ��Ű�� sequence�� ����. 10 ���� 10�� �����ϴ� sequence
-- ������ ������ sequence�� ����ؼ�  dept_copy�� 5���� ���� insert.

CREATE SEQUENCE DEPT_ID2_SEQ
    START WITH 10
    INCREMENT BY 10;

CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT WHERE 1<>1;

SELECT * FROM DEPT_COPY;

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '��ȹ��','����');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '���ߺ�','����');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '���ź�','����');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '��ȹ��','����');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '��ȹ��','����');

-- TODO: ����ID(emp.emp_id)�� ���� �ڵ����� ��Ű�� sequence�� ����. 10 ���� 1�� �����ϴ� sequence
-- ������ ������ sequence�� ����� emp_copy�� ���� 5�� insert

CREATE SEQUENCE EMP_ID_SEQ
    START WITH 10;
    
INSERT INTO EMP2 VALUES(EMP_ID_SEQ.NEXTVAL, 'HONG', NULL,NULL,'2021/01/05',30000, NULL,NULL,NULL);
INSERT INTO EMP2 VALUES(EMP_ID_SEQ.NEXTVAL, 'KANG', NULL,NULL,'2021/01/05',30000, NULL,NULL,NULL);
INSERT INTO EMP2 VALUES(EMP_ID_SEQ.NEXTVAL, 'KIM', NULL,NULL,'2021/01/05',30000, NULL,NULL,NULL);

SELECT * FROM EMP2;
COMMIT;
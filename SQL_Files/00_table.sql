-- �����ּ�
/*
block�ּ�
table: member
�Ӽ�: 
id: varchar2(10), primary key 
password: varchar2(10) not null
name : nvarchar2(50) not null
point : number(7) nullable -9999999 ~ 9999999 
join_date : date not null
*/
--���� : control + enter
CREATE TABLE member(
    id varchar2(10) PRIMARY KEY,
    password varchar2(10) NOT NULL,
    name NVARCHAR2(50) NOT NULL,
    point NUMBER(7),
    join_date DATE NOT NULL    
);
SELECT * FROM tab;

-- ���̺� ���� 
--DROP TABLE member CASCADE CONSTRAINTS;

-- ������ ���� �߰� - insert
-- ���ڿ� : ' ' ���Ѵ�.
-- date : '��/��/��' - ��/���� �ܴ����� ��� �տ� 0�� ���δ�.05 03
-- NULLABLE ��������.
INSERT INTO member(id, password, name, point, join_date) VALUES ('id-1','abcde','Hong',10000,'2020/01/26');
INSERT INTO member(id, password, name, join_date) VALUES ('id-3','abcde','Hong','2020/01/26');

-- ��� �÷��� ���� �� ���� ��� �÷����� ���� ����
INSERT INTO member VALUES('id-2','deeee','Kang',20000,'2020/02/26');
INSERT INTO member VALUES('id-345785212','995aaff','Shin',1000,'2019/02/26');
INSERT INTO member VALUES('id-77','deeee','KIM',NULL,'2020/02/26');

SELECT
    *
FROM MEMBER;




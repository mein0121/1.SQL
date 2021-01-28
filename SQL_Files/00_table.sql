-- 한줄주석
/*
block주석
table: member
속성: 
id: varchar2(10), primary key 
password: varchar2(10) not null
name : nvarchar2(50) not null
point : number(7) nullable -9999999 ~ 9999999 
join_date : date not null
*/
--실행 : control + enter
CREATE TABLE member(
    id varchar2(10) PRIMARY KEY,
    password varchar2(10) NOT NULL,
    name NVARCHAR2(50) NOT NULL,
    point NUMBER(7),
    join_date DATE NOT NULL    
);
SELECT * FROM tab;

-- 테이블 제거 
--DROP TABLE member CASCADE CONSTRAINTS;

-- 한행의 값을 추가 - insert
-- 문자열 : ' ' 감싼다.
-- date : '년/월/일' - 월/일이 단단위일 경우 앞에 0을 붙인다.05 03
-- NULLABLE 생략가능.
INSERT INTO member(id, password, name, point, join_date) VALUES ('id-1','abcde','Hong',10000,'2020/01/26');
INSERT INTO member(id, password, name, join_date) VALUES ('id-3','abcde','Hong','2020/01/26');

-- 모든 컬럼에 값을 다 넣을 경우 컬럼명은 생략 가능
INSERT INTO member VALUES('id-2','deeee','Kang',20000,'2020/02/26');
INSERT INTO member VALUES('id-345785212','995aaff','Shin',1000,'2019/02/26');
INSERT INTO member VALUES('id-77','deeee','KIM',NULL,'2020/02/26');

SELECT
    *
FROM MEMBER;




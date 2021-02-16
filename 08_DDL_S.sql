select * from USER_CONSTRAINTS where TABLE_NAME ='EMP';

/* ***********************************************************************************
DDL = DATABASE에 객체(테이블, 유저, 시퀀스 등)를 관리한다.
- 생성(CREATE), 수정(ALTER), 삭제(DROP)
테이블 생성
- 구문
create table 테이블_이름(
  컬럼 설정
)

제약조건 설정 
- 컬럼 레벨 설정
    - 컬럼 설정에 같이 설정
- 테이블 레벨 설정
    - 컬럼 설정뒤에 따로 설정

- 기본 문법 : constraint 제약조건이름 제약조건타입
- 테이블 제약 조건 조회
    - USER_CONSTRAINTS 딕셔너리 뷰에서 조회
    
테이블 삭제
- 구분
DROP TABLE 테이블이름 [CASCADE CONSTRAINTS]
*********************************************************************************** */

CREATE TABLE PARENT_TB(
    NO NUMBER CONSTRAINT PK_PARENT_TB PRIMARY KEY, -- 컬럼 이름을 직점 지정 
    -- NO NUMBER PRIMARY KEY -- 컬럼 이름을 디폴트값으로 지정
    NAME NVARCHAR2(30) NOT  NULL,
    BIRTHDAY DATE DEFAULT SYSDATE, -- 기본값 설정: INSERT시 값을 넣지 않으면 기본값(SYSDATE)으로.
    EMAIL VARCHAR2(100) CONSTRAINT UK_PARENT_TB_EMAIL UNIQUE, -- 유니크키(중복된 값이 들어갈수없다, null제외) 설정시 컬럼이름 지정.
    -- EMAIL VARCHAR2(100) UNIQUE, -- 컬럼이름을 디폴트값으로 지정.
    GENDER CHAR(1) NOT NULL CONSTRAINT CK_PARENT_TB_GENDER CHECK(GENDER IN ('M','F'))
    -- CHECK 제약조건: 특정 값만 가질수있도록 설정.
);

insert into PARENT_TB values(1, '홍길동', '2000/01/01', 'a@a.com', 'M');
INSERT INTO parent_tb (no, name, gender) values (2, '이순신', 'M');
insert into PARENT_TB values(3, '홍길동1', null, 'b@a.com', 'M');
select * from parent_tb;

/* ************************************************************************************
ALTER : 테이블 수정

컬럼 관련 수정

- 컬럼 추가
  ALTER TABLE 테이블이름 ADD (추가할 컬럼설정 [, 추가할 컬럼설정])
  - 하나의 컬럼만 추가할 경우 ( ) 는 생략가능

- 컬럼 수정
  ALTER TABLE 테이블이름 MODIFY (수정할컬럼명  변경설정 [, 수정할컬럼명  변경설정])
	- 하나의 컬럼만 수정할 경우 ( )는 생략 가능
	- 숫자/문자열 컬럼은 크기를 늘릴 수 있다.
		- 크기를 줄일 수 있는 경우 : 열에 값이 없거나 모든 값이 줄이려는 크기보다 작은 경우
	- 데이터가 모두 NULL이면 데이터타입을 변경할 수 있다. (단 CHAR<->VARCHAR2 는 가능.)

- 컬럼 삭제	
  ALTER TABLE 테이블이름 DROP COLUMN 컬럼이름 [CASCADE CONSTRAINTS]
    - CASCADE CONSTRAINTS : 삭제하는 컬럼이 Primary Key인 경우 그 컬럼을 참조하는 다른 테이블의 Foreign key 설정을 모두 삭제한다.
	- 한번에 하나의 컬럼만 삭제 가능.
	
  ALTER TABLE 테이블이름 SET UNUSED (컬럼명 [, ..])
  ALTER TABLE 테이블이름 DROP UNUSED COLUMNS
	- SET UNUSED 설정시 컬럼을 바로 삭제하지 않고 삭제 표시를 한다. 
	- 설정된 컬럼은 사용할 수 없으나 실제 디스크에는 저장되 있다. 그래서 속도가 빠르다.
	- DROP UNUSED COLUMNS 로 SET UNUSED된 컬럼을 디스크에서 삭제한다. 

- 컬럼 이름 바꾸기
  ALTER TABLE 테이블이름 RENAME COLUMN 원래이름 TO 바꿀이름;

**************************************************************************************  
제약 조건 관련 수정
-제약조건 추가
  ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건 설정

- 제약조건 삭제
  ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건이름
  PRIMARY KEY 제거: ALTER TABLE 테이블명 DROP PRIMARY KEY [CASCADE]
	- CASECADE : 제거하는 Primary Key를 Foreign key 가진 다른 테이블의 Foreign key 설정을 모두 삭제한다.

- NOT NULL <-> NULL 변환은 컬럼 수정을 통해 한다.
   - ALTER TABLE 테이블명 MODIFY (컬럼명 NOT NULL),  - ALTER TABLE 테이블명 MODIFY (컬럼명 NULL)  
************************************************************************************ */



--TODO: emp 테이블을 카피해서 emp2를 생성(틀만 카피)

CREATE TABLE EMP2
AS 
SELECT * FROM EMP WHERE 1 !=1;

SELECT *FROM EMP2;
DESC EMP2;

--TODO: gender 컬럼을 추가: type char(1)

ALTER TABLE EMP2 ADD (GENDER CHAR(1));

--TODO: email 컬럼 추가. type: varchar2(100),  not null  컬럼

ALTER TABLE EMP2 ADD (EMAIL VARCHAR2(100) NOT NULL);

--TODO: jumin_num(주민번호) 컬럼을 추가. type: char(14), null 허용. 유일한 값을 가지는 컬럼.

ALTER TABLE EMP2 ADD (JUMIN_NUM CHAR(14) CONSTRAINT UK_EMP2_JUMIN UNIQUE);
DESC EMP2;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP2';

--TODO: emp_id 를 primary key 로 변경

ALTER TABLE EMP2 ADD CONSTRAINTS PK_EMP2 PRIMARY KEY(EMP_ID);


--TODO: gender 컬럼의 M, F 저장하도록  제약조건 추가

ALTER TABLE EMP2 ADD CONSTRAINTS CK_EMP2_GENDER CHECK(GENDER IN ('M', 'F'));
 
--TODO: salary 컬럼에 0이상의 값들만 들어가도록 제약조건 추가

ALTER TABLE EMP2 ADD CONSTRAINTS CK_EMP2_SALARY CHECK(SALARY > 0);


--TODO: email 컬럼을 null을 가질 수 있되 다른 행과 같은 값을 가지지 못하도록 제약 조건 변경

ALTER TABLE EMP2 MODIFY(EMAIL NULL);

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP2';

--TODO: emp_name 의 데이터 타입을 varchar2(100) 으로 변환

ALTER TABLE EMP2 MODIFY(EMP_NAME VARCHAR2(100));
DESC EMP2;

--TODO: job_id를 not null 컬럼으로 변경

ALTER TABLE EMP2 MODIFY(JOB_ID NOT NULL);

--TODO: dept_id를 not null 컬럼으로 변경

ALTER TABLE EMP2 MODIFY(DEPT_ID NOT NULL);


--TODO: job_id  를 null 허용 컬럼으로 변경

ALTER TABLE EMP2 MODIFY(JOB_ID NULL);


--TODO: dept_id  를 null 허용 컬럼으로 변경

ALTER TABLE EMP2 MODIFY(DEPT_ID NULL);
DESC EMP2;

--TODO: 위에서 지정한 uk_emp2_email 제약 조건을 제거



--TODO: 위에서 지정한 ck_emp2_salary 제약 조건을 제거

alter table emp2 drop constraint ck_emp2_salary;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP2';

--TODO: primary key 제약조건 제거

alter table emp2 drop primary key;


--TODO: gender 컬럼제거

alter table emp2 drop column gender;

--TODO: email 컬럼 제거

alter table emp2 drop column email;

desc emp2;


/* **************************************************************************************************************
시퀀스 : SEQUENCE
- 자동증가하는 숫자를 제공하는 오라클 객체
- 테이블 컬럼이 자동증가하는 고유번호를 가질때 사용한다.
	- 하나의 시퀀스를 여러 테이블이 공유하면 중간이 빈 값들이 들어갈 수 있다.

생성 구문
CREATE SEQUENCE sequence이름
	[INCREMENT BY n]	
	[START WITH n]                		  
	[MAXVALUE n | NOMAXVALUE]   
	[MINVALUE n | NOMINVALUE]	
	[CYCLE | NOCYCLE(기본)]		
	[CACHE n | NOCACHE]		  

- INCREMENT BY n: 증가치 설정. 생략시 1
- START WITH n: 시작 값 설정. 생략시 0
	- 시작값 설정시
	 - 증가: MINVALUE 보다 크커나 같은 값이어야 한다.
	 - 감소: MAXVALUE 보다 작거나 같은 값이어야 한다.
- MAXVALUE n: 시퀀스가 생성할 수 있는 최대값을 지정
- NOMAXVALUE : 시퀀스가 생성할 수 있는 최대값을 오름차순의 경우 10^27 의 값. 내림차순의 경우 -1을 자동으로 설정. 
- MINVALUE n :최소 시퀀스 값을 지정
- NOMINVALUE :시퀀스가 생성하는 최소값을 오름차순의 경우 1, 내림차순의 경우 -(10^26)으로 설정
- CYCLE 또는 NOCYCLE : 최대/최소값까지 갔을때 순환할 지 여부. NOCYCLE이 기본값(순환반복하지 않는다.)
- CACHE|NOCACHE : 캐쉬 사용여부 지정.(오라클 서버가 시퀀스가 제공할 값을 미리 조회해 메모리에 저장) NOCACHE가 기본값(CACHE를 사용하지 않는다. )


시퀀스 자동증가값 조회
 - sequence이름.nextval  : 다음 증감치 조회
 - sequence이름.currval  : 현재 시퀀스값 조회


시퀀스 수정
ALTER SEQUENCE 수정할 시퀀스이름
	[INCREMENT BY n]	               		  
	[MAXVALUE n | NOMAXVALUE]   
	[MINVALUE n | NOMINVALUE]	
	[CYCLE | NOCYCLE(기본)]		
	[CACHE n | NOCACHE]	

수정후 생성되는 값들이 영향을 받는다. (그래서 start with 절은 수정대상이 아니다.)	  


시퀀스 제거
DROP SEQUENCE sequence이름
	
************************************************************************************************************** */

-- 1부터 1씩 자동증가하는 시퀀스
create sequence dept_id_seq; -- 이름관례: 시퀀스를 사용할 컬럼명_seq
--seq이름.nextval()
select DEPT_ID_SEQ.nextval from dual;
select DEPT_ID_SEQ.currval from dual;



insert into dept values(DEPT_ID_SEQ.nextval, '새부서', '서울');

insert into dept values(DEPT_ID_SEQ.nextval, '새부서'||DEPT_ID_SEQ.currval, '서울');

select * from dept ORDER BY DEPT_ID;

-- 1부터 50까지 10씩 자동증가 하는 시퀀스
DROP SEQUENCE EX1_SEQ;

CREATE SEQUENCE EX1_SEQ
    INCREMENT BY 10
    MAXVALUE 50;
    
SELECT EX1_SEQ.NEXTVAL FROM DUAL;



-- 100 부터 150까지 10씩 자동증가하는 시퀀스

CREATE SEQUENCE EX2_SEQ
    INCREMENT BY 10
    START WITH 100
    MAXVALUE 150;


SELECT EX2_SEQ.NEXTVAL FROM DUAL;

-- 100 부터 150까지 20씩 자동증가하되 최대값에 다다르면 순환하는 시퀀스
-- 순환(CYCLE)할때 증가(INCREMENT BY 양수) : MINVALUE(기본값:1)에서 시작
-- 순환(CYCLE)할때 감소(INCREMENT BY 음수) : MAXVALUE(기본값:-1)에서 시작

DROP SEQUENCE EX3_SEQ;

CREATE SEQUENCE EX3_SEQ
    INCREMENT BY 10
    START WITH 100
    MAXVALUE 150
    MINVALUE 100
    CACHE 5
    CYCLE;

SELECT EX3_SEQ.NEXTVAL FROM DUAL;

-- -1부터 자동 감소하는 시퀀스

CREATE SEQUENCE EX4_SEQ
    INCREMENT BY -1; -- 자동감소: START WITH 기본값이 -1

SELECT EX4_SEQ.NEXTVAL FROM DUAL;


-- -1부터 -50까지 -10씩 자동 감소하는 시퀀스

CREATE SEQUENCE EX5_SEQ
    INCREMENT BY -10
    START WITH -1
    MINVALUE -50;

SELECT EX5_SEQ.NEXTVAL FROM DUAL;

-- 100 부터 -100까지 -100씩 자동 감소하는 시퀀스

CREATE SEQUENCE EX6_SEQ
    INCREMENT BY -100
    START WITH 100
    MINVALUE -100
    MAXVALUE 100;

SELECT EX6_SEQ.NEXTVAL FROM DUAL;

-- 15에서 -15까지 1씩 감소하는 시퀀스 작성

DROP SEQUENCE EX7_SEQ;

CREATE SEQUENCE EX7_SEQ
    INCREMENT BY -1
    START WITH 15
    MINVALUE -15
    MAXVALUE 15;

SELECT EX7_SEQ.NEXTVAL FROM DUAL;


-- -10 부터 1씩 증가하는 시퀀스 작성

CREATE SEQUENCE EX8_SEQ
    INCREMENT BY 1
    START WITH -10
    MINVALUE -10; --증가 MINVALUE 1이 기본값. 증가: MINVALUE

SELECT EX8_SEQ.NEXTVAL FROM DUAL;

-- Sequence를 이용한 값 insert







-- TODO: 부서ID(dept.dept_id)의 값을 자동증가 시키는 sequence를 생성. 10 부터 10씩 증가하는 sequence
-- 위에서 생성한 sequence를 사용해서  dept_copy에 5개의 행을 insert.

CREATE SEQUENCE DEPT_ID2_SEQ
    START WITH 10
    INCREMENT BY 10;

CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT WHERE 1<>1;

SELECT * FROM DEPT_COPY;

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '기획부','서울');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '개발부','서울');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '구매부','서울');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '기획부','서울');

INSERT INTO DEPT_COPY VALUES(DEPT_ID2_SEQ.NEXTVAL, '기획부','서울');

-- TODO: 직원ID(emp.emp_id)의 값을 자동증가 시키는 sequence를 생성. 10 부터 1씩 증가하는 sequence
-- 위에서 생성한 sequence를 사용해 emp_copy에 값을 5행 insert

CREATE SEQUENCE EMP_ID_SEQ
    START WITH 10;
    
INSERT INTO EMP2 VALUES(EMP_ID_SEQ.NEXTVAL, 'HONG', NULL,NULL,'2021/01/05',30000, NULL,NULL,NULL);
INSERT INTO EMP2 VALUES(EMP_ID_SEQ.NEXTVAL, 'KANG', NULL,NULL,'2021/01/05',30000, NULL,NULL,NULL);
INSERT INTO EMP2 VALUES(EMP_ID_SEQ.NEXTVAL, 'KIM', NULL,NULL,'2021/01/05',30000, NULL,NULL,NULL);

SELECT * FROM EMP2;
COMMIT;
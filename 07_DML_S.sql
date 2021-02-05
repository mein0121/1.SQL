/* *********************************************************************
DML - 데이터(값)을 다루는 SQL문
    - INSERT, SELECT(DQL), UPDATE, DELETE : CRUD

INSERT 문 - 행 추가
구문
 - 한행추가 :
   - INSERT INTO 테이블명 (컬럼 [, 컬럼]) VALUES (값 [, 값[])
   - 모든 컬럼에 값을 넣을 경우 컬럼 지정구문은 생략 할 수 있다.

 - 조회결과를 INSERT 하기 (subquery 이용)
   - INSERT INTO 테이블명 (컬럼 [, 컬럼])  SELECT 구문
	- INSERT할 컬럼과 조회한(subquery) 컬럼의 개수와 타입이 맞아야 한다.
	- 모든 컬럼에 다 넣을 경우 컬럼 설정은 생략할 수 있다.
	
  
************************************************************************ */
DESC DEPT;
INSERT INTO DEPT (DEPT_ID, DEPT_NAME, LOC) VALUES (1000, '기획부', '서울');
INSERT INTO DEPT VALUES (1100, '구매부', '부산');
ROLLBACK; -- INSERT/UPDATE/DELETE 하기 전 상태로 돌리는 명령어.
COMMIT; -- COMMIT전이면 ROLLBACK으로 데이터 복구(복원)가능.

INSERT INTO DEPT VALUES (1100, '구매부', '부산');
INSERT INTO DEPT VALUES (1200, '구매부', '부산');
INSERT INTO DEPT VALUES (1300, '구매부', '부산');


INSERT INTO EMP VALUES(1000, '홍길동', 'FI_ACCOUNT', NULL, '2020/01/02', 7000, NULL, 10);
INSERT INTO EMP(EMP_ID, EMP_NAME, HIRE_DATE, SALARY) VALUES (1100, '이순신', '2000/01/05', 6000);
INSERT INTO EMP VALUES(1200, '강길동', 'FI_ACCOUNT', NULL,TO_DATE('2020/01', 'YYYY/MM'), 7000, NULL, 10);

INSERT INTO EMP VALUES(1300, '나길동', 'FI_ACCOUNT', 100, '2020/02/01', 9999, 0.1, 10); -- 이미 있는 PK값을 INSERT

SELECT * FROM DEPT ORDER BY DEPT_ID DESC;


SELECT * FROM EMP ORDER BY EMP_ID DESC;
--TODO: 부서별 직원의 급여에 대한 통계 테이블 생성. 
--      조회결과를 insert. 집계: 합계, 평균, 최대, 최소, 분산, 표준편차
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
UPDATE : 테이블의 컬럼의 값을 수정
UPDATE 테이블명
SET    변경할 컬럼 = 변경할 값  [, 변경할 컬럼 = 변경할 값]
[WHERE 제약조건]

 - UPDATE: 변경할 테이블 지정
 - SET: 변경할 컬럼과 값을 지정
 - WHERE: 변경할 행을 선택. 
************************************************************************ */

create table emp_copy(
        emp_id number(6) ,
        emp_name varchar2(20),
        salary number(7,2)
)
-- 원래 있던 테이블에서 특정 컬럼만 복사할때


-- 직원 ID가 200인 직원의 급여를 5000으로 변경

UPDATE EMP
SET SALARY = 5000
WHERE EMP_ID = 200;
COMMIT;

SELECT * FROM EMP WHERE EMP_ID = 200;

-- 직원 ID가 200인 직원의 급여를 10% 인상한 값으로 변경.

UPDATE EMP
SET SALARY = SALARY *1.1
WHERE EMP_ID = 200;
COMMIT;

-- 부서 ID가 100인 직원의 커미션 비율을 0.2로 salary는 3000을 더한 값으로, 상사_id는 100 변경.

SELECT * FROM  EMP WHERE EMP_ID = 100;
100	Steven	AD_PRES		2003/06/17	24000		90

UPDATE EMP
SET COMM_PCT = 0.2, SALARY = SALARY + 3000, MGR_ID = 100
WHERE EMP_ID = 100;

SELECT * FROM  EMP WHERE EMP_ID = 100;
100	Steven	AD_PRES	100	2003/06/17	27000	0.2	90
COMMIT;



-- TODO: 부서 ID가 100인 직원들의 급여를 100% 인상
 SELECT * FROM  EMP WHERE EMP_ID = 100;
 100	Steven	AD_PRES	100	2003/06/17	27000	0.2	90
 UPDATE EMP SET SALARY = SALARY * 2 WHERE EMP_ID = 100;
100	Steven	AD_PRES	100	2003/06/17	54000	0.2	90
-- TODO: IT 부서의 직원들의 급여를 3배 인상
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

-- TODO: EMP 테이블의 모든 데이터를 MGR_ID는 NULL로 HIRE_DATE 는 현재일시로 COMM_PCT는 0.5로 수정.

UPDATE EMP
SET MGR_ID = NULL,
    HIRE_DATE = SYSDATE,
    COMM_PCT = 0.5;

SELECT * FROM EMP;

ROLLBACK;

-- TODO: COMM_PCT 가 0.3이상인 직원들의 COMM_PCT를 NULL 로 수정.
SELECT EMP_NAME, COMM_PCT FROM EMP;

UPDATE EMP
SET COMM_PCT = NULL
WHERE COMM_PCT > 0.3;
ROLLBACK;

-- TODO: 전체 평균급여보다 적게 받는 직원들의 급여를 50% 인상.
SELECT EMP_NAME, SALARY FROM EMP ORDER BY SALARY;
SELECT SALARY FROM EMP WHERE SALARY < (SELECT AVG(SALARY) FROM EMP);
UPDATE EMP
SET SALARY = SALARY *1.5
WHERE SALARY < (SELECT AVG(SALARY)
                FROM EMP);
ROLLBACK;
/* *********************************************************************
DELETE : 테이블의 행을 삭제
구문 
 - DELETE FROM 테이블명 [WHERE 제약조건]
   - WHERE: 삭제할 행을 선택
************************************************************************ */
-- 부서테이블에서 부서_ID가 200인 부서 삭제
DELETE FROM EMP;
SELECT * FROM EMP WHERE DEPT_ID = 200;
ROLLBACK;
-- 부서테이블에서 부서_ID가 10인 부서 삭제

DELETE FROM EMP WHERE DEPT_ID = 200;
SELECT * FROM EMP WHERE DEPT_ID = 10;


-- TODO: 부서 ID가 없는 직원들을 삭제

SELECT * FROM EMP WHERE DEPT_ID IS NULL;

DELETE FROM EMP WHERE DEPT_ID IS NULL;

ROLLBACK;
-- TODO: 담당 업무(emp.job_id)가 'SA_MAN'이고 급여(emp.salary) 가 12000 미만인 직원들을 삭제.
SELECT * FROM EMP WHERE JOB_ID IN 'SA_MAN' AND SALARY < 12000;
DELETE FROM EMP WHERE JOB_ID IN 'SA_MAN' AND SALARY < 12000;

ROLLBACK;
-- TODO: comm_pct 가 null이고 job_id 가 IT_PROG인 직원들을 삭제

SELECT * FROM EMP WHERE COMM_PCT IS NULL AND JOB_ID IN 'IT_PROG';

DELETE FROM EMP WHERE COMM_PCT IS NULL AND JOB_ID IN 'IT_PROG';
ROLLBACK;
-- TODO: job_id에 CLERK가 들어간 업무를 하는 직원들 삭제

SELECT * FROM EMP WHERE JOB_ID LIKE '%CLERK%';

DELETE FROM EMP WHERE JOB_ID LIKE '%CLERK%';

ROLLBACK;

-- EMP_ID 100번인 JOB_ID를 지울때 -- DELETE가 아닌 UPDATE
SELECT * FROM EMP WHERE EMP_ID = 100;

UPDATE EMP
SET JOB_ID = NULL
WHERE EMP_ID = 100;

ROLLBACK;


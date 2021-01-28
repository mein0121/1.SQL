/* *************************************

Select 기본 구문 - 연산자, 컬럼 별칭

*************************************** */
--EMP 테이블의 모든 컬럼의 모든 항목을 조회.


--EMP 테이블의 직원 ID(emp_id), 직원 이름(emp_name), 업무(job) 컬럼의 값을 조회.


--EMP 테이블의 업무(job) 어떤 값들로 구성되었는지 조회. - 동일한 값은 하나씩만 조회되도록 처리.


--EMP 테이블의 부서명(dept_name)이 어떤 값들로 구성되었는지 조회 - 동일한 값은 하나씩만 조회되도록 처리.



--EMP 테이블에서 emp_id는 직원ID, emp_name은 직원이름, hire_date는 입사일, salary는 급여, dept_name은 소속부서 별칭으로 조회한다.
     

/* 
연산자 
 연산은 그 컬럼의 모든 값들에 일률적으로 적용된다.
 같은 컬럼을 여러번 조회할 수 있다.

- 컬럼 + 값 : 컬럼의 모든값에 더한다.
- 컬럼 * 컬럼 : 


*/


--EMP 테이블에서 직원의 이름(emp_name), 급여(salary) 그리고  급여 + 1000 한 값을 조회.



--EMP 테이블에서 입사일(hire_date)과 입사일에 10일을 더한 날짜를 조회.


-- TODO: EMP 테이블의 업무(job)이 어떤 값들로 구성되었는지 조회 - 동일한 값은 하나씩만 조회되도록 처리



--TODO: EMP 테이블에서 직원의 ID(emp_id), 이름(emp_name), 급여(salary), 커미션_PCT(comm_pct), 급여에 커미션_PCT를 곱한 값을 조회.



--TODO:  EMP 테이블에서 급여(salary)을 연봉으로 조회. (곱하기 12)



--TODO: EMP 테이블에서 직원이름(emp_name)과 급여(salary)을 조회. 급여 앞에 $를 붙여 조회.




--TODO: EMP 테이블에서 입사일(hire_date) 30일전, 입사일, 입사일 30일 후를 조회







/* *************************************
Where 절을 이용한 행 행 제한
************************************* */
--EMP 테이블에서 직원_ID(emp_id)가 110인 직원의 이름(emp_name)과 부서명(dept_name)을 조회


 
--EMP 테이블에서 'Sales' 부서에 속하지 않은 직원들의 ID(emp_id), 이름(emp_name), 부서명(dept_name)을 조회.




--EMP 테이블에서 급여(salary)가 $10,000를 초과인 직원의 ID(emp_id), 이름(emp_name)과 급여(salary)를 조회



 
--EMP 테이블에서 커미션비율(comm_pct)이 0.2~0.3 사이인 직원의 ID(emp_id), 이름(emp_name), 커미션비율(comm_pct)을 조회.




--EMP 테이블에서 커미션을 받는 직원들 중 커미션비율(comm_pct)이 0.2~0.3 사이가 아닌 직원의 ID(emp_id), 이름(emp_name), 커미션비율(comm_pct)을 조회.




--EMP 테이블에서 업무(job)가 'IT_PROG' 거나 'ST_MAN' 인 직원의  ID(emp_id), 이름(emp_name), 업무(job)을 조회.




--EMP 테이블에서 업무(job)가 'IT_PROG' 나 'ST_MAN' 가 아닌 직원의  ID(emp_id), 이름(emp_name), 업무(job)을 조회.




--EMP 테이블에서 직원 이름(emp_name)이 S로 시작하는 직원의  ID(emp_id), 이름(emp_name)




--EMP 테이블에서 직원 이름(emp_name)이 S로 시작하지 않는 직원의  ID(emp_id), 이름(emp_name)




--EMP 테이블에서 직원 이름(emp_name)이 en으로 끝나는 직원의  ID(emp_id), 이름(emp_name)을 조회




--EMP 테이블에서 직원 이름(emp_name)의 세 번째 문자가 “e”인 모든 사원의 이름을 조회




-- EMP 테이블에서 직원의 이름에 '%' 가 들어가는 직원의 ID(emp_id), 직원이름(emp_name) 조회




--EMP 테이블에서 부서명(dept_name)이 null인 직원의 ID(emp_id), 이름(emp_name), 부서명(dept_name)을 조회.




--부서명(dept_name) 이 NULL이 아닌 직원의 ID(emp_id), 이름(emp_name), 부서명(dept_name) 조회




--TODO: EMP 테이블에서 업무(job)가 'IT_PROG'인 직원들의 모든 컬럼의 데이터를 조회. 



--TODO: EMP 테이블에서 업무(job)가 'IT_PROG'가 아닌 직원들의 모든 컬럼의 데이터를 조회. 



--TODO: EMP 테이블에서 이름(emp_name)이 'Peter'인 직원들의 모든 컬럼의 데이터를 조회



--TODO: EMP 테이블에서 급여(salary)가 $10,000 이상인 직원의 ID(emp_id), 이름(emp_name)과 급여(salary)를 조회



--TODO: EMP 테이블에서 급여(salary)가 $3,000 미만인 직원의 ID(emp_id), 이름(emp_name)과 급여(salary)를 조회



--TODO: EMP 테이블에서 급여(salary)가 $3,000 이하인 직원의 ID(emp_id), 이름(emp_name)과 급여(salary)를 조회



--TODO: 급여(salary)가 $4,000에서 $8,000 사이에 포함된 직원들의 ID(emp_id), 이름(emp_name)과 급여(salary)를 조회



--TODO: 급여(salary)가 $4,000에서 $8,000 사이에 포함되지 않는 모든 직원들의  ID(emp_id), 이름(emp_name), 급여(salary)를 표시



--TODO: EMP 테이블에서 2007년 이후 입사한 직원들의  ID(emp_id), 이름(emp_name), 입사일(hire_date)을 조회.



--TODO: EMP 테이블에서 2004년에 입사한 직원들의 ID(emp_id), 이름(emp_name), 입사일(hire_date)을 조회.



--TODO: EMP 테이블에서 2005년 ~ 2007년 사이에 입사(hire_date)한 직원들의 ID(emp_id), 이름(emp_name), 업무(job), 입사일(hire_date)을 조회.



--TODO: EMP 테이블에서 직원의 ID(emp_id)가 110, 120, 130 인 직원의  ID(emp_id), 이름(emp_name), 업무(job)을 조회



--TODO: EMP 테이블에서 부서(dept_name)가 'IT', 'Finance', 'Marketing' 인 직원들의 ID(emp_id), 이름(emp_name), 부서명(dept_name)을 조회.



--TODO: EMP 테이블에서 'Sales' 와 'IT', 'Shipping' 부서(dept_name)가 아닌 직원들의 ID(emp_id), 이름(emp_name), 부서명(dept_name)을 조회.



--TODO: EMP 테이블에서 급여(salary)가 17,000, 9,000,  3,100 인 직원의 ID(emp_id), 이름(emp_name), 업무(job), 급여(salary)를 조회.



--TODO EMP 테이블에서 업무(job)에 'SA'가 들어간 직원의 ID(emp_id), 이름(emp_name), 업무(job)를 조회



--TODO: EMP 테이블에서 업무(job)가 'MAN'로 끝나는 직원의 ID(emp_id), 이름(emp_name), 업무(job)를 조회




--TODO. EMP 테이블에서 커미션이 없는(comm_pct가 null인) 모든 직원의 ID(emp_id), 이름(emp_name), 급여(salary) 및 커미션비율(comm_pct)을 조회

    

--TODO: EMP 테이블에서 커미션을 받는 모든 직원의 ID(emp_id), 이름(emp_name), 급여(salary) 및 커미션비율(comm_pct)을 조회



--TODO: EMP 테이블에서 관리자 ID(mgr_id) 없는 직원의 ID(emp_id), 이름(emp_name), 업무(job), 소속부서(dept_name)를 조회




--TODO : EMP 테이블에서 연봉(salary * 12) 이 200,000 이상인 직원들의 모든 정보를 조회.




/* *************************************
 WHERE 조건이 여러개인 경우
 AND OR
 
 참 and 참 -> 참: 조회 결과 행
 거짓 or 거짓 -> 거짓: 조회 결과 행이 아님.
 
 연산 우선순위 : and > or
 
 where 조건1 and 조건2 or 조건3
 1. 조건 1 and 조건2
 2. 1결과 or 조건3
 
 or를 먼저 하려면 where 조건1 and (조건2 or 조건3)
 **************************************/
-- EMP 테이블에서 업무(job)가 'SA_REP' 이고 급여(salary)가 $9,000 인 직원의 직원의 ID(emp_id), 이름(emp_name), 업무(job), 급여(salary)를 조회.




-- EMP 테이블에서 업무(job)가 'FI_ACCOUNT' 거나 급여(salary)가 $8,000 이상인인 직원의 ID(emp_id), 이름(emp_name), 업무(job), 급여(salary)를 조회.



--TODO: EMP 테이블에서 부서(dept_name)가 'Sales이'고 업무(job)가 'SA_MAN' 이고 급여가 $13,000 이하인 
--      직원의 ID(emp_id), 이름(emp_name), 업무(job), 급여(salary), 부서(dept_name)를 조회



--TODO: EMP 테이블에서 업무(job)에 'MAN'이 들어가는 직원들 중에서 부서(dept_name)가 'Shipping' 이고 2005년이후 입사한 
--      직원들의  ID(emp_id), 이름(emp_name), 업무(job), 입사일(hire_date), 부서(dept_name)를 조회



--TODO: EMP 테이블에서 입사년도가 2004년인 직원들과 급여가 $20,000 이상인 
--      직원들의 ID(emp_id), 이름(emp_name), 입사일(hire_date), 급여(salary)를 조회.



--TODO : EMP 테이블에서, 부서이름(dept_name)이  'Executive'나 'Shipping' 이면서 급여(salary)가 6000 이상인 사원의 모든 정보 조회. 



--TODO: EMP 테이블에서 업무(job)에 'MAN'이 들어가는 직원들 중에서 부서이름(dept_name)이 'Marketing' 이거나 'Sales'인 
--      직원의 ID(emp_id), 이름(emp_name), 업무(job), 부서(dept_name)를 조회




--TODO: EMP 테이블에서 업무(job)에 'MAN'이 들어가는 직원들 중 급여(salary)가 $10,000 이하이 거나 2008년 이후 입사한 
--      직원의 ID(emp_id), 이름(emp_name), 업무(job), 입사일(hire_date), 급여(salary)를 조회



/* *************************************
order by를 이용한 정렬
- select문에 가장 마지막에 오는 구절.
- order by 정렬기준컬럼 정렬방식 [, 정렬기준컬럼 정렬방식,...]
- 정렬기준컬럼
	- 컬럼이름.
	- select절에 선언된 순서.
	- 별칭이 있을 경우 별칭.
- 정렬방식
	- asc : 오름차순 (기본-생략가능)
	- desc : 내림차순
- 문자열: 숫자 < 대문자 < 소문자 < 한글
- date : 과거 < 미래	

NULL 값
ASC : 마지막.  order by 컬럼명 asc nulls first
DESC : 처음.   order by 컬럼명 desc nulls last
-- nulls first, nulls last ==> 오라클 문법.

************************************* */

-- 직원들의 전체 정보를 직원 ID(emp_id)가 큰 순서대로 정렬해 조회



-- 직원들의 id(emp_id), 이름(emp_name), 업무(job), 급여(salary)를 
-- 업무(job) 순서대로 (A -> Z) 조회하고 업무(job)가 같은 직원들은  급여(salary)가 높은 순서대로 2차 정렬해서 조회.



--부서명을 부서명(dept_name)의 오름차순으로 정렬해 조회하시오.



--TODO: 급여(salary)가 $5,000을 넘는 직원의 ID(emp_id), 이름(emp_name), 급여(salary)를 급여가 높은 순서부터 조회



--TODO: 급여(salary)가 $5,000에서 $10,000 사이에 포함되지 않는 모든 직원의  ID(emp_id), 이름(emp_name), 급여(salary)를 이름(emp_name)의 오름차순으로 정렬



--TODO: EMP 테이블에서 직원의 ID(emp_id), 이름(emp_name), 업무(job), 입사일(hire_date)을 입사일(hire_date) 순(오름차순)으로 조회.



--TODO: EMP 테이블에서 ID(emp_id), 이름(emp_name), 급여(salary), 입사일(hire_date)을 급여(salary) 오름차순으로 정렬하고 급여(salary)가 같은 경우는 입사일(hire_date)가 오래된 순서로 정렬.



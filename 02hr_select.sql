-- SELECT문 

-- 1. departments 레코드를 조사
select * from departments;

-- <문제> EMPLOYEES 테이블의 모든 내용 출력
select * from employees;

-- 2. departments 테이블에서 department_id, department_name 가져오기
select department_id, department_name
from departments;
 
-- <문제> 사원의 이름과 급여와 입사일자 만을 출력하는 SQL 문을 작성해보자. 
--힌트 : 사원 정보가 저장된 테이블은 EMPLOYEES이고, 
--사원이름 칼럼은 FIRST_NAME, LAST_NAME과, 
--급여 칼럼은 SALARY, 입사일자 칼럼은 HIRE_DATE이다. 
select first_name, last_name, salary, hire_date
from employees;

-- 3. 컬럼이름에 별칭 붙이기
select first_name as f_name, last_name as l_name, salary, hire_date
from employees;

--4. 연결연산자(concatenation) - 자바에서 문자열+숫자
select '사원번호는' || employee_id || '이고 사원의 이름은' || first_name|| last_name||'입니다.' as info from employees;

-- 5. 중복 데이터 한번씩 출력
select DISTINCT job_id from employees;

--<문제>직원들이 어떤 부서에 소속되어 있는지 소속 부서번호(DEPARTMENT_ID)
--출력하되 중복되지 않고 한번씩 출력하는 쿼리문을 작성하자. 
select DISTINCT DEPARTMENT_ID from employees;

-- 6. 조건문
select employee_id, first_name, last_name 
from employees
where salary >= 3000;

--<문제> EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
select *
from employees
where department_id = 110 ;

--<문제> EMPLOYEES 테이블에서 급여가 5000미만이 되는 
--직원의 정보 중에서 사번과 이름, 급여를 출력 하라
select employee_id, first_name, last_name, salary
from employees
where salary < 5000;

-- 7. 문자 데이터 조회
select * 
from employees 
where first_name = 'Lex';

--<문제> 이름이 John인 사람의 직원번호와 직원명과 직급을 출력하라. 
select job_id, first_name, employee_id from employees where first_name = 'John';

-- 8. 날짜 데이터 조회
select first_name, hire_date
from employees
where hire_date >= '2008/01/01';

-- 9. and, or, NOT, in
select employee_id, first_name, phone_number, department_id, job_id
from employees
where department_id = 100 and job_id ='FI_MGR';

select employee_id, first_name, phone_number, department_id, job_id
from employees
where department_id = 100 or job_id = 'FI_MGR';

select employee_id, first_name, phone_number, department_id, job_id
from employees
where NOT department_id = 100;
--where department_id != 100;
--where department_id <> 100;
--where department_id ^= 100;

select *
from employees
where employee_id = 134 or employee_id in(134,201,107);

--<문제>급여가 5000에서 10000이하 직원 정보 출력
select * 
from employees 
--where salary >= 5000 and salary <= 10000;
where salary BETWEEN 5000 and 10000;
--<문제> 직원번호가 134이거나 201이거나 107인 직원 정보 출력
select *
from employees
where employee_id = 134 or employee_id = 201 or employee_id = 107;

--<문제> 직급이 FI_MGR가 아닌 직원 
select *
from employees
where not job_id = 'FI_MGR';

--<문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라. 
--(AND 연산자와 BETWEEN AND 연산자 사용 두개모두 사용해서 보여줄것)

select employee_id, first_name, salary 
from employees 
--where salary >= 2500 and salary <= 4500;
where salary BETWEEN 2500 and 4500;

--<문제> 커미션비율이 0.3 이거나 0.05 이거나 0.1 중의 하나인 직원의 직원번호, 이름, 급여, 
--커미션 비율을 출력하라. (OR 연산자와 IN 연산자 사용 모두 사용해볼것)
select employee_id, first_name, salary, COMMISSION_PCT
from employees 
--where COMMISSION_PCT =0.3 or COMMISSION_PCT =0.05 or COMMISSION_PCT =0.1;
where COMMISSION_PCT in(0.3,0.05,0.1);

-- 10.like 연산자
select employee_id, first_name
from employees
where first_name like 'K%';

select employee_id, first_name
from employees
where first_name like '%k';

select employee_id, first_name
from employees
where first_name like '_d%';

--<문제> 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라. 
select employee_id, first_name
from employees
--where first_name not like '%a%';
where upper(first_name) not like '%a%';

-- 11. Null 연산자
select employee_id, first_name, commission_pct, job_id
from employees
--where commission_pct is NULL;
where commission_pct is not NULL;

--<문제> 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호을 출력하라
select *
from employees
where manager_id is not NULL;

-- 12. order by (desc)
select *
from employees
order by employee_id desc;

select *
from employees
where department_id != 100
order by employee_id desc;

--<문제> 직원번호, 이름, 급여를 급여가 높은 순으로 출력하라. 
select employee_id, first_name, salary
from employees
order by salary desc;
--<문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라. 
select employee_id, first_name, hire_date
from employees
order by hire_date desc;


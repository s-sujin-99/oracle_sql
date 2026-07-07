-- update문
create table emp 
as 
select * from employees;
desc emp;
select * from emp;

-- 제약조건 생성
alter table emp
add constraint pk_emp_id primary key(employee_id);

-- phone_number not null 제약조건
alter table emp
modify phone_number varchar2(20) constraint nn_emp_phone not null;

-- 제약조건 삭제
alter table emp 
drop constraint nn_emp_phone;

-- 제약조건 삭제
alter table emp 
drop constraint pk_emp_id;

-- 제약조건 확인하는 방법-대문자
select * from user_constraints
where table_name= 'EMP';

-- 모든 사원 부서 번호 30으로 변경
update emp set department_id=30;
select department_id from emp;

--             DML
-- select, update, insert, delete 롤백,커밋 가능
rollback;
-- 확정하기 롤백 불가
commit;

-- 모든 사원 급여 10% 인상
-- salary 카피본
-- 1. 컬럼 생성
alter table emp add(salary_copy number(8,2));
-- 2. 업데이트
update emp set salary_copy = salary;
-- 3. 확인
select salary, salary_copy from emp;

update emp set salary = salary * 1.1;

--입사일을 오늘 날짜로 수정 (SYSDATE)
update emp set hire_date = SYSDATE;
select hire_date from emp;

-- emp02 부서번호가 10번인 사원의 부서번호를 30으로 변경
select * from emp02 where department_id =10;
update emp02 set department_id = 30 where department_id =10;
-- 급여가 3000이상이면 급여 10% 인상
update emp02 set salary = salary * 1.1 where salary >= 3000;

-- 2007년에 입사한 사원의 입사일을 오늘로 수정
-- substr('03/06/17',1,2) -> (컬럼,시작점(1부터),가져올 개수)
select * from emp02 where substr(hire_date, 1,2) ='26' ;
update emp02 set hire_date = SYSDATE where substr(hire_date, 1,2) ='07';

-- LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상
update emp02 
set salary = 17000, commission_pct = 0.45
where last_name ='Russell';
select * from emp02 where last_name ='Russell';








-- join
-- 1. cross join
select count(*) from employees;
select count(*) from departments;

select * from employees, departments where first_name like '%l%'; -- 기준을 잘잡아야함
-- ANSI 정의한 cross join
select * from employees cross join departments;

-- 2. inner join (emp, dept 테이블 join해 보기)
-- first_name, email, job_id, salary, department_name, location_id 출력
-- 조건 - 판매처(shipping만) 연봉이 5000이상만
desc employees;
select * from user_tables where table_name ='DEPARTMENTS';
-- ANSI 정의한 inner join
select e.first_name, e.email, e.job_id, e.salary, d.department_name, d.location_id
from employees e inner join departments d
on e.department_id = d.department_id
where lower(department_name) = 'shipping' and salary >= 5000;

-- using을 이용한 inner join -(on을 생략가능)
select e.first_name, e.email, e.job_id, e.salary, d.department_name, d.location_id
from employees e inner join departments d
using(department_id);

-- 3. outer join
select e.first_name, d.department_id, d.department_name
from employees e, departments d
-- right outer join
--where e.department_id(+) = d.department_id
-- left outer join
where e.department_id = d.department_id(+)
order by d.department_id asc;

-- ANSI 정의한 outer join
select e.first_name, d.department_id, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id
order by d.department_id asc;

select e.first_name, d.department_id, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id
order by d.department_id asc;

-- 4. self join 하나의 테이블을 두개로 분리시킨다. (pk, fk 지정)
-- employees self join - 사원의 정보, 사원의 사수 정보를 출려
select e1.first_name, e2.first_name
from employees e1,  employees e2
where e1.manager_id = e2.employee_id;

-- 5. Non-Equi join
-- 등급 최소연봉, 최대연봉
create table salarygrade(
    grade number not null,
    minsalary number not null,
    maxsalary number not null,
    constraint pk_salarygrade_grade primary key(grade)
);
insert into salarygrade values(1,2000,3000);
insert into salarygrade values(2,3001,4500);
insert into salarygrade values(3,4501,6000);
insert into salarygrade values(4,6001,8000);
insert into salarygrade values(5,8001,10000);
insert into salarygrade values(6,10001,13000);
insert into salarygrade values(7,13001,20000);
insert into salarygrade values(8,20001,30000);

select * from salarygrade;

select e.first_name, e.salary, s.grade
from employees e, salarygrade s
where e.salary >= s.minsalary and e.salary <= s.maxsalary;

select e.first_name, e.salary, s.grade
from employees e, salarygrade s
where e.salary between s.minsalary and s.maxsalary;









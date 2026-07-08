-- 무결성 제약조건 (not null, unique, primary key, check, foreign key)
-- 1. not null 제약조건 -컬럼레벨방식으로 구현 

-- 2. unique == primary key 제약조건이랑 똑같음(다른점 : null허용)

drop table emp02;
create table emp02 
as
select * from employees;

-- 제약조건 employees_id primary key 설정
alter table emp02 
add constraint pk_emp02_id primary key(employee_id);

-- 제약조건 phone_number unique 설정
alter table emp02
add constraint uk_emp02_phone unique(phone_number);

-- 제약조건 phone_number not null 설정
alter table emp02
modify phone_number not null;
-- 제약 조건 삭제
alter table emp02
drop constraint uk_emp02_phone;

-- 데이터 딕셔너리 확인 dba, all, user_tables, user_constraints, user_cons_columns
select * from user_constraints where table_name ='EMP02';
select * from user_cons_columns where table_name ='EMP02';

-- table emp03 생성
create table emp03(
    empno number(4),
    emname varchar2(20) not null,
    job varchar2(20),
    constraint uk_emp03_no unique(empno)
);

-- 제약 조건을 줄려면 null값이 있으면 안됨
-- 있는걸 찾아서 삭제 및 임의값을 줘야함
insert into emp03 values(null,'kdj','programmer');
insert into emp03 values(1234,'kdj','programmer');
insert into emp03 values(null,'kdj2','db developer');
-- null 값 삭제
delete from emp03 where job ='db developer';
select * from emp03;
-- null 값 임의값 
update emp03 
set empno = 0 where empno is null;

alter table emp03 
modify empno not null;

-- 3. primary key(not null 허용없음, 중복x) == 자동 인덱스 설정

-- 4. foreign key(참조 무결성 제약조건)
-- 테이블 설계
ALTER TABLE dept DROP CONSTRAINT pk_dept_no1;
ALTER TABLE dept DROP CONSTRAINT uk_dept_name1;
ALTER TABLE dept DROP CONSTRAINT nn_dept_loc1;
ALTER TABLE emp DROP CONSTRAINT pk_emp_id1;
ALTER TABLE emp DROP CONSTRAINT SYS_C008507;
drop table dept;
create table dept(
    deptno number(10),
    deptname varchar2(20),
    deptloc varchar2(20) constraint nn_dept_loc1 not null,
    constraint pk_dept_no1 primary key(deptno),
    constraint uk_dept_name1 unique(deptname)
);

insert into dept values(10,'관리자1','서울1');
insert into dept values(20,'관리자2','서울2');
insert into dept values(30,'관리자3','서울3');
insert into dept values(40,'관리자4','서울4');
select * from dept;

delete from dept where deptno = 30;

create table emp(
    empid number(10),
    empname char(4),
    jobid varchar2(20),
    salary number(10),
    deptno number(10),
    constraint pk_emp_id1 primary key(empid),
    constraint fk_emp_dept1 foreign key(deptno) references dept(deptno)
);
-- 제약조건 수정 (fk_emp_dept1 삭제 후 다시 재설정)
-- ON DELET : 참조 테이블의 튜플이 삭제되었을 때 기본 테이블에 취해야 할 사항을 지정
alter table emp
drop constraint fk_emp_dept1;
alter table emp
add constraint fk_emp_dept_no1 foreign key(deptno) references dept(deptno) on delete set null;
delete from dept where deptno =40;

insert into emp values(1,'kdj1','부장1', 10000000, 40);
insert into emp values(2,'kdj2','부장2', 20000000, 30);
insert into emp values(3,'kdj3','부장3', 30000000, 20);
insert into emp values(5,'kdj5','부장5', 30000000, 40, 'W',100);
select * from emp;

update emp set deptno = 10 where empid=1;
delete from emp where empid=1; 
select * from user_cons_columns where table_name ='EMP';

-- 5. check 제약조건
-- emp - gender char(1) default 'M'추가
alter table emp
add gender char(1) default 'M';

-- emp - gender check 제약 조건 추가('M','W')
select * from emp;
alter table emp
add constraint ck_emp_gender check(gender in ('M','W'));
desc emp;
select * from user_cons_columns where table_name = 'EMP';

insert into emp values(1,'kdj1','부장1', 10000000, 40,'W');

-- emp - score number(4) 체크 조건(0-100)
alter table emp
add score number(4) constraint ck_emp_score check(score between 0 and 100);

--foreign key 옵션 5가지
--1. NO ACTION : 참조 테이블에 변화가 있어도 기본 테이블에는 아무 조취를 취하지 않는다. 
--2. CASCADE : 참조 테이블의 튜플이 사제되면 기본 테이블의 관련 튜플도 삭제되고, 속성이 
--변경되면 관련 튜플의 속성 값도 모두 변경된다. 
--3. SET NULL : 참조 테이블에 변화가 있으면 기본 테이블의 과련 튜플의 속성 값을 NULL로 
--변경한다. 
--4. SET DEFAULT : 참조 테이블에 변화가 있으면 기본 테이블의 관련 튜플의 속성 값을 기본값으로 
--변경한다. 
--5. RESTRICT : 참조 테이블에 변화(삭제,수정)가 있으면 , 기본테이블경우 데이터 삭제나 수정 불가 

alter table emp
drop constraint fk_emp_dept1;
alter table emp
add constraint fk_emp_dept_no1 foreign key(deptno) references dept(deptno) on delete set null;
insert into emp values(5,'kdj5','부장5', 30000000, 40, 'W',100);
delete from dept where deptno =40;

--<문제1>

create table v_gogek(
    g_code number(5) not null,
    g_name varchar2(20) not null,
    g_age number(30),
    g_addr varchar2(50),
    g_tel varchar2(20),
    constraint pk_v_gogek_g_code primary key(g_code)
);

create table video(
    v_code number(5) not null,
    v_title varchar2(50) not null,
    v_genre varchar2(30),
    v_pay number(7) not null,
    v_lend_state number(1),
    v_make_company varchar2(50),
    v_make_data Date,
    v_view_age number(1),
    constraint pk_video_v_code primary key(v_code),
    constraint ck_video_v_state check(v_lend_state in ('Y','N'))
);

create table lend_return(
    lr_code number(5) not null,
    g_code number(5) not null,
    v_code number(5) not null,
    l_date date,
    r_plan_date date,
    l_total_pay number(7),
    constraint pk_lend_return_lr_code primary key(lr_code),
    constraint fk_v_gogek_lend_return foreign key(g_code) references v_gogek(g_code) on delete set null,
    constraint fk_video_lend_return foreign key(v_code) references video(v_code) on delete set null
);















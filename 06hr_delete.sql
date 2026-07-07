--delete문
-- 부서 테이블을 모두삭제
select * from user_tables;

create table dept
as 
select * from departments;

select * from dept;

-- 롤백이 됨
delete from dept;
-- 롤백이 안됨
truncate table dept;

rollback;

-- 30번 부서 삭제
select * from dept where department_id =30;
delete from dept where department_id =30;

-- <문제> 테이블 설계
drop table emp01;
create table emp01(
    empno number(4) not null ,
    ename varchar2(10) not null,
    job varchar2(9),
    mgr number(4),
    hiredate DATE not null,
    sal number(7,2) not null,
    comm number(7,2),
    deptno number(2) not null,
    constraint pk_emp01_no primary key(empno)
);

select * from emp01;
desc emp01;
insert into emp01 values(7369,'smith','cleak',7836,DATE'1980-12-17',800,null,20);
insert into emp01 values(7499, 'allen', 'salesman', 7369, DATE'1987-12-20', 1600, 300, 30);
insert into emp01 values(7839,'king','president','',DATE'1981-02-08',5000,null,10);


-- <문제2> 테이블 생성
create table members(
    id varchar2(20) not null primary key,
    name varchar2(20) not null,
    regno varchar2(20) not null,
    hp varchar2(20) not null,
    address varchar2(100) not null
);
insert into members values(100,'king','20260707-1234567','010-1234-5678','성남');
insert into members values(101,'kim','20200111-1234567','010-1234-5678','서울');
insert into members values(102,'han','20260812-1234567','010-1234-5678','부산');
insert into members values(103,'dong','20000815-1234567','010-1234-5678','세종');
insert into members values(104,'sun','20211115-1234567','010-1234-5678','하남');

select * from members;
desc members;

-- <문제3> 테이블 생성
create table books(
    code number(4) not null primary key,
    title varchar2(50) not null,
    count number(6) not null,
    price number(10) not null,
    publish varchar2(50) not null
);

insert into books values(100,'java의 정석',5,45000,'하남출판사');
insert into books values(101,'c언어의 정석',45,38000,'성남출판사');
insert into books values(102,'베이커리',51,24000,'빛나출판사');
insert into books values(103,'집으로',100,25000,'광주출판사');
insert into books values(104,'python',80,15000,'서울출판사');

select * from books;





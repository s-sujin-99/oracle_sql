--insert문
-- 컬럼명, 컬럼명 개수와 values개수가 맞아야 함
-- 컬럼명 타입과 values 타입이 맞아야 함
-- not null, primary key 제약조건 조심
create table DEPT(
    DEPTNO NUMBER(2) primary key,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) not null
);

drop table TB_CUSTOMER02;

--칼럼 DEPTNO에 10번 부서, DNAME에는 ‘ACCOUNTING’을, LOC에는 ‘NEW YORK’을 추가하자
INSERT INTO DEPT (DEPTNO, DNAME, LOC)VALUES(10,'accounting','NEW YORK');
INSERT INTO DEPT VALUES(11,'accounting1','NEW YORK1');
INSERT INTO DEPT VALUES(13,null,'NEW YORK3');
INSERT INTO DEPT VALUES(14,'','NEW YORK4');
--두개만
INSERT INTO DEPT (DEPTNO, LOC) VALUES(12,'accounting2');

-- 컬럼 deptno 4로 변경, dname -> not null 설정
-- 2. 컬럼 변경
alter table dept 
modify(deptno number(4), dname varchar2(30) not null);
-- 1. dname null인 값을 임시값으로 변경
update dept set dname= '임시값' where dname is null;
-- 3. 확인
desc dept;

select * from dept;
select * from tab;

select * from tab where tname = 'dept';

create table TB_CUSTOMER02(
    customer_cd number(10) primary key,
    customer_nm VARCHAR2(10) not null,
    mw_flg char(1) not null,
    birth_day  DATE not null,
    phone_number char(13),
    email varchar2(20) not null,
    total_point number DEFAULT 0 not null,
    reg_dttm TIMESTAMP not null
);

insert into TB_CUSTOMER02 values(2017042,'강원진','M', DATE'1981-06-03','010-8202-8790',
'wjgang@navi.com', 280300, TIMESTAMP'2017-01-23 13:24:32');
insert into TB_CUSTOMER02 values(2017053,'나경숙','W', DATE'1989-12-25','010-4509-0043',
'ksna@boram.co.kr', 4500, TIMESTAMP'2017-02-10 18:09:30');
insert into TB_CUSTOMER02 values(2017108,'박승대','M', DATE'1971-04-30','',
'sdpark@haso.com', 23450, TIMESTAMP'2017-05-08 20:34:50');

select * from tb_customer02;

-- 시 분 초 까지 확인
--SELECT CUSTOMER_CD, CUSTOMER_NM, MW_FLG, BIRTH_DAY, PHONE_NUMBER, EMAIL, TOTAL_POINT, 
--TO_CHAR(REG_DTTM, 'YYYY-MM-DD HH24:MI:SS') AS REG_DTTM FROM TB_CUSTOMER02;











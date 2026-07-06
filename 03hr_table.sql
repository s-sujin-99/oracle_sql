-- 1.사용자가 정의한 테이블 생성(속성 - 사원번호, 이름, 연봉)
create table EMP01 (
    empNo NUMBER(4),
    name varchar2(20),
    salary number(7,2)
);

select * from emp01;

-- 2.기존 테이블 복사 (employees - employees02)
create table employees02 
as 
select * from employees;

-- 3.테이블에 대한 정보가 기록된 테이블
select * from TAB;

-- 4. 테이블 수정(추가 alter add, 수정 alter modify, 삭제 alter drop)
-- 추가
alter table employees02
add(job VARCHAR2(9));
-- 변경 확인
desc employees02;

--<문제> 이미 존재하는 employees02 테이블에 일사일 칼럼(CREDATE) 날짜형으로 추가
alter table employees02
add(CREDATE DATE);

-- 수정( job을 최대 30까지 늘리기)
alter table employees02
modify(job VARCHAR2(30));

--<문제> job을 number로 바꾸기
alter table employees02
modify(job number(10));

-- 컬럼명 변경
alter table employees02
rename column job to job_copy;

-- 삭제 (job_copy 삭제)
alter table employees02 
drop column job_copy;

-- 5. 테이블 삭제 (employees02 테이블 삭제)
drop table employees02;

-- 6. 테이블명 변경 (employees02 -> employees03) 
rename employees02 to employees03;

-- 7. 테이블에 모든 로우를 제거(TRUNCATE - 데이터만 삭제, 공간이 사라짐)
TRUNCATE table employees03;

--<문제> 테이블 생성 
create table TB_CUSTOMER (
    CUSTOMER_CD CHAR(7) NOT NULL PRIMARY KEY,
    CUMSTOMER_NM VARCHAR2(20) NOT NULL,
    MW_FLG CHAR(1) NOT NULL CHECK(MW_FLG IN('M','F')), 
    BIRTH_DAY CHAR(8) NOT NULL,
    PHONE_NUMBER VARCHAR2(16),
    EMAIL VARCHAR2(30),
    TOTAL_POINT NUMBER(10),
    REG_DTTM CHAR(14)
);

--학생 성적 테이블을 만들어 봅시다.
--1.학번의 (숫자)데이터는 중복되거나 null값을 허용하면 안 되고
--2.이름은 문자데이터며 null값을 허용하지 않고
--3.국어, 영어, 수학 컬럼을 number 타입으로 가지고 모두 다 null값을 허용하지 않습니다.
--4.단, 국어,영어,수학 컬럼에 데이터를 넣지 않으면 기본값으로 0을 갖습니다.
--5.총점과 평균 컬럼은 기본값을 0을 갖습니다.

create table TB_STUDENT (
    STUDENT_ID CHAR(7) NOT NULL PRIMARY KEY,
    STUDENT_NAME VARCHAR2(10) NOT NULL,
    KOR NUMBER(3) DEFAULT 0 NOT NULL ,
    ENG NUMBER(3) DEFAULT 0 NOT NULL,
    MATH NUMBER(3) DEFAULT 0 NOT NULL,
    TOTAL_SCORE NUMBER(3) DEFAULT 0,
    AVG_SCORE NUMBER(4,2) DEFAULT 0
);

desc TB_STUDENT;







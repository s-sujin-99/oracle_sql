-- 시퀀스 생성
CREATE SEQUENCE EMP_SEQ     -- 시퀀스 이름
START WITH 0                -- 시작값
INCREMENT BY 1              -- 증가값
MINVALUE 0                  -- 최소값
MAXVALUE 100000             -- 최대값
NOCYCLE                     -- 1->100 다시 시작 (cycle, nocycle)
CACHE 2;                    -- 캐시메모리 (속도 향상)

-- 테이블 설계 + 시퀀스 설계 + 인덱스 설계 + (트리거,프로시져, 함수 => 프로그램 : 조건문, 반복문, 예외처리)
-- 시퀀스 설계 - 초기값 : 0, 증가치 :1, 최대값 :1000, 최소값 :0, cycle : nocycle, cache : 2
create sequence emp_seq
start with 0
increment by 1
minvalue 0
maxvalue 1000
nocycle
cache 2;

-- 사용자 딕셔너리
select * from user_tables;
select * from user_constraints;
select * from user_cons_columns;
select * from user_sequences;

--emp01 삭제 후 employees - employee_id, first_name, hire_date
drop table emp01;
create table emp01
as
select employee_id, first_name, hire_date
from employees
-- 구조만 복사
where 1=0;

desc emp01;
select * from emp01;

-- 시퀀스 이용하여 데이터 입력
insert into emp01 values(emp_seq.nextval, 'kdj', date'2010-11-11');
insert into emp01 values(emp_seq.nextval, 'kdj', date'2010-01-01');
insert into emp01 values(emp_seq.nextval, 'kdj', date'2010-06-15');
insert into emp01 values(emp_seq.nextval, 'kdj', date'2010-10-12');

-- emp-seq 현재 얼마나 설정되어 있는지 확인
-- 가상테이블 통해 확인
-- CURRVAL : 현재 값을 반환 
-- NEXTVAL : 현재 시퀀스 값의 다음 값을 반환 
select emp_seq.currval from dual;
desc dual;

-- dept_seq 생성 
create sequence dept_seq
start with 10
increment by 10
minvalue 0
maxvalue 30
nocycle
cache 2;

-- dept01 테이블 생성
drop table dept01;
create table dept01
as 
select department_id, department_name, location_id
from departments where 1=0;

-- 테이블 데이터 확인
select * from dept01;

-- 데이터 생성
insert into dept01 values(dept_seq.nextval, '관리과', 100);
insert into dept01 values(dept_seq.nextval, '서버과', 200);
insert into dept01 values(dept_seq.nextval, '총무과', 300);
-- 최대값이 넘어서 안됨
insert into dept01 values(dept_seq.nextval, '서무과', 400);
 
-- 만약 최대값이 넘어서 오류가 나면 alter 사용( 최대값 수정)
alter sequence dept_seq maxvalue 1000;
select * from user_sequences;

-- 시퀀스 삭제
drop sequence dept_seq;


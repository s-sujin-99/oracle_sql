-- 인덱스 설정
-- 장점 : 검색 속도가 빨라진다. / 시스템에 걸리는 부하를 줄여서 시스템 전체 성능을 향상
-- 단점 : 인덱스를 위한 추가 공간 필요 / 생성 시간 소모 / 데이터의 변경 작업이 자주 일어날 시 성능 저하
-- 고려사항
-- 1. 일반적으로 테이블 전체 로우 수의 15%이하의 데이터를 조회할 때 인덱스를 생성한다. 
-- 2. 테이블 건수가 적다면 굳이 인덱스를 만들 필요가 없다. 
-- 3. NULL을 많이 포함된 컬럼은 인덱스 컬럼으로 만들기 적당치 않다. 
-- 4. 테이블에 만들 수 있는 인덱스 수의 제한은 없으나, 너무 많이 만들면 오히려 성능 저하가 발생한다. 


-- emp01 테이블 생성 (employees)
drop table emp01;

create table emp01
as
select * from employees;

-- 인렉스테이블 내용을 조사(데이터 딕셔너리 확인
select * from user_indexes where table_name ='EMP01';

-- 인덱스 성능 체크
select * from emp01;
select * from emp01 where employee_id = 100;

--emp01 employee_id pk 설정
alter table emp01
add constraint pk_emp01_id primary key(employee_id);

-- email으로 성능 체크
select * from emp01 where email like 'A%';

-- email 설정
--CREATE UNIQUE INDEX index_name 
--ON table_name (column_name); 
create unique index ix_emp01_email
on emp01(email);

-- index 삭제
--DROP INDEX index_name; 
drop index ix_emp01_email;











-- 1. 테이블 스페이스 만들기 (테이블 저장할 공간)
-- 저장할 공간 이름 : first01.dbf 사이즈 : 10M
CREATE TABLESPACE firstData
DATAFILE 'C:\oraclexe\oradata\XE\first01.dbf' SIZE 10M;

-- 저장 공간 수정
ALTER TABLESPACE firstData 
ADD DATAFILE 'C:\oraclexe\oradata\XE\first02.dbf' SIZE 10M;

-- 저장 공간 사이즈 수정
ALTER DATABASE
DATAFILE 'C:\oraclexe\oradata\XE\first02.dbf' RESIZE 20M;

-- 저장 공간 삭제 (테스트용이 아니라면 주의해서 실행하세요)
-- DROP TABLESPACE firstData INCLUDING CONTENTS AND DATAFILES;

-- 저장 공간 자동 설정
-- 기존 용량이 부족하면 1M만큼 늘어나며, 최대 20M까지 사용 가능
ALTER DATABASE
DATAFILE 'C:\oraclexe\oradata\XE\first01.dbf'
AUTOEXTEND ON 
NEXT 1M
MAXSIZE 20M;

-- 사용자 설정 
-- 아이디 : javauser, psw : javauser
-- (주의: javaData 테이블스페이스를 기본으로 지정하려면, 사전에 javaData 테이블스페이스가 생성되어 있어야 합니다)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

CREATE USER javauser IDENTIFIED BY javauser
DEFAULT TABLESPACE firstData -- 앞서 만든 firstData를 쓰거나, javaData를 새로 만드셔야 합니다.
TEMPORARY TABLESPACE temp;

-- 사용자 권한 설정 (테이블 CRUD 기능 및 접속 권한)
GRANT CONNECT, RESOURCE TO javauser;
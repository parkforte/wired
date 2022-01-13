select * from dba_tablespaces;

create tablespace wired
datafile 'C:\mydata\wired.dbf' size 48m  --48¸Þ°¡
autoextend on next 10m;

alter session set "_ORACLE_SCRIPT"=true;

create user wired
identified by wired123
default tablespace wired;

grant create session to wired;

grant create table to wired;
grant unlimited tablespace to wired; 

grant resource, connect to wired;
grant unlimited tablespace to wired;  
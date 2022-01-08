
--사원정보 3중 join
select distinct m.*, m.mem_name as member_name , d.dept_name, p.pos_name
from member m join department d
on m.dept_no = d.dept_no
join position p
on m.pos_no = p.pos_no;

create or replace view memberinfo_view
as
(
  select distinct m.* , m.mem_name as member_name , d.dept_name, p.pos_name
  from member m join department d
  on m.dept_no = d.dept_no
  join position p
  on m.pos_no = p.pos_no
);


--linereg 시퀀스
drop sequence linereg_seq;

create sequence linereg_seq
start with 1
increment by 1
nocache;

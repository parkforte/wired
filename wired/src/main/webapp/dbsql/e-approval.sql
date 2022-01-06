
--사원정보 3중 join
select m.*, m.mem_name as member_name , d.dept_name, p.pos_name
from member m join department d
on m.dept_no = d.dept_no
join position p
on m.pos_no = p.pos_no;

create or replace view memberinfo_view
as
(
  select m.* , m.mem_name as member_name , d.dept_name, p.pos_name
  from member m join department d
  on m.dept_no = d.dept_no
  join position p
  on m.pos_no = p.pos_no
);
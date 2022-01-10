
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

create or replace view confirmlineInfo_view
as
(
    select distinct c.*, m.mem_name, d.dept_name, p.pos_name
    from member m join department d
    on m.dept_no = d.dept_no
    join position p
    on m.pos_no = p.pos_no
    join confirmline c
    on m.mem_no = c.mem_no
);



--confirmline 4중 join
        
select distinct c.*, m.mem_name, d.dept_name, p.pos_name
from member m join department d
on m.dept_no = d.dept_no
join position p
on m.pos_no = p.pos_no
join confirmline c
on m.mem_no = c.mem_no
WHERE REG_NO=4
and LINE_ORDER >0
ORDER BY LINE_ORDER;




--linereg 시퀀스
drop sequence linereg_seq;

create sequence linereg_seq
start with 1
increment by 1
nocache;


--confirmline 시퀀스
drop sequence confirmline_seq;

create sequence confirmline_seq
start with 1
increment by 1
nocache;

--confirm 시퀀스
create sequence confirm_seq
start with 1
increment by 1
nocache;
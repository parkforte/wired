

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


--결재선 추출 join
select c.cf_no , c.mem_no ,c.reg_no,l.line_order ,l.mem_no as mem_line , m.mem_name, m.mem_originalfilename
from confirm c join linereg r
on c.reg_no=r.reg_no
join confirmline l
on r.reg_no=l.reg_no
join member m
on l.mem_no=m.mem_no
where l.mem_no>0
--결재선정보 view
create or replace view lineorder_view
as
(
select c.cf_no , c.mem_no ,c.reg_no,l.line_order ,l.mem_no as mem_line , m.mem_name, m.mem_originalfilename
from confirm c join linereg r
on c.reg_no=r.reg_no
join confirmline l
on r.reg_no=l.reg_no
join member m
on l.mem_no=m.mem_no
where l.mem_no>0
);


--결재상태 view
create or replace view confirming_view
as
(
    select c.cf_no,c.cf_title, m.mem_name ,
        c.cf_regdate, c.cf_state ,c.cf_order, l.line_order, l.mem_no  "LINE_MEM" 
    from confirm c join linereg r
    on c.reg_no=r.reg_no
    join confirmline l
    on r.reg_no=l.reg_no
    join member m
    on c.mem_no = m.mem_no
    where c.cf_order=l.line_order
    and c.cf_order>0
);

--docbox join

select c.*, 
    m.mem_name, m.mem_originalfilename , f.form_name , l.line_order,
    DECODE(c.cf_state, 0 , '임시저장',1,'대기',2,'승인',3,'반려') as state_name
from confirm c join member m
on c.mem_no=m.mem_no
join docform f
on c.form_no=f.form_no
join confirmline l
on l.line_order=c.cf_order
;



select c.*, 
    m.mem_name, m.mem_originalfilename , f.form_name , l.line_order,
    DECODE(c.cf_state, 0 , '임시저장',1,'대기',2,'승인',3,'반려') as state_name
from confirm c join member m
on c.mem_no=m.mem_no
join docform f
on c.form_no=f.form_no
join confirmline l
on l.line_order=c.cf_order
;



--?Ç¨?õê?†ïÎ≥? 3Ï§? join
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



--confirmline 4Ï§? join
        
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




--linereg ?ãú???ä§
drop sequence linereg_seq;

create sequence linereg_seq
start with 1
increment by 1
nocache;


create sequence doctype_seq
start with 1
increment by 1
nocache;

--confirmline ?ãú???ä§
drop sequence confirmline_seq;

create sequence confirmline_seq
start with 1
increment by 1
nocache;


create sequence docform_seq
start with 1
increment by 1
nocache;

--confirm ?ãú???ä§
create sequence confirm_seq
start with 1
increment by 1
nocache;


--Í≤∞Ïû¨?Ñ† Ï∂îÏ∂ú join
select c.cf_no , c.mem_no ,c.reg_no,l.line_order ,l.mem_no as mem_line , m.mem_name, m.mem_originalfilename
from confirm c join linereg r
on c.reg_no=r.reg_no
join confirmline l
on r.reg_no=l.reg_no
join member m
on l.mem_no=m.mem_no
where l.mem_no>0;
--Í≤∞Ïû¨?Ñ†?†ïÎ≥? view
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

--Î¨∏ÏÑú?†ïÎ≥? ?†ÑÏ≤? join

select c.*, 
    m.mem_name, m.mem_originalfilename , f.form_name , l.line_order,
    DECODE(c.cf_state, 0 , '?ûÑ?ãú???û•',1,'??Í∏?',2,'?äπ?ù∏',3,'Î∞òÎ†§') as state_name
from confirm c join member m
on c.mem_no=m.mem_no
join docform f
on c.form_no=f.form_no
join confirmline l
on l.line_order=c.cf_order
;



select c.*, 
    m.mem_name, m.mem_originalfilename , f.form_name , l.line_order,
    DECODE(c.cf_state, 0 , '?ûÑ?ãú???û•',1,'??Í∏?',2,'?äπ?ù∏',3,'Î∞òÎ†§') as state_name
from confirm c join member m
on c.mem_no=m.mem_no
join docform f
on c.form_no=f.form_no
join confirmline l
on l.line_order=c.cf_order
;
commit;
select * from user_sequences;

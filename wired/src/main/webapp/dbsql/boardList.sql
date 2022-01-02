SELECT * FROM BOARD;
SELECT * FROM BOARDLIST;


select * from user_sequences;

--사원등급
select * from ranks;
insert into ranks(ranks_no, ranks_name)
values(1,'일반');
insert into ranks(ranks_no, ranks_name)
values(2,'팀장이상');
insert into ranks(ranks_no, ranks_name)
values(3,'관리자');


--insert boardlist
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '영업1팀', 'Y', 'Y', 'Y',1);

--board시퀀스
create sequence board2_seq
start with 1
increment by 1;
--boardlist시퀀스
create sequence boardlist_seq
start with 1
increment by 1;

commit;
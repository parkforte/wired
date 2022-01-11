SELECT * FROM BOARD;
SELECT * FROM BOARDLIST;
select * from user_sequences;
select * from member;

UPDATE MEMBER
SET mem_flag='Y'
where mem_name like '±Ç¾ÆÀç';


--»ç¿øµî±Ş
select * from ranks;
insert into ranks(ranks_no, ranks_name)
values(1,'ÀÏ¹İ');
insert into ranks(ranks_no, ranks_name)
values(2,'ÆÀÀåÀÌ»ó');
insert into ranks(ranks_no, ranks_name)
values(3,'°ü¸®ÀÚ');
select boardlist_seq.nextval from dual;
--insert boardlist
delete from boardlist
where bdlist_no>0;
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '°øÁö»çÇ×', 'N', 'N', 'N',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '¿µ¾÷1ÆÀ', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '¿µ¾÷2ÆÀ', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '¿µ¾÷3ÆÀ', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '¿î¿µ1ÆÀ', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '¿î¿µ2ÆÀ', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '¿î¿µ3ÆÀ', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '¹é¾ØµåÆÀ', 'Y', 'Y', 'Y',1);

--board½ÃÄö½º
create sequence board_seq
start with 1
increment by 1;
--boardlist½ÃÄö½º
drop sequence boardlist_seq;
create sequence boardlist_seq
start with 1
increment by 1;

--°Ô½ÃÆÇ °ü¸® ¸ñ·Ï

select bdlist_no, bdlist_name, ranks_no, 
    (select ranks_name from ranks r where b.ranks_no=r.ranks_no) ranks_name  
from boardlist b
ORDER BY bdlist_no;

update boardlist 
set bdlist_re='N', bdlist_up='N', bdList_rc='N'
where bdlist_no=1;
commit;

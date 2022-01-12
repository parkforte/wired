SELECT * FROM BOARD;
SELECT * FROM BOARDLIST;

select bdlist_no, bdlist_name from boardlist;

ALTER TABLE board
ADD FOREIGN KEY (bdlist_no)
REFERENCES boardlist
ON DELETE CASCADE;

ALTER TABLE BOARD DROP FOREIGN KEY;


출처: https://all-record.tistory.com/151 [세상의 모든 기록]

SELECT * FROM    ALL_CONSTRAINTS
WHERE    TABLE_NAME = 'board';

delete from boardlist
where bdlist_no>10;

delete from boardlist
where bdlist_no=221;
select * from board where bdlist_no=221;

commit;
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
values(boardlist_seq.nextval, '공지사항', 'N', 'N', 'N',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '영업1팀', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '영업2팀', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '영업3팀', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '운영1팀', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '운영2팀', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '운영3팀', 'Y', 'Y', 'Y',1);
insert into boardlist(bdlist_no,bdlist_name, bdlist_re, bdlist_up, bdlist_rc, ranks_no)
values(boardlist_seq.nextval, '백앤드팀', 'Y', 'Y', 'Y',1);
--게시판리스트 삭제
delete from boardList
where bdlist_no<100;

update boardlist
set bdlist_no=1
where bdlist_name='공지사항';

--board시퀀스
create sequence board2_seq
start with 1
increment by 1;

create sequence reply_seq
start with 1
increment by 1;

--boardlist시퀀스
drop sequence boardlist_seq;
create sequence boardlist_seq
start with 1
increment by 1;

--게시판 관리 목록

select bdlist_no, bdlist_name, ranks_no, 
    (select ranks_name from ranks r where b.ranks_no=r.ranks_no) ranks_name  
from boardlist b
ORDER BY bdlist_no;

--페이징 쿼리문 2PAGE
SELECT *
from
(
select rownum AS RNUM, A.*
from
(
select bdlist_no, bdlist_name, ranks_no, 
    (select ranks_name from ranks r where b.ranks_no=r.ranks_no) ranks_name  
from boardlist b
ORDER BY bdlist_no
)A
)
WHERE RNUM>5 AND RNUM<=5+5;



commit;
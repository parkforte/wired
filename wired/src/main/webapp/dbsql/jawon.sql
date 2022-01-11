ALTER TABLE REDOURCES RENAME TO RESOURCES;

SELECT * FROM user_sequences;
--자원sequences;
create sequence res_seq
increment by 1
start with 1
nocache;


select * from restype;

--자원sequences;
create sequence restype_seq
increment by 1
start with 4
nocache;

--자원종류
insert into restype(type_no, type_name)
values(1,'회의실');
insert into restype(type_no, type_name)
values(2,'차량');
insert into restype(type_no, type_name)
values(3,'리조트');

--자원리스트 VIEW
CREATE OR REPLACE VIEW RESLIST_VIEW
AS
(
    SELECT T.*, R.RES_LOCATION, R.RES_NO, R.RES_NAME
    FROM RESTYPE T JOIN RESOURCES R
    ON T.TYPE_NO=R.TYPE_NO
);



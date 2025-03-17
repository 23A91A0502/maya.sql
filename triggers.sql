set serveroutput on;
--triggers
--trigger is nothing but a stored procedure
--triggers can fire upon different events automatically
--events -> insert | update | delete
--3 different types of trigger can written
--1.before,2.after,3.instead of
--Uses
--1.compute some values before performing inserts
--2.logging
--3.validation data ensuring checks
--employee table
-- id,name,dob,salary,age
--using trigger with the help of dob ,we can find age
-------------------------------------------------------SYNTAX OF TRIGGERS-------------------------------------------------------
--Create or replace trigger trg_name
--before or after or instead of
--insert | update | delete
-- on table_name
--[for each row] -> for only row level triggers
--begin

--end;
-----------------------------------------------------------------------------------------------
create table emp (
       id int primary key,
       name varchar(20),
       dob date,
       age int,
       salary int
);
-- a trigger that calculates th age
-- and puts in the table upon insert
create or replace trigger trg_cal_age
before insert or update on emp
for each row
begin
     --pseudo record for newly inserting data :new
     :new.age := floor(months_between(sysdate,:new.dob)/12);
end;
/
insert into emp(id,name,dob,salary)
values(1,'madhu',to_date('18-02-2006','dd-mm-yyyy'),100000);
insert into emp(id,name,dob,salary)
values(2,'asha',to_date('12-01-2005','dd-mm-yyyy'),200000);
select * from emp;

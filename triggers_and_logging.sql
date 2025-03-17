SET SERVEROUTPUT ON;
drop table Student;
--TASK ON SOFT SKILLS FEE

create table Student(
       id int primary key,
       name varchar(20),
       date_of_join date,
       total_fee int,
       ss_fee int
);
insert into Student(id,name,date_of_join,total_fee)
values(1,'RamCharan',to_date('12-06-2007','dd-mm-yyyy'),20000);

insert into Student(id,name,date_of_join,total_fee)
values(2,'Ntr',to_date('14-08-2001','dd-mm-yyyy'),50000);

insert into Student(id,name,date_of_join,total_fee)
values(3,'AA',to_date('9-11-2005','dd-mm-yyyy'),80000);

insert into Student(id,name,date_of_join,total_fee)
values(4,'Saipallavi',to_date('10-04-2008','dd-mm-yyyy'),60000);

insert into Student(id,name,date_of_join,total_fee)
values(5,'Samantha',to_date('18-12-2012','dd-mm-yyyy'),90000);

create or replace trigger fee_trigger
before insert or update on Student
for each row
begin
    :new.ss_fee:= :new.total_fee * 0.1 ;
end;
/
select * from Student;

--we need table salary_change_log
create table salary_log(
     log_id int generated as identity,
     emp_id int,
     old_salary int,
     new_salary int,
     updated_on date default sysdate
);

--trigger that inserts a new
--record in salary_log table
--upon updating the salary
--employee table
create or replace trigger chn_emp_sal
after update of salary on employee--meaning do update only for salary by triggering 
--i.e, restricted to trigger for context of salary only
for each row
begin
    insert into salary_log(emp_id,old_salary,new_salary)
    values(:new.id,:old.salary,:new.salary);
end;
/
select * from employee;
update employee set salary = 65000
where id=17;
update employee set gender='female'
where id=23;
select * from salary_log;

--sequences in sql
--used to generated integers in a sequence
--create sequence nums_seq
--start with 1
--increment by 1;
--select nums_seq.nextval from dual;
---- INV - YEAR - 0000
--select
--'INV-' || extract(year from sysdate) || '-' || lpad(nums_seq.nextval,4,'0')
--from dual;
create table Users(
    u_id int primary key,
    u_name varchar(10),
    email varchar(10)
);
create table Iteams(
      i_id int primary key,
      i_name varchar(10),
      price int
);
drop table Orders;
create table Orders(
    orderId int primary key,
    u_id int,
    i_id int,
    quantity int,
    ordered_on date
);
create table Invoice(
    inv_id,
    orderId int,
    u_id int,
    i_id int,
    item_price int,
    total_price int,
    inv_date date default ordered_on
);

--trigger

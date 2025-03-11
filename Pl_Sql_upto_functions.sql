--set serveroutput on;
--begin
--    for i in 1..10 loop
--        dbms_output.put_line(i);
--        exit;
--    end loop;
--end;
--/

--for i in 1..10 loop 
--    if mod(i,2) = 0 then
--        dbms_output.put_line(i);
--    end if;
--end loop;
--end;
--/
--declare 
--    cnt int;
--begin
--    dbms_output.put_line(2||'&');
--    for i in 1..1000 loop
--        cnt := 0;
--        for j in 1..i loop
--            if mod(i,j) = 0 then
--                cnt:=cnt+1;
--            end if;
--        end loop;
--        if cnt = 2 then
--            dbms_output.put(i||'&');
--        end if;
--    end loop;
--    dbms_output.New_line();
--end;
--/


--declare
--    i int:=1;
--begin
--    loop
--        --code
--        DBMS_output.put_line('Number is : '|| i);
--        i := i+1;
--        exit when i=11;
--    end loop;
--end;
--/

--Case
--Simple Case-Switch
--Works on look up values
--declare
--    day int := 5;
--begin
--    case day
--        when 1 then DBMS_OUTPUT.put_line('Monday');
--        when 2 then DBMS_OUTPUT.put_line('Tuesday');
--        when 3 then DBMS_OUTPUT.put_line('Wednesday');
--        when 4 then DBMS_OUTPUT.put_line('Thursday');
--        when 5 then DBMS_OUTPUT.put_line('Friday');
--        when 6 then DBMS_OUTPUT.put_line('Saturday');
--        when 7 then DBMS_OUTPUT.put_line('Sunday');
--        else DBMS_OUTPUT.put_line('Invalid Output');
--    end case;
--end;
--/

--Case(Searched Case)

--Works on Condition

--declare
--    salary int := 50000;
--begin
--    case
--        when salary > 50000 then DBMS_OUTPUT.put_line('High Salary');
--        when salary between 25000 and 50000 then DBMS_OUTPUT.put_line('Average Salary');
--        else DBMS_OUTPUT.put_line('low');
--    end case;
--end;
--/


--creeating user defined functions pl/sql
--A function should always return a value
--A function can be called in any DML statement(selct)
--A function itself can have a select statement inside it but those functions cannot be called in from select statement
--Instead you need to write anotherr pl/sql block to call that function
--Syntax is little verbose
--Syntax
--Create [or replace] function function_name(parameter_list)
--return data_type is|as
--Function shouls always consist of begin and end

--BEGIn
    --Executable code(using parameters)
    --return statement
--End;


--A function to add two integers and returns their sum
--create or replace function add_two(x int, y int) return int is 
--sum_ int; --Declaration
--begin
--    sum_ := x+y;
--    return sum_;
--end;
--/
----Calling the Function
----Calling in a Sel ect Statement
--Select add_two(10,20) from dual;
declare 
    res int;
begin
    res := add_two(10,20);
    return res;
end;
/


create table dummy_table(value1 int,value2 int);
insert into dummy_table values(10,20);
insert into dummy_table values(100,200);
insert into dummy_table values(1,2);

select add_two(value1,value2) from dummy_table;

--Create and call a PL/SQL function that takes an integer and returns it’s square

create or replace function square(a int) return int is
sq int;
begin
    sq := a*a;
    return sq;
end;
/

declare
    num int; 
    res int;
begin
    num:=&num;
    res := square(num);
    dbms_output.put_line(res);
end;


-- Create and call a PL/SQL function that takes two integers and returns a boolean value
 --TRUE if first integer is a factor of second else FALSE
create or replace function isFactor(a int , b int) return boolean is
ans boolean;
begin
    if mod(b,a) = 0 then ans:=true;
    else ans:=false;
    end if;
    return ans;
end;

select isfactor(2,4) from dual;

 --Create and call a PL/SQL function that takes 3 integers and returns the maximum of them
create or replace function maxofthree(a int,b int,c int) return int is
mot int;
begin
    if a>b and a>c then mot := a;
    elsif b>a and b>c then mot := b;
    else mot := c;
    end if;
    return mot;
end;
select maxofthree(10,20,30) from dual;


--Create and call a PL/SQL function that takes two strings name and gender and returns a
-- new name that is made of name and first letter of gender in the following format– name (g)
-- • Example:– If Alice and Female passed as name and gender, the function should return Alice (F)



create or replace function newname(name varchar(60),gender varchar(10)) return varchar(75) is



-- Create and call a PL/SQL function that takes department and salary and returns bonus
-- computed on following basis
-- department bonus_perc
-- HR 12%
-- Operations 10%
-- SW 15%
-- Testing 8%
-- None 5%


create or replace function get_bonus(
salary int, dept varchar) return int is
bonus int;
begin
    case
        when dept = 'HR' then bonus := salary*0.12;
        when dept = 'Operations' then bonus := salary*0.1;
        when dept = 'SW' then bonus := salary*0.15;
        when dept = 'Testing' then bonus := salary*0.8;
        else bonus :=  salary*0.5;
    end case;
    return bonus;
end;

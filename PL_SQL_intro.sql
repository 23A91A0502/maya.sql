-- PL / sql structure
-- DECLARE (optional)
-- BEGIN ( mandatory)
-- EXCEPT (optional)
-- Delcare is used to declare variables
-- used to initialize variable
-- begin section is used to write
-- executable code
-- except exception handling
SET SERVEROUTPUT ON;
-- PL/SQL block of code that prints hello world
begin
     dbms_output.put_line('Hello World');
     dbms_output.put_line('I am Madhumitha');
     
end;
/
--Declaring variables in pl/sql
declare
    -- variable_name data type
    num int;
    name varchar(50);
begin
    --assignment operator is :=
    -- substitution operator(&)
    num := &num;
    name:='&name';
    dbms_output.put_line('Number is : ' || num);
    dbms_output.put_line('Name is : ' || name);
end;
/


--write a pl/sql code to find area and perimeter of a square
declare
      a int;
      
      area int;
      perimeter int;
begin
     a := &a;
     
     area := a*a;
     perimeter :=4 * a;
     dbms_output.put_line('Area of square is : ' || area);
     dbms_output.put_line('Perimeter of square is : ' || perimeter);
end;
/

-- pl/sql can seemlessly interact with sql commands too
-- age calculator
declare
     dob date;
     age int;
begin
     dob := to_date('&dob','DD-MM-YYYY');
     age := to_char(sysdate,'YYYY') - to_char(dob,'YYYY');
     dbms_output.put_line('You are ' || age || ' years old');
     
     
end;
/
--select to_char(sysdate,'YYYY') from dual;
-- conditional statements
--decision Making
-- if then (simple if)
-- if Condition then Code end if;
--voting program using pl/sql
declare
     age int := 15;
begin
     if age > 18 then
          dbms_output.put_line('You can vote');
    else
      dbms_output.put_line('You cannot vote');
    end if;
end;
/
--num is even or odd
declare
     num int := 6;
begin
     if  mod(num,2)=0 then
          dbms_output.put_line('Number is even');
    else 
       dbms_output.put_line('Number is odd');
    end if;
    end;
    /
-- if - then -elsif-then-else
declare
      a int:= 10;
      b int := 20;
      c int := 30;
      ans int;
begin
   if a>b and a>c then
      ans:=a;
    elsif b>c and b>a then
      ans:=b;
    else
      ans:=c;
      end if;
      dbms_output.put_line(ans);
      end;
      /
-- nested if's only to find max of three numbers
declare
      p int:= 10;
      q int := 20;
      r int := 30;
      ans int;
begin
     if a > b then
      if a > c then
         ans:=a;
      else
         ans:=c;
      end if;
    else
      if b > c then
         ans:=b;
     else
       ans:=c;
      end if;
    end if;
     end if;
     dbms_output.put_line(ans);
end;
/
-- case(simple case)
--case (seached case)

-- iterative statements (loops)
-- while
-- used for condition based looping
--syntax of while
-- while condition
-- code
-- end loop;
-- numbers from 1 to 10
declare
    -- loop variable
    i int:=1;
    
begin
   while i <=10 loop
   dbms_output.put_line('Number: ' || i);
   i:=i+1;
   end loop;
end;
/
--reverse numbers
declare
    j int :=10;
    
begin
     while j>=1 loop
     dbms_output.put_line('Number: ' || j);
     j:=j-1;
     end loop;
end;
/

--factors of a number
declare
     num int:=10;
     i int := 1;
     fc int :=0;
begin
     while i<=num loop
     if mod(num,i)=0 then
     fc:=fc+1;
     dbms_output.put(i || ' ');
     
     end if;
     i:=i+1;
     end loop;
     dbms_output.new_line();
     dbms_output.put_line('factor count: ' || fc);
     end;
     /
     
-- prime or not

--dbms_output.put()
--buffer: hello all this is madhumitha from thub
begin
    dbms_output.put('Hello all ');
    dbms_output.put('This is madhumitha ');
    dbms_output.put('from thub');
    dbms_output.new_line();
    end;
    /
    
--for loop
-- for loop_var in start....Stop loop
-- code
-- end loop;
-- for loop code to print numbers from 1 to 10
begin
     for i in 1..10 loop
        dbms_output.put_line('Num is: ' || i);
    end loop;
end;
/
--pattern 1 stars
begin
    for i in 1..5 loop
       for j in 1..5 loop
          dbms_output.put('* ');
        end loop;
        dbms_output.new_line();
        end loop;
        end;
        /
-- in reverse in for loop
begin
    for i in reverse 1..5 loop
        dbms_output.put_line('Num: ' || i);
    end loop;
end;
/
      

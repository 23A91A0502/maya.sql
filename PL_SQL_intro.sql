-- PL/SQL Introduction
-- SQL --> Declarative Language
-- In declarative languages we focus more
-- on what to get rather than how to get
-- Procedural Language Extension for their data
-- base and they called it PL/SQL
-- PL -> Procedural Language
-- Declaration, assigment, conditional, loops
-- functions
-- PL/SQL struccture
-- DECLARE (optional)
-- BEGIN (mandatory)
-- EXCEPT (optional)
-- DECLARE is used to declare variables
-- used to initialize variable
-- BEGIN section is used to write
-- executable code
-- EXCEPT exception handling
SET SERVEROUTPUT ON;
-- PL/SQL block of code that prints Hello World
-- printf(), print(), cout, System.out.println()
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello World');
    DBMS_OUTPUT.PUT_LINE('I am Pavan');
    DBMS_OUTPUT.PUT_LINE('From Technical Hub');
END;
/

-- Declaring variables in PL/SQL
DECLARE
    -- variable_name data type
    num INT;
    name VARCHAR(50);
BEGIN
    -- Assignment operator is :=
    num := 10;
    name := 'Pavan';
    DBMS_OUTPUT.PUT_LINE('Number is: ' || num);
    DBMS_OUTPUT.PUT_LINE('Name is: ' || name);
END;
/


-- Declaring variables in PL/SQL
-- Oracle 19C EE
-- Oracle 23AI
DECLARE
    -- variable_name data type
    num INT;
    name VARCHAR(50);
BEGIN
    -- Substitution Operator (&)
    num := &num;
    name := '&name';
    DBMS_OUTPUT.PUT_LINE('Number is: ' || num);
    DBMS_OUTPUT.PUT_LINE('Name is: ' || name);
END;
/

-- Write a PL/SQL code to find out area and perimeter
-- of a square
DECLARE
    side INT;
    area INT;
    perimeter INT;
BEGIN
    side := &side;
    area := side * side;
    perimeter := 4 * side;
    DBMS_OUTPUT.PUT_LINE('Area is: ' || area);
    DBMS_OUTPUT.PUT_LINE('Perimeter is: ' || perimeter);
END;
/
-- PL/SQL code can seamlessly interact with SQL commands
-- too
-- Age calculator
DECLARE
    dob DATE;
    age INT;
BEGIN
    dob := TO_DATE('&dob', 'DD-MM-YYYY');
    age := TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(dob, 'YYYY');
    DBMS_OUTPUT.PUT_LINE('You are ' || age || ' years old');
END;
/
SELECT TO_CHAR(SYSDATE, 'YYYY') FROM dual;

-- Conditional Statements
-- Decision Making
-- IF-THEN (Simple If)
-- IF condition THEN code END IF;
-- Voting program using PL/SQL
DECLARE
    age INT := 25;
BEGIN
    IF age > 18 THEN
        DBMS_OUTPUT.PUT_LINE('You can vote');
    END IF;
END;
/
-- IF-THEN-ELSE
-- Voting program using PL/SQL
DECLARE
    age INT := 15;
BEGIN
    IF age > 18 THEN
        DBMS_OUTPUT.PUT_LINE('You can vote');
    ELSE
        DBMS_OUTPUT.PUT_LINE('You cannot vote');
    END IF;
END;
/
-- PL/SQL code to find the given number is even or odd
DECLARE
    num INT;
BEGIN
    num := &num;
    IF MOD(num, 2) = 0 THEN
        DBMS_OUTPUT.PUT_LINE(num || ' is even');
    ELSE 
        DBMS_OUTPUT.PUT_LINE(num || ' is odd');
    END IF;
END;
/
-- Nested If statements
BEGIN
    IF 10 > 2 THEN
        IF 20 > 70 THEN
            DBMS_OUTPUT.PUT_LINE('A');
        ELSE
            DBMS_OUTPUT.PUT_LINE('B');
        END IF;
    ELSE
        DBMS_OUTPUT.PUT_LINE('C');
    END IF;
END;
/
-- Largest of 3 using nested if
DECLARE
    a INT := 10;
    b INT := 20;
    c INT := 30;
    mot INT;
BEGIN
    IF a > b THEN
        IF a > c THEN
            mot := a;
        ELSE
            mot := c;
        END IF;
    ELSE    
        IF b > c THEN
            mot := b;
        ELSE 
            mot := c;
        END IF;
    END IF;
    DBMS_OUTPUT.PUT_LINE('Max of three is: ' || mot);
END;
/

-- Largest of 3 using standard elsif
-- else if, elif --> ELSIF
DECLARE
    a INT := 10;
    b INT := 20;
    c INT := 30;
    mot INT;
BEGIN
    IF a > b AND a > c THEN
        mot := a;
    ELSIF b > c AND b > a THEN
        mot := b;
    ELSE
        mot := c;
    END IF;
    DBMS_OUTPUT.PUT_LINE('The max of three is : ' || mot);
END;
/


-- Iterative Statements (Loops)
-- while 
-- Used for condition based looping
-- Syntax of while
-- WHILE condition LOOP
-- code
-- END LOOP;
-- Simple program to print numbers from 1 to 10 using while loop
DECLARE
    -- loop variable
    i INT := 1;
BEGIN
    WHILE i <= 10 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
        i := i + 1;
    END LOOP;
END;
/

-- Printing from 10 to 1 using while loop





-- for (slightly different from C)
-- Range based looping

-- basic loop (mimics the way do-while works)
DECLARE
    -- loop variable
    i INT := 10;
BEGIN
    WHILE i >= 1 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
        i := i - 1;
    END LOOP;
END;
/
-- PL/SQL program to print factors of a given number
DECLARE
    num INT;
    i INT := 1;
BEGIN
    num := &num;
    WHILE i <= num LOOP
        IF MOD(num, i) = 0 THEN
            DBMS_OUTPUT.PUT_LINE('Number: ' || i);
        END IF;
        i := i + 1;
    END LOOP;
END;
/

DECLARE
    num INT;
    i INT := 1;
    fc INT := 0;            
BEGIN
    num := &num;
    WHILE i <= num LOOP
        IF MOD(num, i) = 0 THEN
            fc := fc + 1;
        END IF;
        i := i + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('Factor count is: ' || f);
END;
/

DECLARE
    num INT;
    i INT := 1;
BEGIN
    num := &num;
    WHILE i <= num LOOP
        IF MOD(num, i) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(i);
        END IF;
        i := i + 1;
    END LOOP;
END;
/

-- DBMS_OUTPUT.PUT()
-- buffer: Hello All This is Pavan From Technical Hub
BEGIN
    DBMS_OUTPUT.PUT('Hello All ');
    DBMS_OUTPUT.PUT('This is Pavan ');
    DBMS_OUTPUT.PUT('From Technical Hub ');
    DBMS_OUTPUT.NEW_LINE(); -- Prints accumulated buffer
END;
/



-- PL/SQL program to print factors of a given number
DECLARE
    num INT;
    i INT := 1;
BEGIN
    num := &num;
    WHILE i <= num LOOP
        IF MOD(num, i) = 0 THEN
            DBMS_OUTPUT.PUT(i || ' ');
        END IF;
        i := i + 1;
    END LOOP;
    DBMS_OUTPUT.NEW_LINE();
END;
/

-- FOR LOOP
-- FOR loop_var IN START..STOP LOOP
-- code
-- END LOOP;
-- For loop code to print numbers from 1 to 10
BEGIN
    FOR i IN 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE('Number  is: ' || i);
    END LOOP;
END;
/

BEGIN
    FOR i IN 1..5 LOOP
        FOR j IN 1..5 LOOP
            DBMS_OUTPUT.PUT('* ');
        END LOOP;
        DBMS_OUTPUT.NEW_LINE();
    END LOOP;
END;
/
-- Using for loop print numbers in reverse
-- Usage of IN REVERSE
BEGIN
    FOR i IN REVERSE 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Number: ' || i);
    END LOOP;
END;
/













-- IF-THEN-ELSIF-THEN-ELSE
-- CASE (Simple CASE)
-- CASE (Seached CASE)














      

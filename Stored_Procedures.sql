-- Basic Syntax

CREATE PROCEDURE procedure_name
AS
BEGIN
    -- SQL statements
END;

EXEC procedure_name()

--Creation 
CREATE PROCEDURE GetAllEmployees
AS 
BEGIN 

SELECT * FROM employees

END
--For Execution
EXEC GetAllEmployees()







-------- Advantages of Using a Procedures -------
-- Precomplied and cashed , reducing parcing time
-- Eliminate Repetative Code in Querey
-- Centeralized Logic
-- Enable Complex operations with BEGIN , TRANSACTION , COMMIT and ROLLBACK
--
--

-------- Disadvantages of Using a Procedures -------
-- Overuse of procedures can leads to tightly coupled database login
-- Portability to other Data Base Mangement Systems is Difficult

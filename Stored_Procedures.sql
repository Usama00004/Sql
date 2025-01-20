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





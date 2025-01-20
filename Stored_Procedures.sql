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



DELIMITER $$
CREATE PROCEDURE GetTotalSales(
    IN product_id INT,
    OUT totalSales DECIMAL(10,2) 

)
BEGIN
    SELECT SUM(quantity * price) INTO totalSales
    FROM Sales
    WHERE product_id = product_id
END $$

DELIMITER ;



-- Counter using loop
DELIMITER $$

CREATE PROCEDURE PrintNumbers()
BEGIN
    DECLARE counter INT DEFAULT 1;

    WHILE counter <= 10 DO
        -- Print the current value of counter
        SELECT counter;
        SET counter = counter + 1;
    END WHILE;
END$$

DELIMITER ;





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


-- Simple Example 
WITH FilteredEmployees AS (
    SELECT EmployeeID, Name, Department, Salary
    FROM Employees
    WHERE Department = 'Sales'
)
SELECT * 
FROM FilteredEmployees

---------------------------------------------------------------------------------------------

-- Recurrsion Using CTE

WITH FactorialCTE AS (
    -- Anchor Member: Start with 1
    SELECT 1 AS Number, 1 AS Factorial
    UNION ALL
    -- Recursive Member: Multiply the current number with the previous factorial
    SELECT Number + 1 AS Number, Factorial * (Number + 1) AS Factorial
    FROM FactorialCTE
    WHERE Number < 5  -- Limit recursion to prevent infinite loop
)
SELECT * 
FROM FactorialCTE;


---------------------------------------------------------------------------------------------
-- Employee Hierarchy
WITH EmployeeHierarchy AS (
    -- Anchor Member: Start with the top manager
    SELECT EmployeeID, Name, ManagerID, 1 AS Level
    FROM Employees
    WHERE ManagerID IS NULL

    UNION ALL

    -- Recursive Member: Add employees reporting to the current level
    SELECT e.EmployeeID, e.Name, e.ManagerID, eh.Level + 1
    FROM Employees e
    INNER JOIN EmployeeHierarchy eh
    ON e.ManagerID = eh.EmployeeID
)
SELECT *
FROM EmployeeHierarchy
ORDER BY Level, EmployeeID;
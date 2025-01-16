-- Create Database
Create Database database_name;

-- Create Table 
CREATE TABLE table_name (
    column_id INT AUTO_INCREMENT PRIMARY KEY,
    column_name column_type
);

-- Insert Table 
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);


-- Alter Table (Add a Column)
ALTER TABLE table_name
ADD column_name data_type;

-- Alter Table (Drop a Column)
ALTER TABLE table_name
DROP COLUMN column_name;

-- Alter Table (Modify a Columns Data Type)
ALTER TABLE table_name
MODIFY column_name new_data_type;

-- Alter Table (Rename a column)
ALTER TABLE table_name
RENAME TO new_table_name

-- Alter Column Name
ALTER TABLE employees 
CHANGE COLUMN lastName last_name VARCHAR(100);

-- Alter Table (Add a Constraint)
ALTER TABLE table_name 
ADD CONSTRAINT constraint_name constraint_type (column_name);


-- Get all employees with a salary greater than 50,000:
SELECT 
    id AS employee_id, 
    name AS employee_name, 
    position AS employee_position, 
    salary AS employee_Salary, 
    department AS employee_department
FROM 
    employees
WHERE 
    salary > 50000;

 --count the number of employees in each department

SELECT 
    department, 
    COUNT(*) AS employee_count
FROM 
    employees
GROUP BY 
    department;

--List all employees with their job titles and department names

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name,
    e.salary
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
JOIN 
    departments d ON e.department_id = d.department_id
ORDER BY 
    e.employee_id;

--List all employees with their job titles and department names

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    j.job_title,
    d.department_name,
    e.salary
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
JOIN 
    departments d ON e.department_id = d.department_id
ORDER BY 
    e.employee_id;

--Count employees hired each year
SELECT 
YEAR(hire_date) AS hire_year,
COUNT(*) AS employee_count
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year;


--List all employees in the Engineering department

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    d.department_name
FROM 
    employees e
JOIN 
    departments d
ON 
    e.department_id = d.department_id
WHERE 
    d.department_name = 'Engineering';


--Find employees who have been in the company for the longest time
SELECT 
    employee_id, 
    first_name, 
    last_name, 
    hire_date, 
    DATEDIFF(CURDATE(), hire_date) AS days_with_company
FROM 
    employees
ORDER BY hire_date ASC
LIMIT 5;


--List all employees in the Engineering department

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.email,
    d.department_name
FROM 
    employees e
JOIN 
    departments d
ON 
    e.department_id = d.department_id
WHERE 
    d.department_name = 'Engineering';


-- List all customers and highlight those who haven't placed any orders
SELECT 
    Customers.CustomerID,
    Customers.Name, 
    Orders.OrderID
FROM 
    Customers
LEFT JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
WHERE 
    Orders.OrderID IS NULL;


 -- List all employees and their assigned projects (if any).
SELECT Employees.EmployeeID, Employees.Name, Projects.ProjectName
FROM Employees
LEFT JOIN Projects ON Employees.EmployeeID = Projects.EmployeeID;

-- Generate a report of all products and their sales, including unsold products.
SELECT Products.ProductID, Products.ProductName, Sales.SaleID
FROM Products
LEFT JOIN Sales ON Products.ProductID = Sales.ProductID;



  

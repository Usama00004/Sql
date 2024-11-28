-- Create table 
CREATE TABLE table_name (
    column_id INT AUTO_INCREMENT PRIMARY KEY,
    column_name column_type
);

-- Insert table 
INSERT INTO table_name (column1, column2)
VALUES (value1, value2);


-- Alter table (Add a Column)
ALTER TABLE table_name
ADD column_name data_type;

-- Alter table (Drop a Column)
ALTER TABLE table_name
DROP COLUMN column_name;

-- Alter table (Modify a Columns Data Type)
ALTER TABLE table_name
MODIFY column_name new_data_type;

-- Alter table (Rename a column)
ALTER TABLE table_name
RENAME TO new_table_name

-- Alter table (Add a constraint)
ALTER TABLE table_name 
ADD CONSTRAINT constraint_name constraint_type (column_name);


--Get all employees with a salary greater than 50,000:
SELECT id, name, position, salary, department
FROM employees
WHERE salary > 50000;

 --count the number of employees in each department
 SELECT department, COUNT(*) AS employee_count
FROM employees
GROUP BY department;

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
FROM 
    employees
GROUP BY 
    YEAR(hire_date)
ORDER BY 
    hire_year;

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

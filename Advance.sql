--Query 1: Rank employees by salary within their department and include the total salary for each department.

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name,
    e.salary,
    DENSE_RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank,
    SUM(e.salary) OVER (PARTITION BY e.department_id) AS total_department_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
ORDER BY 
    e.department_id, salary_rank;
----------------------------------------------------------------------------------------------------------------------

--Divide the result set into a specified number of buckets 
SELECT employee_id, first_name, last_name, salary,
       NTILE(3) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

----------------------------------------------------------------------------------------------------------------------

-- analyze salary differences between employees in the same department, ordered by their hire dates
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    e.salary,
    LAG(e.salary) OVER (PARTITION BY e.department_id ORDER BY e.hire_date) AS previous_salary,
    e.salary - LAG(e.salary) OVER (PARTITION BY e.department_id ORDER BY e.hire_date) AS salary_difference
FROM 
    employees e;


----------------------------------------------------------------------------------------------------------------------

-- Get Employee Details with Job and Department:
SELECT 
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    emp.email,
    emp.department_id,
    jb.job_title,
    dep.department_name
FROM employees AS emp
LEFT JOIN jobs AS jb ON emp.job_id = jb.job_id
LEFT JOIN departments AS dep ON emp.department_id = dep.department_id;


----------------------------------------------------------------------------------------------------------------------
-- Find average salary by department

SELECT 
    dep.department_name as Department_Name,
    AVG(emp.salary) as Average_Salary
From employees as emp
left join departments as dep 
ON emp.department_id = dep.department_id
GROUP By Department_Name
ORDER By Average_Salary DESC


----------------------------------------------------------------------------------------------------------------------
-- Get total Salary expenditure by department

SELECT 
    dep.department_name as Department_Name,
    SUM(emp.salary) as Salary_Expenditure
From employees as emp
left join departments as dep 
ON emp.department_id = dep.department_id
GROUP By Department_Name
ORDER By Salary_Expenditure DESC


----------------------------------------------------------------------------------------------------------------------

--Retrieve the employee's full name, job title, department name, and salary.
--Calculate the average salary for each department and include it in the result.
--Display only those employees whose salary is greater than the average salary of their department.
--Sort the results by department name in ascending order and then by salary in descending order.
--Include a column showing how much the employee's salary is above the department's average.

WITH SalaryWithAverage AS (
    SELECT 
        emp.employee_id,
        CONCAT(emp.first_name, ' ', emp.last_name) AS full_name,
        jb.job_title AS job_title,
        emp.salary AS salary,
        dep.department_name AS department_name,
        AVG(emp.salary) OVER (PARTITION BY emp.department_id) AS department_average_salary
    FROM 
        employees AS emp
    LEFT JOIN 
        departments AS dep ON emp.department_id = dep.department_id
    LEFT JOIN 
        jobs AS jb ON emp.job_id = jb.job_id
)

SELECT 
    full_name,
    job_title,
    salary,
    department_name,
    department_average_salary
FROM 
    SalaryWithAverage
WHERE 
    salary > department_average_salary
ORDER BY 
    department_name ASC, 
    salary DESC; 



----------------------------------------------------------------------------------------------------------------------
-- Find Top 3 Products with the Highest Sales in Each Category

 SELECT 
    p.category_id, 
    c.category_name, 
    p.product_name, 
    SUM(o.quantity) AS total_sales
FROM 
    products p
JOIN 
    orders o ON p.product_id = o.product_id
JOIN 
    categories c ON p.category_id = c.category_id
GROUP BY 
    p.category_id, c.category_name, p.product_name
ORDER BY 
    p.category_id, total_sales DESC
LIMIT 3;
   

----------------------------------------------------------------------------------------------------------------------
-- Retrieve Users Who Have Never Placed an Order
SELECT 
    u.user_id, 
    u.user_name, 
    u.email
FROM 
    users u
LEFT JOIN 
    orders o ON u.user_id = o.user_id
WHERE 
    o.order_id IS NULL;

----------------------------------------------------------------------------------------------------------------------
-- List all employees who earn above the maximum salary for their job title, including their job title and department.

 SELECT 
    e.first_name || ' ' || e.last_name AS employee_name,
    j.job_title,
    d.department_name,
    e.salary,
    j.max_salary
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    e.salary > j.max_salary;
   
----------------------------------------------------------------------------------------------------------------------   
--Find the average salary by department and identify which department has the highest average salary.
SELECT 
    d.department_name,
    ROUND(AVG(e.salary), 2) AS avg_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
GROUP BY 
    d.department_name
ORDER BY 
    avg_salary DESC
LIMIT 1;

----------------------------------------------------------------------------------------------------------------------

-- Get Employee Details with Job and Department:
SELECT 
    emp.employee_id,
    emp.first_name,
    emp.last_name,
    emp.email,
    emp.department_id,
    jb.job_title,
    dep.department_name
FROM employees AS emp
LEFT JOIN jobs AS jb ON emp.job_id = jb.job_id
LEFT JOIN departments AS dep ON emp.department_id = dep.department_id;

----------------------------------------------------------------------------------------------------------------------
-- Find the highest-paid employee in each department
SELECT e.employee_id, e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);




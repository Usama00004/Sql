--Query 1: Rank employees by salary within their department and include the total salary for each department.

SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.department_id,
    d.department_name,
    e.salary,
    RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank,
    SUM(e.salary) OVER (PARTITION BY e.department_id) AS total_department_salary
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
ORDER BY 
    e.department_id, salary_rank;


--Divide the result set into a specified number of buckets 
SELECT employee_id, first_name, last_name, salary,
       NTILE(3) OVER (ORDER BY salary DESC) AS salary_quartile
FROM employees;

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


-- Find average salary by department

SELECT 
    dep.department_name as Department_Name,
    AVG(emp.salary) as Average_Salary
From employees as emp
left join departments as dep 
ON emp.department_id = dep.department_id
GROUP By Department_Name
ORDER By Average_Salary DESC


-- Get total Salary expenditure by department

SELECT 
    dep.department_name as Department_Name,
    SUM(emp.salary) as Salary_Expenditure
From employees as emp
left join departments as dep 
ON emp.department_id = dep.department_id
GROUP By Department_Name
ORDER By Salary_Expenditure DESC
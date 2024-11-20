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
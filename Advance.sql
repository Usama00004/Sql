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
-- Find the highest salaray

select max(Salary) 
from Employees


-- Find the second highest salary 

select max(Salary) 
from Employees
where Salary < (Select max(Salary) from Employees)
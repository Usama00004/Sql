CREATE TABLE employees (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    hire_date DATE,
    job_id INT,
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

INSERT INTO employees (employee_id,first_name, last_name, email, phone_number, hire_date, job_id, salary, department_id) VALUES 
(1,'John', 'Doe', 'john.doe@example.com', '555-1234', '2018-07-01', 1, 85000.00, 1),
(2,'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '2019-02-14', 2, 75000.00, 2),
(3,'Alice', 'Johnson', 'alice.johnson@example.com', '555-8765', '2020-08-22', 3, 95000.00, 3),
(4,'Bob', 'Brown', 'bob.brown@example.com', '555-3456', '2017-03-10', 4, 70000.00, 4),
(5,'Charlie', 'White', 'charlie.white@example.com', '555-6543', '2021-01-15', 5, 60000.00, 5),
(6,'David', 'Black', 'david.black@example.com', '555-7890', '2020-06-01', 3, 105000.00, 3),
(7,'Eve', 'Green', 'eve.green@example.com', '555-1122', '2019-11-20', 2, 60000.00, 2),
(8,'Frank', 'Moore', 'frank.moore@example.com', '555-2233', '2021-03-30', 5, 45000.00, 5),
(9,'Grace', 'King', 'grace.king@example.com', '555-3344', '2016-10-10', 4, 85000.00, 4),
(10,'Hank', 'Davis', 'hank.davis@example.com', '555-4455', '2017-09-18', 1, 90000.00, 1),
(11,'Ivy', 'Taylor', 'ivy.taylor@example.com', '555-5567', '2016-05-22', 3, 98000.00, 3),
(12,'Jack', 'Miller', 'jack.miller@example.com', '555-6678', '2017-11-05', 1, 88000.00, 1),
(13,'Karen', 'Wilson', 'karen.wilson@example.com', '555-7789', '2019-09-12', 4, 78000.00, 4),
(14,'Leo', 'Brown', 'leo.brown@example.com', '555-8890', '2020-01-27', 2, 70000.00, 2),
(15,'Maria', 'Garcia', 'maria.garcia@example.com', '555-9901', '2021-07-19', 5, 58000.00, 5),
(16,'Nina', 'Martinez', 'nina.martinez@example.com', '555-1102', '2018-03-08', 3, 115000.00, 3),
(17,'Oscar', 'Lopez', 'oscar.lopez@example.com', '555-2203', '2019-06-11', 4, 82000.00, 4),
(18,'Patricia', 'Johnson', 'patricia.johnson@example.com', '555-3304', '2021-08-15', 1, 92000.00, 1),
(19,'Quincy', 'Adams', 'quincy.adams@example.com', '555-4405', '2020-12-03', 2, 64000.00, 2),
(20,'Rachel', 'Lee', 'rachel.lee@example.com', '555-5506', '2017-04-29', 5, 49000.00, 5);

CREATE TABLE jobs (
    job_id INT,
    job_title VARCHAR(100) NOT NULL,
    min_salary DECIMAL(10, 2),
    max_salary DECIMAL(10, 2)
);

INSERT INTO jobs (job_id,job_title, min_salary, max_salary) VALUES 
(1,'HR Manager', 50000.00, 90000.00),
(2,'Accountant', 40000.00, 80000.00),
(3,'Software Engineer', 60000.00, 120000.00),
(4,'Marketing Specialist', 45000.00, 85000.00),
(5,'Sales Representative', 30000.00, 70000.00);

CREATE TABLE departments (
    department_id INT,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO departments (department_id,department_name) VALUES 
(1,'Human Resources'),
(2,'Finance'),
(3,'Engineering'),
(4,'Marketing'),
(5,'Sales');


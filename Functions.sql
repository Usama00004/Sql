
-----  Aggregate Functions -------
-- COUNT() Returns the number of rows in a result set.
SELECT COUNT(*) FROM employees;

-- SUM() Returns the sum of a numeric column.
SELECT SUM(salary) FROM employees;

-- AVG() Returns the average value of a numeric column.
SELECT AVG(salary) FROM employees;

-- MIN() Returns the minimum value in a column.
SELECT MIN(salary) FROM employees;

-- MAX() Returns the maximum value in a column.
SELECT MAX(salary) FROM employees;


---------- String Functions ---------
-- CONCAT() Combines two or more strings into one.
SELECT CONCAT(first_name, ' ', last_name) FROM employees;

--UPPER() Converts a string to uppercase.
SELECT UPPER(first_name) FROM employees;

--LOWER() Converts a string to lowercase.
SELECT LOWER(first_name) FROM employees;

--SUBSTRING() Extracts a portion of a string.
SELECT SUBSTRING(first_name, 1, 3) FROM employees;

------------- Date Functions ------------
-- NOW() Returns the current date and time.
SELECT NOW();

-- CURDATE() Returns the current date.
SELECT CURDATE();

-- DATEDIFF() Returns the difference between two dates.
SELECT DATEDIFF('2024-12-01', '2024-11-01');

-- DATE_FORMAT() Formats a date according to a specified format.
SELECT DATE_FORMAT(order_date, '%Y-%m-%d') FROM orders;


-------------Mathematical Functions ------------
-- ROUND() Rounds a number to a specified decimal place.
SELECT ROUND(price, 2) FROM products;

-- CEILING() Returns the smallest integer greater than or equal to the specified number.
SELECT CEILING(price) FROM products;

-- FLOOR() Returns the largest integer less than or equal to the specified number.
SELECT FLOOR(price) FROM products;

-------------Conditional Functions--------------
-- IF() Returns one value if a condition is true, and another value if false.
SELECT IF(salary > 50000, 'High', 'Low') FROM employees;

-- CASE Evaluates conditions and returns a value based on the result.
SELECT CASE WHEN salary > 50000 THEN 'High' ELSE 'Low' END FROM employees;

------------------ Null Functions--------------
-- ISNULL() Checks if a value is NULL and returns a replacement if true.
SELECT ISNULL(name, 'Unknown') FROM employees;

-- COALESCE() Returns the first non-NULL value in a list of expressions.
SELECT COALESCE(address, 'Not Available') FROM customers;

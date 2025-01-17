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


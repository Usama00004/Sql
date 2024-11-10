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

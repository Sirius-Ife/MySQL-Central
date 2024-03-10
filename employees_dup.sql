drop table if exists employees_dup;
CREATE TABLE employees_dup (
    emp_no INT(11),
    birth_date DATE,
    first_name VARCHAR(14),
    last_name VARCHAR(16),
    gender ENUM('M', 'F'),
    hire_date DATE
);

insert into employees_dup
SELECT 
    e.*
FROM
    employees e
LIMIT 20;

SELECT 
    *
FROM
    employees_dup;
    
insert into employees_dup values    
('10001','1953-09-02','Georgi','Facello','M','1986-06-26');
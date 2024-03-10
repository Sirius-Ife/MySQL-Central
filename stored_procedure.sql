# with in parameter
USE employees;
DROP procedure IF EXISTS emp_avg_salary;

DELIMITER $$
USE employees$$
CREATE PROCEDURE emp_avg_salary(in p_emp_no Integer)
BEGIN
SELECT 
    e.first_name, e.last_name, AVG(s.salary)
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

# with out parameter
USE employees;
DROP procedure IF EXISTS emp_avg_salary_out;

DELIMITER $$
USE employees $$
CREATE PROCEDURE emp_avg_salary_out(in p_emp_no Integer, out p_avg_salary decimal(10,2))
BEGIN
SELECT 
   AVG(s.salary) into p_avg_salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
END$$

DELIMITER ;

 USE employees;
DROP procedure IF EXISTS emp_info;

DELIMITER $$
USE employees$$
CREATE PROCEDURE emp_info(in p_first_name varchar(255), in p_last_name varchar(255), out p_emp_no integer)
BEGIN
 SELECT 
    e.emp_no
INTO p_emp_no FROM
    employees e
WHERE
    e.first_name = p_first_name
        AND e.last_name = p_last_name;
END$$

DELIMITER ;

select * from employees;
select emp_no from salaries;
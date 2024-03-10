USE employees;
DROP function IF EXISTS emp_avg_salary;

# DETERMINISTIC, NO SQL, READS SQL DATA

DELIMITER $$
USE employees $$
CREATE FUNCTION emp_avg_salary (p_emp_no integer)
RETURNS decimal(10,2) 
BEGIN
declare v_avg_salary decimal(10,2);
SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    salaries s
        JOIN
    employees e ON s.emp_no = e.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$

DELIMITER ;

# SET @@global.log_bin_trust_function_creators := 1;

# including a function as one of the cols of a select statement

set @p_emp_no = 11300;
SELECT 
    emp_no,
    first_name,
    last_name,
    EMP_AVG_SALARY(@p_emp_no) AS avg_salary
FROM
    employees
WHERE
    emp_no = @p_emp_no;
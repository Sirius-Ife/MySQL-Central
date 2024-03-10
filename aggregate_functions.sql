/* agg funtions gather data from many rows of a table, 
then aggregate it into a single value */
use employees;

# count returns all rows of table including null values 
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;
    
# sum    
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';  

# max and min 
SELECT 
    MAX(salary)
FROM
    salaries;
SELECT 
    MIN(salary)
FROM
    salaries;

# avg extract the mean of all non-null values in a field
SELECT 
    AVG(salary)
FROM
    salaries; 
 
# round  
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries;
    
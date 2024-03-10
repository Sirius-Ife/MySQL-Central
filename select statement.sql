# one line comments 
/* many lines comments */

use employees;

# select is used to retrieve data from database objects, like tables 
SELECT 
    *
FROM
    employees;
    
SELECT 
    first_name, last_name
FROM
    employees;
    
# where is used to set a condition upon which we will specify what part of the data we want to retreive from the database  
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';   
 
# and is used to logically combine two statements in the condition code block 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

# or is like and but for conditions set on the same col 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' OR first_name = 'Elvis';    
    
# note that and will be computed 1st before or
SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis'
        AND (gender = 'm' OR gender = 'f');
        
# in and not in operators
SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');		

# like operator : pattern matching
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('ar%'); 
 SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('mar_');   
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('mar_');    
    
/* between is used for designating the intervals to which a given value belongs
note the 2 values will be included in the out while for not_between they will not be included */
SELECT 
    *
FROM
    employees
WHERE
    hire_date BETWEEN '1990-01-01' AND '2001-09-21';
SELECT 
    *
FROM
    employees
WHERE
    hire_date NOT BETWEEN '1990-01-01' AND '2001-01-01';

# is not null is used to extract values that are not null while is null does the opposite
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NOT NULL;   
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;

# select distinct retreieves distinct, different data values      
SELECT DISTINCT
    gender
FROM
    employees;

# aggregate functions
SELECT 
    COUNT(emp_no)
FROM
    employees;
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees; 
    
# order by sorts the table based on the specified col    
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;   
SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name;

# group by retreives distinct values 
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name DESC; 

# alias are used to rename a selection from your query 
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
ORDER BY first_name; 

/* having refines the from records that do not satisfy a certain condition, note it can work with aggregate functions
but u can't have both and aggregate and non-aggregate condition at the same time */
SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
GROUP BY first_name
HAVING COUNT(first_name) > 250
ORDER BY first_name;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING names_count < 200
ORDER BY first_name;

# limit 
SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10;
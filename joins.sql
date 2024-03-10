# joins are the sql tools that allows us to construct a relationship between objects
/* inner joins extract only records in which the values in the related cols match */
use employees;

SELECT 
    d.dept_no, dm.emp_no, d.dept_name
FROM
    departments_dup d
        JOIN
    dept_manager_dup dm ON d.dept_no = dm.dept_no
ORDER BY d.dept_no;
    

# left joins are like inner join but they also extract all non matching values from the left table
SELECT 
    d.dept_no, dm.emp_no, d.dept_name
FROM
    dept_manager_dup dm
        LEFT JOIN
    departments_dup d ON d.dept_no = dm.dept_no
ORDER BY d.dept_no;
    
# right joins functionality is identical to left joins but the direction is inverted
SELECT 
    d.dept_no, dm.emp_no, d.dept_name
FROM
    dept_manager_dup dm
        RIGHT JOIN
    departments_dup d ON d.dept_no = dm.dept_no
ORDER BY d.dept_no;

# old joins syntax
SELECT 
    d.dept_no, dm.emp_no, d.dept_name
FROM
    dept_manager_dup dm,
    departments_dup d
WHERE
    d.dept_no = dm.dept_no
ORDER BY d.dept_no;

# joins & where 
SELECT 
    e.emp_no, e.first_name, e.last_name, s.salary
FROM
    employees e
        JOIN
    salaries s ON e.emp_no = s.emp_no
WHERE
    salary > 145000;
    
/* cross joins connect all values of the 2 tables not just those that match or
the cartesian product of the values of two or more sets */
SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
ORDER BY dm.emp_no , d.dept_no;

# old cross join syntax
SELECT 
    dm.*, d.*
FROM
    dept_manager dm,
    departments d
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    dm.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
WHERE
    dm.dept_no != d.dept_no
ORDER BY dm.emp_no , d.dept_no;

# joining more than 2 tables 
SELECT 
    e.*, d.*
FROM
    dept_manager dm
        CROSS JOIN
    departments d
        JOIN
    employees e ON dm.emp_no = e.emp_no
WHERE
    dm.dept_no != d.dept_no
ORDER BY dm.emp_no , d.dept_no;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    dept_manager dm ON e.emp_no = dm.emp_no
        LEFT JOIN
    departments d ON dm.dept_no = d.dept_no
ORDER BY e.emp_no;

SELECT 
    e.first_name,
    e.last_name,
    e.hire_date,
    t.title,
    dm.from_date,
    d.dept_name
FROM
    employees e
        JOIN
    titles t ON e.emp_no = t.emp_no
        JOIN
    dept_manager dm ON t.emp_no = dm.emp_no
        JOIN
    departments d ON dm.dept_no = d.dept_no
WHERE
    title = 'Manager'
ORDER BY e.emp_no;

# joining 2 tables with no linking col. tip : look for a table with mutual cols for both unmutual tables 
SELECT 
    d.dept_name, AVG(s.salary) AS average_salary
FROM
    departments d
        JOIN
    dept_manager dm ON d.dept_no = dm.dept_no
        JOIN
    salaries s ON dm.emp_no = s.emp_no
GROUP BY d.dept_name
HAVING average_salary > 60000
ORDER BY average_salary DESC;

/* union & union all are both used to combine a few select statements in a single output, 
the difference is that latter returns all values including duplicates */
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no <= 10003 
UNION ALL SELECT 
    NULL AS emp_no,
    NULL AS first_name,
    NULL AS last_name,
    NULL AS hire_date,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;
 # note union displays only distinct values   
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
    e.hire_date,
    NULL AS dept_no,
    NULL AS from_date
FROM
    employees_dup e
WHERE
    e.emp_no <= 10003 
UNION SELECT 
    m.emp_no,
    NULL AS first_name,
    NULL AS last_name,
    NULL AS hire_date,
    m.dept_no,
    m.from_date
FROM
    dept_manager m;    
SELECT *
FROM employees
LIMIT (10);

SELECT *
FROM departments
LIMIT (10);

SELECT *
FROM dept_employees
LIMIT (10);

SELECT *
FROM managers
LIMIT (10);

SELECT *
FROM salaries
LIMIT (10);

SELECT *
FROM titles
LIMIT (10);

SELECT * employees AS employee_Number, employees.last_name, employees.hire_date
FROM employees
WHERE employees.hire_date > '1-1-1986'::date AND employees.hire_date < '1-1-1987'::date
LIMIT (10);

SELECT managers.dept_no, departments.dept_name, managers.emp_no, employees.last_name, employees.first_name
FROM managers
JOIN employees 
ON managers.emp_no = employees.emp_no
JOIN departments 
ON managers.dept_no = departments.dept_no
LIMIT (10);

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_employees 
ON employees.emp_no = departments_employees.emp_no
JOIN departments 
ON dept_employees.dept_no = departments.dept_no
LIMIT (10);

SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'
LIMIT (10);

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN dept_employees 
ON employees.emp_no = dept_employees.emp_no
JOIN departments 
ON dept_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
LIMIT (10);

SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
JOIN departments_employees 
ON employees.emp_no = departments_employees.emp_no
JOIN departments 
ON dept_employees.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
LIMIT (10);

SELECT employees.last_name, Count (*)
FROM employees
GROUP BY employees.last_name
ORDER BY Count (*) DESC;

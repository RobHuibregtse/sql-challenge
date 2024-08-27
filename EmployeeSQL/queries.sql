-- List the employee number, last name, first name, sex, and salary of each employee
SELECT employees.emp_no AS "Employee Number",
	employees.last_name AS "Employee Last Name",
	employees.first_name AS "Employee First Name",
	employees.sex AS "Employee Sex",
	salaries.salary AS "Employee Salary"
FROM employees
INNER JOIN salaries ON 
employees.emp_no = salaries.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986
SELECT employees.first_name AS "Employee First Name",
	employees.last_name AS "Employee Last Name",
	employees.hire_date AS "Employee Hire Date"
FROM employees WHERE employees.hire_date >= '1986-01-01';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT dept_manager.dept_no AS "Department Number", 
	departments.dept_name AS "Department Name",
	employees.emp_no AS "Manager Number",
	employees.last_name AS "Manager Last Name",
	employees.first_name AS "Manager First Name"
FROM dept_manager
JOIN departments ON 
(dept_manager.dept_no = departments.dept_no)
JOIN employees ON 
(dept_manager.emp_no = employees.emp_no);

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT dept_emp.dept_no AS "Department Number",
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Employee Last Name",
	employees.first_name AS "Employee First Name", 
	departments.dept_name AS "Department Name"
FROM dept_emp
JOIN departments ON 
(dept_emp.dept_no = departments.dept_no)
JOIN employees ON 
(dept_emp.emp_no = employees.emp_no)
ORDER BY "Department Name" ASC;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B
SELECT employees.first_name AS "Employee First Name",
	employees.last_name AS "Employee Last Name",
	employees.sex AS "Employee Sex"
FROM employees WHERE employees.first_name = 'Hercules' AND employees.last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name
SELECT employees.first_name AS "Employee First Name",
	employees.last_name AS "Employee Last Name",
	employees.emp_no AS "Employee Number"
FROM employees 
WHERE employees.emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no = 'd007'
);

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
SELECT employees.first_name AS "Employee First Name",
	employees.last_name AS "Employee Last Name",
	employees.emp_no AS "Employee Number",
	departments.dept_name AS "Department Name"
FROM employees 
JOIN dept_emp ON 
(dept_emp.emp_no = employees.emp_no)
JOIN departments ON 
(dept_emp.dept_no = departments.dept_no)
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

-- List the frequency counts, in descending order, of all the employee last names 
SELECT employees.last_name AS "Employee Last Name", 
	count(employees.last_name) AS "Frequency of Last Name"
FROM employees
GROUP BY employees.last_name 
ORDER BY "Frequency of Last Name" DESC;
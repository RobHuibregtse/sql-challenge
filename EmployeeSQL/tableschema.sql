-- Create all table schema: 

-- departments (Department information)
CREATE TABLE departments (
	dept_no VARCHAR(10) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(32)
);

-- employees (Employee information)
CREATE TABLE employees (
	emp_no VARCHAR(10) PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR(10),
	birth_date DATE, 
	first_name VARCHAR(32),
	last_name VARCHAR(32),
	sex CHAR(1),
	hire_date DATE
);

-- titles (Job titles)
CREATE TABLE titles (
	title_id VARCHAR(10) PRIMARY KEY NOT NULL,
	title VARCHAR(32)
);

-- dept_emp (Employee assignments to departments)
CREATE TABLE dept_emp (
	emp_no VARCHAR(10) NOT NULL,
	dept_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);

-- dept_manager (Manager assignments to departments)
CREATE TABLE dept_manager(
	dept_no VARCHAR(10) NOT NULL,
	emp_no VARCHAR(10) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

-- salaries (Salary assignments to employees)
CREATE TABLE salaries (
	emp_no VARCHAR(10) NOT NULL,
	salary INTEGER, 
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
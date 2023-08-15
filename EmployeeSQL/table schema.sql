CREATE TABLE departments (
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(40)UNIQUE NOT NULL
);


CREATE TABLE titles(
  title_id VARCHAR(5) PRIMARY KEY,
  title VARCHAR (30) NOT NULL UNIQUE
  
);


CREATE TABLE employees (
	 emp_no INT PRIMARY KEY,
	 emp_title_id VARCHAR(5)REFERENCES titles (title_id) NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR(30) NOT NULL,
     last_name VARCHAR(30) NOT NULL,
     sex CHAR CHECK ((sex= 'M') or (sex='F') or (sex ='m') or (sex='f')),
     hire_date DATE NOT NULL
     
);

CREATE TABLE dept_emp(
  emp_no INT REFERENCES employees (emp_no),
  dept_no VARCHAR(4) REFERENCES departments (dept_no) NOT NULL,
  PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE dept_manager (
    dept_no VARCHAR(4) REFERENCES departments (dept_no) NOT NULL,
    emp_no INT REFERENCES employees (emp_no) NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);


CREATE TABLE salaries (
  emp_no INT primary key,
  salary INT CHECK (salary>0) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);




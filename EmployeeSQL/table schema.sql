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
     sex CHAR NOT NULL,
     hire_date DATE NOT NULL
     
);


CREATE TABLE dept_emp(
  emp_no INT REFERENCES employees (emp_no),
  dept_no VARCHAR(4) REFERENCES departments (dept_no) NOT NULL,
  PRIMARY KEY (emp_no, dept_no)
);
drop table dept_emp;

select * from dept_emp;

CREATE TABLE dept_manager (
    dept_no VARCHAR(4) REFERENCES departments (dept_no) NOT NULL,
    emp_no INT REFERENCES employees (emp_no) NOT NULL,
    PRIMARY KEY (emp_no, dept_no)
);
drop table dept_manager;

CREATE TABLE salaries (
  emp_no INT not null primary key,
  salary INT NOT NULL,
  foreign key (emp_no) references employees(emp_no)
);

select * from salaries;


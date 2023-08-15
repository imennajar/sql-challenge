# sql-challenge


In this project, we will see how to use SQL stands for Structured Query Language to create  .
In this project, we will see in the first part what the weather is like as we approach the equator, and in the second part how to plan future vacations using weather data skills.


## What we will learn from this project:

- How to generate the Cities List by Using the citipy Library
  
- How to use the OpenWeatherMap API to retrieve weather data from the cities list generated
  
- How Use the OpenWeatherMap API to retrieve weather data from the cities list generated in the started code
  
- How to use our skill to create Plots to showcase the relationship between weather variables and Latitude: Latitude vs. Temperature, Latitude vs. Humidity, Latitude vs. Cloudiness, and Latitude vs. Wind Speed.
  
- How to use our skills to compute Linear Regression for each relationship: Latitude vs. Temperature in Northern and Southern Hemisphere, Latitude vs. Humidity in Northern and Southern Hemisphere,
  Latitude vs. Cloudiness in Northern and Southern Hemisphere, and Latitude vs. Wind Speed in Northern and Southern Hemisphere.  We will include the linear regression line, the model's formula, and the rvalues.
  
- How to create a map that displays a point for every city of our data using a characteristic of the weather
  
- How to narrow down our data to find our ideal weather condition
  
- How to use the Geoapify API to find hotels (or any other location)
  
- How to add the hotel name and the country as additional information in the hover message for each city in the map
  
## Instructions:

- Prepare the data

- Retrieve weather data

- Create Plots

- Compute Linear Regression Plots

- Create Maps

## Program:

### Tools:

- PostgreSQL: (usually referred to as "Postgres") is an  object-relational database management system that uses the SQL language.🐘

- pgAdmin: is the management tool used for working with Postgres. It simplifies creation, maintenance, and use of database objects.
  
- QuickDBD: is a web-based application that can be used to design and model databases.


### Code 
### Data Modeling
Inspecting the CSV files and sketching an Entity Relationship Diagram of the tables using QuickDBD

<img src=EmployeeSQL/'QuickDBD-Free Diagram.png' style ='width:700px;height:300px'/>


#### Data Engineering: Create tables of the database
```
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


```
### Data Analysis: Retrieve data
```
--List the employee number, last name, first name, sex, and salary of each employee--
SELECT e.emp_no,last_name,first_name,sex,salary 
FROM employees e, salaries s
WHERE s.emp_no=e.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986--
SELECT first_name,last_name, hire_date FROM employees
WHERE EXTRACT (YEAR FROM hire_date)='1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name--
SELECT d.dept_no,dept_name,e.emp_no,last_name,first_name
FROM departments d, employees e, dept_manager dm
WHERE (d.dept_no=dm.dept_no)AND (e.emp_no=dm.emp_no);

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name--
SELECT e.emp_no,d.dept_no,last_name,first_name,dept_name 
FROM departments d, employees e, dept_emp de
WHERE (d.dept_no=de.dept_no)and (e.emp_no=de.emp_no);

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B--
SELECT first_name,last_name,sex 
FROM employees
WHERE (first_name='Hercules') AND (last_name LIKE 'B%');

--List each employee in the Sales department, including their employee number, last name, and first name--
SELECT e.emp_no,last_name,first_name
FROM departments d, employees e, dept_emp de
WHERE (d.dept_no=de.dept_no)AND (e.emp_no=de.emp_no)AND (dept_name='Sales');

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name--
SELECT e.emp_no,last_name,first_name,dept_name
FROM departments d, employees e, dept_emp de
WHERE (d.dept_no=de.dept_no)AND (e.emp_no=de.emp_no)AND ((dept_name='Sales')OR(dept_name='Development'));

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)--
SELECT last_name, COUNT(last_name) FROM employees 
group by last_name
order by last_name;
```


## Tip:🪄

For a better analysis of the relationship between weather variables and Latitude, we can create maps that display, for example in the Southern Hemisphere, a point for each city in our data. The size of the point will represent weather variables in each map.



# sql-challenge

In this task, I complete a research project on employees of a corporation from the 1980s and 1990s using the six csv files that remain of the database of employees from that period.

This challenge consists of 2 parts:
1. Data Engineering
	* Inspected the CSVs and sketched out an ERD of the tables
	* Created a table schema for each of the six CSV files
	* Import each CSV file into the corresponding SQL table.

<img src="https://github.com/kelseyoros/sql-challenge/blob/master/images/QuickDBD-export.png" width="800">

```
CREATE TABLE DEPARTMENTS (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_DEPARTMENTS PRIMARY KEY (
        dept_no
     )
);
```

2. Data Analysis (Queries)
	* List the following details of each employee: employee number, last name, first name, gender, and salary.
	* List employees who were hired in 1986.
	* List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
	* List the department of each employee with the following information: employee number, last name, first name, and department name.
	* List all employees whose first name is "Hercules" and last names begin with "B."
	* List all employees in the Sales department, including their employee number, last name, first name, and department name.
	* List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
	* In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

```
SELECT
   e.emp_no,
   e.last_name,
   e.first_name,
   d.dept_name
FROM employees AS e
JOIN dept_emp AS d_e
	ON e.emp_no = d_e.emp_no
JOIN departments AS d
	ON d_e.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name='Development';
```


```
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
```
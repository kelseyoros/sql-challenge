--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM employees AS e
INNER JOIN salaries AS s
	ON e.emp_no = s.emp_no;

--List employees who were hired in 1986.
SELECT 
	emp_no,
	last_name,
	first_name,
	hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';


--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	d.dept_no,
   	d.dept_name,
   	e.emp_no,
   	e.last_name,
   	e.first_name,
   	d_m.from_date,
   	d_m.to_date
FROM departments AS d
INNER JOIN dept_manager AS d_m
	ON d.dept_no=d_m.dept_no
INNER JOIN employees AS e
	ON e.emp_no = d_m.emp_no;


--List the department of each employee with the following information: employee number,
--last name, first name, and department name.
SELECT
	e.emp_no,
	e.first_name,
   	e.last_name,
   	d.dept_name
FROM departments AS d
INNER JOIN dept_emp AS d_e
	ON d.dept_no=d_e.dept_no
INNER JOIN employees AS e
	ON e.emp_no = d_e.emp_no;


--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
	first_name,
	last_name
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';


--List all employees in the Sales department, including their employee number,
--last name, first name, and department name.
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
WHERE d.dept_name = 'Sales';


--List all employees in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
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


--In descending order, list the frequency count of employee last names, i.e., how many employees
--share each last name.
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


--Evidence in hand, you march into your boss's office and present the visualization. With a sly grin, 
--your boss thanks you for your work. On your way out of the office, you hear the words, "Search your ID
--number." You look down at your badge to see that your employee ID number is 499942.
SELECT first_name, last_name, emp_no
FROM employees
WHERE emp_no='499942';
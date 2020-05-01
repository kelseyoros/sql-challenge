-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE DEPARTMENTS (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_DEPARTMENTS PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE DEPT_EMP (
    emp_no INT   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_DEPT_EMP PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE DEPT_MANAGER (
    dept_no VARCHAR   NOT NULL,
    emp_no INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_DEPT_MANAGER PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE EMPLOYEES (
    emp_no INT   NOT NULL,
    birth_date DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    gender VARCHAR   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_EMPLOYEES PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE SALARIES (
    emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_SALARIES PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE TITLES (
    emp_no INT   NOT NULL,
    title VARCHAR   NOT NULL,
    from_date DATE   NOT NULL,
    to_date DATE   NOT NULL,
    CONSTRAINT pk_TITLES PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE DEPT_EMP ADD CONSTRAINT fk_DEPT_EMP_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);

ALTER TABLE DEPT_EMP ADD CONSTRAINT fk_DEPT_EMP_dept_no FOREIGN KEY(dept_no)
REFERENCES DEPARTMENTS (dept_no);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_dept_no FOREIGN KEY(dept_no)
REFERENCES DEPARTMENTS (dept_no);

ALTER TABLE DEPT_MANAGER ADD CONSTRAINT fk_DEPT_MANAGER_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);

ALTER TABLE SALARIES ADD CONSTRAINT fk_SALARIES_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);

ALTER TABLE TITLES ADD CONSTRAINT fk_TITLES_emp_no FOREIGN KEY(emp_no)
REFERENCES EMPLOYEES (emp_no);


select * from departments;
select * from dept_emp;
select * from dept_manager;
select * from salaries;
select * from titles;
select * from employees;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.

select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
from employees
join salaries
on employees.emp_no = salaries.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

select first_name, last_name, hire_date
from employees
where hire_date like '%1986';

-- List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.

select dept.dept_no, dept.dept_name, employees.emp_no, employees.last_name, employees.first_name
from employees
join dept_manager as dept_m
on employees.emp_no = dept_m.emp_no
join departments as dept
on dept_m.dept_no = dept.dept_no;

-- List the department of each employee with the following information: 
-- employee number, last name, first name, and department name

select employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
from employees
join dept_emp as dept_e
on employees.emp_no = dept_e.emp_no
join departments as dept
on dept_e.dept_no = dept.dept_no;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select first_name, last_name, sex
from employees
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
from employees
join dept_emp as dept_e
on employees.emp_no = dept_e.emp_no
join departments as dept
on dept_e.dept_no = dept.dept_no
where dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.

select employees.emp_no, employees.last_name, employees.first_name, dept.dept_name
from employees
join dept_emp as dept_e
on employees.emp_no = dept_e.emp_no
join departments as dept
on dept_e.dept_no = dept.dept_no
where dept_name = 'Sales' or dept_name='Development';

-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.

select last_name, count (last_name) as amount
from employees
group by last_name
order by amount desc;



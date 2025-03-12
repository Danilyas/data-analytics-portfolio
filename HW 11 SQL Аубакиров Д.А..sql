USE employees;

# 1. Создание простого View: Напишите SQL-запрос для создания представления (View),
# которое отображает имена и фамилии всех сотрудников.

CREATE VIEW employees_full_name AS
SELECT first_name, last_name, hire_date
FROM employees;

SELECT * FROM employees_full_name;

# 2. View с JOIN: Создайте представление, которое объединяет таблицы employees и salaries,
# показывая идентификатор сотрудника, его имя, фамилию и текущую зарплату.

CREATE VIEW employees_salaries AS
SELECT a.emp_no, a.first_name, a.last_name, b.salary
FROM employees a
JOIN salaries b
ON a.emp_no = b.emp_no
WHERE b.to_date = '9999-01-01';

SELECT * FROM employees_salaries;

# 3. View для агрегированных данных: Создайте представление,
# которое показывает среднюю зарплату по каждому отделу.

CREATE VIEW average_salary AS
SELECT a.dept_name, ROUND(AVG(c.salary))
FROM departments a
JOIN dept_emp b
ON a.dept_no = b.dept_no
JOIN salaries c
ON b.emp_no = c.emp_no
GROUP BY a.dept_name;

SELECT * FROM average_salary;

# 4. Комбинированный View с JOIN и WHERE: Создайте представление,
# которое отображает информацию о сотрудниках, работающих в отделе 'Sales'.

CREATE VIEW sales_employees AS 
SELECT a.*
FROM employees a
JOIN dept_emp b
ON a.emp_no = b.emp_no
WHERE b.dept_no = 'd007';

SELECT * FROM sales_employees;


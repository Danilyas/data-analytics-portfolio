USE employees;

# 1. Определение наивысшей текущей зарплаты в каждом отделе (для подсчета текущей зарплаты, используем фильтр WHERE to_date = '9999-01-01'):
#   - Цель: Найти наивысшую текущую зарплату в каждом отделе.
#   - Таблицы для использования: salaries (содержит информацию о зарплатах сотрудников), dept_emp (содержит информацию о том, к каким отделам относятся сотрудники).
#   - Колонки для отображения: Идентификатор сотрудника (emp_no), зарплата (salary), номер отдела (dept_no), наивысшая зарплата в отделе (max_salary_in_dept).

SELECT b.emp_no, b.dept_no, a.salary, MAX(a.salary) OVER (PARTITION BY b.dept_no) AS max_salary_in_dept
FROM dept_emp b
JOIN salaries a
ON b.emp_no = a.emp_no
WHERE a.to_date = '9999-01-01'
ORDER BY emp_no;


# 2. Сравнение зарплаты каждого сотрудника с средней зарплатой в их отделе:
#   - Цель: Сравнить зарплату каждого сотрудника с средней зарплатой в его/ее отделе.
#   - Таблицы для использования: salaries, dept_emp.
#   - Колонки для отображения: Идентификатор сотрудника (emp_no), зарплата (salary), номер отдела (dept_no), средняя зарплата в отделе (avg_salary_in_dept).

SELECT a.emp_no, a.salary, b.dept_no, ROUND(AVG(a.salary) OVER (PARTITION BY b.dept_no)) AS avg_salary_in_dept
FROM salaries a
JOIN dept_emp b
ON a.emp_no = b.emp_no
WHERE a.to_date = '9999-01-01'
ORDER BY emp_no;

#3. Ранжирование сотрудников в отделе по стажу работы:
#   - Цель: Ранжировать сотрудников в каждом отделе по длительности их работы в компании.
#   - Таблицы для использования: employees (содержит информацию о сотрудниках, включая дату найма), dept_emp.
#   - Колонки для отображения: Идентификатор сотрудника (emp_no), дата найма (hire_date), номер отдела (dept_no), ранг опыта (experience_rank). То есть мы хотим разделить на партиции по департаменту и сортировать по hire_date.

SELECT a.emp_no, a.hire_date, b.dept_no, DENSE_RANK() OVER (PARTITION BY b.dept_no ORDER BY a.hire_date) AS experience_rank
FROM employees a
JOIN dept_emp b
ON a.emp_no = b.emp_no;
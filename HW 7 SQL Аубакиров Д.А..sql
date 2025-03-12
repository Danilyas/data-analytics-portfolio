# 1. Выведите список всех менеджеров, а именно их emp_no, имена/фамилии,
# номер департамента, который они курируют,
# и дату найма в компанию. (именно менеджером, то есть подсказка dept_manager)

SELECT a.emp_no, a.first_name, a.last_name, b.dept_no, b.from_date
FROM dept_manager b
LEFT JOIN employees a
ON a.emp_no = b.emp_no;


# 2. Существует ли сотрудник по фамилии Markovitch, который когда-то был менеджером департамента.
# Может быть таких сотрудников несколько? (именно менеджером, то есть подсказка dept_manager)

SELECT a.last_name, b.emp_no
FROM employees a
RIGHT JOIN dept_manager b
ON a.emp_no = b.emp_no
WHERE a.last_name = 'Markovitch';

# 3. Вывести список сотрудников, имена/фамилии, дату найма, должность в компании,
# у которых имя начинается на М, а фамилия заканчивается на H.

SELECT a.first_name, a.last_name, a.hire_date, b.title
FROM employees a
RIGHT JOIN titles b
ON a.emp_no = b.emp_no
WHERE a.first_name LIKE 'M%' AND a.last_name LIKE '%H';

# 4. Создайте временную таблицу на основе salaries, где у вас будет emp_no и его/ее максимальная
# и минимальная зарплата за весь период работы в компании. Далее сделайте
# JOIN используя эту временную таблицу и таблицу employees 
# чтобы получить список сотрудников, их имена/фамилии, и их мин/макс зарплат.

DROP TEMPORARY TABLE salaries_t;
CREATE TEMPORARY TABLE IF NOT EXISTS salaries_t AS
SELECT emp_no, MIN(salary) AS min_salary, MAX(salary) AS max_salary
FROM salaries
GROUP BY emp_no;

SELECT a.emp_no, a.first_name, a.last_name, b.min_salary, b.max_salary
FROM employees a
JOIN salaries_t b
ON a.emp_no = b.emp_no;


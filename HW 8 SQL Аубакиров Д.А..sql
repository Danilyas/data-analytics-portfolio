USE employees;

# 1. Найдите количество сотрудников мужского пола (M) и женского пола (F) и выведите записи в порядке убывания по количеству сотрудников.

SELECT gender, COUNT(*) AS employee_count
FROM employees
GROUP BY gender
ORDER BY employee_count DESC;


# 2. Найдите среднюю зарплату в разрезе должностей сотрудников (title), 
# округлите эти средние зарплаты до 2 знаков после запятой и выведите записи в порядке убывания.

SELECT a.title, ROUND(AVG(b.salary), 2) AS average_salary
FROM titles a
JOIN salaries b
ON a.emp_no = b.emp_no
GROUP BY a.title
ORDER BY average_salary DESC;


# 3. Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.

SELECT MONTH(hire_date) AS hire_month, COUNT(*) AS employee_count
FROM employees
GROUP BY hire_month
ORDER BY hire_month;

# 4. Cформируйте запрос, который соединяет employees, dept_emp, departments и titles, 
# чтобы показать имена и фамилии сотрудников, названия их отделов
# и их текущие должности (именно текущие должности, то есть фильтр по таблице titles, столбец to_date).

SELECT a.first_name, a.last_name, c.dept_name, d.title
FROM employees a
JOIN dept_emp b ON a.emp_no = b.emp_no
JOIN departments c ON b.dept_no = c.dept_no
JOIN titles d ON a.emp_no = d.emp_no
WHERE d.to_date = '9999-01-01';

# 5. Используйте Self JOIN в таблице employees, 
# чтобы найти пары сотрудников с одинаковыми фамилиями. Отобразите их имена и фамилии.

SELECT a.first_name AS first_name1, a.last_name AS last_name1, b.first_name AS first_name2, b.last_name AS last_name2
FROM employees a
JOIN employees b ON a.last_name = b.last_name AND a.emp_no <> b.emp_no;




# 1. Вывод полной информации из таблицы employees
SELECT * FROM employees;

# 2. Вывод всех мужчин из таблицы employees
SELECT * FROM employees
WHERE gender = 'M';

# 3. Вывод всех сотрудников по имени Elvis
SELECT * FROM employees
WHERE first_name = 'Elvis';

# 4. Вывод уникальных названий должностей 
SELECT DISTINCT title FROM titles;

# 5. Вывод всех сотрудников, трудоустроенных в 2000 году
SELECT * FROM employees
WHERE year(hire_date) = 2000;

# 6. Вывод всех сотрудников, кому больше 60 лет
SELECT * FROM employees
WHERE CURDATE() - INTERVAL 61 YEAR >= birth_date;

# 7. Вывод количества строк в таблице salaries
SELECT COUNT(*) FROM salaries;

# 8. Вывод количества строк в таблице salaries, где зарплата > 100.000$
SELECT COUNT(*) FROM salaries
WHERE salary > 100000;
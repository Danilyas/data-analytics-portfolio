USE employees;

# 1. Объединение сотрудников и менеджеров: Напишите запрос, который использует UNION
# для объединения списка всех сотрудников (мужчин) и всех менеджеров (только идентификаторы сотрудников emp_no).

SELECT emp_no
FROM employees
WHERE gender = 'M'
UNION
SELECT emp_no
FROM dept_manager;

# 2. Список уникальных должностей и отделов: Создайте запрос, который объединяет
# уникальные названия должностей из таблицы titles и названия отделов из departments.

SELECT title
FROM titles
UNION
SELECT dept_name
FROM departments;

# 3. Сотрудники с зарплатами выше и ниже среднего: Напишите запрос, который
# использует UNION для объединения двух списков: сотрудников с зарплатой выше
# 60.000 долларов и сотрудников с зарплатой ниже 40.000 долларов (используйте имя и зарплату).

SELECT a.first_name, a.last_name, b.salary
FROM employees a, salaries b
WHERE a.emp_no = b.emp_no AND b.salary > 60000
UNION
SELECT a.first_name, a.last_name, b.salary
FROM employees a, salaries b
WHERE a.emp_no = b.emp_no AND b.salary < 40000;

# 4. Объединение текущих и бывших сотрудников: Используйте UNION для создания списка
# сотрудников, которые в настоящее время работают в компании, и тех, кто уже ушел
# (используйте имя, фамилию и статус 'Текущий' или 'Бывший' , то есть first_name, last_name, 'Текущий' AS status, 'Бывший' AS status ).

# Добавил emp_no для избежания потери и дубликации данных

SELECT DISTINCT a.emp_no, a.first_name, a.last_name, 'Бывший' AS status
FROM employees a
JOIN dept_emp b
ON a.emp_no = b.emp_no AND b.emp_no IN (
SELECT emp_no
FROM dept_emp
WHERE to_date = '9999-01-01'
)
UNION
SELECT DISTINCT a.emp_no, a.first_name, a.last_name, 'Текущий' AS status
FROM employees a
JOIN dept_emp b
ON a.emp_no = b.emp_no
WHERE b.emp_no NOT IN (
SELECT emp_no
FROM dept_emp
WHERE to_date = '9999-01-01'
)


# 5. Сравнение зарплат менеджеров и обычных сотрудников: Создайте запрос с использованием UNION,
# чтобы сравнить средние зарплаты менеджеров и обычных сотрудников (выведите тип сотрудника,
# либо Менеджер, либо Обычный сотрудник их среднюю зарплату,
# то есть 'Менеджер' AS type, 'Обычный сотрудник' AS type, AVG(salary) AS avg_salary ).

# Использовал UNION ALL, при этом заранее исключив повторения со 2 запроса
# так как при использовании UNION теряются данные, скорее всего из за
# одинаковых средних зарплат у обычных сотрудников. Как альтернатива, чтобы решить проблему можно выводить emp_no

SELECT 'Менеджер' AS type, ROUND(AVG(a.salary)) AS avg_salary
FROM salaries a
JOIN dept_manager b
ON a.emp_no = b.emp_no
GROUP BY a.emp_no
UNION ALL
SELECT 'Обычный сотрудник' AS type, ROUND(AVG(a.salary)) AS avg_salary
FROM salaries a
JOIN employees b
ON a.emp_no = b.emp_no
# Без строчек внизу даже с UNION менеджера также засчитываются как и обычные сотрудники
WHERE a.emp_no NOT IN (
SELECT emp_no
FROM dept_manager
)
GROUP BY a.emp_no





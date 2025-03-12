USE employees;

# 1. Основы INNER JOIN: Напишите запрос, который соединяет таблицы employees и dept_emp, 
# чтобы отобразить идентификаторы сотрудников (emp_no)
# и номера отделов (dept_no), в которых они работают (когда-то работали).

SELECT a.emp_no AS 'Идентификаторы сотрудников', b.dept_no AS 'Номер отдела' 
FROM employees a
INNER JOIN dept_emp b
ON a.emp_no = b.emp_no;

# 2. Понимание LEFT JOIN: Создайте запрос, использующий LEFT JOIN для соединения таблиц employees и dept_manager.
# Для каждого сотрудника отобразите его идентификатор и номер отдела,
# которым он управляет, если он является менеджером.

SELECT a.emp_no AS 'Идентификатор сотрудника', b.dept_no 'Номер управляемого отдела'
FROM employees a
LEFT JOIN dept_manager b
ON a.emp_no = b.emp_no;

# 3. Применение RIGHT JOIN: Напишите запрос, который соединяет таблицы departments и dept_emp через RIGHT JOIN.
# Выведите название отдела и идентификатор сотрудника.

SELECT a.dept_name AS 'Название отдела', b.emp_no AS 'Идентификатор сотрудника'
FROM departments a
RIGHT JOIN dept_emp b
ON a.dept_no = b.dept_no
ORDER BY b.emp_no;

# 4. Используйте INNER JOIN для соединения таблиц employees и salaries,
# чтобы отобразить идентификаторы сотрудников и их среднюю зарплату. 

SELECT a.emp_no AS 'Идентификатор сотрудника', ROUND(AVG(b.salary)) AS "Средняя зарплата"
FROM employees a
INNER JOIN salaries b
ON a.emp_no = b.emp_no
GROUP BY a.emp_no
ORDER BY a.emp_no;


USE employees;

# 1. Найдите всех сотрудников, которые работали как минимум в 2 департаментах.
# Вывести их имя и  фамилию. Показать записи в порядке возрастания.

SELECT a.first_name, a.last_name, a.number_of_departments
FROM (
SELECT b.first_name, b.last_name, c.emp_no, COUNT(c.dept_no) AS number_of_departments
FROM employees b
JOIN dept_emp c
ON b.emp_no = c.emp_no
GROUP BY c.emp_no
HAVING COUNT(c.dept_no) >= 2
ORDER BY first_name, last_name
) a;

# 2. Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.

SELECT a.first_name, a.last_name, b.salary
FROM employees a
JOIN salaries b
ON a.emp_no = b.emp_no
WHERE b.salary IN (
    SELECT MAX(salary)
    FROM salaries
);

# 3. Создайте запрос, который выбирает названия всех отделов, в которых работает более 100 сотрудников.

SELECT dept_name
FROM departments
WHERE dept_no IN (
SELECT dept_no
FROM dept_emp
GROUP BY dept_no
HAVING COUNT(emp_no) > 100
);

# 4. Напишите запрос, который находит имена и фамилии всех сотрудников, которые никогда не были менеджерами.

SELECT first_name, last_name
FROM employees
WHERE emp_no NOT IN (
SELECT emp_no
FROM dept_manager
);

# 5. Создайте запрос, который для каждого отдела выводит сотрудников, получающих наибольшую зарплату в этом отделе.

SELECT a.emp_no, a.first_name, a.last_name, b.salary
FROM employees a
JOIN salaries b
ON a.emp_no = b.emp_no
WHERE b.salary IN (
    SELECT MAX(a.salary)
    FROM salaries a
    JOIN dept_emp b
    ON a.emp_no = b.emp_no
    GROUP BY dept_no
);

# 6. Напишите запрос, который выбирает названия отделов, где средняя зарплата выше общей средней зарплаты по компании.

SELECT a.dept_name, ROUND(AVG(c.salary)) AS average_department_salary
FROM departments a
JOIN dept_emp b
ON a.dept_no = b.dept_no
JOIN salaries c
ON b.emp_no = c.emp_no
GROUP BY a.dept_name
HAVING AVG(c.salary) >
(
SELECT AVG(salary)
FROM salaries
);

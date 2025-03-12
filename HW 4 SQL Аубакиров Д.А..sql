USE employees;

# 1. Вывод всех женщин, у которых emp_no заканчивается на 7
SELECT * FROM employees
WHERE gender in ('F') AND emp_no LIKE '%7';

# 2. Вывод emp_no сотрудников, кто не работал в департаменте d005
SELECT emp_no, dept_no FROM dept_emp
WHERE dept_no != 'd005';

# 3. Вывод названий департаментов с буквами 'u' и 'o' в названии
SELECT dept_name FROM departments
WHERE dept_name LIKE '%u%' AND dept_name LIKE '%o%'; 

# 4. Вывод имен сотрудников, в которых есть либо 'z' либо 't'
SELECT * FROM employees
WHERE first_name LIKE '%z%' OR first_name LIKE '%t%';

# 5. Вывод всех фамилий сотрудников, которые были наняты на работу между '1993-01-15' и '1993-12-31'
SELECT last_name FROM employees
WHERE hire_date BETWEEN '1993-01-15' AND '1993-12-31';

# 6. Вывод всех сотрудниц с именем Kellie
SELECT * FROM employees
WHERE gender IN ('F') AND first_name IN ('Kellie');

# 7. Вывод всех сотрудниц с именем Kellie или Aruna
SELECT * FROM employees
WHERE gender IN ('F') AND first_name IN ('Kellie', 'Aruna');

# 8. Вывод всей информации из таблицы salaries с зарплатами между 66000 и 70000
SELECT * FROM salaries
WHERE salary BETWEEN 66000 AND 70000;
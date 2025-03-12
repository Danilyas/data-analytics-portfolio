USE employees;

# 1.Нахождение следующей должности каждого сотрудника:
#   - Цель: Определить, какая должность будет следующей для каждого сотрудника в ходе их карьеры.
#   - Таблицы для использования: titles (содержит информацию о должностях сотрудников).
#   - Колонки для отображения: Идентификатор сотрудника (emp_no), текущая должность (title), следующая должность (next_title).

SELECT emp_no, title, LEAD(title, 1, 0) OVER (PARTITION BY emp_no ORDER BY emp_no, from_date) AS next_title
FROM titles;

# 2. Определение начальной и последней зарплаты сотрудника:
#   - Цель: Узнать, какая была начальная и какая текущая зарплата у каждого сотрудника.
#   - Таблицы для использования: salaries (содержит информацию о зарплатах сотрудников).
#   - Колонки для отображения: Идентификатор сотрудника (emp_no), текущая зарплата (salary), начальная зарплата (first_salary), последняя зарплата (last_salary).

SELECT emp_no, salary, FIRST_VALUE(salary) OVER (PARTITION BY emp_no ORDER BY emp_no) AS first_salary, LAST_VALUE(salary) OVER (PARTITION BY emp_no ORDER BY emp_no) AS last_salary
FROM salaries;

# 3. - Цель: Вычислить скользящее среднее зарплаты для каждого сотрудника, основываясь на его последних трех зарплатах.
# - Таблицы для использования: salaries: содержит информацию о зарплатах сотрудников, включая emp_no (идентификатор сотрудника), salary (зарплата), и from_date (дата начала действия зарплаты).
# - Колонки для отображения: emp_no (идентификатор сотрудника), from_date (дата начала действия зарплаты), salary (зарплата), moving_avg_salary (скользящее среднее зарплаты, рассчитанное на основе последних трех зарплат).

SELECT emp_no, from_date, salary, ROUND(AVG(salary) OVER (PARTITION BY emp_no ORDER BY salary ROWS BETWEEN 2 PRECEDING AND 0 FOLLOWING)) AS moving_avg_salary
FROM salaries;

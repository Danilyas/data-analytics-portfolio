USE employees;

SELECT *
FROM employees
WHERE hire_date > '2000-01-01';

CREATE INDEX i_hire_date
ON employees(hire_date);

SELECT *
FROM employees
WHERE first_name = 'Georgi' AND last_name = 'Facello';

CREATE INDEX i_name
ON employees(first_name, birth_date);

ALTER TABLE employees DROP INDEX i_hire_date;
ALTER TABLE employees DROP INDEX i_name_birth;
USE employees;

# 1.  Создать процедуру, в которой мы получаем на вход два параметра p_salary, p_dept и на выходе получим:
# - Список сотрудников (emp_no, first_name, gender), у которых средняя зарплата больше
# p_salary и которые когда-то работали в департаменте p_dept.

DELIMITER $$

DROP PROCEDURE IF EXISTS GetEmployeesBySalaryAndDept $$
CREATE PROCEDURE GetEmployeesBySalaryAndDept(IN p_salary DECIMAL(10, 2), IN p_dept VARCHAR(4))
BEGIN
    SELECT a.emp_no, a.first_name, a.gender
    FROM employees a
    JOIN salaries b ON a.emp_no = b.emp_no
    JOIN dept_emp c ON a.emp_no = c.emp_no
    WHERE c.dept_no = p_dept
    GROUP BY a.emp_no
    HAVING AVG(b.salary) > p_salary;
END $$

DELIMITER ;

CALL GetEmployeesBySalaryAndDept(40000, 'd005');

# 2. Создать функцию, которая получает на вход f_name
# и выдает максимальную зарплату среди сотрудников с именем f_name.

DELIMITER $$

DROP FUNCTION IF EXISTS GetMaxSalaryByFirstName $$
CREATE FUNCTION GetMaxSalaryByFirstName(f_name VARCHAR(100))
RETURNS DECIMAL(10, 2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE max_salary DECIMAL(10, 2);

    SELECT MAX(s.salary)
    INTO max_salary
    FROM employees e
    JOIN salaries s ON e.emp_no = s.emp_no
    WHERE e.first_name = f_name;

    RETURN max_salary;
END $$

DELIMITER ;

SELECT GetMaxSalaryByFirstName('Alain');


USE world;

# 3.1 Посчитайте количество городов в каждой стране, где IndepYear = 1991 (Independence Year).

SELECT c.CountryCode, COUNT(*) AS CityCount
FROM city AS c
JOIN country AS co ON c.CountryCode = co.Code
WHERE co.IndepYear = 1991
GROUP BY c.CountryCode;

# 3.2 Узнайте, какая численность населения и средняя продолжительность жизни людей в Аргентине (ARG).

SELECT Population, LifeExpectancy
FROM country
WHERE Code = 'ARG';

# 3.3 В какой стране самая высокая продолжительность жизни?

SELECT Name, LifeExpectancy
FROM country
ORDER BY LifeExpectancy DESC
LIMIT 1;

# 3.4 Перечислите все языки, на которых говорят в регионе «Southeast Asia».

SELECT Language
FROM countrylanguage a
JOIN country b ON b.Code = a.CountryCode
WHERE b.Region = 'Southeast Asia';

# 3.5 Посчитайте сумму SurfaceArea для каждого континента.

SELECT continent, ROUND(SUM(SurfaceArea)) AS TotalSurfaceArea
FROM country
GROUP BY continent;
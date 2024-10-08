CREATE DATABASE window_function;
USE window_function;
CREATE TABLE employees (
    emp_no INT PRIMARY KEY AUTO_INCREMENT,
    department VARCHAR(20),
    salary INT
);
 
INSERT INTO employees (department, salary) VALUES
('engineering', 80000),('engineering', 69000),('engineering', 70000),('engineering', 103000),
('engineering', 67000),('engineering', 89000),('engineering', 91000),('sales', 59000),
('sales', 70000),('sales', 159000),('sales', 72000),('sales', 60000),('sales', 61000),('sales', 61000),
('customer service', 38000),('customer service', 45000),('customer service', 61000),('customer service', 40000),
('customer service', 31000),('customer service', 56000),('customer service', 55000);
SELECT*FROM employees;


-- Using Over Clause
SELECT emp_no, department, salary, AVG(salary) OVER() FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(),
    MAX(salary) OVER()
FROM employees;


-- Using partition By
SELECT 
    emp_no, 
    department, 
    salary, 
    AVG(salary) OVER(PARTITION BY department) AS dept_avg,
    AVG(salary) OVER() AS company_avg
FROM employees;

SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department) AS dept_payroll,
    SUM(salary) OVER() AS total_payroll
FROM employees;


-- Using Order By to get rolling calculations
SELECT 
    emp_no, 
    department, 
    salary, 
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS rolling_dept_salary,
    SUM(salary) OVER(PARTITION BY department) AS total_dept_salary
FROM employees;
 
SELECT 
    emp_no, 
    department, 
    salary, 
    MIN(salary) OVER(PARTITION BY department ORDER BY salary DESC) as rolling_min
FROM employees;
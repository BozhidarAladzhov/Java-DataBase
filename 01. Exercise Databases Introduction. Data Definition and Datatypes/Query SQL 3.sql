CREATE DATABASE soft_uni;

USE soft_uni;

CREATE TABLE towns (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL
);



CREATE TABLE addresses (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    address_text VARCHAR (255) NOT NULL,
    town_id INT,
    FOREIGN KEY (town_id) REFERENCES towns(id)
);



CREATE TABLE departments (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR (50) NOT NULL
);




CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR (50) NOT NULL,
    middle_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    job_title VARCHAR (50) NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(id),
    hire_date DATE NOT NULL, 
    salary DOUBLE (6,2) NOT NULL,
    address_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES addresses(id)
);

INSERT INTO towns (name)
VALUES ("Sofia"), ("Plovdiv"), ("Varna"), ("Burgas");

INSERT INTO addresses (address_text, town_id)
VALUES ("TEST_PLOVDIV1", 2), ("TEST_SOFIA", 1), ("TEST_BURGAS", 4), ("TEST_VARNA", 3),("TEST_PLOVDIV2", 2); 

INSERT INTO departments (name)
VALUES ("Engineering"),("Sales"),("Marketing"),("Software Development"),("Quality Assurance");

INSERT INTO employees (first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id)
VALUES ("Ivan", "Ivanov", "Ivanov", ".NET Developer", 4, "2013-02-01", 3500.00, 1),
		("Petar", "Petrov", "Petrov", "Senior Engineer", 1, "2004-03-02", 4000.00, 2),
        ("Maria", "Petrova", "Ivanova", "Intern", 5, "2016-08-28", 525.25, 3),
        ("Georgi", "Terziev", "Ivanov", "CEO", 2, "2007-12-09", 3000.00, 4),
        ("Peter", "Pan", "Pan", "Intern", 3, "2016-08-28", 599.88, 5);
        
        
SELECT * FROM towns;
SELECT * FROM departments;
SELECT * FROM employees;


SELECT name FROM towns
ORDER BY name;

SELECT name FROM departments
ORDER BY name;

SELECT first_name, last_name, job_title, salary FROM employees
ORDER BY salary DESC;

UPDATE employees 
SET salary = salary * 1.10
WHERE id > 0;


SELECT salary
FROM employees;

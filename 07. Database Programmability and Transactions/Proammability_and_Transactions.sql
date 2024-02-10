USE soft_uni_transactions ;

DELIMITER $
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(20)) 
RETURNS INT
DETERMINISTIC
BEGIN
	
    DECLARE e_count INT;
    SET e_count := (SELECT COUNT(employee_id) FROM employees AS e
					JOIN addresses AS a 
                    ON a.address_id = e.address_id
                    JOIN towns AS t 
                    ON t.town_id = a.town_id
                    WHERE t.name = town_name);
	RETURN e_count;
    
END
DELIMITER ;


DELIMITER $
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR (50)) 
BEGIN
	UPDATE employees AS e
    JOIN departments AS d
    ON e.department_id = d.department_id
    SET salary = salary * 1.05
    WHERE d.name = department_name;
END $
DELIMITER ;



DELIMITER $
CREATE PROCEDURE usp_raise_salary_by_id(id INT)
BEGIN
	START TRANSACTION;
    IF((SELECT COUNT(*) FROM employees WHERE employee_id = id) <> 1)
		THEN ROLLBACK;
	ELSE
		UPDATE employees
		SET salary = salary * 1.05
		WHERE employee_id = id;
	END IF ;
END $
DELIMITER ;


CREATE TABLE deleted_employees(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (50),
    last_name VARCHAR (20),
    middle_name VARCHAR (20),
    job_title VARCHAR (20),
    department_id INT,
    salary DOUBLE
);

CREATE TRIGGER delete_employees_trigger
AFTER DELETE
ON employees
FOR EACH ROW 
	INSERT INTO deleted_employees(first_name, last_name, middle_name, job_title, department_id, salary)
    VALUES (old.first_name, old.last_name, old.middle_name, old.job_title, old.department_id, old.salary);


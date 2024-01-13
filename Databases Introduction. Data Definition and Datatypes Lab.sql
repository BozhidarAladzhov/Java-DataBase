CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL    
);

CREATE TABLE categories (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    category_id INT NOT NULL
);

INSERT INTO employees (first_name, last_name) 
VALUES ("Bozhidar", "Aladzhov"),
		("Gergana" , "Aladzhova"),
        ("Peter", "Aladzhov");

SELECT * FROM employees;

ALTER TABLE employees
ADD COLUMN middle_name VARCHAR(50);


ALTER TABLE employees
MODIFY COLUMN middle_name VARCHAR (100);



ALTER TABLE gamebar.products 
ADD INDEX fk_category_id_idx (category_id ASC) VISIBLE;
;
ALTER TABLE gamebar.products 
ADD CONSTRAINT fk_category_id
  FOREIGN KEY (category_id)
  REFERENCES gamebar.categories(id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

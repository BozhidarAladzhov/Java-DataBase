CREATE DATABASE car_rental;

USE car_rental;

CREATE TABLE `categories` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`category` VARCHAR (50) NOT NULL,
    `daily_rate` DOUBLE (6,2),
    `weekly_rate` DOUBLE (6,2),
    `monthly_rate` DOUBLE (6,2),
    `weekend_rate` DOUBLE (6,2)
);

INSERT INTO categories (category, daily_rate, weekly_rate, monthly_rate,weekend_rate)
VALUES ('Sedan', 50.0, 569.0, 1500.00, 150.0),
		('SUV', 100.0, 879.0, 3000.00, 250.0),
        ('PICK UP', 150.0, 678.00, 4500.00, 400.0);
        
CREATE TABLE `cars` (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    plate_number VARCHAR (25) NOT NULL UNIQUE,
    make VARCHAR (50) NOT NULL,
    model VARCHAR (50) NOT NULL,
    car_year INT (4) NOT NULL,
    category_id INT NOT NULL,
    doors INT,
    picture BLOB,
    car_condition VARCHAR (255) NOT NULL,
    available BOOL
);


INSERT INTO cars (plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)
VALUES ('CB1022PB' , 'Acura', 'RL', 2005, 1, 5, 'TEST', 'good', true),
		('CB1023PB' , 'BMW', '428', 2015, 1, 5, 'TEST', 'perfect', true),
        ('CB1024PB' , 'Audi', 'A5', 2010, 1, 5, 'TEST', 'bad', false);
        
 CREATE TABLE employees (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    first_name VARCHAR (50) NOT NULL,
    last_name VARCHAR (50) NOT NULL,
    title VARCHAR (50) NOT NULL,
    notes VARCHAR (255)
 );
 
 INSERT INTO employees (first_name, last_name, title, notes)
 VALUES ('test_efn1' , 'test_eln1', 'seller', 'test_em_notes1' ),
		('test_efn2' , 'test_eln2', 'manager', 'test_em_notes2' ),
        ('test_efn3' , 'test_eln3', 'provider', 'test_em_notes3' );
        
        
CREATE TABLE customers (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    driver_licence_number INT NOT NULL UNIQUE,
    full_name VARCHAR (255) NOT NULL,
    address VARCHAR (255) NOT NULL,
    city VARCHAR (50) NOT NULL,
    zip_code VARCHAR (50) NOT NULL,
    notes TEXT
);

INSERT INTO customers (driver_licence_number, full_name, address, city, zip_code, notes)
VALUES ( 11111111 , "TEST_FULL_NAME_1" , "TEST_ADDRESS_1", "TEST_CITY_1" , "TEST_ZIP_CODE_1", "TEST_NOTES_1" ),
		(22222222 , "TEST_FULL_NAME_2" , "TEST_ADDRESS_2", "TEST_CITY_2" , "TEST_ZIP_CODE_2", "TEST_NOTES_2" ),
        (33333333 , "TEST_FULL_NAME_3" , "TEST_ADDRESS_3", "TEST_CITY_3" , "TEST_ZIP_CODE_3", "TEST_NOTES_3" );
        
        
CREATE TABLE rental_orders (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    employee_id INT NOT NULL,
    customer_id INT NOT NULL,
    car_id INT NOT NULL,
    car_condition VARCHAR (255) NOT NULL,
    tank_level VARCHAR (50) NOT NULL,
    kilometrage_start INT ,
    kilometrage_end INT,
    total_kilometrage INT NOT NULL,
    start_date DATE,
    end_date DATE,
    total_days INT ,
    rate_applied DOUBLE (6,2),
    tax_rate DOUBLE (6,2),
    order_status VARCHAR (50) ,
    notes TEXT
);

INSERT INTO rental_orders (employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)
VALUES (1, 1, 1, "TEST_CONDITION_1" , "TANK_LEVEL_1", 111111, 111111, 11111111, '2024-05-05', '2024-06-05', 1, 200.0, 20, "COMPLETED", "TEST_NOTE"),
		(2, 2, 2, "TEST_CONDITION_2" , "TANK_LEVEL_2", 222222, 222222, 22222222 , '2024-05-05', '2024-06-05', 1, 200.0, 20, "COMPLETED", "TEST_NOTE"),
        (3, 3, 3, "TEST_CONDITION_3" , "TANK_LEVEL_3", 3333333, 3333333, 33333333, '2024-05-05', '2024-06-05', 1, 200.0, 20, "COMPLETED", "TEST_NOTE");

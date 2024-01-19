CREATE DATABASE minions


CREATE TABLE minions (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)
);

ALTER TABLE minions ADD COLUMN age INT;

CREATE TABLE towns (
	town_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (50)
);

ALTER TABLE minions 
ADD COLUMN town_id INT;

ALTER TABLE minions
ADD CONSTRAINT fk_town_id FOREIGN KEY (town_id) REFERENCES towns(id);


INSERT INTO towns (id, name)
VALUES (1,"Sofia"),
		(2,"Plovdiv"),
		(3,"Varna");

INSERT INTO minions (id, name, age, town_id)
VALUES (1,"Kevin", 22,1),
		(2,"Bob", 15,3),
        (3,"Steward", NULL, 2);
        
TRUNCATE TABLE minions;

DROP TABLE minions;
DROP TABLE towns;
        
SELECT * FROM towns;
SELECT * FROM minions;

CREATE TABLE people (
	id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (200) NOT NULL,
    picture TEXT,
    height DOUBLE(6,2),
    weight DOUBLE (6,2),
    gender CHAR (1) NOT NULL,
    birthdate DATE NOT NULL,
    biography BLOB    
);

INSERT INTO people (name, picture, height, weight, gender, birthdate, biography)
VALUES
("Ivan", "test", 1.89, 95.5, 'm',"1976-05-04", "test"),
("Gosho", "test", 1.89, 95.5, 'm',"1976-05-04", "test"),
("Petio", "test", 1.89, 95.5, 'm',"1976-05-04", "test"),
("Maria", "test", 1.89, 95.5, 'f',"1976-05-04", "test"),
("Petio", "test", 1.89, 95.5, 'm',"1976-05-04", "test");
        
CREATE TABLE users (
	id INT UNIQUE PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR  (30) UNIQUE NOT NULL,
    password VARCHAR (26) NOT NULL,
    profile_picture BLOB,
    last_login_time DATETIME,
    is_deleted BOOL
);

INSERT INTO users (username, password, profile_picture, last_login_time, is_deleted)
VALUES ("Peshno", "123", "test", NOW(), false),
		("Petia", "123", "test", NOW(), true),
		("Ivan", "123", "test", NOW(), false),
		("Nikol", "123", "test", NOW(), false),
		("Tsuro", "123", "test", NOW(), false);
        
        
ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(id, username);


ALTER TABLE users
CHANGE last_login_time last_login_time DATETIME DEFAULT NOW();


ALTER TABLE users
DROP PRIMARY KEY,
ADD PRIMARY KEY(id),
ADD CONSTRAINT uc_username UNIQUE (username);

CREATE DATABASE movies;

USE movies;

CREATE TABLE directors (
	id INT PRIMARY KEY AUTO_INCREMENT,
    director_name VARCHAR (50) NOT NULL,
    notes TEXT
);

CREATE TABLE genres (
	id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50) NOT NULL,
    notes TEXT
);

CREATE TABLE categories (
	id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR (50) NOT NULL,
    notes TEXT
);

CREATE TABLE movies (
	id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR (50) NOT NULL,
    copyright_year DATE,
    length INT,
    genre_id INT,
    category_id INT,
    rating INT,
    notes TEXT
);

INSERT INTO directors (director_name, notes)
VALUES ('Dimitar Petrov' , 'test1'),
		("Ivan Ivanov", "test2"),
        ("Ivan Spasov", "test3"),
		("Ivan Yanakiev", "test4"),
		("Ivan Karamfilov", "test5");
        
        
INSERT INTO genres (genre_name, notes)
VALUES ('Dimitar Petrov' , 'test1'),
		("Ivan Ivanov", "test2"),
        ("Ivan Spasov", "test3"),
		("Ivan Yanakiev", "test4"),
		("Ivan Karamfilov", "test5");
        
INSERT INTO categories (category_name, notes)
VALUES ('Dimitar Petrov' , 'test1'),
		("Ivan Ivanov", "test2"),
        ("Ivan Spasov", "test3"),
		("Ivan Yanakiev", "test4"),
		("Ivan Karamfilov", "test5");
        
INSERT INTO movies (title, director_id, copyrigth_year, length, genre_id, category_id, rating, notes)
VALUES ('Pirates of the Carribean' , '1', NOW(), '2', '1', '1','1', 'test'),
		('Rokie ' , '2', NOW(), '2', '1', '1','1', 'test'),
        ('Fast and Furious' , '3', NOW(), '2', '1', '1','1', 'test'),
        ('Expendables' , '4', NOW(), '2', '1', '1','1', 'test'),
        ('Frozen' , '5', NOW(), '2', '1', '1','1', 'test');

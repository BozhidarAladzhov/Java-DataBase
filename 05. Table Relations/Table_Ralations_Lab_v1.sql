CREATE DATABASE mountains_and_peaks;

USE mountains_and_peaks;

CREATE TABLE mountains ( 
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
    name VARCHAR (50) NOT NULL
);

CREATE TABLE peaks (
	id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    name VARCHAR(50) NOT NULL,
    mountain_id INT NOT NULL,
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (mountain_id)
    REFERENCES mountains(id)
);

INSERT INTO mountains(name) VALUES ("Rila"), ("Pirin"), ("VITOSHA");

INSERT INTO peaks(name, mountain_id) VALUES ("Vihren", 3), ("Musala", 1), ("Ostrec", 2);

ALTER TABLE peaks 
DROP CONSTRAINT peaks_ibfk_1;

DROP TABLE mountains;
DROP TABLE peaks;
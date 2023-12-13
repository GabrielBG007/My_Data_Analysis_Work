
CREATE TABLE cats(
    name VARCHAR (50),
    age INT
);

INSERT INTO cats(name,age)
VALUES ("Blue",1); 

INSERT INTO cats(name,age)
VALUES ("Draco", 11);

SELECT * FROM cats;

INSERT INTO cats  (name, age)
VALUES ("Peanut", 2),
("Butter",4),
("Jelly",7);

SELECT * FROM cats;

CREATE TABLE people(
    first_name VARCHAR (20),
    last_name VARCHAR (20),
    age INT
);

INSERT INTO people (first_name, last_name, age)
VALUES ("Linda", "Belcher",45),
("Philip", "Frond", 38),
("Calvin", "Fischoeder", 70);

DESC cats;


INSERT INTO cats (name)
VALUES ("Alabama");

SELECT * FROM cats;

CREATE TABLE cats2 (
    name VARCHAR (100) NOT NULL,
    age INT NOT NULL
);

DESC cats;

INSERT INTO cats2 (name)
VALUES ("Texas");

CREATE TABLE cats3 (
    name VARCHAR (20) DEFAULT "no name provided",
    age INT DEFAULT 99
);

INSERT INTO cats3 (age) VALUES(13);

SELECT*FROM cats3;

INSERT INTO cats (name, age) 
VALUES ("Helena", 6),
("Helena", 6),
("Helena", 6),
("Helena", 6),
("Helena", 6),
("Helena", 6);

SELECT * FROM cats;

CREATE TABLE unique_cats (
    cat_id INT NOT NULL,
    name VARCHAR (100),
    age INT,
    PRIMARY KEY (cat_id)
);

DESC unique_cats;

INSERT INTO unique_cats (cat_id, name, age) VALUES (1,"James", 3);

SELECT * FROM unique_cats;

CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR (100),
    age INT,
    PRIMARY KEY (cat_id)
);


INSERT INTO unique_cats2 (name,age)
VALUES ("Jiff", 3);

SELECT * FROM unique_cats2;


CREATE TABLE Employees (
    id INT NOT NULL AUTO_INCREMENT,
    last_name VARCHAR (50) NOT NULL,
    first_name VARCHAR (50) NOT NULL,
    middle_name VARCHAR (50),
    age INT NOT NULL,
    current_status VARCHAR (50) NOT NULL DEFAULT "employed",
    PRIMARY KEY (id)
);

INSERT INTO Employees (last_name, first_name, middle_name, age)
VALUES ("García", "Nicolás", "Bernabé", 22);


SELECT * FROM Employees;

DROP TABLE Employees;


DROP TABLE cats;

CREATE TABLE cats (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(100),
    breed VARCHAR(100),
    age INT,
    PRIMARY KEY (cat_id)
);


INSERT INTO cats (name, breed, age)
VALUES ("Ringo", "Tabby", 4),
("Cindy","Maine Coon", 10),
("Dumbledore", "Maine Coon", 11),
("Egg", "Persian", 4),
("Misty", "Tabby", 13),
("George Michael", "Ragdoll", 9),
("Jackson", "Sphynx", 7);

SELECT * FROM cats;

SELECT name, age FROM cats;

SELECT * FROM cats 
WHERE  name = "Egg";

SELECT cat_id, age FROM cats
WHERE cat_id = age;

SELECT cat_id as id , name FROM cats;

SELECT name AS "cat name", breed FROM cats;

UPDATE cats
SET breed="Shorthair"
WHERE breed="Tabby";

SELECT * FROM cats;

UPDATE cats
SET age=14 
WHERE name= "Misty";

SELECT name FROM cats 
WHERE name = "Jackson";

UPDATE cats
SET name="Jack"
WHERE name="Jackson";

UPDATE cats
SET breed= "British Shorthair"
WHERE name= "Ringo";

UPDATE cats
SET age=12
WHERE breed = "Maine Coon";

DELETE FROM cats WHERE name = "Egg";

DELETE FROM cats
WHERE age=4;

DELETE FROM cats
WHERE cat_id=age;

DELETE FROM cats;


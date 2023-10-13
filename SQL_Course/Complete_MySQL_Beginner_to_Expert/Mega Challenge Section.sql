
CREATE TABLE shirts (
    shirt_id INT NOT NULL AUTO_INCREMENT,
    article VARCHAR (100),
    color VARCHAR (100),
    shirt_size VARCHAR (100),
    last_worn VARCHAR (100),
    PRIMARY KEY (shirt_id)
);

INSERT INTO shirts (article,color,shirt_size,last_worn)
VALUES 
('t-shirt', 'white', 'S', 10),
  ('t-shirt', 'green', 'S', 200),
  ('polo shirt', 'black', 'M', 10),
  ('tank top', 'blue', 'S', 50),
  ('t-shirt', 'pink', 'S', 0),
  ('polo shirt', 'red', 'M', 5),
  ('tank top', 'white', 'S', 200),
  ('tank top', 'blue', 'M', 15);

INSERT INTO shirts (article, color, shirt_size, last_worn)
VALUES ("polo shirt", "purple", "M", 50);

SELECT article, color, shirt_size, last_worn FROM shirts
WHERE shirt_size= "M";

UPDATE shirts
SET shirt_size = "L"
WHERE article = "polo shirt";

SELECT * FROM shirts;

UPDATE shirts
SET last_worn = 0
WHERE last_worn = 15;

UPDATE shirts 
SET shirt_size = "XS", color = "off white"
WHERE color = "white";

DELETE FROM shirts
WHERE last_worn = 200;

DELETE FROM shirts
WHERE article = "tank top";

DELETE FROM shirts;

DROP TABLE shirts;

# BOOK DATABASE

CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);

SELECT * FROM books;

SELECT author_fname, author_lname FROM books;

SELECT CONCAT("Hello", " ", "World", ".");

SELECT CONCAT (author_fname, " ", author_lname) AS "fullname" FROM books;

SELECT author_fname AS first, author_lname AS last,
CONCAT (author_fname, ",", author_lname) AS full 
FROM books;

SELECT CONCAT_WS (" - ", title, author_fname, author_lname) AS "Example"
FROM books;

SELECT SUBSTRING ("Hello World", 1,4);

SELECT SUBSTRING ("Hello World", -3);

SELECT SUBSTRING (title, 1,10) AS "short title" FROM books; 

SELECT CONCAT(
SUBSTRING (title, 1,10), "...") AS "short title" FROM books;

SELECT REPLACE ("Hello World", "l", "7");

SELECT REPLACE ("Hola me llamo Gabriel", " ", " and ");

SELECT REPLACE (title, "e", "3") AS "3" FROM books;

SELECT SUBSTRING (
  REPLACE (title, "e", "3"),1,10
) AS "Hello" FROM books;

SELECT REVERSE ("Hola") FROM books;

SELECT REVERSE (title) FROM books;

SELECT CONCAT (title," ",CHAR_LENGTH(title)) AS "Gabriel" FROM books;

SELECT CONCAT (author_lname, " is ", CHAR_LENGTH(author_lname), " characters long") FROM books;

SELECT UPPER ("Hello World");

SELECT LOWER (title) FROM books;

SELECT UPPER (REVERSE("Why does my cat look at me with such hatred?"));

SELECT REPLACE (CONCAT("I", " ", "like", " ", "cats")," ", "_");

SELECT REPLACE (title, " ", "->") AS title FROM books;

SELECT author_lname AS "forwards", REVERSE (author_lname) AS "backwards"
FROM books;

SELECT CONCAT(UPPER(author_fname), " ", UPPER(author_lname)) AS "full name in caps" 
FROM books;

SELECT * FROM books;

SELECT CONCAT (title, " was released in ", released_year) AS blurb
FROM books;

SELECT title, CHAR_LENGTH(title) AS "character count"
FROM books;

SELECT CONCAT(SUBSTRING(title, 1,10), "...") AS "short title",
CONCAT (author_lname, " , ", author_fname) AS "author",
CONCAT (stock_quantity, " in stock ") AS "quantity"
FROM books;

SELECT * FROM books;

INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
  VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
          ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
          ('Lincoln In The Bardo', 'George', 'Saunders', 2017, 1000, 367);

SELECT DISTINCT author_lname FROM books;

SELECT DISTINCT released_year FROM books;

SELECT DISTINCT (CONCAT(author_fname, " ", author_lname)) AS "fullname" 
FROM books;

SELECT DISTINCT author_fname, author_lname FROM books;

SELECT author_lname FROM books ORDER BY author_lname;

SELECT title FROM books ORDER BY title;

SELECT author_lname FROM books ORDER BY author_lname DESC;

SELECT released_year FROM books ORDER BY released_year;

SELECT released_year FROM books ORDER BY released_year DESC;

SELECT title, released_year, pages FROM books ORDER BY released_year;

SELECT title, pages FROM books ORDER BY released_year;

SELECT title, author_fname, author_lname FROM books ORDER BY 2;

SELECT DISTINCT author_fname, author_lname FROM books
ORDER BY author_lname, author_fname;

SELECT * FROM books LIMIT 3;

SELECT title, released_year FROM books 
ORDER BY released_year DESC LIMIT 5;

SELECT * FROM books 
LIMIT 10,1;

SELECT * FROM books
LIMIT 5, 1393904239048;

SELECT title, author_fname FROM books
WHERE author_fname LIKE "%da%";

SELECT title, author_fname FROM books
WHERE author_fname LIKE "da%";

SELECT title, author_fname FROM books
WHERE author_fname LIKE "%da";

SELECT stock_quantity FROM books
WHERE stock_quantity LIKE ("____");

SELECT stock_quantity FROM books
WHERE stock_quantity LIKE ("__");

SELECT title FROM books
WHERE title LIKE "%\%%";

SELECT title FROM books
WHERE title LIKE "%\_%";

SELECT title FROM books
WHERE title LIKE "%stories%";

SELECT title, pages FROM books
ORDER BY pages DESC 
LIMIT 0,1;

SELECT CONCAT (title, " - ", released_year) AS "summary" FROM books
ORDER BY released_year DESC 
LIMIT 0,3;

SELECT title, author_lname FROM books
WHERE author_lname LIKE "% %";

SELECT title, released_year, stock_quantity FROM books
ORDER BY stock_quantity, released_year DESC 
LIMIT 0,3;

SELECT title, author_lname FROM books
ORDER BY author_lname, title;

SELECT CONCAT (" MY FAVORITE AUTHOR IS ", UPPER(author_fname), " ", UPPER(author_lname), " ! " ) AS "yell" FROM books
ORDER BY author_lname;

# Aggregate functions

SELECT COUNT(*) FROM books;

SELECT COUNT (author_fname) FROM books;

SELECT COUNT (DISTINCT author_fname) FROM books;

SELECT COUNT (DISTINCT author_fname, author_lname) FROM books;

SELECT COUNT(title) FROM books
WHERE title LIKE "%the%";

SELECT author_fname,author_lname, COUNT(*) FROM books
GROUP BY author_fname,author_lname;

SELECT CONCAT ("In ", released_year," ",COUNT(*), " book(s) released ") AS "Year" FROM books
GROUP BY released_year 
ORDER BY released_year DESC;

SELECT DISTINCT author_fname, author_lname, MIN(released_year), COUNT(*) FROM books
GROUP BY author_fname, author_lname;

SELECT title, pages FROM books
ORDER BY pages DESC 
LIMIT 0,1;

SELECT * FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT DISTINCT author_fname, author_lname , MIN(released_year) AS "First Publishing" FROM books
GROUP BY author_fname, author_lname;

SELECT DISTINCT author_fname, author_lname , MAX(pages) AS "First Publishing" FROM books
GROUP BY author_fname, author_lname;

SELECT SUM (pages) FROM books;

SELECT CONCAT (author_fname, " ", author_lname) AS "Author", SUM(pages) FROM books
WHERE pages >= (SELECT AVG(pages) FROM books)
GROUP BY Author;

SELECT released_year,AVG (stock_quantity) 
FROM books
GROUP BY released_year;

# Exercises

SELECT COUNT (*) AS " Number of books " FROM books;

SELECT released_year ,COUNT (*) AS " Number of books " FROM books
GROUP BY released_year;

SELECT title, SUM(stock_quantity) FROM books
GROUP BY title;

SELECT CONCAT (author_fname, " ", author_lname) AS "Author", AVG(released_year) FROM books
GROUP BY Author;

SELECT CONCAT (author_fname, " ", author_lname)  AS "Author", pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books); 

SELECT released_year AS "year", COUNT(*) AS "# books", AVG (pages) AS "avg pages" FROM books
GROUP BY released_year
ORDER BY released_year ASC;

 # New DATA TYPES

  -- TEXT

  CREATE TABLE dogs(
      name CHAR (5),
      breed VARCHAR (10)
  );

  INSERT INTO dogs(name, breed)
  VALUES ("bob", "beagle"),
         ("robby", "corgi"),
         ("Princess Jane", "Retriever");

-- NUMBERS

CREATE TABLE items(
    price DECIMAL (5,2)
);

INSERT INTO items (price)
VALUES (7);
      
INSERT INTO items (price)
VALUES (28732983720);

INSERT INTO items (price)
VALUES (34.88);

INSERT INTO items (price)
VALUES (298.9999);

INSERT INTO items (price)
VALUES (1.9999);

SELECT * FROM items;

CREATE TABLE thingies (
    price FLOAT
);

INSERT INTO thingies (price)
VALUES (88.45);

INSERT INTO thingies (price)
VALUES (8877.45);

INSERT INTO thingies (price)
VALUES (8844556456.45);

SELECT * FROM thingies;

-- DATE AND TIMES

CREATE TABLE people(
    name VARCHAR (100),
    birthdate DATE,
    birthtime TIME,
    birthdt DATETIME
);

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ("Padma", "1983-11-11", "10:07:35","1983-11-11 10:07:35" );

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ("Larry", "1943-12-25", "04:10:42","1943-12-25 04:10:42" );

INSERT INTO people(name, birthdate, birthtime, birthdt)
VALUES ("Toaster", "2017-04-21", "19:12:43","2017-04-21 19:12:43" );

SELECT * FROM people;

# Workin with DATES

SELECT CURDATE();

SELECT CURTIME();

SELECT NOW();

INSERT INTO people (name,birthdate, birthtime, birthdt)
VALUES ("Microwave", CURDATE(), CURTIME(), NOW());

SELECT * FROM people;

DELETE FROM people WHERE name = "Microwave";

-- Formatting DATES

SELECT name, birthdate,DAY(birthdate) FROM people;

SELECT name, birthdate,DAYNAME(birthdate) FROM people;

SELECT name, birthdate,DAYOFWEEK(birthdate) FROM people;

SELECT name, birthdate,DAYOFYEAR(birthdate) FROM people;

SELECT name, birthdate,DAYOFYEAR(birthdate) FROM people;

SELECT name, birthdt,DAYOFYEAR(birthdt) FROM people;

SELECT name, birthdt,MONTH(birthdt) FROM people;

SELECT name, birthdt,MONTHNAME(birthdt) FROM people;

SELECT name, birthtime,HOUR(birthtime) FROM people;

SELECT DATE_FORMAT (NOW(), "%W %M of %Y");

SELECT DATE_FORMAT (birthdt,"Was Born On A %W") FROM people;

SELECT DATE_FORMAT (birthdt,"%m/%d/%Y") FROM people;

SELECT DATE_FORMAT (birthdt,"%m/%d/%Y at %h:%m") FROM people;

-- DATE MATH

SELECT * FROM people;

SELECT name, birthdate, DATEDIFF (NOW(), birthdate) FROM people;

SELECT birthdt, DATE_ADD (birthdt, INTERVAL 1 MONTH) FROM people;

SELECT birthdt, birthdt + INTERVAL 2 YEAR + INTERVAL 2 SECOND FROM people;


-- TIMESTAMP

CREATE TABLE comments(
    content VARCHAR (100),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO comments (content) 
VALUES ("lol what a funny article"),
("I found this offensive");

SELECT * FROM comments;

CREATE TABLE comments2 (
    content VARCHAR (100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO comments2 (content)
VALUES ("I LIKE CATS AND DOGS");

SELECT * FROM comments2;

UPDATE comments2
SET content = "jsdldvnoif"
WHERE content = "I LIKE CATS AND DOGS";


-- EXERCISES

CREATE TABLE inventory (
    item_name VARCHAR (100),  
    price DECIMAL (8,2),
    quantity INT 
);
SELECT NOW()

SELECT CURDATE()

SELECT DATE_FORMAT(CURDATE(),"%W")

SELECT DATE_FORMAT(NOW(), "%m/%d/%Y")

SELECT DATE_FORMAT(NOW(), "%M %D at %H:%i")


CREATE TABLE tweets (
    Content VARCHAR(140),
    Username VARCHAR(100) UNIQUE,
    Creation_Time TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE tweets;

-- LOGICAL OPERATORS

SELECT title, released_year FROM books WHERE released_year != 2017;

SELECT title FROM books WHERE title NOT LIKE "W%";

SELECT * FROM books 
WHERE released_year > 2000;

SELECT * FROM books 
WHERE released_year >= 2000;

SELECT 99 > 1;

SELECT 99 > 500;

SELECT "A" > "a";

SELECT "a" > "b";

SELECT "A" = "a";

SELECT * FROM books 
WHERE released_year < 2000;

SELECT * FROM books 
WHERE released_year <= 2000;

SELECT * FROM books 
WHERE author_lname="Eggers" AND 
released_year > 2010;

SELECT * FROM books 
WHERE author_lname="Eggers" && 
released_year > 2010;

SELECT 1 < 5 && 100 > 200; -- Both sides have to be true

SELECT * FROM books 
WHERE author_lname = "Eggers" AND
released_year > 2010 AND 
title LIKE "%novel%";

SELECT * FROM books 
WHERE author_lname="Eggers" OR 
released_year > 2010;

SELECT * FROM books 
WHERE author_lname="Eggers" || 
released_year > 2010;

SELECT * FROM books 
WHERE author_lname = "Eggers" ||
released_year > 2010 || 
title LIKE "%novel%";

SELECT title, released_year FROM  books
WHERE released_year >= 2004 && 
released_year <= 2015;

SELECT title, released_year FROM  books
WHERE released_year BETWEEN 2004 AND 2015;

SELECT title, released_year FROM  books
WHERE released_year NOT BETWEEN 2004 AND 2015;

SELECT CAST ("2017-05-02" AS DATETIME);

SELECT name, birthdt FROM people 
WHERE birthdt BETWEEN "1980-01-01" AND "2000-01-01";

SELECT name, birthdt FROM people 
WHERE birthdt BETWEEN CAST ("1980-01-01" AS DATETIME) AND CAST ("2000-01-01" AS DATETIME);

SELECT title, author_lname FROM books
WHERE author_lname IN ("Carver", "Lahiri", "Smith");

SELECT title, released_year FROM books
WHERE released_year IN (1985,2017);

SELECT title, author_lname FROM books
WHERE author_lname NOT IN ("Carver", "Lahiri", "Smith");

SELECT title, released_year FROM books
WHERE released_year NOT IN (1985,2017);

SELECT title, released_year FROM books
WHERE released_year % 2 != 0; -- We only get ODD numbers, % stands for division and !=0 means that the remainder of that division cant be 0.

SELECT title, released_year,  
CASE WHEN released_year IN (2003,2013) 
THEN "JLSDJFLS"
ELSE "None" 
END AS GENRE
FROM books;

SELECT title, stock_quantity, 
CASE 
WHEN stock_quantity BETWEEN 0 AND 50 THEN "*"
WHEN stock_quantity BETWEEN 51 AND 100 THEN "**"
ELSE "***"
END AS STOCK 
FROM books;

SELECT title, stock_quantity, 
CASE WHEN stock_quantity <= 50 THEN "*"
WHEN stock_quantity <= 100 THEN "**"
ELSE "***"
END AS STOCK 
FROM books;

-- Exercises

SELECT * FROM books
WHERE released_year < 1980;

SELECT * FROM books
WHERE author_lname IN ("Eggers", "Chabon");

SELECT * FROM books 
WHERE author_lname = "Lahiri" AND 
released_year > 2000;

SELECT * FROM books
WHERE pages BETWEEN 100 AND 200;

SELECT * FROM books
WHERE author_lname LIKE "C%" OR author_lname LIKE "S%";

SELECT title, author_lname, 
CASE 
WHEN title LIKE "%stories%" THEN "Short Stories"
WHEN title LIKE "%Just Kids%" OR title LIKE "%A Heartbreaking Work%" THEN "Memoir"
ELSE "Novel"
END AS TYPE 
FROM books;

SELECT author_lname, 
CASE 
WHEN COUNT(*) = 1 THEN "1 book"
ELSE CONCAT(COUNT(*), " ", "books") END AS "COUNT"
FROM books
GROUP BY author_lname, author_fname; 


SELECT author_lname, COUNT(*) AS "COUNT", 
CASE 
WHEN COUNT(*) = 1 THEN "book"
ELSE "books" END AS "TYPE"
FROM books
GROUP BY author_lname, author_fname;


-- MULTIPLE TABLES

-- RELATIONSHIPS AND JOINS

-- 1:MANY (Example, Customers and Orders)

CREATE TABLE customers 
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100)
);

CREATE TABLE orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	order_date DATE,
	amount DECIMAL(8,2),
	customer_id INT,
	FOREIGN KEY(customer_id) REFERENCES customers(id)
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');
       
INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);

SELECT * FROM customers;
SELECT * FROM orders;

SELECT * FROM orders 
WHERE customer_id IN (
    SELECT id FROM customers
    WHERE first_name = "Boy" AND last_name= "George"
);

-- IMPLICIT INNER JOIN

SELECT * FROM customers,orders 
WHERE customers.id =orders.customer_id;


-- EXPLICIT INNER JOIN

SELECT * FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id 
WHERE customers.id= 2;

WITH sum_total AS (SELECT customer_id, SUM(amount) AS Total
FROM customers 
JOIN orders 
ON customers.id = orders.customer_id
GROUP BY orders.customer_id)
SELECT customer_id, first_name, last_name, Total
FROM sum_total
JOIN customers
ON sum_total.customer_id = customers.id 
WHERE sum_total.Total >= (
    SELECT AVG (sum_total.Total)
    FROM sum_total
);

-- LEFT JOIN

SELECT * FROM customers
LEFT JOIN orders
ON customers.id = orders.customer_id;

SELECT first_name, last_name, IFNULL(SUM(amount),0) AS total_spent
FROM customers
LEFT JOIN orders 
ON customers.id = orders.customer_id 
GROUP BY customers.id
ORDER BY total_spent LIMIT 0,2;

-- RIGHT JOIN

SELECT * FROM customers
RIGHT JOIN orders
ON customers.id = orders.customer_id;

-- ON DELETE CASCADE

-- EXAMPLE: FOREIGN KEY(customer_id) REFERENCES customers(id) ON DELETE CASCADE

-- EXERCISES

CREATE TABLE STUDENTS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (100) UNIQUE
); 

CREATE TABLE PAPERS (
    title VARCHAR (100),
    grade INT,
    student_id INT,
    FOREIGN KEY (student_id) REFERENCES STUDENTS(id) ON DELETE CASCADE
);

INSERT INTO students (first_name) 
VALUES ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) 
VALUES
	(1, 'My First Book Report', 60),
	(1, 'My Second Book Report', 75),
	(2, 'Russian Lit Through The Ages', 94),
	(2, 'De Montaigne and The Art of The Essay', 98),
	(4, 'Borges and Magical Realism', 89);

SELECT * FROM STUDENTS;
SELECT * FROM PAPERS;

SELECT first_name,title,grade 
FROM STUDENTS 
RIGHT JOIN PAPERS 
ON STUDENTS.id = PAPERS.student_id
ORDER BY grade DESC;

SELECT first_name,IFNULL(title, "MISSING"),IFNULL(grade,0) 
FROM STUDENTS 
LEFT JOIN PAPERS 
ON STUDENTS.id = PAPERS.student_id;

SELECT first_name, IFNULL(AVG(grade),0) AS average 
FROM STUDENTS 
LEFT JOIN PAPERS
ON STUDENTS.id = PAPERS.student_id
GROUP BY first_name
ORDER BY average DESC; 

SELECT first_name, IFNULL(AVG(grade),0) AS average, 
CASE 
WHEN AVG(grade) >=75 THEN "PASSING"
ELSE "FAILING" END AS passing_status 
FROM STUDENTS 
LEFT JOIN PAPERS
ON STUDENTS.id = PAPERS.student_id
GROUP BY first_name
ORDER BY average DESC; 

# MANY TO MANY RELATIONSHIPS

CREATE TABLE reviewers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100)
);

CREATE TABLE series (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year YEAR(4),
    genre VARCHAR(100)
);

CREATE TABLE reviews (
    id INT AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL (2,1),
    series_id INT,
    reviewer_id INT,
    FOREIGN KEY(series_id) REFERENCES series(id),
    FOREIGN KEY(reviewer_id) REFERENCES reviewers(id)
);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');


INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

SELECT * FROM series;


#Challenge 1

SELECT title,rating FROM series
JOIN reviews 
ON series.id = reviews.series_id;

#Challenge 2 AVG rating

SELECT title,AVG(rating) AS avg_rating FROM series
JOIN reviews
ON series.id = reviews.series_id
GROUP BY series.id
ORDER BY avg_rating;

#Challenge 3 

SELECT * FROM reviewers;
SELECT * FROM reviews;

SELECT first_name, last_name, rating FROM reviewers
JOIN reviews 
ON reviewers.id = reviews.reviewer_id;

#Challenge 4

SELECT title AS unreviewd_series FROM series
LEFT JOIN reviews 
ON series.id = reviews.series_id
WHERE rating IS NULL;

#Challenge 5

SELECT genre, ROUND(AVG(rating),2) FROM series
JOIN reviews 
ON series.id = reviews.series_id
GROUP BY genre 
ORDER BY AVG(rating);

#Challenge 6

SELECT  first_name, last_name, 
COUNT(rating), 
IFNULL(MIN(rating),0), 
IFNULL(MAX(rating),0),
ROUND(IFNULL(AVG(rating),0),2), 
CASE 
WHEN COUNT(rating) >= 10 THEN "POWER USER"
WHEN COUNT(rating) >=1 THEN "ACTIVE" 
ELSE "INACTIVE" END AS STATUS FROM reviewers
LEFT JOIN reviews
ON reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;

#Challenge 7 3 TABLES

SELECT  title, rating, CONCAT(first_name," ",last_name) AS reviewer FROM reviewers
JOIN reviews 
ON reviewers.id = reviews.reviewer_id
JOIN series 
ON series.id = reviews.series_id
ORDER BY title;











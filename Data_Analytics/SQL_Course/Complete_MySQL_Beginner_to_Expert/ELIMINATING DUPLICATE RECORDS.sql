
# ELIMINATING DUPLICATE RECORDS

CREATE TABLE cars (
    ID INT,
    MODEL VARCHAR (50),
    BRAND VARCHAR (40),
    COLOR VARCHAR (30),
    MAKE INT

);

SELECT *
FROM cars;

INSERT INTO cars VALUES (2,"EQS","Mercedes Benz","Black",2022),
                        (4,"Ioniq5","Hyundai","White",2021),
                        (6,"Ioniq5","Hyundai","Green",2021),
                        (1,"Model S","Tesla","Blue",2018),
                        (5,"Model S","Tesla","Silver",2018),
                        (3,"iX","BMW","Red",2022);
    

# First Scenario: Just a few columns are duplicated.
-- Eliminating duplicates
-- 1º Solution
DELETE FROM cars
WHERE ID IN(
SELECT * FROM(
SELECT max(ID)
FROM cars
GROUP BY MODEL,BRAND
HAVING COUNT(*) > 1)gabriel)
;

SELECT * FROM cars;



#  2º Solution. Using Self Join (Im gonna be joining the same table). It cant delete multiple duplicate records.
# We insert the eliminated rows

INSERT INTO cars VALUES 
  (5,"Model S","Tesla","Silver",2018),
  (6,"Ioniq5","Hyundai","Green",2021);



DELETE FROM cars
WHERE ID IN(
SELECT * FROM(
SELECT c2.ID 
FROM cars c1
JOIN cars c2 ON c1.model=c2.model AND c1.brand=c2.brand
WHERE c1.ID < c2.ID)Gabriel);


# 3º Solution Using Window Function. It cant delete multiple duplicate records.

INSERT INTO cars VALUES 
  (5,"Model S","Tesla","Silver",2018),
  (6,"Ioniq5","Hyundai","Green",2021);


DELETE FROM cars
WHERE ID IN(
SELECT ID 
FROM(
    SELECT *, row_number() over (partition by model,brand) as rn
    FROM cars
    ) gabriel
    WHERE gabriel.rn > 1)


    # 4º Solution. Using MIN function. It can delete multiple duplicate records.

    INSERT INTO cars VALUES 
  (1,"Model S","Tesla","Blue",2018),
  (4,"Ioniq5","Hyundai","White",2021);


  
  DELETE FROM cars
  WHERE ID NOT IN(
  SELECT * FROM(
  SELECT  min(ID)
  FROM cars
  GROUP BY MODEL,BRAND)gabriel)


# 5º Using a backup table. NOT IDEAL

CREATE TABLE cars_bkp
AS
SELECT * FROM cars
WHERE 1=2;

INSERT INTO cars_bkp
SELECT * FROM cars
WHERE ID IN(
    SELECT min(ID)
    FROM cars
    GROUP BY MODEL,BRAND
)

ALTER TABLE cars_bkp RENAME TO cars;
SELECT * FROM cars;

# 6º SOLUTION. Using a backup table without dropping the original table. Better way then the fifth one.

CREATE TABLE cars_bkp
AS
SELECT * FROM cars
WHERE 1=2;

INSERT INTO cars_bkp
SELECT * FROM cars
WHERE ID IN(
    SELECT min(ID)
    FROM cars
    GROUP BY MODEL,BRAND
)

TRUNCATE TABLE cars;
INSERT INTO cars
SELECT * 
FROM cars_bkp;

DROP TABLE cars_bkp;


# Second Scenario: ALL THE COLUMNS ARE DUPLICATED

SELECT *
FROM cars
ORDER BY MODEL,BRAND

# 1º SOLUTION: DELETE USING CTID. I cant use it here, in Microsoft



# 2º SOLUTION: By creating a temporary unique id column. This will work in Microsoft.

ALTER TABLE cars ADD row_num INT NOT NULL AUTO_INCREMENT PRIMARY KEY;

DELETE FROM cars
WHERE row_num NOT IN(
SELECT * FROM(
SELECT min(row_num)
FROM cars
GROUP BY MODEL,BRAND)gabriel);

ALTER TABLE cars DROP COLUMN row_num;


# 3º SOLUTION: By creating a backup table.

CREATE TABLE cars_bkp AS
SELECT DISTINCT *
FROM cars;

SELECT * 
FROM cars_bkp;

DROP TABLE cars

ALTER TABLE cars_bkp RENAME TO cars;


# 4º SOLUTION: By creating a backup table without dropping the original table.

CREATE TABLE cars_bkp AS
SELECT * FROM cars
WHERE 1=2;

INSERT INTO cars_bkp
SELECT DISTINCT * FROM cars

TRUNCATE TABLE cars;

INSERT INTO cars
SELECT * FROM cars_bkp;

DROP TABLE cars_bkp;

SELECT * FROM cars;
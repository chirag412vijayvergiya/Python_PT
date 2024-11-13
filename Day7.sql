CREATE DATABASE PT;
use PT;
CREATE TABLE emp(
eno int(3),
name char(10),
phone int(10),
salary int(7)
);
desc emp;
CREATE TABLE emp1 as SELECT * from emp;
desc emp1;
select * from emp;
drop table emp;
desc emp;
ALTER TABLE emp1 add(address varchar(10));
desc emp1;
ALTER TABLE emp1 modify column address char(10);
desc emp1;
insert into emp1 (eno, name, phone, salary, address) values (101, 'chirag', 34323232, 32324323, 'Pune');
insert into emp1 (eno, name, phone, salary, address) values (102, 'shyam', 343232332, 2332323, 'Mumbai');
select * from emp1;
TRUNCATE TABLE emp1;
select * from emp1;
insert into emp1 values (103, 'Sonu', 789898232, 24323, 'Jaipur');
INSERT INTO emp1 (eno, name, phone, salary, address) 
VALUES 
    (104, 'John', 123456789, 50000, 'Address1'),
    (105, 'Jane', 98765432, 60000, 'Address4'),
    (106, 'Alice', 5551234, 55000, 'Address7');
ALTER TABLE emp1 RENAME TO employee;
select * from employee;
CREATE TABLE emp(
eno int(3),
name char(10),
phone int(10),
salary int(7)
);
select * from emp;
desc emp;
commit;
SET SQL_SAFE_UPDATES = 0;
UPDATE employee SET phone = 8888888 WHERE eno = 105;
UPDATE employee SET salary = 500000 WHERE address = 'Pune';
DELETE from employee where address = 'Pune'; 
select * from employee;
rollback;
select * from employee;
UPDATE employee SET address = 'Jaipur';
select sum(salary) as "ESAL" from employee;


CREATE TABLE CUSTOMER (
    cust_id VARCHAR(5) PRIMARY KEY,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    area VARCHAR(10),
    phone_no VARCHAR(10)
);


CREATE TABLE MOVIES (
    movie_id VARCHAR(5) PRIMARY KEY,
    movie_name VARCHAR(50),
    movie_type VARCHAR(20),
    price DECIMAL(6,2),
    cust_id VARCHAR(5),
    issue_date DATE,
    FOREIGN KEY (cust_id) REFERENCES CUSTOMER(cust_id)
);

CREATE TABLE INVOICE (
    inv_no VARCHAR(5) PRIMARY KEY,
    cust_id VARCHAR(5),
    movie_id VARCHAR(5),
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (cust_id) REFERENCES CUSTOMER(cust_id),
    FOREIGN KEY (movie_id) REFERENCES MOVIES(movie_id)
);

INSERT INTO CUSTOMER (cust_id, f_name, l_name, area, phone_no) VALUES 
('C001', 'John', 'Doe', 'A1', '1234567890'),
('C002', 'Jane', 'Smith', 'B2', '2345678901'),
('C003', 'Alice', 'Brown', 'C3', '3456789012'),
('C004', 'Bob', 'Davis', 'D4', '4567890123'),
('C005', 'Charlie', 'Johnson', 'E5', '5678901234'),
('C006', 'Diana', 'Miller', 'F6', '6789012345'),
('C007', 'Evan', 'Garcia', 'G7', '7890123456'),
('C008', 'Fiona', 'Martinez', 'H8', '8901234567'),
('C009', 'George', 'Lee', 'I9', '9012345678'),
('C010', 'Hannah', 'Walker', 'J0', '0123456789');

INSERT INTO MOVIES (movie_id, movie_name, movie_type, price, cust_id, issue_date) VALUES 
('M001', 'Inception', 'Sci-Fi', 15.50, 'C001', '2024-11-01'),
('M002', 'Toy Story', 'Animation', 10.00, 'C002', '2024-11-03'),
('M003', 'The Matrix', 'Action', 18.75, 'C003', '2024-11-05'),
('M004', 'The Godfather', 'Drama', 20.00, NULL, NULL),
('M005', 'Finding Nemo', 'Animation', 12.50, 'C004', '2024-11-07'),
('M006', 'Titanic', 'Romance', 16.00, NULL, NULL),
('M007', 'Avengers', 'Action', 25.00, 'C005', '2024-11-08'),
('M008', 'The Dark Knight', 'Thriller', 22.00, NULL, NULL),
('M009', 'Pulp Fiction', 'Drama', 19.00, 'C006', '2024-11-10'),
('M010', 'Interstellar', 'Sci-Fi', 21.50, NULL, NULL);

INSERT INTO INVOICE (inv_no, cust_id, movie_id, issue_date, return_date) VALUES 
('I001', 'C001', 'M001', '2024-11-01', '2024-11-05'),
('I002', 'C002', 'M002', '2024-11-03', '2024-11-06'),
('I003', 'C003', 'M003', '2024-11-05', '2024-11-09'),
('I004', 'C004', 'M005', '2024-11-07', '2024-11-10'),
('I005', 'C005', 'M007', '2024-11-08', '2024-11-12'),
('I006', 'C006', 'M009', '2024-11-10', '2024-11-14'),
('I007', 'C007', 'M006', '2024-11-02', '2024-11-06'),
('I008', 'C008', 'M004', '2024-11-03', '2024-11-08'),
('I009', 'C009', 'M008', '2024-11-04', '2024-11-09'),
('I010', 'C010', 'M010', '2024-11-11', '2024-11-15');


-- Print the entire CUSTOMER table.
select * from CUSTOMER;

-- Calculate the average price of all the movies.
select avg(price) from MOVIES;

--  Count separately the number of movies in the ‘comedy’ and ‘thriller’ type.
SELECT COUNT(*) AS total_count FROM MOVIES WHERE movie_type = 'comedy' OR movie_type = 'thriller';

--  Find the customer’s name and area with cust_id ‘A05’.
SELECT CONCAT(f_name, ' ', l_name) AS full_name, area FROM CUSTOMER WHERE cust_id = 'A05';

-- Change the area of cust_id ‘A03’ to ‘VS’.
UPDATE CUSTOMER SET area = 'VS' WHERE cust_id = 'A03';

--  Retrieve the list of fname & the area of all the customers.
SELECT f_name, area FROM CUSTOMER;

-- Count the number of movies having price greater than or equal to 150.
SELECT COUNT(*) AS total_count FROM MOVIES WHERE price >= 150;

--  Find the number of movies in each type.
SELECT movie_type, COUNT(*) AS total_count FROM MOVIES GROUP BY movie_type;

--  Find the names and movie numbers of all customers who have been issued movies.
SELECT CONCAT(f_name, ' ', l_name) AS full_name, movie_no FROM CUSTOMER WHERE movie_no IS NOT NULL;

-- Change the issue date of cust_id ‘A01’ to 24/07/93.
UPDATE  MOVIES SET issue_date = '1993-07-24' WHERE cust_id = 'A01';

-- Find the names of all customers.
SELECT CONCAT(f_name, ' ', l_name) AS full_name FROM CUSTOMER;

-- Count the total number of customers.
SELECT COUNT(*) AS total_count FROM CUSTOMER;

--  Count the average price for each movie type with a maximum price of 150.
SELECT movie_type, AVG(price) AS avg_price FROM MOVIES WHERE price <= 150 GROUP BY movie_type;

-- Display the movie number and day on which customers were issued movies.
SELECT movie_id, DAYNAME(issue_date) AS day_of_week FROM MOVIES WHERE cust_id IS NOT NULL;

-- Change the telephone number of ‘Pramod’ to 466389.
UPDATE CUSTOMER SET phone_no = '466389' WHERE f_name = 'Pramod';

-- List the various movie types available from the movie table.
SELECT DISTINCT movie_type FROM MOVIES;

-- Calculate the total price of all the movies.
SELECT SUM(price) AS total_price FROM MOVIES;

-- Print the type and average price of each movie.
SELECT movie_type, AVG(price) AS avg_price FROM MOVIES GROUP BY movie_type;

-- Find out the movie numbers which have been issued.
SELECT movie_id FROM CUSTOMER WHERE cust_id IS NOT NULL;

-- Change the price of ‘LOVE’ to Rs. 250.00.
UPDATE MOVIES SET price = 250 WHERE movie_name = 'LOVE';

-- Find the lname of all customers that begin with ‘P’.
SELECT l_name FROM CUSTOMER WHERE l_name LIKE 'P%';

-- Calculate the average price of all movies where type is ‘comedy’ or ‘thriller’ and price is greater than or equal to 150.
SELECT AVG(price) AS avg_price FROM MOVIES WHERE movie_type IN ('comedy', 'thriller') AND price >= 150;

-- Find the title and type of movies issued to Raj.
SELECT movie_name, movie_type FROM MOVIES WHERE cust_id = 'A02';

-- Delete the record with invoice number ‘I08’ from the INVOICE table.
DELETE FROM INVOICE WHERE inv_no = 'I08';

-- List all customers who stay in area ‘DA’, ‘MU’, or ‘GH’.
SELECT * FROM CUSTOMER WHERE area IN ('DA', 'MU', 'GH');

-- Determine the maximum and minimum movie prices.
SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM MOVIES;


-- Find the names of customers issued movies of type ‘comedy’.
SELECT CONCAT(f_name, ' ', l_name) AS full_name FROM CUSTOMER WHERE movie_no IN (SELECT movie_id FROM MOVIES WHERE movie_type = 'comedy');

-- Delete records with a return date between 10th July and 14th March.
DELETE FROM MOVIES WHERE return_date BETWEEN '1993-07-10' AND '1993-03-14';

-- Find movies with prices greater than 150 and less than or equal to 250.
SELECT * FROM MOVIES WHERE price > 150 AND price <= 250;

-- Count separately the number of movies in ‘comedy’ and ‘thriller’.
SELECT COUNT(*) AS total_count FROM MOVIES WHERE movie_type IN ('comedy', 'thriller') GROUP BY movie_type;

-- Find customers issued movie number ‘M09’.
SELECT * FROM CUSTOMER WHERE movie_no = 'M09';

-- Change the return date of invoice number ‘I07’ to 16-08-93.
UPDATE INVOICE SET return_date = '1993-08-16' WHERE inv_no = 'I07';

-- Calculate the square root of each movie price.
SELECT SQRT(price) AS square_root_price FROM MOVIES;

-- Calculate the average price of movies where type is ‘comedy’ or ‘thriller’ and price is greater than or equal to 180.
SELECT AVG(price) AS avg_price FROM MOVIES WHERE movie_type IN ('comedy', 'thriller') AND price >= 180;

-- Find the names of movies issued to ‘Raj’ and ‘Prashant’.
SELECT m.movie_name
FROM MOVIES m
JOIN CUSTOMER c ON m.cust_id = c.cust_id
WHERE c.f_name IN ('Raj', 'Prashant');

-- Change the issue date of cust_id ‘A01’ to 22/07/93.
UPDATE MOVIES SET issue_date = '1993-07-22' WHERE cust_id = 'A01';

-- Find names of customers with ‘a’ as the second letter in their fname.
SELECT CONCAT(f_name, ' ', l_name) AS full_name FROM CUSTOMER WHERE f_name LIKE '_a%';

-- Print the Title and average price of each movie.
SELECT movie_name, AVG(price) AS avg_price FROM MOVIES GROUP BY movie_name;

-- Find the lname and fname of customers issued movies.
SELECT f_name, l_name FROM CUSTOMER WHERE movie_no IS NOT NULL;

-- Change the price of ‘robot’ to Rs. 280.00.
UPDATE MOVIES SET price = 280 WHERE movie_name = 'robot';

-- Find customers who stay in areas with 'a' as the second letter.
SELECT * FROM CUSTOMER WHERE area LIKE '_a%';

-- Count the average price for each type with a maximum price of 190.
SELECT AVG(price) AS avg_price FROM MOVIES WHERE price <= 190 GROUP BY movie_type;

-- List all movies issued, showing title, cust_id, and movie number.
SELECT movie_name, cust_id, movie_no FROM MOVIES WHERE cust_id IS NOT NULL;

-- Change the telephone number of ‘Rajesh’ to 567889.
UPDATE CUSTOMER SET phone_no = '567889' WHERE f_name = 'Rajesh';

-- Find movies priced between 100 and 180.
SELECT * FROM MOVIES WHERE price BETWEEN 100 AND 180;

-- Calculate the average price of all movies.
SELECT AVG(price) AS avg_price FROM MOVIES;

-- Find if the movie ‘LOVE’ is issued to any customer and show the cust_id.
SELECT cust_id FROM MOVIES WHERE movie_name = 'LOVE';

-- Find movies of type ‘action’ and ‘comedy’.
SELECT * FROM MOVIES WHERE movie_type IN ('action', 'comedy');

-- Calculate the average price of movies where type is ‘comedy’ or ‘thriller’ and price is greater than or equal to 100.
SELECT AVG(price) AS avg_price FROM MOVIES WHERE movie_type IN ('comedy', 'thriller') AND price >= 100;

-- List customers’ names and phone numbers for movies issued before August.
SELECT CONCAT(f_name,l_name) phone_no FROM CUSTOMER WHERE movie_no IN (SELECT movie_id FROM MOVIES WHERE issue_date < '1993-08-01');

-- Change the area of cust_id ‘A01’ to ‘JK’.
UPDATE CUSTOMER SET area = 'JK' WHERE cust_id = 'A01';

-- Find movies with prices greater than 170.
SELECT * FROM MOVIES WHERE price > 170;

-- Delete the record with invoice number ‘I07’.
DELETE FROM INVOICE WHERE inv_no = 'I07';

-- Divide the cost of movie ‘robot’ by its price minus 100.
SELECT price / (price - 100) AS result FROM MOVIES WHERE movie_name = 'robot';

-- List movies in sorted order by their title.
SELECT * FROM MOVIES ORDER BY movie_name;

-- Count the total number of customers.
SELECT COUNT(*) AS total_count FROM CUSTOMER;

-- Print information from INVOICE table for cust_id ‘A01’ and ‘A02’.
SELECT * FROM INVOICE WHERE cust_id IN ('A01', 'A02');

-- Find all movies except ‘action’ movies.
SELECT * FROM MOVIES WHERE movie_type != 'action';

-- Count movies with prices greater than or equal to 190.
SELECT COUNT(*) AS total_count FROM MOVIES WHERE price >= 190;

-- Find the date 15 days after the current date.
SELECT DATE_ADD(CURDATE(), INTERVAL 15 DAY) AS date_after_15_days;

-- List the movie_no and inv_no for movies with mv_no less than ‘M05’.
SELECT movie_no, inv_no FROM MOVIES WHERE movie_id < 'M05';

-- Display the issue_date in the format dd-mm-yy.
SELECT DATE_FORMAT(issue_date, '%d-%m-%y') AS formatted_issue_date FROM MOVIES;

--  Change the area of cust_id ‘A06’ to ‘AP’.
UPDATE CUSTOMER SET area = 'AP' WHERE cust_id = 'A06';




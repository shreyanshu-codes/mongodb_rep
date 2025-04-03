-- Create database only if it does not exist
CREATE DATABASE IF NOT EXISTS ORG123;
SHOW DATABASES;
USE ORG123;

-- Drop tables if they already exist to avoid errors
DROP TABLE IF EXISTS Bonus;
DROP TABLE IF EXISTS Title;
DROP TABLE IF EXISTS Worker;

-- Create the Worker table
CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	FIRST_NAME CHAR(25),
	LAST_NAME CHAR(25),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT CHAR(25)
);

-- Insert data into Worker table
INSERT INTO Worker 
	(FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		('Monika', 'Arora', 100000, '2020-02-14 09:00:00', 'HR'),
		('Niharika', 'Verma', 80000, '2011-06-14 09:00:00', 'Admin'),
		('Vishal', 'Singhal', 300000, '2020-02-14 09:00:00', 'HR'),
		('Amitabh', 'Singh', 500000, '2020-02-14 09:00:00', 'Admin'),
		('Vivek', 'Bhati', 500000, '2011-06-14 09:00:00', 'Admin'),
		('Vipul', 'Diwan', 200000, '2011-06-14 09:00:00', 'Account'),
		('Satish', 'Kumar', 75000, '2020-01-14 09:00:00', 'Account'),
		('Geetika', 'Chauhan', 90000, '2011-04-14 09:00:00', 'Admin');

-- Create the Bonus table
CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATE,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES
Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- Insert data into Bonus table
INSERT INTO Bonus 
	(WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
		(1, 5000, '2020-02-16'),
		(2, 3000, '2011-06-16'),
		(3, 4000, '2020-02-16'),
		(1, 4500, '2020-02-16'),
		(2, 3500, '2011-06-16');

-- Create the Title table
CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- Insert data into Title table
INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
		(1, 'Manager', '2016-02-20 00:00:00'),
		(2, 'Executive', '2016-06-11 00:00:00'),
		(8, 'Executive', '2016-06-11 00:00:00'),
		(5, 'Manager', '2016-06-11 00:00:00'),
		(4, 'Asst. Manager', '2016-06-11 00:00:00'),
		(7, 'Executive', '2016-06-11 00:00:00'),
		(6, 'Lead', '2016-06-11 00:00:00'),
		(3, 'Lead', '2016-06-11 00:00:00');

-- Queries:

-- 1. Select workers with salary not between 100000 and 200000
SELECT * FROM Worker WHERE SALARY NOT BETWEEN 100000 AND 200000;

-- 2. Select first names of workers with specific worker IDs
SELECT FIRST_NAME FROM Worker WHERE WORKER_ID IN (2, 4, 6);

-- 3. Select workers with salary between 200000 and 400000 and specific worker IDs
SELECT * FROM Worker 
WHERE SALARY BETWEEN 200000 AND 400000 
AND WORKER_ID IN (1, 2, 3, 4, 5);

-- 4. Describe the Worker table
DESC Worker;

-- 5. Get the minimum salary in the HR department
SELECT MIN(SALARY) FROM Worker WHERE DEPARTMENT = 'HR';

-- 6. Get distinct departments
SELECT DISTINCT DEPARTMENT FROM Worker;

-- 7. Alias example - Rename WORKER_ID as EMP_ID
SELECT WORKER_ID AS EMP_ID FROM Worker;

-- 8. UNION ALL: Get worker IDs and first names combined into a single column
SELECT WORKER_ID FROM Worker
UNION ALL
SELECT FIRST_NAME FROM Worker;

-- 9. UNION with ORDER BY: Get department and worker IDs for specific salaries
SELECT DEPARTMENT, WORKER_ID FROM Worker WHERE SALARY = 100000
UNION 
SELECT DEPARTMENT, WORKER_ID FROM Worker WHERE SALARY = 200000
ORDER BY WORKER_ID;

-- 10. CASE statement to classify workers based on salary
SELECT WORKER_ID, FIRST_NAME, DEPARTMENT,
CASE
    WHEN SALARY > 100000 THEN 'Rich People'
    WHEN SALARY BETWEEN 50000 AND 100000 THEN 'Middle Class People'
    ELSE 'Poor'
END AS People_stage_wise 
FROM Worker;
    ELSE 'Poor people'
END 
AS People_stage_wise
FROM worker;
-- Create the category table
CREATE TABLE category (
    c_id INT PRIMARY KEY,
    c_name VARCHAR(25) NOT NULL UNIQUE,
    c_descrp VARCHAR(250) NOT NULL
);

-- Insert data into category
INSERT INTO category (c_id, c_name, c_descrp) 
VALUES (102, 'furnitures', 'It stores all sets of wooden items');

-- Select all from category
SELECT * FROM category;

-- Describe category table
DESC category;

-- Use the database (Ensure the database exists before using it)
USE org123;

-- Create the Products table with a foreign key reference to category
CREATE TABLE Products (
    P_ID INT PRIMARY KEY,
    p_Name VARCHAR(250) NOT NULL,
    c_id INT,
    CONSTRAINT fk_category FOREIGN KEY (c_id) 
    REFERENCES category(c_id) ON DELETE SET NULL
);

-- Show tables from the database
SHOW TABLES FROM org123;

-- Describe Products table
DESC Products;

-- Drop the Products table (if needed)
DROP TABLE IF EXISTS Products;

-- Insert into Products (NULL is allowed in foreign key if necessary)
INSERT INTO Products (P_ID, p_Name, c_id) 
VALUES (904, 'Wooden table', NULL);

-- Select all from Products
SELECT * FROM Products;

-- Select all from category
SELECT * FROM category;

-- Delete a specific category entry
DELETE FROM category WHERE c_id = 101;

-- Drop the category table (if needed)
DROP TABLE IF EXISTS category;
create database saturday;
use saturday;

create table category(
c_id int primary key,
c_name varchar(25) not null unique,
c_decrp varchar(250) not null
);

insert into category values (101, 'electronics', 'it stores all set of electronics items');
select * from category;
desc category;

CREATE TABLE Products (
    P_ID int primary key,
    p_Name varchar(250) NOT NULL,
    c_id int ,
    CONSTRAINT c_id FOREIGN KEY (c_id)
    REFERENCES category(c_id) on delete cascade
);

insert into products values (904, 'INTEL I5 Processor', 101);
select * from products;
delete from category where c_id=101;
select * from category;
create table vitBhopal (id int primary key, name varchar(20) not null,
department varchar(25) not null);
insert into vitbhopal values (104,'Karthik','cs'),(103,'Arun','cs');

create table vit (id int primary key, name varchar(20) not null,
college varchar(25) not null);
insert into vit values (104,'Karthik','chennai'),(103,'Arun','bhopal');
select * from vit;

select * from vitbhopal;

select name as WinnerOfTheYear from vitbhopal
where id = (select id from vit where college='bhopal');

Q1]Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending. GIVE PROPER CODE IN SQL QUERY
SELECT * 
FROM Worker 
ORDER BY FIRST_NAME ASC;

Q2]Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * 
FROM Worker 
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

Q3]Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * 
FROM Worker 
WHERE FIRST_NAME NOT IN ('Vipul', 'Satish');

Q4]Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * 
FROM Worker 
WHERE FIRST_NAME LIKE '_____h';

Q5]Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT COUNT(*) AS Employee_Count
FROM Worker
WHERE DEPARTMENT = 'Admin';

Q6]Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.
SELECT FIRST_NAME, LAST_NAME, SALARY
FROM Worker
WHERE SALARY BETWEEN 50000 AND 100000;

Q7]Write an SQL query to fetch the no. of workers for each department in the descending order
SELECT DEPARTMENT, COUNT(*) AS Worker_Count
FROM Worker
GROUP BY DEPARTMENT
ORDER BY Worker_Count DESC;

Q8]Write an SQL query to determine the 5th highest salary without using TOP or limit method.
SELECT SALARY 
FROM Worker W1
WHERE 4 = (
    SELECT COUNT(DISTINCT W2.SALARY) 
    FROM Worker W2 
    WHERE W2.SALARY > W1.SALARY
);

Q9]Write an SQL query to fetch the list of employees with the same salary.
SELECT W1.FIRST_NAME, W1.LAST_NAME, W1.SALARY
FROM Worker W1
WHERE W1.SALARY IN (
    SELECT W2.SALARY 
    FROM Worker W2
    GROUP BY W2.SALARY
    HAVING COUNT(*) > 1
);

Q10]Write an SQL query to fetch the departments that have less than three people in it.
SELECT DEPARTMENT
FROM Worker
GROUP BY DEPARTMENT
HAVING COUNT(*) < 3;

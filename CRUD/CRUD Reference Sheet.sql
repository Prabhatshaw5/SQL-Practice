/*CRUID Operations in SQL: 
Create (databases, tables)-> CREATE
Read (fetch rows) -> SELECT
Update (existing data) -> UPDATE
Insert (add rows) -> INSERT
Delete (rows) -> DELETE
*/

/*MySQL Workbench is LARGELY NoT CaSe SensitIve!

To be on the safer side, please write the commands in small 
case (or UPPER CASE) but be consistent. 

Write the database names, table name, column names in 
the same case (upper or lower or proper) as they were
created in (or appear in the server).*/


/*Step 1: Let's create a new database called Loans_db
*/

create database loans_db;

/*Make the new database as the default database*/
USE Loans_db;

/*Let's see if we have any tables in the database*/
Show tables;

/*Let's create a new table in the loans_db*/
CREATE TABLE customers(custId INTEGER,
custName char(100),
gender char(10),
income integer,
dob date,
credit_history boolean
);

describe customers; /*Show the metadata (or data dictionary) of this table*/

/*CRUD Operations:
Create -> Create database / table
Read -> Select
Add Rows -> INSERT
Update - Update
Delete - Delete*/

select custName, gender, income, dob, credit_history 
from customers;

select * /*select all the columns.*/
from customers;

/*How to insert rows into a table?*/
INSERT INTO customers(custId, custName, gender, income, dob, credit_history)
VALUES
(101, "Deepak Raj", "Male", 9999999, "1999-12-05", TRUE),
(201, "Suhas Chavan", "Male", 777777, "2001-11-30", TRUE);

/*Delete rows /records*/
delete
from customers;

/*You're not allowed to delete or update without where conditions*/
SET SQL_SAFE_UPDATEs = 0; /*Disables the unconditonal delete / update restriction*/

/*delete rows conditionally*/
delete 
from customers 
where custName = "Divya";

use loans_db;

/*Update -> modify existing data (eg somebody's last name)*/
Update customers
SET custName = "Divya", custId = 666
where custID = 101;

select * from customers;

/*Practice questions:
1. Create a new table called materials with the following structure and data:
MaterialID | MaterialName | UnitCost | PriceDate  | IsAvailableInIndia
1          | Steel        | 5        | 2023-12-08 | TRUE
2          | Plastic      | 2        | 2023-11-02 | TRUE
3          | Aluminum     | 4        | 2023-10-23 | TRUE
4          | Rubber       | 1.5      | 2024-04-19 | FALSE
5          | Copper       | 6        | 2024-05-08 | FALSE

2. Change the UnitCost to 1.8 for MaterialID 4
3. Add a new row with MaterialID 6, MaterialName 'Glass', UnitCost 3, PriceDate '2024-06-15', IsAvailableInIndia TRUE    
4. Delete the material details of MaterialID 6

-- Bonus Assignment -- 
1. Create a new table called as loans with the following 
structure and data: 
loan_ID | loan_amt	| custID
1			43434	  101
2			4222	  201
3			66533	  101

2. Change the loan_amt to 5555 for loan_Id 2
3. Add a new row with loan_ID 4, loan_amt 666, custId 201	
4. Delete the loan details of loan_ID 4
*/

create database credit_card_db;

use credit_card_db;

/*Import the customers data table into cc_profile_temp database*/

/*Tasks to remove comma from annualsalary column
1. Create a new column Salary with INT data type
2. Replace comma with null string ("" - pair of double quotes without any space) 
3. Update the Salary column with the replaced value after 
converting the replaced value into integer. 
(We'll use CAST function to convert numbers stored as text 
into integer)
*/

/*1. Create a new column Salary with INT data type*/
Alter table customers add column Salary int;

/*Let's verify the Salary column*/
select * from customers limit 10;

/*2. Replace comma with null string ("" - pair of double quotes without any space) 
*/
select annualsalary, replace(annualsalary, ",","")
from customers;

/*3. Update the Salary column with the replaced value after 
converting the replaced value into integer. 
(We'll use CAST function to convert numbers stored as text 
into integer)*/
Update customers

SET salary = CAST(replace(annualsalary, ",", "") as Unsigned);

select * from customers;

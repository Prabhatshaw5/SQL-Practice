/*Practice Questions: TCL
1. Create a new database: bank db*/

create database bank_db;
use bank_db;

/*2. Extract the female customers data from the loans_dataset's customers table.*/
select * 
from loans_db.customers
where Gender= "female";

/*3. Using this, create table: female_customers in bank_db*/
create table female_customers as
select *
from loans_db.customers
where Gender="Female";

select * from female_customers; -- checking the results and its correct

/*4. Start the transaction and create a savepoint before_changes*/
start transaction;
savepoint sp1;

/*5. Delete the female customers whose income is less than 1000.*/
Delete from female_customers
where applicantincome<1000;

select * from female_customers order by applicantincome asc; -- checking whether the income less than 1000 rows were deleted or not!

/*6. rollback the changes*/
rollback;
select * from female_customers order by applicantincome asc; -- checking whether the rollback worked or not and whether we got the deleted rows back or not!

/*7. Remove the female customers whose income is more than 5000.*/
delete from female_customers
where applicantincome > 5000;
select * from female_customers order by applicantincome asc; -- checking it deleted or not!

/*8. Commit the changes.*/
commit;

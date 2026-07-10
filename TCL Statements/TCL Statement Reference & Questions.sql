-- Transaction Control Language Statemenets in MySQL

START transaction; -- Starts with Start Transaction; 

update customers 
set custId = 101 
where custId = 201;

select * from customers;

Rollback; -- Rollsback to the state of the database before the updates.

update customers 
set custId = 101 
where custId = 201;

select * from customers;

Commit; -- Save the changes permanently. You wont be able to rollback to previous state after committing.

Rollback; -- It wont roll back to the original state because the changes were committed.

select * from customers;

-- Savepoint introduction
Start transaction;

-- Savepoint is a a temporary backup of the database until committed
SAVEPOINT before_changes; 

select * from customers;

update customers
set custId = 666
where custId = 201;

select * from customers;

rollback to before_changes; -- rollsback the state of the db to the Savepoint

select * from customers;

Commit; -- Changes have been permanent, and savepoints are deleted.

rollback to before_changes; -- It will give an error that savepoint doesn't exist.

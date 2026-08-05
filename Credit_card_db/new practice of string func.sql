use credit_card_db;
/*
1.  Find the position of first "a" in name of each customer. */
select name, instr(name,'a')
from customers;

/*2.   Display the customers' entire name but the last character. 
Eg: Prateek -> Pratee*/
select name, left(name, length(name)-1)
from customers;

/*3.    Display the last two characters of the customers’ name */
select name, right(name,2)
from customers;

/*4.    Select names containing a single “e”.  */
select name
from customers
where length(name)-length(replace(name,'e',''))=1 ;
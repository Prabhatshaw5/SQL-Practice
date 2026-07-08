/*MaterialID | MaterialName | UnitCost | PriceDate  | IsAvailableInIndia
1          | Steel        | 5        | 2023-12-08 | TRUE
2          | Plastic      | 2        | 2023-11-02 | TRUE
3          | Aluminum     | 4        | 2023-10-23 | TRUE
4          | Rubber       | 1.5      | 2024-04-19 | FALSE
5          | Copper       | 6        | 2024-05-08 | FALSE

1. Create a new table called materials with the following structure and data:*/

create database if not exists crud;
use crud;
create Table if not exists materials (
materialID integer Primary key, materialName varchar(100) not null,
UnitCost float, PriceDate date,IsAvailableInIndia boolean);

Insert into materials ( materialID, MaterialName,
UnitCost, PriceDate, IsAvailableInIndia)
Values ( 1 ,"Steel" ,5 , "2023-12-08 ",TRUE),
(2 , "Plastic " ,2 ,"2023-11-02" ,TRUE),
(3 , "Aluminum" ,4 ,"2023-10-23" ,TRUE),
(4 ,"Rubber", 1.5 ,"2024-04-19" ,FALSE),
(5, "Copper" ,6 ,"2024-05-08" ,FALSE);
select * from materials;

/*2. Change the UnitCost to 1.8 for MaterialID 4*/
update materials set unitcost = 1.8 where Materialid = 4;

/*3. Add a new row with MaterialID 6, MaterialName 'Glass', UnitCost 3,
 PriceDate '2024-06-15', IsAvailableInIndia TRUE */
 insert into materials ( materialID, MaterialName,
UnitCost, PriceDate, IsAvailableInIndia)
values (6, "Glass" , 3 ,"2024-06-15" ,True);
select * from materials;

/*4. Delete the material details of MaterialID 6*/
delete from materials
where materialid = 6;
select * from materials;

/*structure and data: 
loan_ID | loan_amt	| custID
1			43434	  101
2			4222	  201
3			66533	  101
1. Create a new table called as loans with the following*/

create table loans ( loan_ID integer primary key, loan_amt float not null, custID integer);
insert into loans (loan_ID, loan_amt ,custID )
values ( 1, 43434 ,101),
(2, 4222 , 201),
(3 , 66533 , 101);
select * from loans;

/*2. Change the loan_amt to 5555 for loan_Id 2 */
update loans
set loan_amt= 5555 
where loan_id =2;

/*3. Add a new row with loan_ID 4, loan_amt 666, custId 201	*/
insert into loans (loan_ID, loan_amt ,custID )
values (4,666,201);

/*4. Delete the loan details of loan_ID 4*/
delete from loans
where loan_id=4;

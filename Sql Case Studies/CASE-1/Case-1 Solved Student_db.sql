

-- 3.	a)	Find the number of girls living in TST.
select name, class
from student
where sex ='F' and dcode = 'TST';
-- b)	List the number of pass in the Math test of each class. (passing mark = 50)
select name, class, Mtest as Passed
from student
where Mtest >= 50;
-- c)	List the number of girls grouped by each class
select class,count(*) as Female_students
from student 
where sex = 'F'
group by class;
-- d)	List the number of girls grouped by the year of birth.
select year(str_to_date(dob, '%d-%m-%Y')),count(*)
from student 
where sex = 'F'
group by year(str_to_date(dob, '%d-%m-%Y'));
-- e)	Find the average age Frrm class 1 boys.
select avg(timestampdiff(
                     year,
                     str_to_date(dob,'%d-%m-%Y'),curdate()))as Average_date
from student 
where sex='M' and class like '1%';

-- 4.	a)	Find the average mark of mtest for each class.
select avg(mtest) as Average_marks, class
from student
group by class;
-- b)	Find the maximum mark of mtest for each sex.
select max(mtest) as Max_marks, sex
from student
group by sex;
-- c)	Find the average mark of mtest for all students.
select avg(mtest) as Average_marks
from student;

	-- 5.a)	List the students who are common members of the Physics Club and the Chemistry Club.
select p.id, p.fullname  
from phy p inner join chem c on p.id=c.id;
-- b)	List the students who are common members of the Chemistry Club and Biology Club but not of the Physics Club.
select c.id, c.fullname  
from chem c inner join bio b on c.id=b.id
where c.id not in (select id
				   from phy);
                   
-- 6.a)	Produce a list of parts in ascending order of quantity.
select Part_no,Descript,QTY
from client 
order by Qty asc; 
-- b)	Produce a list of parts that consist of the keyword ‘Shaft’ in the description.
select Part_no,Descript
from client 
where descript like '%Shaft%'; 
-- c)	Produce a list of parts that have a quantity more than 20 and are supplied by ‘China Metals Co.’
select Part_no,Descript,Qty,Supplier
from client 
where Qty> 20 and Supplier = 'China Metals Co.'; 
-- d)	List all the suppliers without duplication.
select distinct Supplier
from client ; 
-- e)	Increase the quantity by 10 for those parts with quantity less than 10.
select Descript,Qty
from client
where qty <10 ;
update client set qty= qty+10
where qty <10 ;
-- f)	Delete records with part_no equal to 879, 654, 231 and 234
delete from client 
where part_no in (879,654,231,234);
-- g)	Add a field “Date_purchase” to record the date of purchase.
alter table client
add Date_purchase date;

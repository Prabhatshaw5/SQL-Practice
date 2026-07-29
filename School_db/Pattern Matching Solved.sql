-- IN, NOT, BETWEEN AND, Like Queries:

-- 1.	Find the students who have IDs in the following set – 1,5,9
use school_db;  select * from music;  select * from student_raw_transformed_withtime;

select *
from student_raw_transformed_withtime
where id =1 or id= 5 or id= 9;   -- we can also write  where id in(1,5,9);

-- 2.	List the names of the students who are playing a musical instrument (Hint: refer to Music and Student tables both)
select s.id, s.FullName, m.type
from student_raw_transformed_withtime S inner join music M on S.id = M.id;

/* 3.	List the students who were born on Wednesday or Saturdays (Hint: Use WeekDay(DOB) function, 
which returns the day of the week (in number format between 1 & 7) corresponding to a given date – Eg – 1 means Sunday)*/
select FullName,DOB, weekday(str_to_date(dob, '%c-%e-%Y %h:%i %p')) as day
from student_raw_transformed_withtime
where weekday(str_to_date(dob, '%c-%e-%Y %h:%i %p')) in (2,5);

-- 4.	List the students who were not born in January, March, and June (Hint: Use Month(DOB) function) 
select FullName,DOB, month(str_to_date(dob, '%c-%e-%Y %h:%i %p')) as Mname
from student_raw_transformed_withtime
where month(str_to_date(dob, '%c-%e-%Y %h:%i %p')) not in (1,3,6); -- we can also write where monthname(str_to_date(dob, '%c-%e-%Y %h:%i %p')) not in ("January", "March", "June");

-- 5.	List the students who have scored between 70 and 80 and 90 and 100.
 select FullName,MTest
from student_raw_transformed_withtime
where MTest between 70 and 80 
or Mtest between 90 and 100;
-- 6.	List the students whose names contain E
 select FullName
from student_raw_transformed_withtime
where FullName like '%E%';

-- 7.	List the students who come from Districts ending with T
 select FullName,DCode
from student_raw_transformed_withtime
where DCode like '%T';
-- 8.	List the students whose names contain B as the second last letter
select FullName
from student_raw_transformed_withtime
where FullName like '%B_';
-- 9.	List the students who come from districts with M as the third character
select FullName,DCode
from student_raw_transformed_withtime
where DCode like '__M%';
-- 10.	List the students who come from districts that contain Y in the district name
select FullName,DCode
from student_raw_transformed_withtime
where DCode like '%Y%';
-- 11.	List the students who are playing instruments that contain letter "p" somewhere.
select s.id, s.FullName, m.type
from student_raw_transformed_withtime s inner join music m on s.id=m.id
where m.type like '%p%';
-- 12.	List the instruments played by students whose names start with letter capital "A".
 select s.id, s.FullName, m.type
from student_raw_transformed_withtime s inner join music m on s.id=m.id
where binary s.FullName like 'A%';
-- 13.	List the students whose name contain small case "u" as the second letter.
 select FullName
from student_raw_transformed_withtime
where binary FullName like '_u%';
-- 14.	List the students whose name contain "u" or "r" somewhere 
 select FullName
from student_raw_transformed_withtime
where FullName like '%u%' or fullname like '%r%'; -- or we canm alspo write it as where FullName regexp 'u|r'
-- 15.	List the students who don’t contain ‘A’ and ‘R’ in their names. 
 select FullName
from student_raw_transformed_withtime
where FullName not like '%A%' and fullname not like '%R%';  -- or we canm alspo write it as where FullName not regexp 'A|R'
-- 16.	List the students whose names contain only these characters - “A” or “B” or “C” or “D” (eg – names like “dada” “baba” “caba”)
 select FullName
from student_raw_transformed_withtime
where FullName regexp '^[ABCD]+$';
-- 17.	List the students whose names don’t contain t, o, r anywhere
 select FullName
from student_raw_transformed_withtime
where FullName not regexp 't|o|r'; -- we can also write where FullName not like '%t%' and FullName not like '%o% and Fullname not like '%r%'
-- 18.	List the students whose names contain only three characters and must contain at least one of the following characters: a, e, u
 select Fullname
from student_raw_transformed_withtime
where length(FullName) = 3 and fullname regexp '[aeu]';

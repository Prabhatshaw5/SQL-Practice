create database school_db;
use school_db;
select * from student_raw_transformed_withtime;
select * from bridge;
select * from chess;
select * from music;

/*1.List the female students who have scored less than 92 in Maths*/
select * 
from student_raw_transformed_withtime 
where MTest<92 and sex= "F"
order by Mtest asc;

/*2.•  List the students who were born before 01/01/2000 (hint: use “ “ for date values)*/
select *
from student_raw_transformed_withtime
where str_to_date(dob, '%m-%d-%y %h:%i%p')< "2000-01-01";

/*3.List the students who have not paid their fees*/
select *
from student_raw_transformed_withtime
where remission =0;

/*4.•  List the students who come from district YMT*/
select *
from student_raw_transformed_withtime
where Dcode= "YMT";

/*5.•  Find the age of students (hint: use date() function)*/
select fullname, timestampdiff(year, str_to_date(dob, '%d-%m-%y'),curdate() )as age
from student_raw_transformed_withtime;

/*6.• Show the age in the following format: years in one column and the month in another.*/
select fullname, timestampdiff(year, str_to_date(dob, '%d-%m-%y'),curdate() )as years, mod(timestampdiff (month,str_to_date(dob, '%d-%m-%y'),curdate() ),12 ) as months
from student_raw_transformed_withtime;

-- categorize the students as Mtest>=95 then scholar or dumb
select id,fullname, if(MTest>=95,'scholar','dumb') as status
from student_raw_transformed_withtime;

-- /*1. List the students who come from districts that contain Y in the district name*/
select FullName, DCode
from student_raw_transformed_withtime
where Dcode like "%Y%";

-- 2 List the students who are playing instruments that contain letter "p" somewherg.
select s.FullName, s.id, m.type
From student_raw_transformed_withtime s inner join music m on s.id = m.id
where m.type like "%p%";

-- 3.List the instruments played by students whose names start with letter capital "A".*/
select s.FullName, m.Type,s.id
from student_raw_transformed_withtime s inner join music m on s.id = m.id
where binary s.FullName like "A%";

-- 4. List the students whose name contain small case "u" as the second letter.
select distinct FullName
from student_raw_transformed_withtime
where binary FullName like "_u%";

/*5. List the students whose name contain "u" or "r" somewhere*/
select FullName
from student_raw_transformed_withtime
where FullName like "%u%" or FullName like "%r%";

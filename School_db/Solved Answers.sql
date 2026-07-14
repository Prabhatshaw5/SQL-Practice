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
select *
from student_raw_transformed_withtime


/*•  Show the age in the following format: years in one column and the month in another.*/

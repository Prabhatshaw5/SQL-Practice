Use School Database (student table) to solve the following questions:
Text Function Queries: 

Please refer to the attached notes on Text Functions in SQL. Then, please do the following questions using the School_Db: 

1. List the first initial of all the students coming from YMT
 2. Display the entire name but the last character of students
3. Display the last two characters of the students’ name 
4. Do the second question using Mid function
 5. Do the third question using Mid function
6. Show the fullname in Upper Case. 
 7. Select students whose name contain a single “e”.  
 8. Find the position of second “e” in fullnames

/*Use School Database (student table) to solve the following questions:
Text Function Queries: 
Please refer to the attached notes on Text Functions in SQL. Then, please do the following questions using the School_Db:*/
use School_Db;
-- 1. List the first initial of all the students coming from YMT
select  FullName,left(fullname,1)
from student_raw_transformed_withtime
where DCode ='YMT';

 -- 2. Display the entire name but the last character of students
 select fullname, left(fullname, length(fullname)-1) 
 from student_raw_transformed_withtime;
 
-- 3. Display the last two characters of the students’ name 
select fullname, right(fullname,2) 
from student_raw_transformed_withtime;

-- 4. Do the second question using Mid function
select fullname, mid(fullname,1,length(fullname)-1 )
from student_raw_transformed_withtime;

 -- 5. Do the third question using Mid function
 select fullname, mid(fullname, length(fullname)-1, 2)
from student_raw_transformed_withtime;

-- 6. Show the fullname in Upper Case. 
 select fullname, ucase(fullname)
from student_raw_transformed_withtime;

 -- 7. Select students whose name contain a single “e”.  
select fullname
from student_raw_transformed_withtime
where length(fullname)- length(replace(fullname,'e',''))=1;
 
 -- 8. Find the position of second “e” in fullnames
select fullname, length()
from student_raw_transformed_withtime
where length(fullname)- length(replace(fullname,'e',''))=1;

/*Pattern Matching
Eg - 
Names that start with letter "P"
Or Names that end with "ra"
Or Names that don't contain "a" or "r" anywhere
Or Names that contain "a" as the third character

Then, you use Like or NOT LIKE with wild card operators
% : Any number of alphanumeric characters, incl. zero length string (meaning - nothing) 
_ : Has to be replaced with one char / one no. / one spl char, including space*/

/*Names starting with "p"*/
select fullname
from student
where fullname Like "p%";

/*Names that end with "a"*/
select fullname
from student
where fullname like "%a";

/*Names that contain "i" somewhere*/
select fullname
from student
where fullname like "%i%";

/*Names that don't contain "a" anywhere*/
select fullname
from student
where fullname not like "%a%";

/*Names that contain "r" as the second letter*/
select fullname
from student
where fullname like "_r%";

/*Names that contain smallcase "r" as the second letter*/
select fullname
from student
where binary fullname like "_r%";

/*Names that contain "r" as the third letter*/
select fullname
from student
where fullname like "__r%";

/*Names that contain "p" as the second last letter*/
select fullname
from student
where fullname like "%p_";

/*Questions:
1. List the students who come from districts that contain Y in the district name
2. List the students who are playing instruments that contain
letter "p" somewhere.
3. List the instruments played by students whose names start 
with letter capital "A". 
4. List the students whose name contain small case "u"
 as the second letter.
5. List the students whose name contain "u" or "r" somewhere 
*/

/*1. List the students who come from districts that contain Y in the district name*/
SELECT FullName, Dcode
from student 
where Dcode Like "%Y%";

/*2. List the students who are playing instruments that contain
letter "p" somewhere.*/
Select ID, FullName
From Student 
where ID IN (select ID from Music
          where Type like "%p%");

/*3. List the instruments played by students whose names start 
with letter capital "A".*/
Select Type
from music
where ID in (select ID from student
             where Binary FullName like "A%");
             
/*4. List the students whose name contain small case "u"
 as the second letter.*/
Select FullName
from student
where binary FullName like "_u%";

/*5. List the students whose name contain "u" or "r" somewhere /
*/
Select FullName
from student 
where FullName like "%u%" or fullname like "%r%";


/*For Advanced Pattern Matching - Regular Expressions
Eg: 
Names that contain either a or z in the third position, but 
don't contain p anywhere.

How? 								
	Use RegExp or Rlike commands. Would advise to use RegExp to avoid any confusion with Like / not Like. 							
								
Syntax								
	SELECT	FullName		Will give fullname that contain A or R somewhere				
	FROM 	Customer						
	WHERE 	FullName RegExp "[ar]"						

*/

/*Names that contain a or r*/
SELECT FullName
FROM Student
where fullname regexp "[ar]"; /*[charset] is treated as a char list*/

/*Names that contain capital case "A" or "R". Use binary keyword*/
SELECT FullName
FROM Student
where binary fullname regexp "[AR]"; /*[] is treated as a char list*/

/*Names that start with a or r*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^[ar]";

/*Names that end with a or r*/
SELECT FullName
FROM Student
WHERE FullName RegExp "[ar]$";

/*Names containing r as the third character*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^..r";

/*Names that have "r" in the second position and "a" as the last char*/
select fullname
from student
where fullname regexp "^.[r]" and fullname regexp "[a]$";

/*SECOND Method - Names that have "r" in the second position and "a" as the last char*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^.r[a-z]*a$";


/*Names that have a or r in the third position*/
SELECT FullName
FROM Student
WHERE FullName RegExp "^..[ar]";

/*Names that don't contain "a" anywhere*/
SELECT fullName
FROM Student
WHERE FullName NOT RegExp "[a]";

/*Names that don't start with "a"*/
SELECT fullName
FROM Student
WHERE FullName NOT RegExp "^[a]";

/*Names that don't contain "a" as third char*/
SELECT fullName
FROM Student
WHERE FullName NOT RegExp "^..[a]";

/*Names that start with "ma" or "ru"*/
SELECT FullName
FROM Student 
WHERE FullName RegExp "^(ma)|^(ru)";

/*Q11 - Contains only a b c or d*/ 
SELECT FullName
FROM Student
WHERE FullName NOT RegExp "[e-z]";

/*Can we extract numbers using RegExp?*/
use student;

select *
from student
where fullname NOT regexp "[3-7]";

select *
from student
where fullname NOT regexp "[e-z]";

select fullname
from student
where fullname regexp "^[abcd][abcd]*[abcd]$";

/*Names that contain only - a u or e*/
select fullname
from student
where fullname regexp "^[aue][aue]*[aue]$"

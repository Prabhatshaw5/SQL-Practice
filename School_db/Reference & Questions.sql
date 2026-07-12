/*Select Statement Introduction
Select helps you to extract data from the tables. 
Doesn't make any change to the tables. 

SQL Execution Sequence ->			
1 - From; 
2 - Where (if specified); 
Last - SELECT						

Ideal steps to write Select statement: 
1. Visualize the output / report that you want to create
2. Think of the execution sequence (From which table, what conditions, what do we have to select) 
3. Write the Select Statement
*/

Use students_db;

/*How do you filter rows*/
SELECT * 
FROM Student;

SELECT ID, FullName, Mtest 
FROM Student 
WHERE Mtest > 90;

/*List of females who have scored more than 80 in Maths
Or List of males who have score more than 90 in Maths*/
SELECT ID, FullName, Sex, Mtest 
FROM Student
WHERE (Sex = "F" AND Mtest > 80) OR (Sex = "M" AND Mtest > 90);

SELECT ID, FullName, MTest, SEx 
FROM Student
WHERE (SEX = "F" AND Mtest > 90) OR 
	(SEX = "M" AND Mtest > 95);

/*Multiple conditions*/
SELECT ID, FullName, Mtest, SEx
FROM Student
WHERE (Sex = "M" AND Mtest > 90) OR (SEX = "F" and Mtest > 80);

/*How to handle different cell values in SQL*/
SELECT ID, FullName, SEx, NewDOB 
FROM Student 
WHERE Sex = "F" AND NEWDob > '1987-12-31' 
and Mtest > 90 AND Remission = False;

SELECT * FROM Student;

/*Handle boolean / binary values in SQL
You can compare the boolean field with True / False / 0 / 1*/
SELECT FullName, Remission 
FROM Student
WHERE Remission = True;

/*Numeric Calculations in SQL*/
SELECT FullName, Mtest as Maths, Round((Mtest + Ptest)/2,2) AS Avge
FROM Student;

/*Mod - gives you remainder*/
SELECT FullName, Mtest, Mtest mod 10 AS Remainder, 
Mtest % 10 as R2
FROM Student;

/*Quotient of a division - Use Div*/
SELECT FullName, Mtest, Mtest div 10 AS Q
FROM Student;

/*Mathematical Operators in SQL
+  Addition
-  Subtraction
*  Multipication
/  division
%  Remainder (Mod) 

Logical Operators in SQL 
> 
= 
<
>=
<= 
<> - Not Equals to 
*/

/*Remainder & Quotient*/
SELECT FullName, 38 % 12 as Rm, 
38 mod 12 as Rm2, 38 div 12 as Q
FROM Student; 

/*Functions in SQL - Help us in computing complex data

A function looks like -> funcName() 
It will always return something
Some functions accept parameters or arguments. 
Eg. Round(8.89, 1)  -> 8.9
Please note – a function will have always have a pair of brackets as suffix  
There are functions for: 
1. Numeric Calculations 
2. Data / Time Calculations
3. String Cleaning / Manipulation 
4. Advanced functions  
 */
 SELECT Fullname, Round((Mtest + Ptest)/2,1) as AvgFinalScore
 FROM Student;
 
 
 SELECT FullName, Round(((Mtest + Ptest) / 2)*.35,1) as FinalScore
 FROM Student;

/*Common Date Functions*/ 
SELECT FullName, DateDiff(Current_date(), NewDOB) as AgeinDays
FROM student; 

SELECT FullNAme, Day(NewDOB) as Dy, Month(NewDOB) as Mth, Year(NewDOB) as Yr
FROM Student;

SELECT FullName, WeekDay(NewDOB) as WkDayinNumeric, 
DayName(NewDOB) as WkDayName, Month(NewDOB) as mthInNo, MonthName(NewDOB) as MthName
FROM Student;

SELECT FullName, TimeStampDiff(Month, NewDOB, Current_Date()) as AgeInMonths
FROM Student;

/*How do we handle Null values in SQL*/
SELECT * From Student;

SELECT ID, Fullname, Class 
FROM Student
WHERE Class IS Null and Dcode IS NULL;

/*Distinct - Extract different values from a list
Remember there is a difference between a distinct 
list of values and unique list of values*/
SELECt Distinct DCode, Class
FROM Student;

/*IfNull*/
Select FullName, IfNull(Class, "No Class Assigned")  as ClassStatus
FROM Student;


/*Once you've created the School_db and imported the attached CSV data files from the previous assignment, please work on the following queries:

Basic Queries on School database
•  List the female students who have scored less than 92 in Maths
•  List the students who were born before 01/01/2000 (hint: use “ “ for date values)
•  List the students who have not paid their fees
•  List the students who come from district YMT
•  Find the age of students (hint: use date() function)
•  Show the age in the following format: years in one column and the month in another.*/

/*
Hello, 
Download the attached files and un-zip them (if you don't know how, please Google).

1. Please create a new database: boxoffice_db (only if you've not already created this database). 
2. Import the two attached CSV data tables into MySQL database using MySQL workbench (only if you've not done so already). 
Use boxoffice_db; 
right click on the tables under the boxofice_db. Click Data Import Wizard and follow on-screen prompts. Don't forget to import the date columns with the right data type mapping.
3. Write the SQL queries to answer the attached questionnaire. 
4. Submit only your sql queries as your submission.

Please use the following scripts as a reference: */

-- Boxoffice analysis - introduction
create database boxoffice_dec;

use boxoffice_dec;

select *
from movie_details;

/*Let's analyze the data a little bit:
1. The list of drama movies.
2. The list of movies with runtime > 2.5 hours
3. Sort the data by runtime column in descending order
4. Top 2 shortest movies. 
5. List of action movies which are shorter than 
140 minutes.
*/
-- Q1
select movie_name, movie_genre
from movie_details
where movie_genre = "drama"; 

-- Q2. The list of movies with runtime > 2.5 hours
select movie_name, runtime
from movie_details
where runtime > 2.5 * 60;

-- 3. Sort the data by runtime column in descending order
select movie_name, runtime
from movie_details
order by runtime desc;

-- 4. Top 2 shortest movies.
select movie_name, runtime
from movie_details
order by runtime asc
limit 2;

-- 5. List of action movies which are shorter than 140 minutes.
select movie_name, movie_genre, runtime
from movie_details
where runtime < 140 AND movie_genre = "action";
create database boxoffice_db;
use boxoffice_db;

select *
from movie_details;

/*1. The list of drama movies.*/
select movie_name,movie_genre
from movie_details
where movie_genre= "drama";

/*2. The list of movies with runtime > 2.5 hours*/
select movie_name, runtime
from movie_details
where runtime>2.5 *60;

/*3. Sort the data by runtime column in descending order*/
select movie_name, runtime
from movie_details
order by runtime desc;

/*4. Top 2 shortest movies.*/
select movie_name, runtime
from movie_details
order by runtime asc
limit 2;

/*5. List of action movies which are shorter than 140 minutes.*/
select movie_name, movie_genre, runtime
from movie_details
where movie_genre= "Action" and runtime < 140;

-- 6. List the movies which had the weekend collectio same as the first week collection
select movie_name, movie_weekend,movie_firstweek
from movie_commercials
where movie_weekend = movie_firstweek;

-- 7. List the top 3 movies with the highest foreign collection. 
select movie_name, movie_total_worldwide
from movie_commercials
order by movie_total_worldwide desc
limit 3;

-- 8. List the movies that were released on a non-weekend day. 
select movie_name, release_date
from movie_details
where dayname(str_to_date(release_date,'%d-%b-%yy')) not in ('saturday','sunday');

-- 9. List the movies by Reliance Entertainment which were non comedy.
select movie_name, movie_genre,banner
from movie_details
where banner='Reliance Entertainment' and movie_genre <> 'comedy';

-- 10. List the movies produced in the month of October, November, and December that were released on the weekends.
select movie_name, release_date
from movie_details
where monthname(str_to_date(release_date,'%d-%b-%y')) in ('October','November','December') 
and dayname(str_to_date(release_date,'%d-%b-%y')) in ('Saturday','Sunday');

-- to check no 10 question we run this query 
select movie_name, release_date, dayname(str_to_date(release_date,'%d-%b-%y')) as day_name
from movie_details
where monthname(str_to_date(release_date,'%d-%b-%y')) in ('October','November','December') ;

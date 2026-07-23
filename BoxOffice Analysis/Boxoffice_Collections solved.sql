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
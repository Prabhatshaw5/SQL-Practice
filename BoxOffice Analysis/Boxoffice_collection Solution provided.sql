create database boxoffice_collection;

SET SQL_SAFE_UPDATEs = 0;

update movie_details
set release_date = str_to_date(release_date, "%d-%M-%y");

-- 1- Show the list of movies released in 2020.
select * from movie_details 
where release_date between "2019-12-31" and "2021-01-01";

-- 2- List the top 5 movies which grossed the highest collections across all years.
select movie_name from movie_commercials 
order by movie_total_worldwide desc 
limit 5;

-- 3- List the name of the producers who has produced comedy movies in 2019.
select producer 
from movie_details 
where movie_genre = "comedy" 
and release_date between "2018-12-31"
and "2020-01-01";

-- 4- Which movie in 2020 had the shortest duration?
select movie_name, runtime 
from movie_details 
where release_date between "2019-12-31"
and "2021-01-01"
order by runtime asc
limit 1;

/* 5- List the movie with the highest opening weekend. 
Is this the same movie which had the highest overall collection?*/

select movie_name, 
if (max(movie_firstweek) = max(movie_total_worldwide), "Same Movie", "Not Same Movie") as Comparison  
from movie_commercials 
group by movie_name, movie_firstweek
order by movie_firstweek desc
limit 1;

-- 6- List the movies which had the weekend collectio same as the first week collection
select * from movie_commercials where movie_weekend = movie_firstweek;

-- 7- List the top 3 movies with the highest foreign collection. 
select movie_name, round((movie_total_worldwide - movie_total),2) as foreign_collection
from movie_commercials
where (movie_total_worldwide - movie_total) 
order by (movie_total_worldwide - movie_total) desc
limit 3;

-- 8- List the movies that were released on a non-weekend day. 
select * 
from movie_details 
where weekday(release_date) not in (4,5,6);

-- 9- List the movies by Reliance Entertainment which were non comedy.
select * from movie_details 
where banner= "Reliance Entertainment" and movie_genre!="comedy";

-- 10- List the movies produced in the month of October, November, and December that were released on the weekends.
select *
from movie_details 
where monthname(release_date) in ("October", "November", "December")
and weekday(release_date) in (4, 5, 6);
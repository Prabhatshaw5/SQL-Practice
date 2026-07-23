Create database webanalytics_db_new;
use webanalytics_db_new;

/*1. Convert any of the date columns from string (text) to date using Str_To_Date() function and update statement.*/
select vistid, dob, str_to_date(dob, '%d-%m-%Y') as converted_dob
from visitorprofile_withdob;

/*2. Show the list of top 10 longest visits on the weekends. (Hint: Try to use order by and limit clauses) 
Eg: select visitID, internet_usage
from visitdata 
order by internet_usage desc /here order by will sort the data by Internet_Usage in larges tt to smalled values/
limit 3; /limit 3 will ensure it will only show the top 3 internet_usage visits*/

select vistid, weekday, time_spent
from visitdata
where weekday in ("saturday" , "sunday")
order by time_spent desc
limit 10;

/*3. List the top 5 richest visitors from Singapore. (Hint: try to use Order By and Limit Clauses)*/
select vistid, avg_income, country_name
from visitorprofile_withdob
where country_name ='Singapore'
order by avg_income desc
limit 5;

/*4. List the 3 countries with the lowest Avg_income.*/
select vistid, avg_income, country_name
from visitorprofile_withdob
order by avg_income asc
limit 3;

/*5. Show all the visits where the internet_usage was more than 230 MB 
and time_spent was more than 60. Also, show the day of the week for these visits.*/
select vistid, Time_Spent, Internet_Usage, weekday
from visitdata
where internet_usage > 250 and time_spent>60
limit 10;

/*6. Are there any female visitors from any of the following countries?
- India
- Pakistan
- Sri Lanka
- Fiji
If there are, please list their visit Id, Avg Income, and DOB.*/
select vistid, avg_income, dob,sex
from visitorprofile_withdob
where country_name in ('india','Pakistan','sri lanka','Fiji') and sex= 'F';


select *
from visitorprofile_withdob;
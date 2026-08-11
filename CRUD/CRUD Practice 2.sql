/*1. Create a new database: 
website_visit_db
2. Create two tables in that database: 
visitor_profile
visitID    |     DOB        |    country    |    gender 
111        | 2001-03-22|    India    | Male
222        | 2000-01-31|    USA        | Female        

visit_data
visitID    |    visit_date    |    form_submitted?
111        |    2022-07-22    |    Yes
111        |    2022-06-13    |    No
222        |    2022-04-13    |    Yes    */

create database website_visit_db;
use website_visit_db;

Create Table visitor_profile ( VisitID Integer Primary key, DOB Date Not Null, Country Varchar(50), Gender Varchar(50));
Insert Into Visitor_profile (VisitID, DOB , Country, Gender)
values (111,"2001-03-22","India" ,"Male"),
(222,"2000-01-31","USA ","Female");



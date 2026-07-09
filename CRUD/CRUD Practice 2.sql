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

Create Table visit_data (VisitID Integer not null, Visit_date date not null, form_submitted Varchar(3));
Insert Into Visit_data (VisitID, Visit_date, form_submitted)
Values (111,"2022-07-22","yes"),
(111,"2022-06-13" ,"No"), 
(222,"2022-04-13","Yes");
Select * from Visit_data;

/*3. Show the female visitor profiles (if any)*/
Select *
from visitor_profile
where Gender = "female";

/*4. Show the dates when the visitors submitted the form.*/
Select Visit_date
from Visit_data 
where Form_submitted = "yes";

/*5. Update the visit_data and make the form_submitted as Yes for 2022-06-13 visits.*/
update visit_data
set form_submitted = "yes" 
where visit_date = "2022-06-13";

Select * from visit_data;

Questions on Basic SQL 
/Webanalytics Case - Basic SQL/
/*
Please create a new database webanalytics_db_new
Then, import the two attached CSV files as separate tables.
 
Please import any date columns as text into the database. 

Once imported, please do the following tasks: 
1. Convert any of the date columns from string (text) to date using Str_To_Date() function and update statement.
2. Show the list of top 10 longest visits on the weekends. (Hint: Try to use order by and limit clauses) 
Eg: 
select visitID, internet_usage
from visitdata 
order by internet_usage desc /here order by will sort the data by Internet_Usage in larges tt to smalled values/
limit 3; /limit 3 will ensure it will only show the top 3 internet_usage visits/



SELECT custID,ApplicantIncome,Gender FROM `prabhat-501013.loan_db.customers` LIMIT 3;
/* list the female customers whose income is more than 4000 */

SELECT custID,ApplicantIncome,Gender 
from `loan_db.customers`
where Gender= 'Female'and ApplicantIncome > 4000;

/* 1. Show first five records */
SELECT *
FROM `loan_db.customers`
LIMIT 5;

/* 2. Show only cust_id, gender and applicantincome */
SELECT custID,Gender,ApplicantIncome
FROM `loan_db.customers`
LIMIT 10;

/* 3.Find customers who are graduates*/
SELECT *
FROM `loan_db.customers`
WHERE Education= 'Graduate'
LIMIT 10;

/* 4.Find Female Customers */
SELECT *
FROM `loan_db.customers`
WHERE Gender= 'Female'
LIMIT 10;

/* 5.find Customers with incpome greater than 5000*/
SELECT *
FROM `loan_db.customers`
WHERE ApplicantIncome> 5000
LIMIT 10;

/* 6.Find Female Customers who are graduates */
SELECT *
FROM `loan_db.customers`
WHERE Education= 'Graduate' and Gender= 'Female'
LIMIT 10;

/* 7.Find marrier Customers with credit histoiry =1 */
SELECT *
FROM `loan_db.customers`
WHERE Married = True AND Credit_History = 1
LIMIT 10;

/*8.Find Customers who are graduate or self employed */
SELECT *
FROM `loan_db.customers`
WHERE Education='Graduate' OR Self_Employed= True
LIMIT 10;

/*9. Find Customer who are female or From Rural Area */
SELECT *
FROM `loan_db.customers`
WHERE Gender='Female' OR Property_Area='Rural'
LIMIT 10;

/*10.Find Customers Who are Female and (Graduate or self Employed)*/
SELECT *
FROM `loan_db.customers`
WHERE Gender='Female' and ( Education= 'graduate' or Self_Employed= TRUE )
LIMIT 10;

/*11. Find Customers who are male & married*/
SELECT *
FROM `loan_db.customers`
Where Gender='male' AND Married= TRUE
LIMIT 10;

/*12. Find customers whose income is greater then 6000 and credit history=1 */
SELECT *
FROM `loan_db.customers`
WHERE ApplicantIncome>6000 AND Credit_History=1
LIMIT 10;

/*13.Find Customers who are not graduate or Self Employed*/
SELECT *
FROM `loan_db.customers`
WHERE Education != 'Graduate' OR Self_Employed= false;

/*14.Find customers who are from urban area AND (Married or Crerdit history=1) */
SELECT *
FROM `loan_db.customers`
WHERE Property_Area= 'rural' AND (Married= TRUE OR Credit_History= 1)
LIMIT 1;

/*15. Find customers whose income is less than 3000 or (coapplicant income>2000 and married= yes )*/
SELECT *
FROM `loan_db.customers`
WHERE ApplicantIncome<3000 OR (CoapplicantIncome>2000 AND Married= TRUE )
LIMIT 10;

/*16.List 3 Richest Female customers*/
SELECT custID,Gender,ApplicantIncome
FROM `loan_db.customers`
WHERE Gender='Female'
ORDER BY ApplicantIncome DESC
LIMIT 3;

/*17. Show Total No of msale & female Customers*/
SELECT Gender,count(custID)
FROM `loan_db.customers`
GROUP BY Gender;

/*18.Show List Of Female Customers whose Loans got rejected*/
SELECT l.Loan_ID,l.Loan_Status, custID,Gender
FROM `loan_db.loans` as l INNER JOIN `loan_db.customers` as c ON l.Loan_ID=c.Loan_ID
WHERE l.Loan_Status = false and c.Gender = 'Female' ;

/*19.Show The list of customers who has deposited money and have high credit card balance*/
SELECT deposit.CustID,highbal.CCBalance, highbal.Card_Type ,deposit.DepositAmt
FROM `loan_db.depositcustomers` as deposit inner join `loan_db.highcreditcardbalancecustomers` as highbal on deposit.CustID = highbal.CustID
order by highbal.CCBalance desc;

/*20.Show the total income of Male and Female Customers of the customers whose loans were approved*/
SELECT SUM(cust.ApplicantIncome)as totalincome ,cust.Gender, count(lapproved.Loan_Status) as Totalloans
FROM `loan_db.customers` as cust inner join `loan_db.loans` as lapproved on cust.Loan_ID = lapproved.Loan_ID
WHERE lapproved.Loan_Status = True
GROUP BY cust.Gender, lapproved.Loan_Status;

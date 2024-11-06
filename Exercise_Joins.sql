--Exercise 1)
-- Create Tables
CREATE TABLE merchant(
  merchant_id VARCHAR(255) PRIMARY KEY, 
  merchant_name VARCHAR(255),
  category VARCHAR(255)
);

CREATE TABLE loans(
    merchant_id VARCHAR(255) REFERENCES merchant(merchant_id),
    user_id VARCHAR(255),
    checkout_id VARCHAR(255) PRIMARY KEY,
    checkout_date DATE, 
    loan_amount DECIMAL,
    down_payment_amount DECIMAL,
    user_first_capture VARCHAR(255),
    user_dob_year INT, 
    loan_length_months INT, 
    mdr DECIMAL,
    apr DECIMAL,
    fico_score INT,
    loan_return_percentage DECIMAL
);   

CREATE TABLE funnel (
    merchant_id VARCHAR(255) REFERENCES merchant(merchant_id),
    user_id VARCHAR(255) PRIMARY KEY,
    checkout_id VARCHAR(255) REFERENCES loans(checkout_id),
    action VARCHAR(255),  
    action_date DATE
);

--a) How many users took out loans in May 2016 who were born in the 1980’s? 
--2 Users took out loans in March and were born in the 1980’s
SELECT "user_id" AS "User ID",
	    "checkout_id" AS "Checkout ID",
	    "user_dob" AS "Birth Year",
	    "checkout_date" AS "Checkout Date"
FROM loans
WHERE EXTRACT(MONTH FROM "checkout_date") = 5 AND 
      "user_dob" BETWEEN 1980 AND 1989

--b) What merchant industry had the most dollars loaned to repeat users in 2018?
SELECT  merchant."category" AS "Category",
	    SUM("loan_amount") AS "Total dollars loaned" 
FROM loans
INNER JOIN merchant
ON loans."merchant_id" = merchant."merchant_id"
WHERE EXTRACT(YEAR FROM loans."checkout_date") = 2018
GROUP BY "Category"
ORDER BY "Total dollars loaned" DESC
LIMIT 1

--c) Which merchant saw the second best average loan return percentage for loans taken out in 2018?
SELECT "merchant_id" AS "Merchant",
	   "loan_amount" AS "Loan Amount",
	   "user_dob" AS "Birth Year",
	   "mdr" AS "Merchant Discount Rate",
	   "fico_score" AS "Risk Score",
       "loan_return_percentage" AS "Avg. Loan Return %"
FROM loans
WHERE EXTRACT(YEAR FROM "checkout_date") = 2018
ORDER BY "Avg. Loan Return %" DESC
LIMIT 1
OFFSET 1


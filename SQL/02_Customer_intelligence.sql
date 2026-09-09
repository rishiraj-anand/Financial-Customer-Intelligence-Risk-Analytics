USE amex_analytics;


/* ============================================================
   CUSTOMER INTELLIGENCE & SEGMENTATION
   ============================================================ */


-- Q1: Customer Distribution by Employment Type

SELECT 
     Employment_Type , 
     COUNT(DISTINCT Customer_ID) AS Total_Customers , 
     ROUND(COUNT(DISTINCT Customer_ID)*100.0/(
     SELECT COUNT(DISTINCT Customer_ID) FROM Customers
     ),2) AS Customer_Distribution_pct 
     FROM 
     Customers 
     GROUP BY Employment_Type 
     ORDER BY Customer_Distribution_pct DESC ;


-- Q2:Customer Distribution by State

SELECT 
    State , 
    COUNT(DISTINCT Customer_ID) AS Total_Customers , 
    ROUND(COUNT(DISTINCT Customer_ID)*100.0/(
    SELECT COUNT(DISTINCT Customer_ID) FROM Customers
    ),2) AS Customer_distribution_pct 
    FROM 
    Customers 
    GROUP BY State
    ORDER BY Customer_distribution_pct
    DESC ;
    
-- Q3:Average Income by Employment_Type
SELECT 
     Employment_Type , 
     ROUND(AVG(Annual_Income),2) AS Avg_Income 
     FROM 
     Customers 
     GROUP BY Employment_Type 
     ORDER BY Avg_Income 
     DESC ;


-- Q4:Average Credit_Score by Employment_type
SELECT 
      Employment_Type, 
      ROUND(AVG(Credit_Score),2) AS Avg_Credit_Score 
      FROM Customers 
      GROUP BY Employment_Type 
      ORDER BY Avg_Credit_Score 
      DESC ;


-- Q4:Customer by Credit_Score Segment 

SELECT 
     CASE 
     WHEN Credit_Score < 580 THEN 'Poor'
     WHEN Credit_Score < 670 THEN 'Fair'
     WHEN Credit_Score < 740 THEN 'Good'
     WHEN Credit_Score < 800 THEN 'Very Good'
     ELSE 'Excellent'
     END AS Credit_Segment , 
     COUNT(DISTINCT Customer_ID) AS Total_Customers , 
     ROUND(COUNT(DISTINCT Customer_ID)*100.0/(
     SELECT COUNT(DISTINCT Customer_ID) FROM Customers 
     ),2) AS Customer_Disctribution_Pct 
     FROM Customers 
     GROUP BY 
     CASE 
     WHEN Credit_Score < 580 THEN 'Poor'
     WHEN Credit_Score < 670 THEN 'Fair'
     WHEN Credit_Score < 740 THEN 'Good'
     WHEN Credit_Score < 800 THEN 'very Good'
     ELSE 'Excellent'
     END
     ORDER BY 
      Customer_Disctribution_Pct  DESC ;

-- Q5:Top 10 Customers by Approved Transaction Spending

SELECT 
      c.Customer_ID , 
     ROUND(SUM(t.Transaction_Amount),2) AS Approved_Transaction_Value 
     FROM 
     Customers AS c 
     INNER JOIN 
     transactions AS t
     ON
     c.Customer_ID = t.Customer_ID
	 WHERE t.Transaction_Status='Approved'
     GROUP BY c.Customer_ID 
     ORDER BY Approved_Transaction_Value  DESC 
     LIMIT 10 ;
     

-- Q6 Customers with above-Average transaction spending 
SELECT 
     c.Customer_ID , 
     ROUND(AVG(t.Transaction_Amount),2) AS Customer_Avg_Transaction 
     FROM 
     Customers AS c 
     INNER JOIN 
     transactions AS t 
     ON c.Customer_ID = t.Customer_ID 
     WHERE t.Transaction_Status='Approved'
     GROUP BY c.Customer_ID 
     HAVING ROUND(AVG(t.Transaction_Amount),2) > (
     SELECT AVG(Transaction_Amount) FROM 
     transactions 
     WHERE Transaction_Status='Approved'
     ) ORDER BY Customer_Avg_Transaction
     DESC LIMIT 10 ;
     
     
-- Q7:Customers Card ownership - customers with 1,2,3+ cards 
     
WITH Customers_Card_Counts AS (
SELECT 
      c.Customer_ID , 
      COUNT(ca.Card_ID) AS Numbers_of_Cards 
      FROM 
      Customers AS c 
      INNER JOIN 
      Cards AS ca 
      ON c.Customer_ID = ca.Customer_ID 
      GROUP BY c.Customer_ID
)
SELECT 
     Numbers_of_Cards , 
      COUNT(DISTINCT Customer_ID) AS Total_Customers , 
      ROUND(COUNT(DISTINCT Customer_ID)*100.0/(
      SELECT COUNT(DISTINCT Customer_ID) FROM Customers 
      ),2) AS Customer_Distribution_pct 
      FROM Customers_Card_Counts
      GROUP BY 
      Numbers_of_Cards
      ORDER BY Numbers_of_Cards ;
     
	
     
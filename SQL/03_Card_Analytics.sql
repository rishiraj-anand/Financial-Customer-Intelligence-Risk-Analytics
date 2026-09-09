USE amex_analytics;

/* ============================================================
   CARD PORTFOLIO & STATUS ANALYTICS
   ============================================================ */

-- Q1. How is the card portfolio distributed across card types
--     and card statuses, and what is the active rate for each
--     card type?

SELECT Card_Type , 
       COUNT(*) AS Total_No_Cards , 
       SUM(CASE WHEN Card_Status='Active' THEN 1 ELSE 0 END) AS Active_Cards , 
       SUM(CASE WHEN Card_Status ='Inactive' THEN 1 ELSE 0 END) AS Inactive_Cards , 
       SUM(CASE WHEN Card_Status ='Blocked' THEN 1 ELSE 0 END) AS Blocked_Card , 
       SUM(CASE WHEN Card_Status='Closed' THEN 1 ELSE 0 END) AS Closed_Cards , 
       ROUND(
       (SUM(CASE WHEN Card_Status='Active' THEN 1 ELSE 0 END)*100.0)/COUNT(*),2) AS Active_rate 
       FROM 
       Cards 
       GROUP BY Card_Type 
       ORDER BY Total_No_Cards DESC ;
       
       
-- Q2. How do average and total credit limits vary
--     across different card types?

SELECT 
     Card_Type , 
     ROUND(AVG(Credit_Limit),2) AS Avg_Credit_Limit , 
     ROUND(SUM(Credit_Limit),2) AS Total_Credit_Limit 
     FROM Cards 
     GROUP BY Card_Type 
     ORDER BY Avg_Credit_Limit  DESC ;
     

-- Q3. How does the average annual fee vary across different card types?

SELECT 
     Card_Type , 
     ROUND(AVG(Annual_Fee),2) AS Avg_Annual_Fee 
     FROM 
     Cards 
     GROUP BY Card_Type 
     ORDER BY Avg_Annual_Fee 
     DESC ;

-- Q4. How does approved transaction value vary across card types,
--  and which card types contribute the highest transaction value?

SELECT 
     c.Card_Type ,
     ROUND(SUM(t.Transaction_Amount),2) AS Total_Transaction_Value , 
     ROUND(AVG(t.Transaction_Amount),2) AS Avg_Transaction_Value , 
     RANK() OVER(ORDER BY SUM(t.Transaction_Amount) DESC) AS Transaction_Value_Rank 
     FROM Cards AS c 
     INNER JOIN 
     transactions AS t 
     ON c.Card_ID = t.Card_ID
     WHERE t.Transaction_Status='Approved'
     GROUP BY c.Card_Type ;

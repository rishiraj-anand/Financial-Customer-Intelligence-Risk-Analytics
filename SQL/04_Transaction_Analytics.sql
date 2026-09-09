USE amex_analytics;

/* ============================================================
   TRANSACTION PERFORMANCE ANALYTICS
   ============================================================ */
   
   
-- Q1. Monthly Approved Transaction Performance
-- How do approved transaction volume and transaction value change month over month?


WITH Monthly_analysis AS (
SELECT 
     YEAR(Transaction_Date) AS Years , 
     MONTH(Transaction_Date) AS Month_no , 
     MONTHNAME(Transaction_Date) AS Month_Name , 
     COUNT(Transaction_ID) AS Total_Transactions , 
     ROUND(SUM(Transaction_Amount),2) AS Total_Transaction_Value 
     FROM transactions
     WHERE Transaction_Status='Approved'
     GROUP BY 
     YEAR(Transaction_Date) , 
     MONTH(Transaction_Date),
     MONTHNAME(Transaction_Date)
)
SELECT * , 
LAG(Total_Transaction_Value,1,0) OVER(ORDER BY Years , Month_no ) AS Previous_Transaction_value , 
ROUND((Total_Transaction_Value - LAG(Total_Transaction_Value,1,0)OVER(ORDER BY Years , Month_no))*100.0/
NULLIF(LAG(Total_Transaction_Value ,1,0) OVER(ORDER BY Years , Month_no),0),2) AS Transaction_Value_Growth_pct 
FROM Monthly_analysis ;
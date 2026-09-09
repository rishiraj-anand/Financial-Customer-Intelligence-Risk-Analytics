USE amex_analytics;

/* ============================================================
   PART 1: EXECUTIVE PORTFOLIO & FINANCIAL PERFORMANCE KPIs
   Customer Base | Card Portfolio | Transaction Performance
   Payment Activity | Credit Exposure
   ============================================================ */


-- KPI 1: Total Customers

SELECT 
	COUNT(DISTINCT Customer_ID) AS Total_Customers 
    FROM Customers;


-- KPI 2: Total Cards

SELECT COUNT(DISTINCT Card_ID) AS Total_Cards 
FROM Cards ;


-- KPI 3: Transaction Performance

SELECT 
      COUNT(DISTINCT Transaction_ID ) AS Total_Transactions , 
      SUM(CASE WHEN Transaction_Status='Approved' THEN 1 ELSE 0 END) AS Total_approved_transactions , 
      SUM( CASE WHEN Transaction_Status='Declined' THEN 1 ELSE 0 END) AS Total_declined_transactions , 
      ROUND(SUM(CASE WHEN Transaction_Status='Approved' THEN Transaction_Amount ELSE 0  END ),2) AS Total_approved_transaction_value , 
      ROUND(AVG(CASE WHEN Transaction_Status='Approved' THEN Transaction_Amount ELSE NULL END),2) AS Avg_approved_transaction_value ,
      ROUND(
      (SUM(CASE WHEN Transaction_Status='Approved' THEN 1 ELSE 0 END)*100.0)/COUNT(DISTINCT Transaction_ID),2) AS Approval_rate 
      FROM transactions;

-- KPI 4: Total Payment Amount

SELECT 
     ROUND(SUM(Payment_Amount),2) AS Total_payment_amount 
     FROM Payments;



-- KPI 5: Total Credit Limit

SELECT 
     SUM(Credit_Limit) AS Total_credit_limit 
     FROM Cards ;



-- KPI 6: Active Card Percentage

SELECT 
    ROUND(
    (SUM(CASE WHEN Card_Status='Active' THEN 1 ELSE 0 END)*100.0)/COUNT(DISTINCT Card_ID),2) AS Active_card_pct 
    FROM Cards ;

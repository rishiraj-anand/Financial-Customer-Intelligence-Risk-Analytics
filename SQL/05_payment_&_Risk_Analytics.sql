USE amex_analytics;

SELECT 
     Payment_Status , 
     COUNT(Payment_ID) AS Number_Of_Payments , 
     ROUND(COUNT(Payment_ID)*100.0/(
     SELECT COUNT(payment_ID) FROM payments
     ),2) AS payment_Status_Distribution_Pct 
     FROM 
     payments
     GROUP BY Payment_Status
     ORDER BY Number_Of_Payments
     DESC ;
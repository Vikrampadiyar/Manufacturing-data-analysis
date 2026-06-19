Create database Manufacturing ;
use  Manufacturing ;
select * from  manufecturing;
-- Manufacture Qty
SELECT 
  SUM(`Manufactured Qty`) AS Total_manufacture_Qty
FROM manufecturing;

-- Rejected Qty 
SELECT 
  SUM(`Rejected Qty`) AS Total_Rejected_Qty
FROM manufecturing;

-- processed Qty
SELECT 
   SUM(`processed Qty`) AS Total_processed_Qty
FROM manufecturing;

-- wastage Qty
select
SUM(`Wo Qty`) AS Total_wastage_Qty
FROM manufecturing;

-- Employee wise Rejected Qty
SELECT 
'Emp Name',
SUM(`Rejected Qty`) AS Rejected_Qty    
FROM manufecturing
GROUP BY 'Emp Name'
ORDER BY Rejected_Qty DESC; 

-- Machine wise Rejected Qty
SELECT 
'Machin Name', 
SUM(`Rejected Qty`) AS Rejected_Qty
FROM manufecturing
GROUP BY 'Machin Name' 
ORDER BY Rejected_Qty DESC;

-- Production Comparison Trend 
SELECT `Doc Date`, 
       SUM(`Manufactured Qty`) AS Total_Manufactured, 
       SUM(`Rejected Qty`) AS Total_Rejected 
FROM  manufecturing
GROUP BY `Doc Date`
ORDER BY `Doc Date`;

-- Manufacture Vs. Rejected
SELECT SUM(`Manufactured Qty`) AS Total_Manufactured, 
       SUM(`Rejected Qty`) AS Total_Rejected, 
       (SUM(`Rejected Qty`) / SUM(`Manufactured Qty`)) * 100 AS Rejection_Rate
FROM manufecturing;

-- Department-wise Manufactured Vs. Rejected
SELECT `Department Name`, 
       SUM(`Manufactured Qty`) AS Total_Manufactured, 
       SUM(`Rejected Qty`) AS Total_Rejected, 
       (SUM(`Rejected Qty`) / SUM(`Manufactured Qty`)) * 100 AS Rejection_Rate
FROM manufecturing
GROUP BY `Department Name`
ORDER BY Rejection_Rate DESC;

-- Employee-wise Rejected Quantity 
SELECT `Emp Code`, `Emp Name`, SUM(`Rejected Qty`) AS Total_Rejected
FROM manufecturing
GROUP BY `Emp Code`, `Emp Name`
ORDER BY Total_Rejected DESC;

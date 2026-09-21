CREATE DATABASE IF NOT EXISTS marketing_analysis;
USE marketing_analysis;

CREATE TABLE marketing_campaign (
    ID INT,
    Year_Birth INT,
    Age INT,
    Education VARCHAR(50),
    Marital_Status VARCHAR(50),
    Income DECIMAL(12,2),
    Kidhome INT,
    Teenhome INT,
    Dt_Customer DATE,
    Recency INT,
    MntWines INT,
    MntFruits INT,
    MntMeatProducts INT,
    MntFishProducts INT,
    MntSweetProducts INT,
    MntGoldProds INT,
    NumDealsPurchases INT,
    NumWebPurchases INT,
    NumCatalogPurchases INT,
    NumStorePurchases INT,
    NumWebVisitsMonth INT,
    AcceptedCmp3 INT,
    AcceptedCmp4 INT,
    AcceptedCmp5 INT,
    AcceptedCmp1 INT,
    AcceptedCmp2 INT,
    Complain INT,
    Z_CostContact INT,
    Z_Revenue INT,
    Response INT
    
);
-- Check whether 2,240 rows imported
SELECT COUNT(*) AS total_customers
FROM marketing_campaign;


ALTER TABLE marketing_campaign
MODIFY Income VARCHAR(20);
-- Check the data
SELECT *
FROM marketing_campaign
LIMIT 10;
-- Check the structure
DESCRIBE marketing_campaign;
-- Check duplicate customers
SELECT 
    ID, COUNT(*) AS duplicate_count
FROM
    marketing_campaign
GROUP BY ID
HAVING COUNT(*) > 1;

-- Check missing Income
SELECT 
    COUNT(*) AS missing_income
FROM
    marketing_campaign
WHERE
    Income IS NULL OR Income = ''
        OR TRIM(Income) = '';
   
-- How many customers are there?

SELECT COUNT(*) AS total_customers
FROM marketing_campaign;

-- What is the average customer age?

SELECT 
    ROUND(AVG(Age), 0) AS average_age
FROM
    marketing_campaign;

-- What is the youngest and oldest customer?
SELECT 
    MIN(Age) AS minimum_age, MAX(Age) AS maximum_age
FROM
    marketing_campaign;

-- EDUCATION

SELECT 
    Education, COUNT(*) AS customer_count
FROM
    marketing_campaign
GROUP BY Education
ORDER BY customer_count DESC;

-- MARITAL STATUS

SELECT 
    Marital_Status, COUNT(*) AS customer_count
FROM
    marketing_campaign
GROUP BY Marital_Status
ORDER BY customer_count DESC;

-- INCOME ANALYSIS

SELECT 
    ROUND(AVG(Income), 2) AS average_income
FROM
    marketing_campaign
WHERE
    Income IS NOT NULL;

-- Minimum and maximum income
SELECT 
    MIN(Income) AS minimum_income, MAX(Income) AS maximum_income
FROM
    marketing_campaign
WHERE
    Income IS NOT NULL;

-- PRODUCT SPENDING

SELECT 
    SUM(MntWines) AS total_wines,
    SUM(MntFruits) AS total_fruits,
    SUM(MntMeatProducts) AS total_meat,
    SUM(MntFishProducts) AS total_fish,
    SUM(MntSweetProducts) AS total_sweets,
    SUM(MntGoldProds) AS total_gold
FROM
    marketing_campaign;

SELECT 
    'Wines' AS product_category, SUM(MntWines) AS total_spending
FROM
    marketing_campaign 
UNION ALL SELECT 
    'Fruits', SUM(MntFruits)
FROM
    marketing_campaign 
UNION ALL SELECT 
    'Meat', SUM(MntMeatProducts)
FROM
    marketing_campaign 
UNION ALL SELECT 
    'Fish', SUM(MntFishProducts)
FROM
    marketing_campaign 
UNION ALL SELECT 
    'Sweets', SUM(MntSweetProducts)
FROM
    marketing_campaign 
UNION ALL SELECT 
    'Gold', SUM(MntGoldProds)
FROM
    marketing_campaign
ORDER BY total_spending DESC;

-- PURCHASE CHANNEL ANALYSIS
SELECT
    SUM(NumWebPurchases) AS web_purchases,
    SUM(NumCatalogPurchases) AS catalog_purchases,
    SUM(NumStorePurchases) AS store_purchases
FROM marketing_campaign;

SELECT 
    'Web' AS purchase_channel,
    SUM(NumWebPurchases) AS total_purchases
FROM
    marketing_campaign 
UNION ALL SELECT 
    'Catalog', SUM(NumCatalogPurchases)
FROM
    marketing_campaign 
UNION ALL SELECT 
    'Store', SUM(NumStorePurchases)
FROM
    marketing_campaign
ORDER BY total_purchases DESC;

-- WEBSITE BEHAVIOR

SELECT
    ROUND(AVG(NumWebVisitsMonth), 2) AS average_monthly_visits,
    MIN(NumWebVisitsMonth) AS minimum_visits,
    MAX(NumWebVisitsMonth) AS maximum_visits
FROM marketing_campaign;

-- MARKETING CAMPAIGN ANALYSIS

SELECT 
    Response, COUNT(*) AS customer_count
FROM
    marketing_campaign
GROUP BY Response;

-- Calculate response rate

SELECT 
    ROUND(SUM(CASE
                WHEN Response = 1 THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS response_rate
FROM
    marketing_campaign;
    
-- CAMPAIGN ACCEPTANCE

SELECT 
    SUM(AcceptedCmp1) AS Campaign_1,
    SUM(AcceptedCmp2) AS Campaign_2,
    SUM(AcceptedCmp3) AS Campaign_3,
    SUM(AcceptedCmp4) AS Campaign_4,
    SUM(AcceptedCmp5) AS Campaign_5
FROM
    marketing_campaign;
    
-- TOTAL CUSTOMER SPENDING

SELECT 
    ID,
    Age,
    Income,
    (MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spending
FROM
    marketing_campaign;
    
-- Average customer spending

SELECT 
    ROUND(AVG(MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds),
            2) AS average_total_spending
FROM
    marketing_campaign;
    
-- Top 10 customers by spending

SELECT 
    ID,
    Age,
    Income,
    (MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds) AS total_spending
FROM
    marketing_campaign
ORDER BY total_spending DESC
LIMIT 10;

-- AGE GROUP ANALYSIS

SELECT 
    CASE
        WHEN Age < 30 THEN 'Under 30'
        WHEN Age BETWEEN 30 AND 39 THEN '30-39'
        WHEN Age BETWEEN 40 AND 49 THEN '40-49'
        WHEN Age BETWEEN 50 AND 59 THEN '50-59'
        ELSE '60+'
    END AS age_group,
    COUNT(*) AS customer_count
FROM
    marketing_campaign
GROUP BY age_group
ORDER BY customer_count DESC;

-- INCOME GROUP VS SPENDING

SELECT 
    CASE
        WHEN Income < 30000 THEN 'Low Income'
        WHEN Income < 60000 THEN 'Medium Income'
        ELSE 'High Income'
    END AS income_group,
    COUNT(*) AS customers,
    ROUND(AVG(MntWines + MntFruits + MntMeatProducts + MntFishProducts + MntSweetProducts + MntGoldProds),
            2) AS average_spending
FROM
    marketing_campaign
WHERE
    Income IS NOT NULL
GROUP BY income_group
ORDER BY average_spending DESC;

-- FIND ANOMALIES
SELECT 
    ID, Year_Birth, Age, Income
FROM
    marketing_campaign
WHERE
    Age > 100
ORDER BY Age DESC;

-- HIGH INCOME VALUES

SELECT 
    ID, Income, Age
FROM
    marketing_campaign
WHERE
    Income IS NOT NULL
ORDER BY Income DESC
LIMIT 10;

-- WEBSITE VISITS VS WEB PURCHASES
SELECT 
    NumWebVisitsMonth,
    COUNT(*) AS customers,
    ROUND(AVG(NumWebPurchases), 2) AS avg_web_purchases
FROM
    marketing_campaign
GROUP BY NumWebVisitsMonth
ORDER BY NumWebVisitsMonth;

UPDATE marketing_campaign 
SET 
    Income = NULL
WHERE
    TRIM(Income) = '';

ALTER TABLE marketing_campaign
MODIFY Income DECIMAL(12,2) NULL;

SELECT COUNT(*) AS total_customers
FROM marketing_campaign;

SELECT COUNT(*) AS missing_income
FROM marketing_campaign
WHERE Income IS NULL;
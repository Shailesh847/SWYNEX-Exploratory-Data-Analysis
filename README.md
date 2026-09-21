Customer Marketing Campaign - Exploratory Data Analysis
Project Overview

After completing the data cleaning and preparation stage, the next question was not simply "What does the dataset contain?" but rather:

What can the data tell us about the customers, their spending behavior, purchasing channels, and response to marketing campaigns?

This project is the second task of my Data Analyst Internship at SWYNEX Technologies, where I performed Exploratory Data Analysis (EDA) on a customer marketing dataset using MySQL and SQL.

The analysis started with a cleaned dataset containing 2,240 customer records and information about customer demographics, income, purchasing behavior, product spending, website activity, and marketing campaign responses.

Instead of looking at individual records one by one, I used SQL to turn the raw customer-level data into meaningful summaries, comparisons, patterns, and potential anomalies.

The overall analytical journey was:

Cleaned Data → Data Validation → Descriptive Statistics → Customer Analysis → Spending Analysis → Purchase Channel Analysis → Campaign Analysis → Relationship Analysis → Anomaly Detection → Business Insights

Objective

The main objective of this project was to perform exploratory analysis and understand what patterns exist within the customer marketing dataset.

The analysis focused on:

Understanding the customer profile
Analyzing age, education, and marital status
Examining income distribution
Understanding product spending behavior
Comparing purchasing channels
Measuring marketing campaign response
Comparing customer spending across income groups
Identifying high-spending customers
Investigating website visits and web purchases
Detecting potential data-quality anomalies
Converting SQL results into meaningful business insights
Dataset

The dataset contains 2,240 customer records.

Each record represents an individual customer and contains information related to:

Customer Demographics
ID
Year of Birth
Age
Education
Marital Status
Household Information
Income
Kidhome
Teenhome
Customer Information
Customer enrollment date
Recency
Product Spending
Wines
Fruits
Meat Products
Fish Products
Sweet Products
Gold Products
Purchasing Behavior
Deals Purchases
Web Purchases
Catalog Purchases
Store Purchases
Website Visits
Marketing Campaigns
Campaign 1
Campaign 2
Campaign 3
Campaign 4
Campaign 5
Response
Data Quality / Supporting Fields
Complain
Z_CostContact
Z_Revenue
Tools & Technologies
Tool	Purpose
MySQL	Database and SQL analysis
MySQL Workbench	Writing and executing SQL queries
Microsoft Excel	Data preparation and visualization
GitHub	Project documentation and version control
Analytical Approach

I followed a structured EDA process rather than immediately creating charts.

1. Data Validation

Before analyzing the data, I checked whether the imported dataset contained the expected number of records and whether the customer IDs were unique.

2. Descriptive Analysis

I calculated:

Customer count
Average age
Minimum and maximum age
Average income
Minimum and maximum income
3. Customer Segmentation

I analyzed customers based on:

Education
Marital status
Age groups
Income groups
4. Spending Analysis

I compared spending across:

Wines
Meat
Gold
Fish
Sweets
Fruits
5. Channel Analysis

I compared:

Store purchases
Web purchases
Catalog purchases
6. Marketing Analysis

I analyzed:

Overall campaign response
Campaign acceptance
Response rate
7. Relationship Analysis

I investigated:

Income group vs average spending
Website visits vs web purchases
8. Anomaly Detection

I searched for:

Unusually high ages
Extremely high income values
Potential data-quality issues
Data Validation

Before moving into business analysis, I first checked whether the dataset had been imported correctly.

Total Customers

The dataset contains:

2,240 customers

Duplicate Customer IDs

The duplicate-ID query returned:

0 duplicate IDs

This confirmed that each customer ID appeared only once.

Missing Income

The dataset contains:

24 missing Income values

These values were kept as missing rather than replacing them with zero or an arbitrary value.

This is important because a missing income value does not mean that the customer's income was zero.

Customer Profile

The first analytical question was:

Who are the customers in this dataset?

Understanding the customer profile provides context before analyzing their purchasing behavior.

Education Distribution

The education breakdown was:

Education	Customers
Graduate	1,330
PhD	486
Master	370
Basic	54
Insight

Graduate customers form the largest education group, with 1,330 customers, representing approximately 59.4% of the customer base.

This gives us an important understanding of the overall customer composition.

However, education distribution alone does not tell us whether one education group spends more or responds better to campaigns. That would require additional comparative analysis.

Marital Status Distribution
Marital Status	Customers
Married	1,444
Single	487
Divorced	232
Widowed	77
Insight

Married customers represent the largest marital-status group, with 1,444 customers, approximately 64.5% of the dataset.

This indicates that the customer base is largely represented by married customers.

Age Analysis

The average customer age was approximately:

56.19 years

The calculated age range was:

Minimum: 29
Maximum: 132

To understand the distribution more clearly, customers were divided into age groups.

Age Group	Customers
60+	860
50–59	685
40–49	506
30–39	187
Under 30	2
Insight

Customers aged 60 and above form the largest age group, with 860 customers. Only two customers fall below the age of 30.

This shows that the dataset is heavily concentrated toward older customers.

Income Analysis

The income analysis showed:

Metric	Value
Average Income	52,247.25
Minimum Income	1,730
Maximum Income	666,666

The average income provides a general understanding of the customer base, while the maximum value requires additional investigation.

An income of 666,666 is substantially higher than the other high-income records and was therefore treated as a potential data-quality outlier.

Rather than automatically deleting it, I flagged it for further investigation.

Product Spending Analysis

One of the main questions in the analysis was:

Which products account for the highest customer spending?

The analysis covered six product categories.

Product Category	Total Spending
Wines	680,816
Meat	373,968
Gold	98,609
Fish	84,057
Sweets	60,621
Fruits	58,917
Key Finding

Wine is the largest spending category, with total spending of 680,816.

It represents approximately 50.2% of the total spending across the six analyzed product categories.

Meat products are the second-largest category at 373,968.

This creates a clear difference between the highest-spending categories and the remaining product categories.

Analytical Story

The spending data shows that customer purchasing behavior is not evenly distributed across product categories.

A large proportion of spending is concentrated in wines and meat products, while fruits and sweets account for considerably smaller amounts.

This could be useful for further analysis of product preferences, customer segments, and cross-selling opportunities.

Purchase Channel Analysis

Customers made purchases through three primary channels:

Store
Web
Catalog

The analysis showed:

Purchase Channel	Purchases
Store	12,970
Web	9,150
Catalog	5,963
Key Finding

Store purchases were the largest purchasing channel, with 12,970 purchases.

Approximately:

Store: 46.2%
Web: 32.6%
Catalog: 21.2%

of the purchases across these three channels.

Analytical Story

Although online purchasing is a significant part of customer behavior, the store channel has the largest number of recorded purchases in this dataset.

This provides a useful starting point for comparing customer behavior across physical and digital channels.

Website Behavior

I also analyzed monthly website visits.

The results showed:

Average monthly visits: 5.32
Minimum visits: 0
Maximum visits: 20

This provides a baseline understanding of customer website engagement.

I also analyzed website visits against web purchases to investigate whether customers with different visit frequencies showed different average web-purchasing behavior.

This analysis describes an observed relationship in the dataset; it does not establish that website visits cause purchases.

Marketing Campaign Analysis

The next question was:

How did customers respond to the marketing campaign?

The Response field was analyzed using SQL.

Response	Customers
No Response	1,906
Response	334
Response Rate

The calculated response rate was:

14.91%

Key Finding

334 out of 2,240 customers responded to the campaign represented by the Response field, resulting in a response rate of approximately 14.91%.

Rather than labeling this response rate as good or bad, I used it as a descriptive measure of customer response within this dataset.

A meaningful performance judgment would require additional information such as campaign cost, industry benchmarks, campaign exposure, and historical performance.

Campaign Acceptance Analysis

The five campaign acceptance counts were:

Campaign	Accepted Customers
Campaign 1	144
Campaign 2	30
Campaign 3	163
Campaign 4	167
Campaign 5	163
Finding

Campaign acceptance varied considerably.

The observed acceptance counts ranged from:

30 customers to 167 customers.

Campaign 4 had the highest raw acceptance count, while Campaign 2 had the lowest.

However, I did not interpret the highest raw count as automatically meaning that the campaign was the most effective.

A deeper campaign comparison would require information about the number of customers targeted or exposed to each campaign.

Income Group vs Customer Spending

To explore the relationship between income and spending, customers were divided into three income groups:

Low Income: < 30,000
Medium Income: 30,000–59,999
High Income: 60,000+

The results were:

Income Group	Customers	Average Spending
Low Income	370	72.18
Medium Income	1,004	298.24
High Income	842	1,210.37
Key Finding

Average spending increases substantially across the defined income groups.

Average spending increased from:

72.18 → 298.24 → 1,210.37

as the income group increased.

Analytical Story

This is one of the strongest relationships observed during the EDA.

The pattern suggests that higher-income customers in this dataset tend to have substantially higher average product spending.

However, this analysis identifies an association, not causation. Income alone may not explain the entire difference in spending.

Further analysis could investigate age, household composition, product preference, and campaign response alongside income.

High-Spending Customers

I also calculated total spending for every customer by combining spending across:

Wines
Fruits
Meat
Fish
Sweets
Gold

The resulting total_spending metric allowed me to identify the highest-spending customers.

This helped move the analysis from category-level totals toward individual customer behavior.

The top-spending customers can be used in future analysis to investigate:

Their income
Age
Education
Product preferences
Purchase channels
Campaign responses

This could support a more detailed customer segmentation analysis in a future project.

Anomaly Detection

EDA is not only about finding positive trends. It is also about finding values that require investigation.

Age Anomalies

The analysis identified three customers with calculated ages above 100.

ID	Year of Birth	Calculated Age
11004	1893	132
1150	1899	126
7829	1900	125

These records were flagged as potential data-quality anomalies.

They were not automatically deleted because an unusual value should first be investigated rather than removed without understanding its origin.

Income Anomaly

The dataset contains an income value of:

666,666

This is substantially higher than the other high-income observations and was therefore flagged for investigation.

Again, the purpose of EDA is to identify such records so that they can be reviewed before making a decision about whether they should be corrected or removed.

Key Insights Summary

The analysis produced several important findings:

1. Customer Profile

Graduate customers represent approximately 59.4% of the customer base, making them the largest education group.

2. Marital Status

Married customers represent approximately 64.5% of the dataset.

3. Age Distribution

Customers aged 60+ form the largest age group with 860 customers.

4. Product Spending

Wines generated 680,816 in total spending and represented approximately 50.2% of spending across the six product categories.

5. Purchase Channels

Store purchases were the largest channel, with 12,970 purchases, representing approximately 46.2% of purchases across the three analyzed channels.

6. Marketing Response

The campaign response rate was 14.91%, with 334 customers responding.

7. Income and Spending

Average spending increased substantially across the defined income groups, from 72.18 for low-income customers to 1,210.37 for high-income customers.

8. Data Quality

Three records contained calculated ages above 100, and an income value of 666,666 was identified as a potential outlier.

SQL Analysis Performed

The project includes SQL queries for:

Data Validation
├── Customer count
├── Duplicate ID detection
└── Missing Income detection

Descriptive Statistics
├── Average Age
├── Minimum Age
├── Maximum Age
├── Average Income
├── Minimum Income
└── Maximum Income

Customer Analysis
├── Education distribution
├── Marital Status distribution
└── Age groups

Spending Analysis
├── Product category spending
├── Total customer spending
├── Average customer spending
└── Top 10 customers by spending

Purchase Analysis
├── Web purchases
├── Catalog purchases
└── Store purchases

Marketing Analysis
├── Campaign response
├── Response rate
└── Campaign acceptance

Relationship Analysis
├── Income group vs spending
└── Website visits vs web purchases

Anomaly Detection
├── Age anomalies
└── High-income values
Visualizations

The SQL results were used to create visualizations for the major findings.

The analysis includes charts for:

Customer distribution by education
Customer distribution by age group
Spending by product category
Purchases by channel
Campaign acceptance
Average spending by income group

The purpose of the charts was not simply to make the project visual, but to make the patterns discovered through SQL easier to understand.

Key SQL Concepts Used

Through this project, I practiced:

SELECT
WHERE
GROUP BY
ORDER BY
COUNT()
SUM()
AVG()
MIN()
MAX()
ROUND()
CASE
UNION ALL
HAVING
LIMIT
IS NULL
TRIM()
Conditional aggregation using CASE
Calculated fields
Data validation
Anomaly detection
What I Learned

This project helped me understand that Exploratory Data Analysis is not simply about creating charts.

The important part is the process behind the chart:

Ask a question → Write a SQL query → Examine the result → Find a pattern → Validate the finding → Explain what it means.

I also learned that unusual values should not automatically be deleted. A potential anomaly needs to be investigated and understood before making a data-cleaning decision.

The project also helped me become more comfortable using SQL to move from individual customer records to aggregated business-level insights.

Business Questions Answered

Through this analysis, I was able to answer questions such as:

Who are the customers?

The customer base is largely made up of older customers, with the 60+ group being the largest age segment.

What products generate the most spending?

Wine products have the highest total spending among the six product categories analyzed.

How do customers purchase?

Store purchases represent the largest share among store, web, and catalog purchases.

How are customers responding to marketing?

The observed campaign response rate is 14.91%.

Does spending differ across income groups?

Yes. The defined income groups show substantial differences in average spending.

Are there unusual records?

Yes. Three age records and one unusually high income value were flagged for further investigation.

Future Analysis

This EDA provides a foundation for deeper analysis.

Future improvements could include:

Customer segmentation using RFM analysis
Customer lifetime value analysis
Campaign response by customer segment
Product preference by income group
Web vs store customer behavior
Correlation analysis between income and spending
Customer clustering
Predicting campaign response
Building an interactive Power BI dashboard
Creating a customer-level marketing recommendation analysis
Conclusion

This project transformed a cleaned customer dataset into a structured analytical story using SQL.

The analysis showed that customer behavior is not evenly distributed. Spending is concentrated heavily in wine and meat products, store purchases represent the largest purchasing channel, and higher-income groups show substantially higher average spending within the defined segments.

At the same time, the analysis revealed important data-quality observations, including unusually high calculated ages and an extreme income value.

The biggest learning from this project was that SQL is not only a tool for retrieving data. It can be used to ask business questions, validate assumptions, compare customer groups, identify patterns, investigate anomalies, and turn raw records into useful information for decision-making.

Author

Shailesh Kumar Verma

Aspiring Data Analyst | SQL | Excel | Power BI | Tableau

GitHub: https://github.com/Shailesh847

Project Repository: https://github.com/Shailesh847/SWYNEX-Exploratory-Data-Analysis

This project was completed as part of my Data Analyst Internship at SWYNEX Technologies.

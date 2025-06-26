# Financial-Inclusion-Microloan-Tracker
A SQL project analyzing microloan trends, disbursement, and repayment behavior.
🚀 Project Overview

Goal:-
To extract meaningful insights from microfinance data using SQL—such as which sectors receive the most loans, how repayment performance varies by region or partner, and how gender or time affects loan trends.

Use Case:-
Inspired by real-world platforms like Kiva.org, this project simulates a real-world financial dataset and uses SQL for comprehensive data analysis.

📂 Folder Structure:-
Financial-Inclusion-SQL-Project/
    ─ 1_schema_and_import.sql           # Table creation and data import statements
    ─ 2_exploration_and_patterns.sql    # Basic SELECTs: sectors, gender, term, country trends
    ─ 3_analysis_queries.sql            # Aggregated loan amounts, averages, group by insights
    ─ 4_loan_insights.sql               # Loan term, size, monthly trends, gender split
    ─ 5_join_analysis_queries.sql       # JOINs across borrowers, lenders, field partners
    ─ 6_business_insights.sql           # Repayment trends, partner ratings, risk profiles
    ─ 7_advanced_insights.sql           # CTEs, window functions, rankings, rolling averages                      
datasets used in import
    ─ loans.csv
    ─ repayments.csv
    ─ borrowers.csv
    ─ field_partners.csv
    ─ lenders.csv
─ README.md                            # Project documentation and insights summary─ data/    

⚙️ Setup:-
- Ensure you have MySQL installed (e.g., MySQL Workbench).
- Create a new database and run `1_schema_and_import.sql` to load all tables and data.
- Execute analysis files (`2_exploratory_analysis.sql`, `3_joins_and_relationships.sql`, `4_advanced_queries.sql`) for insights.

                     
🔧 Tools Used:-
Language: SQL (MySQL)
Platform: MySQL Workbench
Data Type: Relational tables (.csv)
Skills Demonstrated: Joins, Aggregations, Grouping, CTEs, Time Series, Conditional Logic

📦 Dataset: Simulated financial dataset modeled on real-world microloan platforms such as Kiva.org.

🔍 Key Analyses:-
🧪1. Exploratory Queries
Top sectors by total loan amount
Loan distribution by gender
Average loan by country
Loan duration analysis
Monthly trends in loan issuance

🔗 2. Join-Based Insights
Total repaid per country
Partner performance based on on-time repayments
Repayment behavior by borrower type
Lender activity across regions

🧠 3. Advanced SQL Queries
Rolling loan growth by month (CTEs)
Country ranking by repayment and disbursement
Detection of loan defaults and late repayments
Percentage of loans by sector over time (Window Functions)

💡 Sample Advanced Query:-
```sql
-- Rolling loan disbursement growth by month
WITH monthly_loans AS (
    SELECT DATE_FORMAT(posted_time, '%Y-%m') AS month,
           SUM(loan_amount) AS total_amount
    FROM loans
    GROUP BY month
)
SELECT month,
       total_amount,
       LAG(total_amount) OVER (ORDER BY month) AS previous_month,
       ROUND((total_amount - LAG(total_amount) OVER (ORDER BY month)) / 
             LAG(total_amount) OVER (ORDER BY month) * 100, 2) AS growth_percent
FROM monthly_loans;

✅Key Outcomes & Insights:-
📊 Loan Sector Trends: Agriculture and Retail sectors consistently receive the highest loan amounts, highlighting focus areas for microfinance programs.

🌍 Country-wise Loan Insights: Countries like Kenya, Philippines, and Peru show higher average loan sizes—indicating stronger borrower engagement or higher cost-of-living.

👥 Gender Participation: Women dominate borrowing activity, aligning with global microfinance strategies that prioritize women’s economic empowerment.

⏱ Loan Duration & Timelines: Majority of loans are short-term (6–12 months), reflecting the rapid turnover typical of microcredit systems.

💰 Repayment Patterns: On-time repayment rates vary significantly by field partner—useful for assessing risk and partner performance.

📈 Monthly Loan Trends: Loan disbursements show consistent monthly growth, hinting at program expansion or seasonal financial needs.

🚩 Default Detection (Advanced): Used CASE and filters to identify late or missed repayments, allowing risk profiling for borrowers or partners.




-- 1. Top 10 Sectors by Total Loan Amount
-- This query helps identify the sectors that received the highest funding overall.
SELECT sector, SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY sector
ORDER BY total_loan_amount DESC
LIMIT 10;

-- 2. Average Loan Amount by Country
-- This query calculates the average loan size per country.
SELECT country, ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM loans
GROUP BY country
ORDER BY avg_loan_amount DESC
LIMIT 10;

-- 3. Number of Loans by Borrower Gender
-- This shows how loans are distributed across borrower genders.
SELECT borrower_genders, COUNT(*) AS count
FROM loans
GROUP BY borrower_genders
ORDER BY count DESC;

-- 4. Loan Term Distribution
-- This query shows how loan terms are distributed, helping us understand popular durations.
SELECT term_in_months, COUNT(*) AS num_loans
FROM loans
GROUP BY term_in_months
ORDER BY num_loans DESC;

-- 5. Monthly Loan Posting Trends
-- This time-series analysis shows the number of loans posted each month.
SELECT DATE_FORMAT(posted_time, '%Y-%m') AS loan_month,
       COUNT(*) AS total_loans
FROM loans
GROUP BY loan_month
ORDER BY loan_month;

-- 6. Top 10 Countries by Number of Loans
-- Useful to know which countries received the most number of loans.
SELECT country, COUNT(*) AS loan_count
FROM loans
GROUP BY country
ORDER BY loan_count DESC
LIMIT 10;

-- 7. Top 10 Partners by Total Funded Amount
-- Shows which field partners are associated with the most funding.
SELECT partner_id, SUM(funded_amount) AS total_funded
FROM loans
GROUP BY partner_id
ORDER BY total_funded DESC
LIMIT 10;

-- 8. Currency-wise Loan Distribution
-- Helps understand currency diversity in loans.
SELECT currency, COUNT(*) AS loan_count
FROM loans
GROUP BY currency
ORDER BY loan_count DESC;

-- 9. Regional Loan Amount Summary
-- Gives insights into funding distribution by region.
SELECT region, SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY region
ORDER BY total_loan_amount DESC;

-- 10. Repayment Interval Patterns
-- Examines how often borrowers repay (weekly, monthly, etc.)
SELECT repayment_interval, COUNT(*) AS count
FROM loans
GROUP BY repayment_interval
ORDER BY count DESC;

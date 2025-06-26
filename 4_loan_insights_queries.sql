-- 1. Top 10 Sectors by Total Loan Amount
SELECT sector, SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY sector
ORDER BY total_loan_amount DESC
LIMIT 10;

-- 2. Average Loan Amount by Country
SELECT country, ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM loans
GROUP BY country
ORDER BY avg_loan_amount DESC
LIMIT 10;

-- 3. Loan Distribution by Gender
SELECT borrower_genders, COUNT(*) AS loan_count
FROM loans
GROUP BY borrower_genders
ORDER BY loan_count DESC;

-- 4. Loan Term Distribution (in months)
SELECT term_in_months, COUNT(*) AS num_loans
FROM loans
GROUP BY term_in_months
ORDER BY num_loans DESC;

-- 5. Monthly Loan Trends (Time Series)
SELECT DATE_FORMAT(posted_time, '%Y-%m') AS loan_month,
       COUNT(*) AS total_loans
FROM loans
GROUP BY loan_month
ORDER BY loan_month;

-- 6. Top 10 Countries by Number of Loans
SELECT country, COUNT(*) AS total_loans
FROM loans
GROUP BY country
ORDER BY total_loans DESC
LIMIT 10;

-- 7. Funding vs Loan Amount Gap by Country
SELECT country, 
       ROUND(SUM(loan_amount - funded_amount), 2) AS funding_gap
FROM loans
GROUP BY country
ORDER BY funding_gap DESC
LIMIT 10;

-- 8. Field Partner Performance: Repayment Rate
SELECT partner_name, repayment_rate, loan_count
FROM field_partners
ORDER BY repayment_rate DESC
LIMIT 10;

-- 9. Average Loan Duration by Sector
SELECT sector, AVG(term_in_months) AS avg_loan_duration
FROM loans
GROUP BY sector
ORDER BY avg_loan_duration DESC;

-- 10. Gender-wise Average Loan Amount
SELECT borrower_genders, ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM loans
GROUP BY borrower_genders;

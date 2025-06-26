-- 1. Top 5 countries with the highest average loan term
SELECT country, AVG(term_in_months) AS avg_term
FROM loans
GROUP BY country
ORDER BY avg_term DESC
LIMIT 5;
-- 2. Repayment behavior by gender
SELECT b.gender, r.status, COUNT(*) AS total_repayments
FROM borrowers b
JOIN repayments r ON b.borrower_id = r.borrower_id
GROUP BY b.gender, r.status
ORDER BY b.gender, total_repayments DESC;
-- 3. Partner-wise average loan size and their repayment rate
SELECT fp.partner_name, 
       ROUND(AVG(l.loan_amount), 2) AS avg_loan_amount, 
       fp.repayment_rate
FROM loans l
JOIN field_partners fp ON l.partner_id = fp.partner_id
GROUP BY fp.partner_name
ORDER BY avg_loan_amount DESC;
-- 4. Most funded activities across all regions
SELECT activity, SUM(funded_amount) AS total_funding
FROM loans
GROUP BY activity
ORDER BY total_funding DESC
LIMIT 10;
-- 5. Average delay (in days) in late repayments by country
SELECT l.country,
       ROUND(AVG(DATEDIFF(r.paid_date, r.due_date)), 2) AS avg_delay_days
FROM loans l
JOIN repayments r ON l.id = r.loan_id
WHERE r.status = 'late'
GROUP BY l.country
ORDER BY avg_delay_days DESC
LIMIT 10;

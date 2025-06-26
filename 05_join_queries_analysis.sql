-- 1. Join loans with field partners to see which partner gave the highest total loans
SELECT fp.partner_name, SUM(l.loan_amount) AS total_loans
FROM loans l
JOIN field_partners fp ON l.partner_id = fp.partner_id
GROUP BY fp.partner_name
ORDER BY total_loans DESC
LIMIT 10;

-- 2. Average loan amount by partner rating
SELECT fp.rating, ROUND(AVG(l.loan_amount), 2) AS avg_loan_amount
FROM loans l
JOIN field_partners fp ON l.partner_id = fp.partner_id
GROUP BY fp.rating
ORDER BY fp.rating DESC;

-- 3. Gender-wise loan repayment behavior
SELECT b.gender, r.status, COUNT(*) AS num_repayments
FROM repayments r
JOIN borrowers b ON r.borrower_id = b.borrower_id
GROUP BY b.gender, r.status
ORDER BY num_repayments DESC;

-- 4. Total amount repaid per country
SELECT l.country, SUM(r.amount_paid) AS total_repaid
FROM loans l
JOIN repayments r ON l.id = r.loan_id
GROUP BY l.country
ORDER BY total_repaid DESC
LIMIT 10;

-- 5. Top lenders by total contribution
SELECT l.name, SUM(l.amount_contributed) AS total_contribution
FROM lenders l
GROUP BY l.name
ORDER BY total_contribution DESC
LIMIT 10;

-- 6. Loan default rate by region
SELECT l.region,
       COUNT(CASE WHEN r.status = 'missed' THEN 1 END) AS missed_repayments,
       COUNT(*) AS total_repayments,
       ROUND(COUNT(CASE WHEN r.status = 'missed' THEN 1 END) / COUNT(*) * 100, 2) AS default_rate_percentage
FROM loans l
JOIN repayments r ON l.id = r.loan_id
GROUP BY l.region
ORDER BY default_rate_percentage DESC;

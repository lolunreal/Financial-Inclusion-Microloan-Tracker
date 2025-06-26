USE kiva_microloans;
SELECT * FROM loans LIMIT 10;
SELECT * FROM borrowers LIMIT 10;
SELECT * FROM field_partners LIMIT 10;
SELECT * FROM repayments LIMIT 10;
SELECT * FROM lenders LIMIT 10;
-- STEP 1: Preview the data
SELECT * FROM loans LIMIT 10;

-- STEP 2: Total number of loans
SELECT COUNT(*) AS total_loans FROM loans;

-- STEP 3: Top 10 countries by number of loans
SELECT country, COUNT(*) AS num_loans
FROM loans
GROUP BY country
ORDER BY num_loans DESC
LIMIT 10;





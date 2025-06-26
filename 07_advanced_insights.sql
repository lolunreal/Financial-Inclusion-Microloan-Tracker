-- 1. Categorize repayments by delay duration
SELECT 
  CASE 
    WHEN DATEDIFF(paid_date, due_date) <= 0 THEN 'On-time or Early'
    WHEN DATEDIFF(paid_date, due_date) BETWEEN 1 AND 7 THEN '1-7 days late'
    WHEN DATEDIFF(paid_date, due_date) BETWEEN 8 AND 30 THEN '8-30 days late'
    ELSE 'Over 30 days late'
  END AS delay_category,
  COUNT(*) AS num_repayments
FROM repayments
WHERE paid_date IS NOT NULL AND due_date IS NOT NULL
GROUP BY delay_category
ORDER BY num_repayments DESC;
-- 2. Default rate (missed repayments) by field partner rating tier
SELECT 
  CASE 
    WHEN fp.rating >= 4 THEN 'High-rated'
    WHEN fp.rating BETWEEN 2 AND 3.99 THEN 'Medium-rated'
    ELSE 'Low-rated'
  END AS rating_group,
  COUNT(CASE WHEN r.status = 'missed' THEN 1 END) AS missed_repayments,
  COUNT(*) AS total_repayments,
  ROUND(COUNT(CASE WHEN r.status = 'missed' THEN 1 END) / COUNT(*) * 100, 2) AS default_rate_percentage
FROM repayments r
JOIN loans l ON r.loan_id = l.id
JOIN field_partners fp ON l.partner_id = fp.partner_id
GROUP BY rating_group
ORDER BY default_rate_percentage DESC;
-- 3. Average time (in days) to fund loans, by sector
SELECT 
  sector,
  ROUND(AVG(DATEDIFF(funded_time, posted_time)), 2) AS avg_days_to_fund,
  COUNT(*) AS total_loans
FROM loans
WHERE funded_time IS NOT NULL AND posted_time IS NOT NULL
GROUP BY sector
ORDER BY avg_days_to_fund ASC
LIMIT 10;

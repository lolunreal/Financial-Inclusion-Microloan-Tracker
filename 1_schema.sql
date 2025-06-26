-- Use database
USE kiva_microloans;
-- Create Loans Table
CREATE TABLE loans (
  id INT PRIMARY KEY,
  funded_amount DECIMAL(10, 2),
  loan_amount DECIMAL(10, 2),
  activity VARCHAR(100),
  sector VARCHAR(100),
  `use` TEXT,
  country_code VARCHAR(10),
  country VARCHAR(100),
  region VARCHAR(100),
  currency VARCHAR(10),
  partner_id INT,
  posted_time DATETIME,
  disbursed_time DATETIME,
  funded_time DATETIME,
  term_in_months INT,
  lender_count INT,
  tags VARCHAR(255),
  borrower_genders VARCHAR(50),
  repayment_interval VARCHAR(50),
  date DATE
);
-- Create Borrowers Table
CREATE TABLE borrowers (
    borrower_id INT PRIMARY KEY,
    loan_id INT,
    gender ENUM('male', 'female', 'nonbinary'),
    age INT,
    borrower_type ENUM('individual', 'group'),
    employment_status VARCHAR(50)
);
-- Create Field Partners Table
CREATE TABLE field_partners (
    partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    rating FLOAT,
    founded_year INT,
    country VARCHAR(50),
    loan_count INT,
    repayment_rate FLOAT
);
-- Create Repayments Table
CREATE TABLE repayments (
    repayment_id INT PRIMARY KEY,
    loan_id INT,
    borrower_id INT,
    due_date DATE,
    paid_date DATE,
    amount_paid FLOAT,
    status ENUM('on-time', 'late', 'missed')
);
-- Create Lenders Table
CREATE TABLE lenders (
    lender_id INT PRIMARY KEY,
    name VARCHAR(50),
    country VARCHAR(50),
    amount_contributed FLOAT,
    loan_id INT
);



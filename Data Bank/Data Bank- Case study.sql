create database if not exists Data_Bank;
use Data_Bank;

-- Create the regions table
CREATE TABLE regions (
    region_id INTEGER PRIMARY KEY,
    region_name VARCHAR(50)
);

-- Insert data into regions
INSERT INTO regions (region_id, region_name)
VALUES
  ('1', 'Australia'),
  ('2', 'America'),
  ('3', 'Africa'),
  ('4', 'Asia'),
  ('5', 'Europe');


-- Create the customers table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    region_id INTEGER,
    node_id INTEGER,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (region_id) REFERENCES regions(region_id)
);

-- Insert data into customers
INSERT INTO customers (customer_id, region_id, node_id, start_date, end_date) VALUES
(1, 2, 102, '2022-02-10', '2022-04-22'),
(2, 1, 106, '2022-10-10', '2023-02-11'),
(3, 1, 105, '2022-05-31', '2022-09-28'),
(4, 1, 104, '2022-11-18', '2023-02-09'),
(5, 3, 102, '2022-11-13', '2023-02-19'),
(6, 2, 103, '2022-01-10', '2022-04-11'),
(7, 2, 102, '2022-03-15', '2022-06-18'),
(8, 3, 105, '2022-04-20', '2022-09-05'),
(9, 1, 106, '2022-06-10', '2022-10-10'),
(10, 3, 104, '2022-08-01', '2022-12-12'),
(11, 1, 104, '2022-02-22', '2022-05-30'),
(12, 2, 103, '2022-01-01', '2022-04-15'),
(13, 3, 102, '2022-03-10', '2022-06-30'),
(14, 1, 106, '2022-04-14', '2022-07-20'),
(15, 2, 105, '2022-05-18', '2022-08-25'),
(16, 3, 103, '2022-06-01', '2022-09-01'),
(17, 2, 104, '2022-07-07', '2022-10-15'),
(18, 1, 106, '2022-08-20', '2022-11-30'),
(19, 2, 103, '2022-09-12', '2022-12-15'),
(20, 3, 105, '2022-10-18', '2023-01-20');

-- Create the transactions table
CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    txn_date DATE,
    txn_type VARCHAR(20),
    txn_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Insert data into transactions (sample for customers 1-5)
INSERT INTO transactions (customer_id, txn_date, txn_type, txn_amount) VALUES
(1, '2022-03-13', 'deposit', 3750.45),
(1, '2022-05-18', 'deposit', 1133.82),
(1, '2022-10-18', 'purchase', 1641.92),
(1, '2022-11-26', 'withdrawal', 800.07),
(1, '2022-12-02', 'withdrawal', 2038.60),

(2, '2022-11-01', 'deposit', 1500.00),
(2, '2022-11-12', 'withdrawal', 700.00),
(2, '2022-11-15', 'purchase', 400.00),

(3, '2022-06-10', 'deposit', 1200.00),
(3, '2022-06-20', 'withdrawal', 300.00),
(3, '2022-07-05', 'purchase', 500.00),

(4, '2022-12-01', 'deposit', 2000.00),
(4, '2022-12-10', 'purchase', 1000.00),

(5, '2023-01-01', 'deposit', 2500.00),
(5, '2023-01-10', 'withdrawal', 1500.00);

SELECT * FROM regions;
SELECT * FROM customers;
SELECT * FROM transactions;

# Questions and Solutions
-- A. Customer Nodes Exploration

# 1.How many unique nodes are there on the Data Bank system?
SELECT COUNT(DISTINCT(node_id)) AS Unique_Node FROM customers;

# 2.What is the number of nodes per region?
SELECT 
    r.region_name,
    COUNT(DISTINCT c.node_id) AS num_nodes
FROM customers c
JOIN regions r ON c.region_id = r.region_id
GROUP BY r.region_name
ORDER BY num_nodes DESC;

# 3.How many customers are allocated to each region?
SELECT COUNT(DISTINCT(customer_id)) AS No_Customers, region_id FROM customers
GROUP BY region_id;

# 4.How many days on average are customers reallocated to a different node?
SELECT AVG(DATEDIFF(end_date, start_date)) AS avg_reallocation_days FROM customers;

# 5.What is the median, 80th and 95th percentile for this same reallocation days metric for each region?
WITH reallocation_days AS (
    SELECT 
        r.region_name,
        DATEDIFF(cn.end_date, cn.start_date) AS days_in_node
    FROM customers cn
    JOIN regions r ON cn.region_id = r.region_id
    WHERE cn.end_date != '9999-12-31'
)
SELECT 
    region_name,
    MAX(CASE WHEN percentile = 50 THEN days_in_node END) AS median,
    MAX(CASE WHEN percentile = 80 THEN days_in_node END) AS percentile_80,
    MAX(CASE WHEN percentile = 95 THEN days_in_node END) AS percentile_95
FROM (
    SELECT 
        region_name,
        days_in_node,
        NTILE(100) OVER (PARTITION BY region_name ORDER BY days_in_node) AS percentile
    FROM reallocation_days
) percentiles
WHERE percentile IN (50, 80, 95)
GROUP BY region_name;

-- B. Customer Transactions
# 1.What is the unique count and total amount for each transaction type?
SELECT txn_type, COUNT(DISTINCT(customer_id)) AS Unique_customers, SUM(txn_amount) AS Total_amount 
FROM transactions
GROUP BY txn_type;

# 2.What is the average total historical deposit counts and amounts for all customers?
WITH customer_deposits AS (
    SELECT 
        customer_id,
        COUNT(*) AS deposit_count,
        SUM(txn_amount) AS deposit_amount
    FROM transactions
    WHERE txn_type = 'deposit'
    GROUP BY customer_id
)
SELECT 
    ROUND(AVG(deposit_count), 2) AS avg_deposit_count,
    ROUND(AVG(deposit_amount), 2) AS avg_deposit_amount
FROM customer_deposits;

# 3.For each month - how many Data Bank customers make more than 1 deposit and either 1 purchase or 1 withdrawal in a single month?
WITH monthly_transactions AS (
    SELECT 
        customer_id,
        MONTH(txn_date) AS month_num,
        SUM(CASE WHEN txn_type = 'deposit' THEN 1 ELSE 0 END) AS deposit_count,
        SUM(CASE WHEN txn_type = 'purchase' THEN 1 ELSE 0 END) AS purchase_count,
        SUM(CASE WHEN txn_type = 'withdrawal' THEN 1 ELSE 0 END) AS withdrawal_count
    FROM transactions
    GROUP BY customer_id, MONTH(txn_date)
)
SELECT 
    month_num,
    COUNT(*) AS qualified_customers
FROM monthly_transactions
WHERE deposit_count > 1 
AND (purchase_count >= 1 OR withdrawal_count >= 1)
GROUP BY month_num
ORDER BY month_num;

# 4.What is the closing balance for each customer at the end of the month?
WITH txn_with_sign AS (
    SELECT 
        customer_id,
        txn_date,
        DATE_FORMAT(txn_date, '%Y-%m') AS txn_month,
        CASE 
            WHEN txn_type = 'deposit' THEN txn_amount
            WHEN txn_type IN ('withdrawal', 'purchase') THEN -txn_amount
            ELSE 0
        END AS signed_amount
    FROM transactions
),
monthly_txn_totals AS (
    SELECT 
        customer_id,
        txn_month,
        SUM(signed_amount) AS net_amount
    FROM txn_with_sign
    GROUP BY customer_id, txn_month
),
running_balance AS (
    SELECT 
        customer_id,
        txn_month,
        SUM(net_amount) OVER (
            PARTITION BY customer_id
            ORDER BY txn_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS closing_balance
    FROM monthly_txn_totals
)
SELECT 
    customer_id,
    txn_month,
    closing_balance
FROM running_balance
ORDER BY customer_id, txn_month;


# 5.What is the percentage of customers who increase their closing balance by more than 5%?
WITH txn_with_sign AS (
    SELECT 
        customer_id,
        txn_date,
        DATE_FORMAT(txn_date, '%Y-%m') AS txn_month,
        CASE 
            WHEN txn_type = 'deposit' THEN txn_amount
            WHEN txn_type IN ('withdrawal', 'purchase') THEN -txn_amount
            ELSE 0
        END AS signed_amount
    FROM transactions
),
monthly_totals AS (
    SELECT 
        customer_id,
        txn_month,
        SUM(signed_amount) AS net_amount
    FROM txn_with_sign
    GROUP BY customer_id, txn_month
),
running_balance AS (
    SELECT 
        customer_id,
        txn_month,
        SUM(net_amount) OVER (
            PARTITION BY customer_id 
            ORDER BY txn_month
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS closing_balance
    FROM monthly_totals
),
balance_change AS (
    SELECT 
        customer_id,
        txn_month,
        closing_balance,
        LAG(closing_balance) OVER (
            PARTITION BY customer_id ORDER BY txn_month
        ) AS prev_balance
    FROM running_balance
),
improved_customers AS (
    SELECT DISTINCT customer_id
    FROM balance_change
    WHERE 
        prev_balance IS NOT NULL
        AND closing_balance > prev_balance * 1.05
)
SELECT 
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT customer_id) FROM transactions), 2) AS percent_customers_improved
FROM improved_customers;
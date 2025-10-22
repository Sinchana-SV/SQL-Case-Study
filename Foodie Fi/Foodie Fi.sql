CREATE DATABASE Foodie_fi;
USE Foodie_fi;

CREATE TABLE plans (
    plan_id INT PRIMARY KEY,
    plan_name VARCHAR(50),
    price DECIMAL(10,2) NULL
);

INSERT INTO plans (plan_id, plan_name, price) VALUES
(0, 'trial', 0),
(1, 'basic monthly', 9.90),
(2, 'pro monthly', 19.90),
(3, 'pro annual', 199),
(4, 'churn', NULL);


CREATE TABLE subscriptions (
    customer_id INT,
    plan_id INT,
    start_date DATE
);

INSERT INTO subscriptions (customer_id, plan_id, start_date) VALUES
('1', '0', '2020-08-01'),
  ('1', '1', '2020-08-08'),
  ('2', '0', '2020-09-20'),
  ('2', '3', '2020-09-27'),
  ('3', '0', '2020-01-13'),
  ('3', '1', '2020-01-20'),
  ('4', '0', '2020-01-17'),
  ('4', '1', '2020-01-24'),
  ('4', '4', '2020-04-21'),
  ('5', '0', '2020-08-03'),
  ('5', '1', '2020-08-10'),
  ('6', '0', '2020-12-23'),
  ('6', '1', '2020-12-30'),
  ('6', '4', '2021-02-26'),
  ('7', '0', '2020-02-05'),
  ('7', '1', '2020-02-12'),
  ('7', '2', '2020-05-22'),
  ('8', '0', '2020-06-11'),
  ('8', '1', '2020-06-18'),
  ('8', '2', '2020-08-03'),
  ('9', '0', '2020-12-07'),
  ('9', '3', '2020-12-14'),
  ('10', '0', '2020-09-19'),
  ('10', '2', '2020-09-26'),
  ('11', '0', '2020-11-19'),
  ('11', '4', '2020-11-26'),
  ('12', '0', '2020-09-22'),
  ('12', '1', '2020-09-29'),
  ('13', '0', '2020-12-15'),
  ('13', '1', '2020-12-22'),
  ('13', '2', '2021-03-29'),
  ('14', '0', '2020-09-22'),
  ('14', '1', '2020-09-29'),
  ('15', '0', '2020-03-17'),
  ('15', '2', '2020-03-24'),
  ('15', '4', '2020-04-29'),
  ('16', '0', '2020-05-31'),
  ('16', '1', '2020-06-07'),
  ('16', '3', '2020-10-21'),
  ('17', '0', '2020-07-27'),
  ('17', '1', '2020-08-03'),
  ('17', '3', '2020-12-11'),
  ('18', '0', '2020-07-06'),
  ('18', '2', '2020-07-13'),
  ('19', '0', '2020-06-22'),
  ('19', '2', '2020-06-29'),
  ('19', '3', '2020-08-29'),
  ('20', '0', '2020-04-08'),
  ('20', '1', '2020-04-15'),
  ('20', '3', '2020-06-05'),
  ('21', '0', '2020-02-04'),
  ('21', '1', '2020-02-11'),
  ('21', '2', '2020-06-03'),
  ('21', '4', '2020-09-27'),
  ('22', '0', '2020-01-10'),
  ('22', '2', '2020-01-17'),
  ('23', '0', '2020-05-13'),
  ('23', '3', '2020-05-20'),
  ('24', '0', '2020-11-10'),
  ('24', '2', '2020-11-17'),
  ('24', '3', '2021-04-17'),
  ('25', '0', '2020-05-10'),
  ('25', '1', '2020-05-17'),
  ('25', '2', '2020-06-16'),
  ('26', '0', '2020-12-08'),
  ('26', '2', '2020-12-15'),
  ('27', '0', '2020-08-24'),
  ('27', '2', '2020-08-31'),
  ('28', '0', '2020-06-30'),
  ('28', '3', '2020-07-07'),
  ('29', '0', '2020-01-23'),
  ('29', '2', '2020-01-30'),
  ('30', '0', '2020-04-29'),
  ('30', '1', '2020-05-06'),
  ('31', '0', '2020-06-22'),
  ('31', '2', '2020-06-29'),
  ('31', '3', '2020-11-29'),
  ('32', '0', '2020-06-12'),
  ('32', '1', '2020-06-19'),
  ('32', '2', '2020-07-18'),
  ('33', '0', '2020-09-03'),
  ('33', '2', '2020-09-10'),
  ('33', '4', '2021-02-05'),
  ('34', '0', '2020-12-20'),
  ('34', '1', '2020-12-27'),
  ('34', '2', '2021-03-26'),
  ('35', '0', '2020-09-03'),
  ('35', '2', '2020-09-10'),
  ('36', '0', '2020-02-25'),
  ('36', '2', '2020-03-03'),
  ('37', '0', '2020-08-05'),
  ('37', '1', '2020-08-12'),
  ('37', '2', '2020-11-11'),
  ('38', '0', '2020-10-02'),
  ('38', '2', '2020-10-09'),
  ('38', '3', '2020-11-09'),
  ('39', '0', '2020-05-28'),
  ('39', '1', '2020-06-04'),
  ('39', '2', '2020-08-25'),
  ('39', '4', '2020-09-10'),
  ('40', '0', '2020-01-22'),
  ('40', '1', '2020-01-29'),
  ('40', '2', '2020-03-25'),
  ('41', '0', '2020-05-16'),
  ('41', '2', '2020-05-23'),
  ('42', '0', '2020-10-27'),
  ('42', '1', '2020-11-03'),
  ('42', '2', '2021-04-28'),
  ('43', '0', '2020-08-13'),
  ('43', '1', '2020-08-20'),
  ('43', '2', '2020-12-18'),
  ('44', '0', '2020-03-17'),
  ('44', '3', '2020-03-24'),
  ('45', '0', '2020-02-11'),
  ('45', '1', '2020-02-18'),
  ('45', '2', '2020-08-12'),
  ('46', '0', '2020-04-19'),
  ('46', '1', '2020-04-26'),
  ('46', '2', '2020-07-06'),
  ('46', '3', '2020-08-06'),
  ('47', '0', '2020-06-06'),
  ('47', '1', '2020-06-13'),
  ('47', '3', '2020-10-26'),
  ('48', '0', '2020-01-11'),
  ('48', '1', '2020-01-18'),
  ('48', '4', '2020-06-01'),
  ('49', '0', '2020-04-24'),
  ('49', '2', '2020-05-01'),
  ('49', '3', '2020-08-01'),
  ('50', '0', '2020-07-21'),
  ('50', '2', '2020-07-28');
  
SELECT * FROM plans;
SELECT * FROM subscriptions;

  # A. Customer Journey
  
SELECT s.customer_id, p.plan_name, s.start_date
FROM subscriptions s
JOIN plans p ON s.plan_id = p.plan_id
ORDER BY s.customer_id, s.start_date;

# B. Data Analysis Questions

# 1. How many customers has Foodie-Fi ever had?
SELECT COUNT(DISTINCT(customer_id)) AS No_of_Customers
FROM subscriptions; 

# 2. What is the monthly distribution of trial plan start_date values for our dataset - use the start of the month as the group by value
SELECT DATE_FORMAT(start_date, '%Y-%m') AS month, COUNT(*) AS trial_count
FROM subscriptions
WHERE plan_id = 0
GROUP BY month
ORDER BY month;

# 3. What plan start_date values occur after the year 2020 for our dataset? Show the breakdown by count of events for each plan_name
SELECT p.plan_name, COUNT(*) AS count_events
FROM subscriptions s
JOIN plans p USING (plan_id)
WHERE YEAR(s.start_date) > 2020
GROUP BY p.plan_name
ORDER BY count_events DESC;

# 4. What is the customer count and percentage of customers who have churned rounded to 1 decimal place?
SELECT COUNT(DISTINCT(customer_id)) AS Churned_Count, 
ROUND(100 * COUNT(DISTINCT customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM Subscriptions), 1) AS Churned_Percentage 
FROM Subscriptions
WHERE plan_id = 4;

# 5. How many customers have churned straight after their initial free trial - what percentage is this rounded to the nearest whole number?
WITH plan_sequence AS (
    SELECT 
        customer_id,
        plan_id,
        LAG(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS previous_plan
    FROM subscriptions
)
SELECT COUNT(*) AS Immediate_churn_count
FROM plan_sequence
WHERE plan_id = 4 AND previous_plan = 0;

# 6. What is the number and percentage of customer plans after their initial free trial?
SELECT 
    p.plan_name,
    COUNT(DISTINCT s2.customer_id) AS customer_count,
    ROUND(100 * COUNT(DISTINCT s2.customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions), 1) AS percentage
FROM subscriptions s1
JOIN subscriptions s2 
    ON s1.customer_id = s2.customer_id 
    AND s1.start_date < s2.start_date
JOIN plans p ON s2.plan_id = p.plan_id
WHERE cs1.plan_id = 0 
AND s2.plan_id != 4
GROUP BY p.plan_name
ORDER BY customer_count DESC;

# 7. What is the customer count and percentage breakdown of all 5 plan_name values at 2020-12-31?
SELECT 
    sp.plan_name,
    COUNT(DISTINCT cs.customer_id) AS customer_count,
    ROUND(100 * COUNT(DISTINCT cs.customer_id) / (SELECT COUNT(DISTINCT customer_id) FROM subscriptions), 1) AS percentage
FROM subscriptions cs
JOIN plans sp ON cs.plan_id = sp.plan_id
WHERE cs.start_date <= '2020-12-31'
GROUP BY sp.plan_name
ORDER BY customer_count DESC;

# 8. How many customers have upgraded to an annual plan in 2020?
SELECT COUNT(DISTINCT customer_id) AS annual_upgrade_count
FROM subscriptions
WHERE plan_id = 3  -- Pro annual plan
  AND EXTRACT(YEAR FROM start_date) = 2020;

# 9. How many days on average does it take for a customer to an annual plan from the day they join Foodie-Fi?
WITH trial_dates AS (
  SELECT 
    customer_id,
    start_date AS trial_start
  FROM subscriptions
  WHERE plan_id = 0
),
annual_upgrades AS (
  SELECT 
    customer_id,
    start_date AS annual_start
  FROM subscriptions
  WHERE plan_id = 3
)
SELECT 
  ROUND(AVG(au.annual_start - td.trial_start), 0) AS avg_days_to_upgrade
FROM trial_dates td
JOIN annual_upgrades au ON td.customer_id = au.customer_id;

# 10. Can you further breakdown this average value into 30 day periods (i.e. 0-30 days, 31-60 days etc)
WITH upgrade_times AS (
  SELECT 
    s.customer_id,
    MIN(CASE WHEN s.plan_id = 0 THEN s.start_date END) AS trial_start,
    MIN(CASE WHEN s.plan_id = 3 THEN s.start_date END) AS annual_start,
    MIN(CASE WHEN s.plan_id = 3 THEN s.start_date END) - 
    MIN(CASE WHEN s.plan_id = 0 THEN s.start_date END) AS days_to_upgrade
  FROM subscriptions s
  WHERE s.plan_id IN (0, 3)
  GROUP BY s.customer_id
  HAVING MIN(CASE WHEN s.plan_id = 3 THEN s.start_date END) IS NOT NULL
),
period_groups AS (
  SELECT 
    CASE 
      WHEN days_to_upgrade <= 30 THEN '0-30 days'
      WHEN days_to_upgrade <= 60 THEN '31-60 days'
      WHEN days_to_upgrade <= 90 THEN '61-90 days'
      ELSE 'Over 90 days'
    END AS period_group,
    days_to_upgrade
  FROM upgrade_times
)
SELECT 
  period_group,
  COUNT(*) AS customer_count,
  ROUND(AVG(days_to_upgrade), 1) AS avg_days_in_group
FROM period_groups
GROUP BY period_group
ORDER BY MIN(period_group);

# 11. How many customers downgraded from a pro monthly to a basic monthly plan in 2020? 
WITH plan_sequence AS (
  SELECT 
    customer_id,
    plan_id,
    start_date,
    LAG(plan_id) OVER (PARTITION BY customer_id ORDER BY start_date) AS previous_plan
  FROM subscriptions
  WHERE EXTRACT(YEAR FROM start_date) = 2020
)
SELECT COUNT(DISTINCT customer_id) AS downgrade_count
FROM plan_sequence
WHERE plan_id = 1  #-- Basic monthly
  AND previous_plan = 2;  #-- Pro monthly

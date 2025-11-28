# SQL Challenge Solutions 🧐

This repository contains my solutions to a series of SQL challenges completed over the course of multiple weeks. These challenges helped me master key SQL concepts, including database design, data aggregation, optimization, and complex queries. Below are the case studies I have worked on, along with the approach and techniques used for each challenge.

## Challenges Completed
1. 🍽️[**Danny's Dinner**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/c2aa88860c1778bac5914b0c81ba5b0dde4136af/Danny's%20Diner/Danny's%20Diner.sql)
2. 🍕[**Pizza Runner**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/c2aa88860c1778bac5914b0c81ba5b0dde4136af/Pizza%20Runner/Pizza%20Runner.sql)
3. 🍜[**Foodie-Fi**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Foodie%20Fi/Foodie%20Fi.sql)
4. 🏦[**Data Bank**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Data%20Bank/Data%20Bank-%20Case%20study.sql)
5. 🥣 [**Cereal Nutrition Analytics**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Cereals/Cereals.sql)
6. 🏥 [**Medical Insurance Charges Analytics**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Insurance/Insurance.sql)

## Challenge Overview

### 1. 🍽️[**Danny's Dinner**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/c2aa88860c1778bac5914b0c81ba5b0dde4136af/Danny's%20Diner/Danny's%20Diner.sql)
- **Objective**: Design and execute SQL queries to manage a dinner reservation system for a restaurant.
- **Key Concepts**: Database design, `JOIN`, `GROUP BY`, and `HAVING`.
- **Approach**:
  - Created tables for guests, reservations, and menu items.
  - Used `JOIN` to fetch guest and reservation details together.
  - Aggregated data to find the most popular menu items.

### 2. 🍕[**Pizza Runner**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/c2aa88860c1778bac5914b0c81ba5b0dde4136af/Pizza%20Runner/Pizza%20Runner.sql)
- **Objective**: Analyze and optimize a pizza delivery business's sales data to determine key performance metrics.
- **Key Concepts**: `JOIN`, `SUM`, `AVG`, data aggregation, performance optimization.
- **Approach**:
  - Joins to combine order, customer, and delivery data.
  - Aggregated data to calculate total sales per customer and identify peak times.
  - Optimized the queries for performance.
 
### 3. 🍜[**Foodie-Fi**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Foodie%20Fi/Foodie%20Fi.sql)
- **Objective**: Analyze customer subscription behavior for a food streaming service.
- **Key Concepts**: Window functions (LAG, LEAD), date functions, churn analysis.
- **Approach**:
  - Designed queries to track customer plan changes and subscription durations.
  - Calculated churn rates, upgrade/downgrade trends, and revenue impact.
  - Identified customer retention patterns using time-based analytics.
 
### 4. 🏦[**Data Bank**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Data%20Bank/Data%20Bank-%20Case%20study.sql)
- **Objective**: Derive insights into customer balances, transactions, and data plan usage for a digital banking platform.
- **Key Concepts**:CTEs, CASE WHEN, data transformation, and window functions.
- **Approach**:
  - Calculated customer transaction patterns and average balances.
  - Used CTEs for cleaner, modular query design.
  - Derived business insights on active customers and profitability drivers.

### 5. 🥣 [**Cereal Nutrition Analytics**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Cereals/Cereals.sql) 

- **Objective:** Explore a cereal nutrition dataset to understand how ingredients and calories relate to product ratings and manufacturer performance.  
- **Key Concepts:** Indexes & views, aggregate queries, `GROUP BY`, CASE expressions, CTEs/subqueries, feature engineering (High/Low calories).  
- **Approach:**  
  - Created and optimised the `cereals_data` table with indexes for faster name-based lookups.  
  - Built views to safely expose nutrition fields while hiding non-required columns.  
  - Classified cereals into **High / Low calorie** groups using global average calories and CASE logic.  
  - Analysed manufacturer-wise patterns and top-rated products using aggregation and sorting.  
  - Used subqueries to compare each cereal’s calories with overall and manufacturer-specific averages.  

---

### 6. 🏥 [**Medical Insurance Charges Analytics**](https://github.com/Sinchana-SV/SQL-Case-Study/blob/main/Insurance/Insurance.sql)

- **Objective:** Analyse a medical insurance dataset to understand how demographics and lifestyle factors impact insurance charges.  
- **Key Concepts:** Primary keys & indexes, views, `GROUP BY` aggregations, CASE expressions, subqueries, data transformation.  
- **Approach:**  
  - Structured the `insurance` table with a primary key and index for efficient querying.  
  - Summarised customers by **region, gender, and smoker status** to uncover high-risk segments.  
  - Engineered new fields such as **`HL_Charges`** (High/Low charges) and **age–BMI ratio** to enrich the dataset.  
  - Converted numeric `children` counts into readable categories to support segmentation.  
  - Used subqueries to compare BMI and charges against population averages and derive actionable insights on cost drivers.  

---
 
## 🐬Technologies Used
- **SQL Databases**: MySQL🐬

## 🌟 Key Learnings
- Writing clean, optimized SQL queries.
- Applying advanced SQL concepts to solve real-world case studies.
- Translating business problems into analytical SQL solutions.

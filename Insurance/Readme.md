# 🏥 Medical Insurance SQL Case Study – Data Exploration & Insights
<img width="907" height="602" alt="image" src="https://github.com/user-attachments/assets/d83a5f8f-9d15-49a7-824d-b7811d9b2159" />

Welcome to my **Medical Insurance SQL Project** repository! 🚀  
This mini-project uses SQL to analyse a health insurance dataset and apply core database concepts such as **indexes, views, constraints, derived columns, and subqueries**. :contentReference[oaicite:0]{index=0}  

The goal is to treat a typical insurance table like a small analytics sandbox and show how SQL can answer real-world style questions about **age, gender, BMI, smoking status, children, region, and charges**.

---

## 📌 Project Overview

The project revolves around a single table: **`insurance`**, which contains columns such as:

- `id` – unique record identifier  
- `age` – age of the policyholder  
- `sex` / `gender` – male or female  
- `bmi` – body mass index  
- `children` – number of dependents  
- `smoker` – yes/no  
- `region` – geographic region (e.g., northwest, southeast)  
- `charges` – medical insurance charges  

Using SQL, the script in this repo walks through a set of tasks including:

- Counting policyholders by **region** and **gender**  
- Ranking records by **age** and **charges**  
- Creating an **index** and a **primary key**  
- Building **views** to hide sensitive columns and focus on specific segments  
- Engineering new features like **`ratio` (age × BMI)** and **`HL_Charges` (High/Low)**  
- Transforming the `children` column into human-readable labels  
- Writing **subqueries** to analyse BMI and charges

All SQL logic is stored inside a single script file so that the README stays clean and high-level. ✨

---
## 💼 Business-Style Tasks Implemented

Some of the practical tasks included in `Insurance.sql` are:

- Counting policyholders by region (e.g., how many are from `northwest`).  
- Counting number of female policyholders.  
- Listing the top 50 oldest customers.  
- Sorting policyholders from highest to lowest charges.  
- Creating the `HL_Charges` flag to classify charges as High or Low.  
- Creating a view `Female_HL_Charges` for female, high-charges, smoker, zero-children cases.  
- Converting the `children` field into labels like `"Zero Children"`, `"two_children"`, `"More_than_five_children"`.  

These mimic the kind of transformation and segmentation you might do before building dashboards or models.

---

## 🧾 What You Learn from This Project

By going through this script, you practice:

- ✅ Designing and modifying relational schemas  
- ✅ Creating and using **indexes** and **views**  
- ✅ Writing **aggregate queries** and `GROUP BY`  
- ✅ Implementing **categorical flags** from numeric data  
- ✅ Using **CTEs**, **subqueries**, and **correlated subqueries**  
- ✅ Applying pattern matching and conditional logic with `CASE`  
- ✅ Managing columns with `ALTER TABLE` (add/modify/drop/reposition)  

---

## 💡 Possible Extensions

If you want to extend this project further, you could:

- Add **window functions** (e.g., rank customers by charges within each region).  
- Build a **dashboard** (Power BI, Tableau, or Looker Studio) over the cleaned insurance table.  
- Export the dataset for **machine learning** (e.g., predicting `charges` from age, BMI, smoker status, and children).  

---

## 🙌 Acknowledgements

- Dataset style inspired by common **medical insurance** datasets used in analytics and data-science teaching.  
- All SQL queries and transformations were written as part of a learning exercise to practice **real-world-style data exploration and feature engineering**.  

---

## 🛠 Tech Stack

- 💾 **Database:** MySQL (or MySQL-compatible engine)  
- 🗂 **Main table:** `insurance`  
- 📜 **Script file:** `Insurance.sql`

---


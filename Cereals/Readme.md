# 🥣 Cereal SQL Case Study – Data Exploration & Insights
<img width="938" height="547" alt="image" src="https://github.com/user-attachments/assets/7430dce9-6bc3-4ef1-a422-3b6764f26e6f" />

Welcome to the **Cereal SQL Assignment** repository! 🚀  
This project uses SQL to explore and analyse a cereal nutrition dataset – answering business-style questions, optimising queries, and demonstrating core SQL concepts like **indexes, views, subqueries, CTEs, and data classification**. :contentReference[oaicite:0]{index=0}  

---

## 📌 Project Overview

This project is built around a table called `cereals_data` containing information about breakfast cereals, including:

- `name` – cereal name  
- `mfr` – manufacturer  
- `type` – hot or cold cereal  
- `calories`, `protein`, `fat`, `sodium`, `fiber`, `carbo`, `sugars`, `potass`  
- `vitamins`, `shelf`, `weight`, `cups`, `rating`  
- additional engineered fields like `Sl_no` and `HL_Calories`

Using SQL (MySQL), the script walks through a structured set of tasks from simple queries to more advanced data transformations.

---

## 🧩 Key Objectives

This SQL project focuses on:

- 🧱 **Database & table manipulation** – creating DB, altering table structure  
- 🚀 **Performance optimisation** – adding an index  
- 👀 **Data security / abstraction** – using views to hide sensitive columns  
- 📊 **Descriptive analytics** – counts, averages, max ratings  
- 🧮 **Derived business logic** – flagging cereals as **High/Low Calories**  
- 🧠 **Advanced querying** – CTEs and correlated subqueries  
- 🧹 **Schema evolution** – adding/dropping columns

---

## 🛠 Tech Stack

- 💾 **Database:** MySQL  
- 🗂 **Dataset Table:** `cereals_data`  
- 📜 **Script:** `Cereal Assignment.sql`

---

## 📂 File in This Repo

- `Cereal Assignment.sql` – main SQL script containing all steps and queries for the assignment.

---

## ▶️ How to Run the Project

### 🧠 Concepts Demonstrated (Task-wise Breakdown)
### 1️⃣ Creating DB & Inspecting Data
<img width="297" height="183" alt="image" src="https://github.com/user-attachments/assets/82f96f33-8785-4622-9067-21251867a6a7" />

### 2️⃣ Indexing for Faster Lookup
<img width="572" height="236" alt="image" src="https://github.com/user-attachments/assets/53069eec-956f-4ab4-a8a0-3f01384a2fe1" />

### 3️⃣ Creating a View to Hide Columns
<img width="593" height="252" alt="image" src="https://github.com/user-attachments/assets/baecaf18-6a6a-4a4b-b0b5-8574f7f02754" />

### 4️⃣ Renaming the View
<img width="562" height="132" alt="image" src="https://github.com/user-attachments/assets/53e9ce64-0204-481a-9253-11be746f8a19" />

### 5️⃣ Counting Cold Cereals
<img width="426" height="156" alt="image" src="https://github.com/user-attachments/assets/1fa9117e-5c95-4ef1-9e42-51c95cd75ccf" />

### 6️⃣ Counting Cereals by Shelf
<img width="711" height="162" alt="image" src="https://github.com/user-attachments/assets/aa40b520-f94c-41a0-a56c-b29698ee620c" />

### 7️⃣ Ranking Cereals by Rating
<img width="660" height="137" alt="image" src="https://github.com/user-attachments/assets/61af716e-595f-47b6-9095-8cdf0802f074" />

### 8️⃣ Adding a Primary Key
<img width="547" height="157" alt="image" src="https://github.com/user-attachments/assets/e89d9ebe-a5b1-4694-9707-4ed2cf1a5678" />

### 9️⃣ Average Calories by Type (Hot vs Cold)
<img width="522" height="133" alt="image" src="https://github.com/user-attachments/assets/2375958b-0fcf-46cf-8ae5-8002f655c3a3" />

### 🔟 Classifying High vs Low Calorie Cereals
<img width="540" height="733" alt="image" src="https://github.com/user-attachments/assets/0c3fcdaf-04e0-4117-98d8-f008bb044fa5" />

### 1️⃣1️⃣–1️⃣3️⃣ Pattern Matching on Names (LIKE)
<img width="507" height="251" alt="image" src="https://github.com/user-attachments/assets/67cf84e3-3da1-4b14-b22d-12f6b7ee39d6" />

### 1️⃣4️⃣ Filtering High-Calorie Cereals
<img width="461" height="135" alt="image" src="https://github.com/user-attachments/assets/503333ab-c735-410d-90d7-070b818c8215" />

### 1️⃣5️⃣ Maximum Rating
<img width="351" height="121" alt="image" src="https://github.com/user-attachments/assets/83d4a515-c491-45dd-9016-39bedfefd1d2" />

### 1️⃣6️⃣ Average Rating by Calorie Group
<img width="562" height="137" alt="image" src="https://github.com/user-attachments/assets/f1cd3285-547c-4d50-b686-727d1ee3227b" />

### 1️⃣7️⃣ Subqueries with Explanations
<img width="772" height="420" alt="image" src="https://github.com/user-attachments/assets/b9e14a7c-13a9-4c9f-b649-d5ccc3eb995b" />

### 1️⃣8️⃣ Dropping a Column
<img width="477" height="118" alt="image" src="https://github.com/user-attachments/assets/4012514f-5170-4691-be3d-ebce3bbdeb19" />

### 1️⃣9️⃣ Counting Records per Manufacturer
<img width="467" height="136" alt="image" src="https://github.com/user-attachments/assets/8ba82e9b-82e3-4311-ba19-7d14f59e6c1e" />

### 2️⃣0️⃣ Selecting Specific Columns
<img width="513" height="117" alt="image" src="https://github.com/user-attachments/assets/4f6d1b0b-b005-43d4-8051-ddf3d8f60588" />

## 📈 What You Learn from This Project

---
By going through this script, you practice:

- ✅ Designing and modifying relational schemas  
- ✅ Creating and using **indexes** and **views**  
- ✅ Writing **aggregate queries** and `GROUP BY`  
- ✅ Implementing **categorical flags** from numeric data  
- ✅ Using **CTEs**, **subqueries**, and **correlated subqueries**  
- ✅ Applying pattern matching with `LIKE`  
- ✅ Managing columns with `ALTER TABLE` (add/modify/drop)  

---

## 💡 Possible Extensions

If you want to extend this project further, you could:

- Add **window functions** (e.g., rank cereals by rating per manufacturer).  
- Build a **dashboard** (Power BI / Tableau) on top of this SQL output.  
- Export results for **machine learning** (e.g., predicting rating from nutrients).  

---

## 🙌 Acknowledgements

- Dataset inspiration: cereal nutrition datasets commonly used for teaching analytics and SQL.  
- All queries and logic authored as part of an SQL learning assignment to practice **real-world-style data exploration**.  





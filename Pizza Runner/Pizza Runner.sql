create database if not exists Pizza_Runner;
use Pizza_runner;

CREATE TABLE runners (
  runner_id INTEGER,
  registration_date DATE);
  
show tables;

INSERT INTO runners(runner_id, registration_date)
VALUES
  (1, '2021-01-01'),
  (2, '2021-01-03'),
  (3, '2021-01-08'),
  (4, '2021-01-15');
  
select * from runners;

CREATE TABLE customer_orders (
  order_id INTEGER,
  customer_id INTEGER,
  pizza_id INTEGER,
  exclusions VARCHAR(4),
  extras VARCHAR(4),
  order_time TIMESTAMP
);

select * from customer_orders;

INSERT INTO customer_orders
  (order_id, customer_id, pizza_id, exclusions, extras, order_time)
VALUES
  ('1', '101', '1', '', '', '2020-01-01 18:05:02'),
  ('2', '101', '1', '', '', '2020-01-01 19:00:52'),
  ('3', '102', '1', '', '', '2020-01-02 23:51:23'),
  ('3', '102', '2', '', NULL, '2020-01-02 23:51:23'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '1', '4', '', '2020-01-04 13:23:46'),
  ('4', '103', '2', '4', '', '2020-01-04 13:23:46'),
  ('5', '104', '1', 'null', '1', '2020-01-08 21:00:29'),
  ('6', '101', '2', 'null', 'null', '2020-01-08 21:03:13'),
  ('7', '105', '2', 'null', '1', '2020-01-08 21:20:29'),
  ('8', '102', '1', 'null', 'null', '2020-01-09 23:54:33'),
  ('9', '103', '1', '4', '1, 5', '2020-01-10 11:22:59'),
  ('10', '104', '1', 'null', 'null', '2020-01-11 18:34:49'),
  ('10', '104', '1', '2, 6', '1, 4', '2020-01-11 18:34:49');
  
  select * from customer_orders;
  
  CREATE TABLE runner_orders (
  order_id INTEGER,
  runner_id INTEGER,
  pickup_time VARCHAR(19),
  distance VARCHAR(7),
  duration VARCHAR(10),
  cancellation VARCHAR(23)
);

INSERT INTO runner_orders
  (order_id, runner_id, pickup_time, distance, duration, cancellation)
VALUES
  ('1', '1', '2020-01-01 18:15:34', '20km', '32 minutes', ''),
  ('2', '1', '2020-01-01 19:10:54', '20km', '27 minutes', ''),
  ('3', '1', '2020-01-03 00:12:37', '13.4km', '20 mins', NULL),
  ('4', '2', '2020-01-04 13:53:03', '23.4', '40', NULL),
  ('5', '3', '2020-01-08 21:10:57', '10', '15', NULL),
  ('6', '3', 'null', 'null', 'null', 'Restaurant Cancellation'),
  ('7', '2', '2020-01-08 21:30:45', '25km', '25mins', 'null'),
  ('8', '2', '2020-01-10 00:15:02', '23.4 km', '15 minute', 'null'),
  ('9', '2', 'null', 'null', 'null', 'Customer Cancellation'),
  ('10', '1', '2020-01-11 18:50:20', '10km', '10minutes', 'null');
  
  
  CREATE TABLE pizza_names (
  pizza_id INTEGER,
  pizza_name TEXT
);

INSERT INTO pizza_names(pizza_id, pizza_name)
VALUES
  (1, 'Meatlovers'),
  (2, 'Vegetarian');
  
  
  CREATE TABLE pizza_recipes (
  pizza_id INTEGER,
  toppings TEXT
);

INSERT INTO pizza_recipes
  (pizza_id, toppings)
VALUES
  (1, '1, 2, 3, 4, 5, 6, 8, 10'),
  (2, '4, 6, 7, 9, 11, 12');
  
  CREATE TABLE pizza_toppings (
  topping_id INTEGER,
  topping_name TEXT
);

INSERT INTO pizza_toppings
  (topping_id, topping_name)
VALUES
  (1, 'Bacon'),
  (2, 'BBQ Sauce'),
  (3, 'Beef'),
  (4, 'Cheese'),
  (5, 'Chicken'),
  (6, 'Mushrooms'),
  (7, 'Onions'),
  (8, 'Pepperoni'),
  (9, 'Peppers'),
  (10, 'Salami'),
  (11, 'Tomatoes'),
  (12, 'Tomato Sauce');
  
# A. Pizza Metrics

select * from runners;
select * from customer_orders;
select * from runner_orders;
select * from pizza_names;
select * from pizza_recipes;
select * from pizza_toppings;


# 1.How many pizzas were ordered?
SELECT COUNT(order_id) as Total_orders from customer_orders; 

# 2.How many unique customer orders were made?
SELECT COUNT(DISTINCT(order_id)) as Unique_cust_orders from customer_orders;

# 3.How many successful orders were delivered by each runner?
SELECT runner_id, COUNT(*) AS Successfull_orders FROM runner_orders
WHERE cancellation is null or cancellation = ""
GROUP BY runner_id;

# 4.How many of each type of pizza was delivered?
SELECT pizza_name, COUNT(*) AS Count_pizza_delivered FROM customer_orders cs JOIN pizza_names pn on cs.pizza_id = pn.pizza_id
GROUP BY pizza_name;

# 5.How many Vegetarian and Meatlovers were ordered by each customer?
SELECT cs.customer_id, 
SUM(CASE WHEN pn.pizza_id = 1 THEN 1 ELSE 0 END) AS Meat_Lovers,
SUM(CASE WHEN pn.pizza_id = 2 THEN 1 ELSE 0 END) AS Vegetarian
FROM customer_orders cs JOIN pizza_names pn ON cs.pizza_id = pn.pizza_id
GROUP BY customer_id;

# 6.What was the maximum number of pizzas delivered in a single order?
SELECT order_id, COUNT(order_id) as Max_pizza_ordered
FROM customer_orders
group by order_id
order by Max_pizza_ordered desc limit 1;

# 7.For each customer, how many delivered pizzas had at least 1 change and how many had no changes?
SELECT co.customer_id,
SUM(CASE WHEN (co.exclusions != '' AND co.exclusions IS NOT null AND co.extras != '' AND co.extras IS NOT null) THEN 1 ELSE 0 END) AS With_Changes,
SUM(CASE WHEN (co.exclusions = '' OR co.exclusions IS null OR co.extras = '' OR co.extras IS null) THEN 1 ELSE 0 END) AS No_Changes
FROM customer_orders co INNER JOIN runner_orders ro using (order_id)
WHERE cancellation is null or cancellation = ''
GROUP BY customer_id;

# 8.How many pizzas were delivered that had both exclusions and extras?
SELECT SUM(CASE WHEN (co.exclusions != '' AND co.exclusions IS NOT null AND co.extras != '' AND co.extras IS NOT null) THEN 1 ELSE 0 END) AS Pizza_Delivered 
FROM customer_orders co JOIN runner_orders ro using (order_id)
WHERE cancellation is null or cancellation = '';

# 9.What was the total volume of pizzas ordered for each hour of the day?
SELECT HOUR(order_time) AS hour_of_day, COUNT(*) AS Pizza_ordered 
FROM customer_orders
GROUP BY hour_of_day;

# 10.What was the volume of orders for each day of the week?
SELECT DAYOFWEEK(order_time) AS Day_of_week, COUNT(*) AS Pizza_ordered
FROM customer_orders
GROUP BY Day_of_week;

#B. Runner and Customer Experience

# 1.How many runners signed up for each 1 week period? (i.e. week starts 2021-01-01)
SELECT DATE_FORMAT(registration_date, '%Y-%u') AS Week_starting, COUNT(*) AS Runners_signed_up
FROM runners 
GROUP BY Week_starting;

# 2.What was the average time in minutes it took for each runner to arrive at the Pizza Runner HQ to pickup the order?
SELECT runner_id, AVG(MINUTE(pickup_time)) AS Avg_Time
FROM runner_orders
GROUP BY runner_id;

# 3.Is there any relationship between the number of pizzas and how long the order takes to prepare?
# Answer -- There is no relationship between number of pizzas and how long the order takes to prepare it.
SELECT co.order_id, MAX(ro.duration) AS duration, COUNT(co.order_id) AS number_of_pizzas
FROM customer_orders co 
JOIN runner_orders ro ON co.order_id = ro.order_id
WHERE ro.pickup_time IS NOT NULL
GROUP BY co.order_id;

# 4.What was the average distance travelled for each customer?
SELECT customer_id, ROUND(AVG(REPLACE(ro.distance, 'km', '')),2) AS avg_distance_travelled_km
FROM customer_orders co JOIN runner_orders ro USING (order_id) 
WHERE ro.distance IS NOT NULL
GROUP BY customer_id;

# 5.What was the difference between the longest and shortest delivery times for all orders?
SELECT 
MAX(TIMESTAMPDIFF(MINUTE, STR_TO_DATE(pickup_time, '%Y-%m-%d %H:%i:%s'), STR_TO_DATE(CONCAT(SUBSTRING(pickup_time, 1, 10), ' ', SUBSTRING(duration, 1, LOCATE(' ', duration)-1)), '%Y-%m-%d %H:%i:%s'))) - 
MIN(TIMESTAMPDIFF(MINUTE, STR_TO_DATE(pickup_time, '%Y-%m-%d %H:%i:%s'), STR_TO_DATE(CONCAT(SUBSTRING(pickup_time, 1, 10), ' ', SUBSTRING(duration, 1, LOCATE(' ', duration)-1)), '%Y-%m-%d %H:%i:%s'))) AS delivery_time_difference_minutes
FROM runner_orders
WHERE pickup_time IS NOT NULL AND duration IS NOT NULL;

# 6.What was the average speed for each runner for each delivery and do you notice any trend for these values?
SELECT runner_id,
AVG(CAST(REPLACE(distance, 'km', '') AS DECIMAL(5,2)) / (CAST(SUBSTRING_INDEX(duration, ' ', 1) AS DECIMAL(5,2)) / 60)) AS avg_speed_kmh
FROM runner_orders
WHERE distance IS NOT NULL AND duration IS NOT NULL
GROUP BY runner_id;

# 7.What is the successful delivery percentage for each runner?
SELECT runner_id,
round((SUM(CASE WHEN cancellation IS NULL OR cancellation = '' THEN 1 ELSE 0 END) / COUNT(*))*100,1) AS successful_delivery_percentage
FROM runner_orders
GROUP BY runner_id;

#  C. Ingredient Optimisation

# 1. What are the standard ingredients for each pizza?
SELECT pn.pizza_name, pt.topping_name
FROM pizza_recipes pr
JOIN pizza_names pn ON pr.pizza_id = pn.pizza_id
JOIN pizza_toppings pt ON FIND_IN_SET(pt.topping_id, pr.toppings);

# 2. What was the most commonly added extra?
SELECT pt.topping_name, COUNT(*) AS frequency
FROM customer_orders co
JOIN pizza_toppings pt ON FIND_IN_SET(pt.topping_id, co.extras)
GROUP BY pt.topping_name
ORDER BY frequency DESC LIMIT 1;

# 3. What was the most common exclusion?
SELECT pt.topping_name, COUNT(*) AS frequency
FROM customer_orders co
JOIN pizza_toppings pt ON FIND_IN_SET(pt.topping_id, co.exclusions)
GROUP BY pt.topping_name
ORDER BY frequency DESC LIMIT 1;

# 4. Generate an order item for each record in the customer_orders table in the specified format
SELECT co.order_id, pn.pizza_name,
CASE WHEN co.exclusions IS NOT NULL AND co.extras IS NOT NULL THEN CONCAT(pn.pizza_name, ' - Exclude ', GROUP_CONCAT(DISTINCT pt1.topping_name ORDER BY pt1.topping_name SEPARATOR ', '), ' - Extra ', GROUP_CONCAT(DISTINCT pt2.topping_name ORDER BY pt2.topping_name SEPARATOR ', '))
	 WHEN co.exclusions IS NOT NULL THEN CONCAT(pn.pizza_name, ' - Exclude ', GROUP_CONCAT(DISTINCT pt1.topping_name ORDER BY pt1.topping_name SEPARATOR ', '))
	 WHEN co.extras IS NOT NULL THEN CONCAT(pn.pizza_name, ' - Extra ', GROUP_CONCAT(DISTINCT pt2.topping_name ORDER BY pt2.topping_name SEPARATOR ', '))
	 ELSE pn.pizza_name
     END AS order_item
FROM customer_orders co
JOIN pizza_names pn ON co.pizza_id = pn.pizza_id
LEFT JOIN pizza_toppings pt1 ON FIND_IN_SET(pt1.topping_id, co.exclusions)
LEFT JOIN pizza_toppings pt2 ON FIND_IN_SET(pt2.topping_id, co.extras)
GROUP BY co.order_id, pn.pizza_name, co.exclusions, co.extras;

# 5. Generate an alphabetically ordered comma-separated ingredient list for each pizza order and add a 2x in front of any relevant ingredients
SELECT co.order_id, pn.pizza_name,CONCAT(pn.pizza_name, ': ', GROUP_CONCAT(DISTINCT CASE WHEN FIND_IN_SET(pt.topping_id, co.extras) THEN CONCAT('2x', pt.topping_name)
                                                                                         ELSE pt.topping_name
																						 END ORDER BY pt.topping_name SEPARATOR ', ')) AS ingredient_list
FROM customer_orders co
JOIN pizza_recipes pr ON co.pizza_id = pr.pizza_id
JOIN pizza_names pn ON co.pizza_id = pn.pizza_id
JOIN pizza_toppings pt ON FIND_IN_SET(pt.topping_id, pr.toppings)
GROUP BY co.order_id, pn.pizza_name;

# 6. What is the total quantity of each ingredient used in all delivered pizzas sorted by most frequent first?
SELECT pt.topping_name, SUM(CASE WHEN FIND_IN_SET(pt.topping_id, co.extras) THEN 2 ELSE 1 END) AS total_quantity
FROM customer_orders co
JOIN runner_orders ro ON co.order_id = ro.order_id
JOIN pizza_recipes pr ON co.pizza_id = pr.pizza_id
JOIN pizza_toppings pt ON FIND_IN_SET(pt.topping_id, pr.toppings)
WHERE ro.cancellation IS NULL OR ro.cancellation = ''
GROUP BY pt.topping_name
ORDER BY total_quantity DESC;

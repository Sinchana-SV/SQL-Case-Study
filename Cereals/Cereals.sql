Create database Cereals;
Use Cereals;
select * from cereals_data;

# 1. Add index name fast on name  
describe cereals_data;
Alter table cereals_data
modify name varchar(50);
create index fast on cereals_data (name);

# 2. Describe the schema of table 
describe cereals_data;

# 3. Create view name as see where users can not see type column [first run appropriate query then create view]  
create view see as (
select name, mfr, calories,protein,fat,sodium,fiber,carbo,sugars,potass,vitamins,shelf,weight,cups,rating from cereals_data);
select * from see;

# 4. Rename the view as saw
Rename table see to saw;
SELECT * from saw;

select * from cereals_data;

# 5. Count how many are cold cereals
select type, count(type) as No_cold_cereals
from cereals_data where type = "c"
group by type;

# 6. Count how many cereals are kept in shelf 3  
select shelf, count(shelf) as No_cereals
from cereals_data where shelf = 3
group by shelf;

# 7. Arrange the table from high to low according to ratings  
select * from cereals_data
order by rating desc;

# 8. Suggest some column/s which can be Primary key  
alter table cereals_data
add column Sl_no int auto_increment primary key
first;

select * from cereals_data;

# 9. Find average of calories of hot cereal and cold cereal in one query 
select type, avg(calories) as Avg_calories
from cereals_data
group by type;

# 10. Add new column as HL_Calories where more than average calories should be categorized as 
# HIGH and less than average calories should be categorized as LOW  
Alter table cereals_data
add column HL_Calories enum ('High','Low');
Alter table cereals_data
drop column HL_Calories;


select * from cereals_data;
select avg(calories) from cereals_data;

Update cereals_data 
set HL_Calories = (case 
				   when calories> (select avg(calories) as avg_cal from cereals_data) then "High"
				  else "Low"
				  end);

select * from cereals_data;
use cereals;

update cereals_data set HL_calories = null;

# CTE (common table expression) it act's as an temp table with in the query or statement
with CTE as (
select avg(calories) as avg_cal from cereals_data)
update cereals_data set HL_Calories = case when Calories <(select avg_cal from CTE) then "Low" else "High" end;

desc cereals_data;
alter table cereals_data modify HL_Calories varchar(10);



# 11. List only those cereals whose name begins with B 
select name from cereals_data where name like "B%";

# 12. List only those cereals whose name begins with F  
select name from cereals_data where name like "F%";

# 13. List only those cereals whose name ends with s  
select name from cereals_data where name like "%s";

# 14. Select only those records which are HIGH in column HL_calories and mail to 
# jeevan.raj@imarticus.com [save/name your file as <your first name_cereals_high>] 
select * from cereals_data where HL_calories = "High";

# 15. Find maximum of ratings  
select max(rating) as Max_rating
from cereals_data;


# 16. Find average ratings of those were High and Low calories 
Select HL_Calories, avg(rating) as Avg_ratings 
from cereals_data group by HL_Calories;

# 17. Create two examples of Sub Queries of your choice and give explanation in the script 
# itself with remarks by using # 
 
 # list every cereal whose calorie count ia greater than average calorie
 select name, calories from cereals_data
 where calories > (select avg(calories) from cereals_data);

# list cereals whose calorie count is above average for their own mfr
select name,mfr,calories from cereals_data C1
where c1.calories > (select avg(c2.calories) from cereals_data as C2
                                             where c2.mfr = c1.mfr);
								
# 18. Remove column fat 
Alter table cereals_data
Drop column fat;

Select * from Cereals_data;

# 19. Count records for each manufacturer [mfr] 
Select mfr, count(mfr) as Count_records 
from Cereals_data
group by mfr;

# 20. Select name, calories and ratings only 
Select name, calories, rating from cereals_data;









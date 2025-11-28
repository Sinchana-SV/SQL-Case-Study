Create Database Insurance;  
Use Insurance;
Select * from insurance;

# 1. Count for each categories of ‘region  
select region, count(region) as Region
from insurance 
group by region;

# 2. Find 50 records of highest ‘age’ and export data/table to desktop 
select * from insurance
order by age desc limit 50;

# 3. Add index name ‘quick’ on ‘id’ 
create index quick on insurance(id); 

# 4. Describe the schema of table 
Desc insurance;

# 5. Create view name as ‘gender’ where users can not see ‘sex’ [Hint: first run appropriate query then create view] 
create view gender as(
select id,age,bmi,children,smoker,region,charges from insurance);

Select * from gender;

# 6. Rename the view as ‘type’  
Rename table gender to type;
Select * from type;

# 7. Count how many are ‘northwest’ insurance holders 
select region, count(region) as Cnt_Reg
from insurance
where region = "northwest";

# 8. Count how many insurance holders were ‘female’  
select sex, count(sex) as Cnt_female
from insurance
where sex = "female";

# 9. Create Primary key on a suitable column
Alter table insurance 
add constraint primary_key 
primary key (id);

select * from insurance;
desc insurance;

# 10. Create a new column ‘ratio’ which is age multiply by bmi 
alter table insurance
add column ratio float;

Update insurance set ratio = (age*bmi);

# 11. Arrange the table from high to low according to charges  
select * from insurance
order by charges desc;

# 12. Find MAX of ‘charges’  
select max(charges) as Max_Charges from insurance;
 
 # 13. Find MIN of ‘charges’ 
select min(charges) as Min_Charges from insurance;

# 14. Find average of ‘charges’ of male and female
Select sex,avg(charges) as Avg_Charges 
from insurance
group by sex;

# 15. Write a Query to rename column name sex to Gender 
Alter table insurance 
rename column sex to gender;

# 16. Add new column as HL_Charges where more than average charges should be 
# categorized as HIGH and less than average charges should be categorized as LOW
alter table insurance
add column HL_Charges varchar(10);
select avg(charges) from insurance;
update insurance set hl_charges = case when charges >13270 then "High" else "Low" end;

with CTE as (
select avg(charges) as Avg_charges from insurance)
update insurance set HL_Charges = case when HL_Charges <(select avg_charges from CTE) then "Low" else "High" end;


# 17. Change location/position of ‘smoker’ and bring before ‘children’
Alter table insurance 
modify column smoker text after bmi;

# 18. Show top 20 records
Select * from insurance limit 20;

# 19. Show bottom 20 records  
Select * from insurance 
order by id desc
limit 20;

# 20. Randomly select 20% of records and export to desktop 
select 0.2*(count(*)) from insurance;
select * from insurance limit 267;

# 21. Remove column ‘ratio’ 
Alter table insurance
drop column ratio;

# 22. Create one example of Sub Queries involving ‘bmi’ and ‘sex’ and give explanation in 
# the script itself with remarks by using #  

#Q. Find the number of male and female who has bmi greater than average bmi.
select gender, count(gender) as No_people from insurance 
where bmi >(select avg(bmi) from insurance)
group by gender; 

# 23. Create a view called Female_HL_Charges that shows only those data where 
# HL_Charges is High, Female, Smokers and with 0 children 
 create view Female_HL_Charges as (select HL_Charges, gender, smoker,children from insurance 
 where HL_charges = "High" and gender ="female" and children="0" and smoker ="yes"); 
 
 select * from Female_HL_Charges;
 
 # 24. Update children column if there is 0 children then make it as Zero Children, if 1 
# then one_children, if 2 then two_children, if 3 then three_children, if 4 then 
# four_children if 5 then five_children else print it as More_than_five_children. 
select * from insurance;
desc insurance;

Alter table insurance
modify children varchar(20);

update insurance set children= case when children="0" then "Zero Children"
                                     when children= "1" then "one_children"
                                     when children="2" then  "two_children"
                                     when children="3" then "three_children"
                                     when children= "4" then "four_children"
                                     when children="5" then "five_children"
                                     else "More_than_five_children"
                                     end;
                                     













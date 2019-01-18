##--- Home work -------
use sakila;
select first_name,last_name from actor;#--- 1a
select concat(ucase(first_name)," ",ucase(last_name)) as "Actor Name"  from actor;#---1b
select actor_id,first_name,last_name from actor where first_name="Joe";#---2a
select actor_id,first_name,last_name from actor where last_name like"%GEN%";#---2b
select actor_id,first_name,last_name from actor where last_name like"%LI%" order by last_name, first_name;#---2c
select country_id, country from country where country in("Afghanistan","Bangladesh","China");#---2d
alter table actor add column description blob; #--3a
alter table actor drop column description;#--3b
select last_name, count(last_name) Lastname_Count from actor group by last_name;#--4a
select last_name, count(last_name) Lastname_Count from actor group by last_name having count(last_name) >1;#--4b
#select * from actor where first_name = "GROUCHO" and last_name = "WILLIAMS";
UPDATE ACTOR SET FIRST_NAME ="HARPO"
WHERE  first_name = "GROUCHO" and last_name = "WILLIAMS"; #----4C
update actor set First_name="Groucho" WHERE FIRST_NAME = "HARPO";#--4d
show create table address;#--5a
select s.first_name,s.last_name,a.address from staff s inner join address a on s.address_id=a.address_id; #-----6a
select s.first_name,s.last_name,sum(p.amount) as "Total_amount" from staff s inner join payment p on s.staff_id=p.staff_id 
  where month(payment_date)=8 and year(payment_date)=2005 group by s.first_name,s.last_name;#-----6b


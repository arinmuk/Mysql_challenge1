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
  
select title, count(fa.actor_id) as number_of_actors from film f inner join film_actor fa on f.film_id=fa.film_id group by title;  #--6c
select f.title,count(title) as "no_copies" from film f inner join inventory i on f.film_id=i.film_id 
	where f.title="Hunchback Impossible"; #--6d
    
select c.last_name, sum(p.amount) as "Total Amount Paid" from customer c inner join payment p on c.customer_id=p.customer_id 
	group by c.last_name order by last_name ; ###-- 6e

select title from film where title like "K%" or title like "Q%" and 
language_id in
(select distinct(l.language_id) from film f inner join language l on f.language_id=l.language_id where name = "English"); ##-- 7a

select concat(ucase(a.first_name)," ",ucase(a.last_name)) as "Actor Name" from actor a inner Join film_actor fa on a.actor_id=fa.actor_id where fa.film_id in (
select film_id from film where title = "Alone Trip"); #--7b

select concat(ucase(cust.first_name)," ",ucase(cust.last_name)) as "Customer Name",email 
 from customer cust inner join address a on cust.address_id=a.address_id where a.city_id in 
(select ct.city_id from city ct join country c on c.country_id=ct.country_id where country ="Canada");#--7c

    
select title from film f inner join film_category fc on f.film_id=fc.film_id
inner join category c on fc.category_id=c.category_id
where name ="family";#--7d

select title, count(title) as "number_of_rentals" from inventory i inner join rental r on i.inventory_id=r.inventory_id 
inner join film f on f.film_id = i.film_id
group by r.inventory_id, title order by number_of_rentals desc; #---7e
  

select s.store_id,sum(p.amount) as "total amount" from payment p inner join rental r on p.rental_id =r.rental_id
 inner join inventory i on r.inventory_id = i.inventory_id
 inner join store s on s.store_id = i.store_id group by s.store_id;#---7f
 
 
 
 select s.store_id, a.address,ct.city,c.country  from store s inner join address a on s.address_id=a.address_id
 inner join city ct on a.city_id=ct.city_id
 inner join country c on ct.country_id =c.country_id;#--7g
 
 select c.name,sum(p.amount) as "total amount" from payment p inner join rental r on p.rental_id =r.rental_id
 inner join inventory i on r.inventory_id = i.inventory_id
 inner join film f on f.film_id = i.film_id 
 inner join film_category fc on f.film_id=fc.film_id
 inner join category c on fc.category_id=c.category_id
  group by c.name
 order by sum(p.amount) desc limit 5;#---7h
 


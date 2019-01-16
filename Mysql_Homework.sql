##--- Home work -------
use sakila;
select first_name,last_name from actor;#--- 1a
select concat(ucase(first_name)," ",ucase(last_name)) as "Actor Name"  from actor;#---1b
select actor_id,first_name,last_name from actor where first_name="Joe";#---2a
select actor_id,first_name,last_name from actor where last_name like"%GEN%";#---2b
select actor_id,first_name,last_name from actor where last_name like"%LI%" order by last_name, first_name;#---2c
select country_id, country from country where country in("Afghanistan","Bangladesh","China");#---2d
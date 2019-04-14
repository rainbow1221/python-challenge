use sakila;

1a.
select first_name,last_name from sakila.actor;

1b.
SELECT upper(concat(first_name,' ', last_name)) AS 'Actor Name'
FROM sakila.actor;

 2a.
 select first_name,last_name, actor_id from actor where first_name ='Joe';
 
 2b.
 select first_name,last_name  from sakila.actor where last_name like '%GEN%';
 
 2c.
 select * from actor where last_name like '%LI%' order by last_name,first_name;
 
2d.
 select country_id,country from country where country in ('Afghanistan','Bangladesh','China');
 
3a.
ALTER TABLE `sakila`.`actor` 
ADD COLUMN `description` BLOB NOT NULL AFTER `last_update`;

3b.
ALTER TABLE `sakila`.`actor` DROP COLUMN `description`;  

4a.
SELECT last_name, COUNT(last_name) AS counts
FROM actor
GROUP BY last_name
HAVING (counts >= 1);

4b.
SELECT last_name, COUNT(last_name) AS counts
FROM actor
GROUP BY last_name
HAVING (counts > 1);

4c.
UPDATE sakila.actor
SET
first_name = 'HARPO'
WHERE FIRST_NAME = 'GROUCHO'
and last_name='WILLIAMS';

4d.
UPDATE sakila.actor
SET
first_name = 'GROUCHO'
WHERE FIRST_NAME = 'HARPO'
and last_name='WILLIAMS';

5a. 
show create table address;

6a.
select s.first_name,s.last_name,a.address 
from sakila.staff s, sakila.address a
where s.address_id=a.address_id;

6a.
SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
USING (address_id);

6b.
select s.first_name, s.last_name, concat('$', format(SUM(p.amount),2)) AS total_rung
from sakila.staff s
JOIN sakila.payment p
USING (staff_id)
where DATE(p.payment_date) like '2005-08%'
group by s.first_name,s.last_name;

6c.
select f.title, count(a.actor_id) AS count
from sakila.film f
join sakila.film_actor a
using(film_id)
group by f.title;

6d.
select f.title,sum(i.store_id) total_copies
from sakila.film f
join sakila.inventory i
using(film_id)
where f.title='Hunchback Impossible'
group by f.title;

6e.
select c.first_name,c.last_name,concat('$', format(SUM(p.amount),2)) AS total_payment
from sakila.customer c
join sakila.payment p
using(customer_id)
group by c.first_name,c.last_name
order by c.last_name;


7a.
select title, language_id
from sakila.film 
where language_id in 
(select language_id 
from sakila.language
where name='ENGLISH')
and title like 'K%' or title like 'Q%';

7b.
select first_name,last_name
from sakila.actor
where actor_id in 
(select actor_id
from sakila.film_actor
where film_id in 
(select film_id
from sakila.film
where title ='Alone Trip'));

7c
select first_name,last_name,email
from sakila.customer
where address_id in
  (select address_id
  from sakila.address
  where city_id in 
    (select city_id
    from sakila.city
    where country_id in 
     (select country_id 
      from sakila.country
      where country='Canada'
	)
  )
);

7d.
select title from sakila.film
where film_id in 
  (select film_id 
  from sakila.film_category
  where category_id in 
     (select category_id 
     from sakila.category
     where name='family' or name='FAMILY'
     )
  );
  
7e.
SELECT f.title, COUNT(r.rental_id) AS count
FROM sakila.film f, sakila.inventory i, sakila.rental r
WHERE f.film_id = i.film_id
AND i.inventory_id = r.inventory_id
GROUP BY title
ORDER BY count DESC;

7f.
SELECT s.store_id, concat('$', format(SUM(amount),2)) AS 'total_business'
FROM sakila.store s, sakila.staff sf, sakila.payment p
WHERE s.store_id = sf.store_id
AND sf.staff_id = p.staff_id
GROUP BY s.store_id;

7g.
SELECT s.store_id, city, country
FROM sakila.store s, sakila.address a, sakila.city ci, sakila.country co
WHERE s.address_id = a.address_id
AND a.city_id = ci.city_id
AND ci.country_id = co.country_id;

7h.
SELECT c.name, concat ('$', format(SUM(p.amount), 2)) AS 'Gross Revenue' 
FROM sakila.category c, sakila.film_category fc, sakila.inventory i, sakila.rental r,  sakila.payment p
WHERE c.category_id = fc.category_id
AND fc.film_id = i.film_id
AND i.inventory_id = r.inventory_id
AND r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY SUM(amount) DESC
LIMIT 5;

8a.
CREATE VIEW sakila.Top_Five_Genres as 
(SELECT c.name, concat ('$', format(SUM(p.amount), 2)) AS 'Gross Revenue' 
FROM sakila.category c, sakila.film_category fc, sakila.inventory i, sakila.rental r,  sakila.payment p
WHERE c.category_id = fc.category_id
AND fc.film_id = i.film_id
AND i.inventory_id = r.inventory_id
AND r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY SUM(amount) DESC
LIMIT 5);

8b.
select * from sakila.top_five_Genres;

8c.
Drop view sakila.top_five_Genres;

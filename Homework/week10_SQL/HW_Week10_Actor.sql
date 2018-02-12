use sakila;

##HW item 1a.
select first_name, last_name
from actor;

##HW item 1b

alter table actor
ADD actor_name VARCHAR(90);

#checking sql query to concatenate first and last name
select concat(first_name,' ',last_name) as full_name from actor;


#inserting values into newly created actor_name Column

update actor set actor_name = concat(first_name,' ',last_name);
select * from actor;

#item 2a
Select actor_id, first_name, last_name
from actor
where first_name = 'joe';

#item 2b
Select actor_id, first_name, last_name
from actor
where last_name like '%gen%';

#item 2c. Find all actors whose last names contain the letters `LI`. This time, order the rows by last name and first name, in that order:
Select actor_id, first_name, last_name
from actor
where last_name like '%li%'
order by last_name, first_name;

#item 2d. Using `IN`, display the `country_id` and `country` columns of the following countries: Afghanistan, Bangladesh, and China:
Select country_id, country
from country
where country IN ('afghanistan','bangladesh','china');

#item 3a Add a `middle_name` column to the table `actor`. Position it between `first_name` and `last_name`. Hint: you will need to specify the data type.
alter table actor
add middle_name VARCHAR(50)
after first_name;

Select * from actor;

#item 3b. You realize that some of these actors have tremendously long last names. Change the data type of the `middle_name` column to `blobs`.
alter table actor
modify column middle_name blob;

#item * 3c. Now delete the `middle_name` column.
alter table actor
drop column middle_name;
Select * from actor;

#item * 4a. List the last names of actors, as well as how many actors have that last name.

select last_name,count(last_name)
from actor
group by last_name;

#item 4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

select last_name,count(last_name)
from actor
group by last_name
having count(last_name) > 1;

#item 4c. Oh, no! The actor `HARPO WILLIAMS` was accidentally entered in the `actor` table as `GROUCHO WILLIAMS`, the name of Harpo's second cousin's husband's yoga teacher. Write a query to fix the record.
#checking for rows with first name
select first_name, last_name, actor_name 
from actor 
where first_name = 'GROUCHO';

update actor 
set first_name = 'HARPO', actor_name = 'HARPO WILLIAMS'
where (first_name = 'GROUCHO' AND last_name = 'WILLIAMS');

#checking update
select first_name, last_name, actor_name 
from actor 
where first_name = 'HARPO';

#item * 4d. Perhaps we were too hasty in changing `GROUCHO` to `HARPO`. It turns out that `GROUCHO` was the correct name after all! In a single query, if the first name of the actor is currently `HARPO`, change it to `GROUCHO`. Otherwise, change the first name to `MUCHO GROUCHO`, as that is exactly what the actor will be with the grievous error. BE CAREFUL NOT TO CHANGE THE FIRST NAME OF EVERY ACTOR TO `MUCHO GROUCHO`, HOWEVER! (Hint: update the record using a unique identifier.)


update actor
set first_name = 'GROUCHO', actor_name = 'GROUCHO WILLIAMS'
where first_name = 'HARPO';

#item 5a. You cannot locate the schema of the `address` table. Which query would you use to re-create it?

Show columns from address;

#item 6a Use `JOIN` to display the first and last names, as well as the address, of each staff member. Use the tables `staff` and `address`:

Select a.first_name, a.last_name, a.address_id, b.address
from staff a
join address b
on (a.address_id = b.address_id);

#item 6b. Use `JOIN` to display the total amount rung up by each staff member in August of 2005. Use tables `staff` and `payment`. 
select sum(a.amount), a.staff_id, b.first_name, b.last_name
from payment a

join staff b
on (a.staff_id = b.staff_id)
group by a.staff_id;

#item 6c. List each film and the number of actors who are listed for that film. Use tables `film_actor` and `film`. Use inner join.

select a.film_id, a.title, count(b.actor_id)
from film a

inner join film_actor b
on (a.film_id = b.film_id)
group by a.film_id;

#item 6d. How many copies of the film `Hunchback Impossible` exist in the inventory system?
select count(inventory_id)
from inventory
where film_id in
(select film_id
from film
where title = 'Hunchback Impossible');

#item 6e. Using the tables `payment` and `customer` and the `JOIN` command, list the total paid by each customer. List the customers alphabetically by last name:

select a.customer_id,a.first_name, a.last_name, sum(b.amount)
from customer a

join payment b
on (a.customer_id = b.customer_id)
group by a.customer_id
order by a.last_name;

#item 7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters `K` and `Q` have also soared in popularity. Use subqueries to display the titles of movies starting with the letters `K` and `Q` whose language is English. 

select title
from film
where title LIKE 'k%' OR title LIKE 'q%'
AND
language_id in
(select language_id
from language
where name ='english');

#item 7b. Use subqueries to display all actors who appear in the film `Alone Trip`.
select a.actor_id, b.first_name, b.last_name
from film_actor a

join actor b
on (a.actor_id = b.actor_Id)

where a.film_id in
(select film_id
from film
where title = 'Alone Trip');

#item 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.

select a.address_id, a.email, a.first_name, a.last_name, b.location
from customer a

join address b
on (a.address_id = b.address_id)

where a.address_id in
(select city_id
from address
where city_id in
(select city_id
from city
where country_id in 
(select country_id
from country
where country = 'Canada')));

#item 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.

select title
from film
where film_id in
(select film_id
from film_category
where category_id in
(select category_id
from category
where name = 'Family'));

#item 7e. Display the most frequently rented movies in descending order.

select count(a.rental_id), b.film_id, c.title

from rental a

join inventory b

on (a.inventory_id = b.inventory_id)

join film c

on (b.film_id = c.film_id)

group by b.film_id
order by count(a.rental_id) DESC;

#item 7f. Write a query to display how much business, in dollars, each store brought in.

select sum(a.amount), c.store_id

from payment a

join rental b

on (a.rental_id = b.rental_id)

join inventory c

on (b.inventory_id = c.inventory_id)

group by c.store_id
order by sum(a.amount) DESC;

#item 7g. Write a query to display for each store its store ID, city, and country.

select a.store_id, c.city, d.country
from store a

join address b

on (a.address_id = b.address_id)

join city c

on (b.city_id = c.city_id)

join country d

on (c.country_id = d.country_id);

#item 7h. List the top five genres in gross revenue in descending order. (**Hint**: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

select sum(a.amount), f.name

from payment a

join rental b

on (a.rental_id = b.rental_id)

join inventory c

on (b.inventory_id = c.inventory_id)

join film d

on (c.film_id = d.film_id)

join film_category e

on (d.film_id = e.film_id)

join category f

on (e.category_id = f.category_id)

group by f.name
order by sum(a.amount) desc
limit 5;

#item 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.


Create view top_5_Genres as

select sum(a.amount) as 'Total Gross Revenue' , f.name as 'Genres'

from payment a

join rental b

on (a.rental_id = b.rental_id)

join inventory c

on (b.inventory_id = c.inventory_id)

join film d

on (c.film_id = d.film_id)

join film_category e

on (d.film_id = e.film_id)

join category f

on (e.category_id = f.category_id)

group by f.name
order by sum(a.amount) desc
limit 5;

#item * 8b. How would you display the view that you created in 8a?

select * from top_5_genres;

#item 8c. You find that you no longer need the view `top_five_genres`. Write a query to delete it.

drop view top_5_genres;


/*
 * Write a SQL query SELECT query that:
 * List the first and last names of all actors who have appeared in movies in the "Children" category,
 * but that have never appeared in movies in the "Horror" category.
 *
 * HINT:
 * This requires joining from the category table down to the actor table.
 */
select first_name, last_name

from film 
inner join film_actor using(film_id)
inner join actor using(actor_id) 
inner join film_category using(film_id)
inner join category using(category_id)
where actor_id not in (select actor_id
       from film_actor
	inner join film using(film_id)
	inner join film_category using(film_id)
	inner join category using(category_id)
	where name = 'Horror'
) and name = 'Children'
group by first_name, last_name 
order by first_name, last_name

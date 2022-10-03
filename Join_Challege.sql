-- California sales tax laws have changed and we need to alert our customers to this through email.
--What are the emails of the customers who live in California?
select email, address.district from customer
left join address ON address.address_id = customer.address_id
where address.district = 'California';


-- A customer is a huge fan of actor Nick Wahlberg and wants to know all the moves hs is in.  
-- Get a list of all the movie Nick Wahlberg has been in.
select film.title, actor.first_name, actor.last_name from film_actor
inner join film on film_actor.film_id = film.film_id
inner join actor on film_actor.actor_id = actor.actor_id
where first_name = 'Nick' and last_name = 'Wahlberg';

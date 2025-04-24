-- find the total quantity of each pizza category ordered.
select pizza_types.category, sum(order_details.quantity) as quantity
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by quantity desc;

-- Determine the distribution of orders by hour of the day.
select hour(order_time) AS Hour , count(order_id) AS order_count
 from orders
 group by hour(order_time);
 
--  Join relevant tables to find the category-wise distribution of pizzas.
select category, count(name) from pizza_types
group by category;
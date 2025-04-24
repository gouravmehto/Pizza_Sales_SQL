-- Group the orders by date and calculate the average number of pizzas ordered per day.
select round(avg(quantity), 0) as avg_pizza_ordered_per_day from
(select orders.order_date, sum(order_details.quantity) as quantity
from orders join order_details
on orders.order_id = order_details.order_id
group by orders.order_date) as order_quamtity;

-- Determine the top 3 most ordered pizza types based on revenue
select pizza_types.name, sum(order_details.quantity * pizzas.price) as revenue
from pizza_types join pizzas
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.name order by revenue desc limit 3 ;

-- Calculate the percentage contribution of each pizza type to total revenue.		
select pizza_types.category,
round(sum(order_details.quantity * pizzas.price) / (select 
round(sum(order_details.quantity * pizzas.price),2) as total_sales
from order_details join pizzas
on pizzas.pizza_id = order_details.pizza_id) *100, 2) as revenue
from pizza_types join pizzas 
on pizzas.pizza_type_id = pizza_types.pizza_type_id
join order_details
on order_details.pizza_id = pizzas.pizza_id
group by pizza_types.category order by revenue desc;
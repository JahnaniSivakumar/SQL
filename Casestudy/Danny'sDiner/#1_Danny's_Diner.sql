select * from dannys_diner.sales;
select * from dannys_diner.menu;
select * from dannys_diner.members;

-- Q1. What is the total amount each customer spent at the restaurant?
select s.customer_id, sum(m.price) as total_amt from dannys_diner.sales s
left join dannys_diner.menu m
on s.product_id = m.product_id
group by s.customer_id
order by 2 desc;

-- Q2. How many days has each customer visited the restaurant?
select customer_id, count(distinct order_date) as num_of_days_customer_visited
from dannys_diner.sales
group by 1
order by 2 desc

-- Q3. What was the first item from the menu purchased by each customer?
with cte as (
select s.*, m.product_name, rank() over(partition by customer_id order by order_date) as rnk
from dannys_diner.sales s
left join dannys_diner.menu m
on s.product_id = m.product_id )

select customer_id, product_name from cte where rnk = 1
order by product_id

-- Q4. What is the most purchased item on the menu and how many times was it purchased by all customers?

select s.product_id, m.product_name, count(*) as cnt  
from dannys_diner.sales s
left join dannys_diner.menu m
on s.product_id = m.product_id
group by s.product_id, m.product_name
order by 3 desc
limit 1;

-- Q5. Which item was the most popular for each customer?
with cte as (
select s.customer_id, s.product_id, m.product_name, count(*),
rank() over(partition by customer_id order by count(*) desc) as rnk
from dannys_diner.sales s
left join dannys_diner.menu m 
on s.product_id = m.product_id
group by s.customer_id, s.product_id, m.product_name
order by 1, 2, 3 desc)

select customer_id, product_name, count
from cte
where rnk = 1
order by 1,3 desc

-- Q6. Which item was purchased first by the customer after they became a member?

with cte as (
select s.*, mem.join_date, rank() over(partition by s.customer_id order by s.order_date asc)  as rnk
from dannys_diner.members mem
left join dannys_diner.sales s
on mem.customer_id = s.customer_id
where s.order_date >= mem.join_date)

select c.customer_id, c.join_date, c.order_date, m.product_name
from cte c join dannys_diner.menu m
on c.product_id = m.product_id
where rnk = 1
order by 1;

-- Q7. Which item was purchased just before the customer became a member?

with cte as (
select s.*, mem.join_date, rank() over(partition by s.customer_id order by s.order_date desc)  as rnk
from dannys_diner.members mem
left join dannys_diner.sales s
on mem.customer_id = s.customer_id
where s.order_date < mem.join_date)

select c.customer_id, c.order_date, c.join_date, m.product_name
from cte c join dannys_diner.menu m
on c.product_id = m.product_id
where rnk =1
order by 1

-- Q8. What is the total items and amount spent for each member before they became a member?
with cte as (
select s.*, mem.join_date, rank() over(partition by s.customer_id order by s.order_date desc)  as rnk
from dannys_diner.members mem
left join dannys_diner.sales s
on mem.customer_id = s.customer_id
where s.order_date < mem.join_date)

select c.customer_id, sum(m.price) as amt_spent, count(*) as total_items from cte c 
join dannys_diner.menu m 
on c.product_id = m.product_id
group by 1
order by 1 

-- Q9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?
with cte as (
select s.*, m.price, m.product_name, 
case when m.product_name = 'sushi' then price* 20 else price * 10 end as points
from dannys_diner.sales s
join dannys_diner.menu m 
on s.product_id = m.product_id)

select customer_id, sum(points) as final_points
from cte group by customer_id
order by 2 desc;

-- Q10. In the first week after a customer joins the program (including their join date) they earn 2x points 
-- on all items, not just sushi - how many points do customer A and B have at the end of January?

with dates_cte as (
  select customer_id, join_date, join_date + 6 as valid_date, 
    DATE_TRUNC(
      'month', '2021-01-31'::DATE)
      + interval '1 month' 
      - interval '1 day' as last_date
  from dannys_diner.members
)

select 
  sales.customer_id, 
  sum(case
    when menu.product_name = 'sushi' then 2 * 10 * menu.price
    when sales.order_date between dates.join_date and dates.valid_date then 2 * 10 * menu.price
    else 10 * menu.price end) as points
from dannys_diner.sales
join dates_cte as dates
  on sales.customer_id = dates.customer_id
  and sales.order_date <= dates.last_date
join dannys_diner.menu
  on sales.product_id = menu.product_id
group by sales.customer_id;

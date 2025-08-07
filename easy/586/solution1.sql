-- The trick here is to use aggregation not in the `SELECT` statement but in
-- `ORDER BY` instead so we can use the function's result to sort in descending
-- order. The `LIMIT 1` statement will then show only the first record (which is
-- the one we're looking for since we sorted from highest to lowest value!)

select o.customer_number
from Orders o
group by o.customer_number
order by count(o.order_number) desc
limit 1

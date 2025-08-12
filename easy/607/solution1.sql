-- Using CTEs may not be always the most performatic solution, but sometimes they
-- make the query so much easier to understand. Here we first separate all the
-- orders made to the RED company, then we use the result as the left table on
-- a `LEFT JOIN` with `SalesPerson` looking speficially for `NULL` matches, i.e.,
-- for sales people who did not make any orders to RED.

with
    red as (
        select o.order_id
            ,o.sales_id
        from Orders o
        join Company c using (com_id)
        where c.name = 'RED'
    )
select s.name
from SalesPerson s
left join red r using (sales_id)
where r.order_id is null

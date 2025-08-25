-- The easiest way to solve this problem may be with a CTE/subquery. We can't use
-- set-returning functions like `unnest()` inside a `WHERE` clause (nor in any
-- clause that can act as a filter), so we need to first return a query with all
-- the possible combinations and then filter the `NULL` values.

with
    cte as (
        select p.product_id
            ,unnest(array['store1','store2','store3']) store
            ,unnest(array[p.store1,p.store2,p.store3]) price
        from Products p
    )
select c.*
from cte c
where c.price is not null

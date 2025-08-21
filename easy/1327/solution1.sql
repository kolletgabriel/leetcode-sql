-- This one is very simple. We just need to do the filtering in the right order,
-- i.e., one must be before and the other must be after the aggregation. We don't
-- want to compute anything out of the given date range, so we filter it in the
-- `WHERE` clause—which runs before the aggregation. We also don't want any
-- records in which `sum() < 100`, so we filter them out in the `HAVING` clause—
-- wich runs after the aggregation.

select p.product_name
    ,sum(o.unit) unit
from Products p
join Orders o using (product_id)
where o.order_date between '2020-02-01' and '2020-02-29'
group by p.product_name
having sum(o.unit) >= 100

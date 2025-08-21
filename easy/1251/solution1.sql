-- This problem has mainly 2 quirks: it asks for an average that can't be
-- calculated with the `avg()` function, and it requires a join using the
-- `BETWEEN` clause to handle the different dates properly. Because the average
-- is calculated manually, we then need to cast the values as something that is
-- not `int`, thus the `*1.0`.

select p.product_id
    ,round(
        coalesce(
            sum(p.price * u.units)*1.0 / sum(u.units)*1.0,
            0
        ),
        2
    ) average_price
from Prices p
left join UnitsSold u
    on u.purchase_date between p.start_date and p.end_date
    and u.product_id = p.product_id
group by p.product_id

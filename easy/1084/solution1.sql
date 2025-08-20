-- This is an interesting one, because we necessarily need an aggregation instead
-- of a `WHERE`/`BETWEEN` trick. The problem asks for the (distinct) products
-- sold only in a given period. So, if a product sold both in and out of that
-- period, it must not be included. If we use `BETWEEN`, we are including records
-- of products sold within the period--records, not products! That's the problem.
-- By using `min()` and `max()` for each individual product we can safely filter
-- properly, because both conditions must be true at the same time.

select p.product_id
    ,p.product_name
from Product p
join Sales s using (product_id)
group by 1, 2
having min(s.sale_date) >= '2019-01-01'
    and max(s.sale_date) <= '2019-03-31'

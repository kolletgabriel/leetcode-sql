-- This one can be quite tricky if we're not very used to deal with arrays. Since
-- we need the number of different products sold—not the total units—we must use
-- the `DISTINCT` keyword to avoid counting duplicates. Finally, for the array
-- part, we need to use the `string_agg()` with an `ORDER BY` expression inside
-- to properly sort the names as specified by the problem.

select a.sell_date
    ,count(distinct a.product) num_sold
    ,string_agg(distinct a.product, ',' order by a.product) products
from Activities a
group by a.sell_date
order by a.sell_date

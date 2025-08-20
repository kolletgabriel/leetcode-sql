-- This solution is less verbose and uses a clever trick with the `avg()`
-- function, but just because of that it also may be not so straightforward to
-- understand. The `avg()` function alone does the job of dividing the selected
-- records by the total amount. Also, is good to mention that we can't replace
-- `CASE`/`WHEN` with `FILTER` since `FILTER` only works for aggregate functions
-- and those can't be nested.

select q.query_name
    ,round(
        avg(q.rating*1.0 / q.position*1.0)
        , 2
    ) quality
    ,round(
        avg(case when q.rating < 3 then 1 else 0 end)*1.0
        * 100
        , 2
    ) poor_query_percentage
from Queries q
group by q.query_name

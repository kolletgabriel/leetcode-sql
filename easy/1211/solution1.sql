-- The hardest thing in this problem is not even solving it but actually writing
-- the query as something at least A BIT readable. One of the ways to solve it is
-- by "manually" calculating the percentage dividing the number of poor queries
-- by the number of total queries. We need of course multiply by 100. The `*1.0`
-- is a shortcut to cast a value as float (or numeric iirc) so the calculations
-- are performed correctly under the hood.

select q.query_name
    ,round(
        avg(q.rating*1.0 / q.position*1.0)
        , 2
    ) quality
    ,round(
        (count(q.query_name) filter (where q.rating < 3))*1.0
        / count(q.query_name)*1.0
        * 100
        , 2
    ) poor_query_percentage
from Queries q
group by q.query_name

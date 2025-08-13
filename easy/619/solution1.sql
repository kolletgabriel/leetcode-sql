-- That's probably the easiest to understand. The one thing in this problem that
-- can make it "hard" is the fact that we need to force in a `NULL` value if
-- there are no single numbers in the input table. The `max()` function does it
-- automatically, but here we can only make it work after a subquery/CTE.

with
    single as (
        select m.num
        from MyNumbers m
        group by m.num
        having count(*) = 1
    )
select max(s.num) num
from single s

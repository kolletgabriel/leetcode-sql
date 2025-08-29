-- We can achieve the same results with a cte/subquery plus the `lead()` window
-- function, that gets the next value of any field for a given record. For this
-- solution we don't need joins, but the filtering and the need of `DISTINCT` is
-- the same.

with
    cte as (
        select l.num num1
            ,lead(l.num, 1) over () num2
            ,lead(l.num, 2) over () num3
        from Logs l
    )
select distinct c.num1 ConsecutiveNums
from cte c
where c.num1 = c.num2
    and c.num1 = c.num3

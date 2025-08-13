-- Here is one extra solution using only 1 query. We can force the `NULL` values
-- by using a `CASE` statement. Also, we need to explicitly tell Postgres to
-- place the `NULL`s at the end after sort the results.

select case count(*)
        when 1 then m.num else null
    end num
from MyNumbers m
group by m.num
order by 1 desc nulls last  -- `1` is the `CASE` result, not the `m.num` itself!
limit 1

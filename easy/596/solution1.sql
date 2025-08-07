-- The filtering here must occour after the aggregation, so we must use the
-- `HAVING` statement. Also, we only aggregate in the `HAVING` statement since we
-- don't need the actual values on the output.

select c.class
from Courses c
group by c.class
having count(c.student) >= 5

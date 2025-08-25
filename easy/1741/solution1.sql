-- One more simple aggregation problem. This time, we need to aggregate not just
-- a single field but the result of a calculation using 2 different ones. Note
-- that `sum(x - y)` is different from `sum(x) - sum(y)`!

select e.event_day "day"  -- `day` is reserved, thus the quotes.
    ,e.emp_id
    ,sum(e.out_time - e.in_time) total_time
from Employees e
group by e.event_day
    ,e.emp_id

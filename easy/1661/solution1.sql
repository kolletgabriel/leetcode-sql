-- A good solution for this problem is by leveraging the `JOIN` capacity of
-- matching columns in different ways. Here, we do a self `INNER JOIN` in which
-- both sides must have strictly different values for the same field. After that,
-- it's a simple aggregation problem. One thing to mention is that we must
-- explicitly cast the aggregation's result to `NUMERIC` or `DECIMAL` since
-- `round()` doesn't take floats (or doubles) as valid arguments when also given
-- the number of decimal places.

select a1.machine_id
    ,round(avg(a2.timestamp-a1.timestamp)::numeric, 3) processing_time
from Activity a1
join Activity a2
    on a1.machine_id = a2.machine_id
    and a1.process_id = a2.process_id
    and a1.activity_type = 'start'
    and a2.activity_type = 'end'
group by a1.machine_id

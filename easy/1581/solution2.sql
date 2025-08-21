-- Another way to solve this problem is using the not so common `EXCEPT` set
-- operation, similar to the more famous `UNION` operation. With `EXCEPT` we can
-- discard all rows of the `Visits` table that appear in the `Transactions`
-- table, when joined with the first to find all visits for which exist a
-- transaction. Finally, we can use the result to aggregate the values with
-- `count()`, solving the last part of the problem.

with
    cte as (
        select v.visit_id, v.customer_id
        from Visits v
        except
        select t.visit_id, v.customer_id
        from Transactions t
        join Visits v using (visit_id)
    )
select c.customer_id
    ,count(*) count_no_trans
from cte c
group by c.customer_id

-- We can also solve this problem using window functions instead of self joins.
-- Most of the logic stays the same, but the difference is that the filtering
-- done previously in the `JOIN` is now in a `WHERE` clause with the same
-- subquery used to keep only the first logins. We need to separate the query
-- with the window function from the main one since we can't use window functions
-- directly inside `WHERE` etc.

with
    cte as (
        select a.player_id
            ,a.event_date
            ,lead(a.event_date) over (
                partition by a.player_id
                order by a.event_date
            ) next_date
        from Activity a
    )
select round(
        count(distinct c.player_id)*1.0
        / (select count(distinct a.player_id)*1.0 from Activity a)
    , 2) fraction
from cte c
where c.event_date - c.next_date = -1
    and (c.player_id, c.event_date) in (
        select a.player_id
            ,min(a.event_date)
        from Activity a
        group by a.player_id
    )

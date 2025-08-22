-- An easy to understand solution can be made by first calculating separatelly in
-- a cte/subquery the total amount of users then using it on the main query to
-- find the percentage we're looking for. We just need to remember to `*1.0` each
-- field for proper casting.

with
    cte as (
        select count(*) total_users
        from Users u
    )
select r.contest_id
    ,round(
        count(r.user_id)*1.0 / c.total_users*1.0 * 100,
        2
    ) percentage
from Register r
    ,cte c  -- `CROSS JOIN` here, but only for 1 single value
group by r.contest_id
    ,c.total_users
order by percentage desc
    ,r.contest_id

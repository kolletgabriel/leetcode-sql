-- This solution is arguably the same as the first, but without using the CTE
-- syntax. Instead we throw the same small query right into the `SELECT` part of
-- the main one.

select r.contest_id
    ,round(
        count(r.user_id)*1.0 / (select count(*) from Users)*1.0 * 100,
        2
    ) percentage
from Register r
group by r.contest_id
order by percentage desc
    ,r.contest_id

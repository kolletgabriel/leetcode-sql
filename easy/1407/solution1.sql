-- This one is also very simple: we just need to apply `coalesce()` to handle the
-- eventual `null` cases, because in this context they actually mean 0. The only
-- thing here that may be confusing is the fact that we need to `GROUP BY` with
-- the `id` field even if we're not bringing it into `SELECT`, because 2 distinct
-- users can have the same name.

select u.name
    ,coalesce(sum(r.distance), 0) travelled_distance
from Users u
left join Rides r
    on u.id = r.user_id
group by u.id
    ,u.name
order by travelled_distance desc
    ,u.name

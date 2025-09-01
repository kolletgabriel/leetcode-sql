-- This problem can be quite complicated to solve since we need different
-- aggregations for the same table: we need a `min()` grouping by `player_id` to
-- find the first date for each one, and 2 `count(DISTINCT ...)`: one for the
-- number of players that satisfie the conditions and the other for the total
-- amount of players. The solution goes as follows: we can do a self `INNER JOIN`
-- under the `a1.event_date - a2.event_date = -1` condition to pair only
-- consecutive days, then we further filter the results putting a subquery inside
-- the `WHERE` clause to keep only the records for which `a1.event_date`
-- corresponds to the first login date. Finally, in the `SELECT` statement, we
-- count the number of players kept after the filtering and divide it by the
-- number of total players—which also requires a subquery to find.

select round(
        count(distinct a1.player_id)*1.0
        / (select count(distinct a.player_id)*1.0 from Activity a)
    , 2) fraction
from Activity a1
join Activity a2
    on a1.player_id = a2.player_id
    and a1.event_date - a2.event_date = -1
where (a1.player_id, a1.event_date) in (
    select a.player_id
        ,min(a.event_date)
    from Activity a
    group by a.player_id
)

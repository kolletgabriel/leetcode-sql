-- We need to count the times each relation occurs, sou we aggregate with the
-- `count()` function. Since the filtering is after the aggrefation, we must use
-- the `HAVING` clause.

select a.actor_id
    ,a.director_id
from ActorDirector a
group by 1, 2
having count(*) >= 3

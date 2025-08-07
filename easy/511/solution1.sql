-- Just use the `min()` function, grouping by the id.

select player_id
    ,min(event_date) first_login
from Activity
group by player_id

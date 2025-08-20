-- First and foremost: this problem is poorly defined. Period. It fails to
-- describe what exactly constitutes an "active user" and doesn't clarify very
-- well how to handle sessions that start on one date and end on another. Still,
-- we can observe the example to have a decent idea for what to do.

select a.activity_date "day"  -- reserved word, thus the quotes
    ,count(distinct a.user_id) active_users
from Activity a
where a.activity_date between '2019-06-28' and '2019-07-27'
group by a.activity_date
having count(a.user_id) > 0  -- [^1]

-- [^1]: For some reason, the solution still works without it, but the problem
--       states it "doesn't care" about days with zero active users, implying the
--       need for this.

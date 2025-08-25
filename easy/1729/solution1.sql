-- This is the most basic use case for `count()` since we don't even need to
-- apply the function on a specific field and just use `*` to count the rows
-- themselves. This is because the number of rows for each `user_id` will always
-- be the same as the number of `follower_id`.

select f.user_id
    ,count(*) followers_count
from Followers f
group by f.user_id
order by f.user_id

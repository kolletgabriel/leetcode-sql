-- There isn't much to say about this problem because at some extent it is not a
-- proper SQL problem but a regex one. In Postgres, we an use the `regexp_like()`
-- function or even the `~` sign before the pattern string.

select *
from Users
where regexp_like(mail, '^[A-Za-z]+[A-Za-z0-9_.-]*@leetcode\.com$')
-- where mail ~ '^[A-Za-z]+[A-Za-z0-9_.-]*@leetcode\.com$'

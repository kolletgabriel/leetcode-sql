-- This is just a string manipulation problem. Nothing else happening here. We
-- need to break the original string in 2 different substrings and operate on
-- each one separatelly before snap them back into place. One thing to note is
-- that the `||` operator is for concatenation, but we could use the `concat()`
-- function instead.

select u.user_id
    ,upper(substr(u.name, 1, 1)) || lower(substr(u.name, 2)) name
from Users u
order by u.user_id

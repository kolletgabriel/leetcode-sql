-- Yet another pure regex problem. Nothing much to say about this one since regex
-- although important is a whole different topic.

select *
from Users
where email ~ '^[a-zA-Z0-9_]+@[a-zA-z]+\.com$'
order by 1

-- Probably the easiest problem. There's nothing here to break down, really.

select t.tweet_id
from Tweets t
where length(t.content) > 15

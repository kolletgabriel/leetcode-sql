-- Not much to talk about this one. They key is the `DISTINCT` statement, but it
-- could also be solved using `GROUP BY` to get rid of the eventual duplicates.

select distinct v.author_id "Id"
from Views v
where v.author_id = v.viewer_id
order by 1

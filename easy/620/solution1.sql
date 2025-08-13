-- There isn't much to uncover in this one. Maybe the trickiests part for some
-- could be the `%` mod operator to find the odd IDs.

select *
from Cinema c
where c.description <> 'boring'
    and (c.id % 2) = 1
order by rating desc

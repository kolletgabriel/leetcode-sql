-- Nothing much to say about this problem since literally all it asks is exactly
-- all `dense_rank()`, which we used in the last problem, gives us.

select s.score
    ,dense_rank() over (order by s.score desc) "rank"  -- `rank` is reserved, thus the quotes
from Scores s

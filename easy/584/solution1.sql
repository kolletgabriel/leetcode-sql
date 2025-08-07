-- The problem tells explicitly to filter out `referee_id = 2` so we do so.
-- This problem is almost technically the same as the #577 in regards of dealing
-- with `NULL` values.

select c.name
from Customer c
where c.referee_id <> 2
    or c.referee_id is null

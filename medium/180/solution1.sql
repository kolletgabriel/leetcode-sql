-- We can solve this problem with 2 self joins, taking advantage of the ids being
-- sequential. By joining on the `x.id = (y.id + 1)` condition we can pair each
-- value with the next. Finally, in the `WHERE` clause we keep only the records
-- for which `l1.num = l2.num = l3.num`, i.e., 3 consecutive values. We also need
-- the `DISTINCT` statement for `SELECT` to avoid duplicates.

select distinct l1.num ConsecutiveNums
from Logs l1
join Logs l2
    on l1.id = (l2.id + 1)
join Logs l3
    on l1.id = (l3.id + 2)
where l1.num = l2.num
    and l1.num = l3.num

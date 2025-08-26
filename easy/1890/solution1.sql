-- One more simple aggregation problem. We just need to filter by year before,
-- and for that we can apply the `extract()` function (or even `date_part()`).

select l.user_id
    ,max(l.time_stamp) last_stamp
from Logins l
where extract(year from l.time_stamp) = 2020
group by l.user_id

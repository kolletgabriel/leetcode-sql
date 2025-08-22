-- An alternate solution can be achieved by aggregating with a `CASE` statement.
-- It may be less readable, but it doesn't need joins. We apply the `avg()`
-- function but conditioning the number sign to the `activity_type` field: when
-- its value is 'start', the timestamp must be negative; if 'end', then positive.
-- This will guarantee that the sum operations made under `avg()` will find the
-- total time difference. Finally, we need to multiply the result by 2 because
-- the `avg()` function will divide the sum by the total number of rows for each
-- `machine_id`, not the number of processes. An example to better clarify: if a
-- given `machine_id` has 3 processes, then it has exactly 6 rows (one with 
-- 'start' and the other with 'end' in `activity_type` for each `process_id`),
-- and, since we're grouping by `machine_id` only, `avg()` will divide by all 6.
-- But the sum operation done under `avg()` is the sum for 3 processes, not 6, so
-- we must double the result it gives us, for `x/3 = 2*(x/6).

select a.machine_id
    ,round(
        avg(
            case a.activity_type 
                when 'start' then a.timestamp*(-1.0)
                else a.timestamp
            end
        )::numeric * 2,
        3
    ) processing_time
from Activity a
group by a.machine_id

-- We can also appeal to window functions for solving this one if we don't want
-- to use subqueries/CTEs. Here, we use `last_value()` partitioning the window by
-- employees and sorting it by the flag. If there are multiple departments for a
-- given employee, then the function would return the one with the 'Y' flag,
-- because we're sorting the rows inside the window by `primary_flag`, and the
-- character 'Y' comes after 'N'. And if there is only 1 department, so there is
-- also only 1 value to be choosen from. Also, we need to change the default
-- frame to `CURRENT ROW AND UNBOUNDED FOLLOWING`so `last_value()` takes the last
-- value of the entire window. Finally, we use `DISTINCT` to get rid of the
-- eventual duplicates.

select distinct e.employee_id
    ,last_value(e.department_id) over (
        partition by e.employee_id order by e.primary_flag
        rows between current row and unbounded following
    ) department_id
from Employee e

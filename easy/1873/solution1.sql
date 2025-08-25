-- We can use `CASE`/`WHEN` to solve this problem. First, we check if the ID is
-- even by using the `%` (mod) operator; then we check the name's string to see
-- if it doesn't start with 'M' using `NOT LIKE` for pattern matching. If both
-- conditions are true, then the bonus is of 100%, i.e., equals the salary. Worth
-- mention that instead of `LIKE` one can use actual functions like `substr()` or
-- `left()`.

select e.employee_id
    ,case
        when e.employee_id % 2 = 1 and e.name not like 'M%' then salary
        else 0
    end bonus
from Employees e
order by e.employee_id

-- What makes this problem a little more difficult is the need of returning a
-- `NULL` value if there's no number in `salary` that satisfies the condition.
-- Probably the easiest way to do so is by using the `max()` function, which will
-- return `NULL` in the absence of values. Knowing that everything in the `WHERE`
-- clause runs before any aggregations, we put in it a simple one-line subquery
-- to find (and filter by) the highest value. Then, when we aggregate again with
-- the same function at `SELECT`, we'll get the second highest value since the
-- first highest has been filtered out already.

select max(e.salary) SecondHighestSalary
from Employee e
where salary < (select max(e.salary) from Employee e)

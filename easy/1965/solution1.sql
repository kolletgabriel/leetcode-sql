-- Probably the easiest way to solve this problem is with a `FULL OUTER JOIN`. We
-- just need to `coalesce()` the id to not end up with `NULL` values. We then
-- proceed to filter the exact fields the problem asks for.

select coalesce(e.employee_id, s.employee_id) employee_id
from Employees e
full outer join Salaries s using (employee_id)
where e.name is null
    or s.salary is null
order by employee_id  -- appearently LC accepts the solution w/o this line

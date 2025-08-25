-- Despite the `easy` label, this one is not as straightforward to solve as many
-- others in the same category. The tricky part of the problem is the fact that
-- an 'N' for `primary_flag` may or may not confirm the respective department as
-- the correct one (which is in itself something contradictory and would never be
-- implemented in this way in real situations), depending actually on the absence
-- of other departments for the same employee. So, we can't simply check for the
-- 'Y' values since we'd be leaving behind the employees which have only 1. One
-- good way to solve it is by checking the existence of employees associated with
-- only 1 department in a subquery written for the `WHERE` clause, using the `IN`
-- statement.

select e.employee_id
    ,e.department_id
from Employee e
where e.primary_flag = 'Y'
    or e.employee_id in (
        select e.employee_id
        from Employee e
        group by e.employee_id
        having count(*) = 1
    )

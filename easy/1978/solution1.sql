-- This is another self join problem, since managers are also employees. We can't
-- apply an `INNER JOIN` because we need to work with the `NULL`s, so we apply a
-- `LEFT` pairing the manager ids with the "common" ones to leverage the relation
-- employee/manager we need. Finally, we filter accordingly inside the `WHERE`
-- clause: employees whose salary is less then 30000 and for whom there is a
-- manager but the manager's data doesn't exist in the table anymore.

select e1.employee_id
from Employees e1
left join Employees e2
    on e1.manager_id = e2.employee_id
where e1.salary < 30000
    and e1.manager_id is not null
    and e2.employee_id is null
order by e1.employee_id

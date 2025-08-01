-- The trick here is the self join, since common employees and their managers
-- are on the same table but we need to match them anyway.

select e1.name Employee
from Employee e1
join Employee e2
    on e1.managerId = e2.id
where e1.salary > e2.salary

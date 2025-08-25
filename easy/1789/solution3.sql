-- Using `UNION` is another way to solve the problem. Actually, this one is not
-- so straightforward to do in Postgresql as it is in MySQL for instance: we need
-- an additional `INNER JOIN` since Postgres would not let us keep something in
-- the `SELECT` statement that isn't also in the `GROUP BY` clause or inside an
-- aggregate function. Here, it doesn't make sense to group by both employee and
-- department id, but we do need both in the output anyway. So we manage to get
-- the `department_id` field from the `JOIN` operation.

select e.employee_id
    ,e.department_id
from Employee e
where e.primary_flag = 'Y'
union
select e.employee_id
    ,e.department_id
from Employee e
join (
    select e.employee_id
    from Employee e
    group by e.employee_id
    having count(*) = 1
) q using (employee_id)

-- This is another self join problem (although CTEs/subqueries could do it too).
-- It must be `INNER JOIN` since we're not looking for `NULL` values. Also, we
-- could cast `avg()` to integer instead of applying `round()`.

select e1.employee_id
    ,e1.name
    ,count(*) reports_count
    ,round(avg(e2.age)) average_age
from Employees e1
join Employees e2 on e1.employee_id = e2.reports_to
group by e1.employee_id
    ,e1.name
order by e1.employee_id

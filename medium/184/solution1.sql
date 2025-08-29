-- A good solution to this problem is to use the classic `max()` not as an
-- aggregation function but as a window one, partitioning by `departmentId`. The
-- only thing here is that since we can't use window functions in the `WHERE`
-- clause, we need to write a second query to filter the correct values.

with
    cte as (
        select d.name Department
            ,e.name Employee
            ,e.salary Salary
            ,max(e.salary) over (partition by e.departmentId) max_salary
        from Department d
        join Employee e
            on d.id = e.departmentId
    )
select c.Department
    ,c.Employee
    ,c.Salary
from cte c
where c.Salary = c.max_salary

-- Another solution, also using a second query, doesn't apply any window
-- functions. Instead, we make a subquery inside the `WHERE` clause using the
-- `IN` expression to find the highest salary for each department. So, the main
-- query will only select the records containing these pairs.

select d.name Department
    ,e.name Employee
    ,e.salary Salary
from Department d
join Employee e
    on d.id = e.departmentId
where (e.departmentId, e.salary) in (
    select e.departmentId
        ,max(salary)
    from Employee e
    group by e.departmentId
)

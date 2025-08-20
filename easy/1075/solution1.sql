-- This problem is a simple aggregation using the `avg()` function. Nothing much
-- to discuss here.

select p.project_id
    ,round(avg(e.experience_years), 2) average_years
from Project p
join Employee e using (employee_id)
group by p.project_id

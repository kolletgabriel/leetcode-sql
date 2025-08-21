-- It's a strange yet extremely simple problem. A `LEFT JOIN` alone does the job.
-- The only important detail to note is that the problem doesn't ask for the
-- `name` field, but is assumed since "each user" in this context is defined by
-- their name in the first table.

select u.unique_id
    ,e.name
from Employees e
left join EmployeeUNI u
    on e.id = u.id

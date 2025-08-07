-- Since we need all bonuses that are lesser then 1000, we must `LEFT JOIN` the
-- `Employee` table with the `Bonus` table so that the `NULL` values (which in
-- the given context represent the absence of a bonus or simply 0) can show up
-- in the results.

select e.name
    ,b.bonus
from Employee e
left join Bonus b using (empId)
where b.bonus < 1000
    or b.bonus is null  -- ^1

-- [^1]: `NULL` is not a number therefore not evaluates to true in the first
-- comparsion, but it needs to appear anyway so we "force" it in.

-- Aggregate functions can be used in a `HAVING` clause after the `GROUP BY`
-- instead of in the `SELECT` clause. We can use that to solve the problem with
-- only 1 query (i.e. without subqueries or CTEs).

select p.email Email
from Person p
group by p.email
having count(p.email) > 1

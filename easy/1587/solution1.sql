-- Simple and straightforward aggregation problem. We are given a table with all
-- the individual transactions made by the users, and the sum of those are equal
-- to the balance we need to find. Therefore, we need to `sum()` grouping by each
-- user. Finally, the filtering must occur in the `HAVING` clause since we are
-- essentially acting upon the result of an aggregation, not upon the pre-given
-- values of the table.

select u.name
    ,sum(t.amount) balance
from Users u
join Transactions t using (account)
group by u.name
having sum(t.amount) > 10000

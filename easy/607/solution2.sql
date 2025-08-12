-- This problem is also one of the rare cases in which we can leverage a clever
-- use of the `RIGHT JOIN` if we don't want to use subqueries/CTEs. The trick is
-- to put out all "non-red orders" before the first `JOIN` to use them as a
-- filter to select the correct names.

select s.name
from Orders o
join Company c
    on o.com_id = c.com_id
    and c.name = 'RED'
right join SalesPerson s
    on o.sales_id = s.sales_id
where o.sales_id is null

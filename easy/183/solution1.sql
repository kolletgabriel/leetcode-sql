-- left join here is necessary because if a customer doesn't match with any
-- record in the `Orders` table, a `null` will be shown in the `customerId`
-- field. And if a given customer doesn't match with anything in the `Orders`
-- table, it is so because they did not make any orders.

select c.name Customers
from Customers c
left join Orders o
    on c.id = o.customerId
where o.id is null

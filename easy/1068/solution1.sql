-- It is just an `INNER JOIN` problem.

select p.product_name
    ,s.year
    ,s.price
from Product p
join Sales s using (product_id)

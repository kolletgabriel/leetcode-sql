-- This problem only needs a `WHERE` clause in which we can filter based on
-- pre-given values. Nothing to add here.

select p.product_id
from Products p
where p.low_fats = 'Y'
    and p.recyclable = 'Y'

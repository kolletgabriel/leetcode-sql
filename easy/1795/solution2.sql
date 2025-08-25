-- For an alternative solution, we can use set operations. Here, we are doing the
-- same first query as before, with all the possible combinations. Then, we use
-- the `EXCEPT` operation with a second query in which all the prices are `NULL`,
-- thus excluding all the `NULL` values from the first one.

select p.product_id
    ,unnest(array['store1','store2','store3']) store
    ,unnest(array[p.store1,p.store2,p.store3]) price
from Products p
except
select p.product_id
    ,unnest(array['store1','store2','store3']) store
    ,null
from Products p2

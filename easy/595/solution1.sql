-- All we need to filter out for solving this one are already given values from 2
-- fileds in the only table presented by the problem, so we do just that in the
-- `WHERE` statement--no calculations needed.

select w.name
    ,w.population
    ,w.area
from World w
where w.area >= 3000000
    or w.population >= 25000000

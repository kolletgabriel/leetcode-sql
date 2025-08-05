-- We can solve this one with a clever use of one self join, filtering the
-- results accordingly before the joining process takes place.

select w2.id
from Weather w1
join Weather w2
    on (w2.recordDate - w1.recordDate) = 1  -- STRICTLY 1 day interval!
    and w2.temperature > w1.temperature

-- It's just simple google-able math. Not even a SQL problem if you really think
-- about it.

select *,
    case when ((abs(x) + abs(y)) > abs(z))
        and ((abs(x) + abs(z)) > abs(y))
        and ((abs(y) + abs(z)) > abs(x))
    then 'Yes' else 'No' end triangle
from Triangle

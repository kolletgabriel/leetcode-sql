-- Join must be left, not inner! With left join, we can preserve the fields of
-- the first (or left) table even when they don't match with anything on the
-- second (or right) table, leaving a `null` value for each unmatched field.

select p.firstName
    ,p.lastName
    ,a.city
    ,a.state
from "Person" p
left join "Address" a using (personId)

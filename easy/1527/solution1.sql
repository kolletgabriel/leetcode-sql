-- This one can be solved by pattern matching without necessarily using regex, so
-- it's more "SQL-centered" so to speak. For that we employ the `LIKE` keyword in
-- the `WHERE` statement.

select p.*
from Patients p
where p.conditions like 'DIAB1%'
    or p.conditions like '% DIAB1%'  -- [^1]

-- [^1]: The extra space here is needed since the string must start with (or be
--       itsef) 'DIAB1', not simply have 'DIAB1' as any substring.

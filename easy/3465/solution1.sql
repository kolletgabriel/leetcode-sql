-- The last regexp problem. This one may be the trickiest, also.

select p.*
from products p
where p.description ~ '(^|[^A-Za-z])SN[0-9]{4}-[0-9]{4}([^0-9]|$)'
order by p.prouct_id

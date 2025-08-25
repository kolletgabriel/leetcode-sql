-- The problem explicitly states that we must find the number of distinct IDs of
-- both lead and partner for each date and make, so we obviously must apply the
-- `count()` function. The only difference here is the need of counting specific
-- fields, not `*`, so we can make proper use of the `DISTINCT` clause.

select d.date_id
    ,d.make_name
    ,count(distinct d.lead_id) unique_leads
    ,count(distinct d.partner_id) unique_partners
from DailySales d
group by d.date_id
    ,d.make_name

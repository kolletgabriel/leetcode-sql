-- The simplest way to solve this problem may be by doing a `LEFT JOIN` of the
-- `Visits` to the `Transactions` table and then filtering out all the records
-- that didn't match, i.e., that didn't have a transaction for a visit thus
-- leaving a `null` value.

select v.customer_id
    ,count(*) count_no_trans
from Visits v
left join Transactions t using (visit_id)
where t.transaction_id is null  -- could be really any field of `Transactions`
group by 1

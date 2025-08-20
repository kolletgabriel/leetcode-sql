-- This one is particularly weird because it tells you to "reformat" the table,
-- not necessarily find and/or filter one or more values. Therefore, we need to
-- aggregate the values only. Doesn't matter with which function. Sadly, there is
-- no elegant solution for this problem. it's just a hacky way to make a pivot
-- table like in Excel. The `FILTER` clause here can make the query more readable
-- than with `CASE`/`WHEN` but even so it's still repetitive.

select d.id
    ,sum(d.revenue) filter (where d.month = 'Jan') Jan_Revenue
    ,sum(d.revenue) filter (where d.month = 'Feb') Feb_Revenue
    ,sum(d.revenue) filter (where d.month = 'Mar') Mar_Revenue
    ,sum(d.revenue) filter (where d.month = 'Apr') Apr_Revenue
    ,sum(d.revenue) filter (where d.month = 'May') May_Revenue
    ,sum(d.revenue) filter (where d.month = 'Jun') Jun_Revenue
    ,sum(d.revenue) filter (where d.month = 'Jul') Jul_Revenue
    ,sum(d.revenue) filter (where d.month = 'Aug') Aug_Revenue
    ,sum(d.revenue) filter (where d.month = 'Sep') Sep_Revenue
    ,sum(d.revenue) filter (where d.month = 'Oct') Oct_Revenue
    ,sum(d.revenue) filter (where d.month = 'Nov') Nov_Revenue
    ,sum(d.revenue) filter (where d.month = 'Dec') Dec_Revenue
from Department d
group by d.id

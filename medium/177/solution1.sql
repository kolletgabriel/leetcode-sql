-- This problem must be solved with a stored procedure since we're not given any
-- values. Luckily, Leetcode already left that part written for us with a comment
-- right on the part where we need to put the query itself. So, about the query:
-- we need a cte/subquery in which to use the `dense_rank()` window function to
-- find the exact rank for each salary. We need to use this function instead of
-- simply `rank()` because `rank()` will return the row number for a given record
-- after a tie while `dense_rank()` continues to increment only by 1.

CREATE OR REPLACE FUNCTION NthHighestSalary(N INT)
RETURNS TABLE (Salary INT) AS $$
BEGIN
    RETURN QUERY (
        with
            cte as (
                select e.salary
                    ,dense_rank() over (order by e.salary desc) r
                from Employee e
            )
        select f.salary getNthHighestSalary
        from cte c
        where r = N
        limit 1
    );
END;
$$ LANGUAGE plpgsql;

-- We can use the `min()` aggregate function grouping by `email` to filter out
-- all the posterior ids with the same email, maintaining only the first
-- occurrence for each email. Then, we mark for deletion every row in the table
-- that isn't in the querie's result.

delete from Person
where id not in (
    select min(id) "id"  -- `id` is a reserved in Postgres. Quotes needed!
    from Person
    group by email
)

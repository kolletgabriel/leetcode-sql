-- We can use the `USING` statement to perform a self join, finding the
-- duplicated records by comparing the different ids for the same email.

delete from Person p1
using Person p2
where p1.email = p2.email
    and p1.id < p2.id

-- Despite being quite verbose, this problem is still easy. We need a `JOIN` to
-- access the `return_date` field for each book and filter the records by it
-- before aggregating, leaving only the current borrowed. The main trick here is
-- in the `HAVING` clause: the number of records aggregated, given by `count(*)`,
-- being equal to `total_copies` means that every copy is borrowed, therefore
-- none is available for that one `book_id`.

select l.book_id
    ,l.title
    ,l.author
    ,l.genre
    ,l.publication_year
    ,count(*) current_borrowers
from library_books l
join borrowing_records b using (book_id)
where b.return_date is null
group by l.book_id
    ,l.title
    ,l.author
    ,l.genre
    ,l.publication_year
    ,l.total_copies
having count(*) = l.total_copies
order by current_borrowers desc
    ,l.title

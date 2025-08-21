-- The problem says "... each student for each exam." and reinforces it on the
-- Explanation section that the output must show all students and subjects,
-- therefore we need a `CROSS JOIN`. Finally, we `LEFT JOIN` with the last table
-- and count the number of IDs it has. The key takeaway here is to know when to
-- use `count()` on a specific column and not on `*` so that it can properly skip
-- the `null` values the column has.

select s.*   -- We need every column from `Students`
    ,u.*  -- We need every column (there's only 1) from `Subjects`
    ,count(e.student_id) attended_exams
from Students s
cross join Subjects u
left join Examinations e using (student_id, subject_name)
group by s.student_id
    ,s.student_name
    ,u.subject_name
order by s.student_id
    ,u.subject_name

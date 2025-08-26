-- Another super simple aggregation problem for which the only important detail
-- is the need of a `DISTINCT` statement. Here we need it since one same teacher
-- can teach a subject in different departments, so the same subject can appear
-- more than 1 time.

select t.teacher_id
    ,count(distinct t.subject_id) cnt
from Teacher t
group by t.teacher_id

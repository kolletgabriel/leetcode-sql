-- A simple `CASE` statement can solve this one.

update Salary
set sex = case sex
            when 'f' then 'm' else 'f'
        end

-- The last regexp problem. This one may be the trickiest, also.

select p.*
from products p
where p.description ~ '(^| )SN[0-9]{4}-[0-9]{4}( |$)'  -- [^1]
order by p.prouct_id

-- [^1]: Breaking down the expression:
--       - `^` means "start with the following pattern";
--       - `|` means "or";
--       - ' ' (whitespace) is a literal to be matched;
--       - `(^| )` is a pattern composed of 2 subpatterns connected by a logical
--         "or", matching either a string starting with the next pattern outside the
--         the parentheses or a substring constituted by a whitespace;
--       - 'SN' is a literal to be matched;
--       - `[0-9]` is a pattern for any numeric digits;
--       - `{4}` means "repeat the previous pattern 4 times";
--       - '-' is a literal to be matched;
--       - `[0-9]{4}` again;
--       - ' ' (whitespace) again;
--       - `|` again;
--       - `$` means "end with the preceding pattern";
--       - `( |$)` is a pattern composed of 2 subpatterns connectd by a logical
--         "or", matching either a substring constituted by a whitespace or the
--          end of the line preceded by the last pattern outside the parentheses.

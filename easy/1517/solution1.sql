-- There isn't much to say about this problem because at some extent it is not a
-- proper SQL problem but a regex one. In Postgres, we an use the `regexp_like()`
-- function or even the `~` sign before the pattern string.

select *
from Users
where regexp_like(mail, '^[A-Za-z]+[A-Za-z0-9_.-]*@leetcode\.com$')  -- [^1]
-- where mail ~ '^[A-Za-z]+[A-Za-z0-9_.-]*@leetcode\.com$'

-- [^1]: Breaking down the expression:
--       - `^` means "start with the following pattern";
--       - `[A-Za-z]` is a pattern for any lower or uppercase letters;
--       - `+` means "at least 1 occurance of the preceding pattern";
--       - `[A-Za-z0-9_.-]` is a pattern for alphanumeric characters, plus any
--         underscores, dots and/or dashes;
--       - `*` means 0 or more occurances of the preceding pattern;
--       - `\` is for escaping the semantic meaning of `.`, making the substring
--         '@leetcode.com' a literal to be matched;
--       - `$` means "end with the preceding pattern".

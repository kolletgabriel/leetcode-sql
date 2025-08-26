-- Yet another pure regex problem. Nothing much to say about this one since regex
-- although important is a whole different topic.

select *
from Users
where email ~ '^[a-zA-Z0-9_]+@[a-zA-z]+\.com$'  -- [^1]
order by 1

-- [^1]: Breaking down the expression:
--       - `^` means "start with the following pattern";
--       - `[a-zA-Z0-9_]` is a pattern for alphanumeric characters, plus
--         underscores;
--       - `+` means "at least 1 occurance of the preceding pattern";
--       - The '@' is a literal to be matched;
--       - `[a-zA-z]` is a pattern for any lower or uppercase letters;
--       - `+` again;
--       - `\` is for escaping the semantic meaning of `.`, making the substring
--         '.com' a literal to be matched;
--       - `$` means "end with the preceding pattern".

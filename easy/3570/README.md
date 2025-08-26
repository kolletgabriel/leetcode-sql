# Find Books with no Available Copies

## Tables

Table: `library_books`:

```
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| book_id          | int     |
| title            | varchar |
| author           | varchar |
| genre            | varchar |
| publication_year | int     |
| total_copies     | int     |
+------------------+---------+
```

`book_id` is the unique identifier for this table.
Each row contains information about a book in the library, including the total
number of copies owned by the library.

Table: `borrowing_records`:

```
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| record_id     | int     |
| book_id       | int     |
| borrower_name | varchar |
| borrow_date   | date    |
| return_date   | date    |
+---------------+---------+
```

`record_id` is the unique identifier for this table.
Each row represents a borrowing transaction and `return_date` is `NULL` if the book
is currently borrowed and hasn't been returned yet.

## Problem

Write a solution to find all books that are currently borrowed (not returned) and
have zero copies available in the library.

A book is considered currently borrowed if there exists a borrowing record with
`return_date = NULL`.

Return the result table **ordered by** current borrowers in **descending order**, then by
book title in **ascending order**.

## Example

### Input

`library_books` table:

```
+---------+------------------------+------------------+----------+------------------+--------------+
| book_id | title                  | author           | genre    | publication_year | total_copies |
+---------+------------------------+------------------+----------+------------------+--------------+
| 1       | The Great Gatsby       | F. Scott         | Fiction  | 1925             | 3            |
| 2       | To Kill a Mockingbird  | Harper Lee       | Fiction  | 1960             | 3            |
| 3       | 1984                   | George Orwell    | Dystopian| 1949             | 1            |
| 4       | Pride and Prejudice    | Jane Austen      | Romance  | 1813             | 2            |
| 5       | The Catcher in the Rye | J.D. Salinger    | Fiction  | 1951             | 1            |
| 6       | Brave New World        | Aldous Huxley    | Dystopian| 1932             | 4            |
+---------+------------------------+------------------+----------+------------------+--------------+
```

`borrowing_records` table:

```
+-----------+---------+---------------+-------------+-------------+
| record_id | book_id | borrower_name | borrow_date | return_date |
+-----------+---------+---------------+-------------+-------------+
| 1         | 1       | Alice Smith   | 2024-01-15  | NULL        |
| 2         | 1       | Bob Johnson   | 2024-01-20  | NULL        |
| 3         | 2       | Carol White   | 2024-01-10  | 2024-01-25  |
| 4         | 3       | David Brown   | 2024-02-01  | NULL        |
| 5         | 4       | Emma Wilson   | 2024-01-05  | NULL        |
| 6         | 5       | Frank Davis   | 2024-01-18  | 2024-02-10  |
| 7         | 1       | Grace Miller  | 2024-02-05  | NULL        |
| 8         | 6       | Henry Taylor  | 2024-01-12  | NULL        |
| 9         | 2       | Ivan Clark    | 2024-02-12  | NULL        |
| 10        | 2       | Jane Adams    | 2024-02-15  | NULL        |
+-----------+---------+---------------+-------------+-------------+
```

### Output

```
+---------+------------------+---------------+-----------+------------------+-------------------+
| book_id | title            | author        | genre     | publication_year | current_borrowers |
+---------+------------------+---------------+-----------+------------------+-------------------+
| 1       | The Great Gatsby | F. Scott      | Fiction   | 1925             | 3                 |
| 3       | 1984             | George Orwell | Dystopian | 1949             | 1                 |
+---------+------------------+---------------+-----------+------------------+-------------------+
```

### Explanation

For the books included:

- The Great Gatsby:
    - total copies: 3;
    - currently borrowed by Alice Smith, Bob Johnson, and Grace Miller (3
      borrowers);
    - available copies: `3 - 3 = 0`;
    - included because `available_copies = 0`.
- 1984:
    - total copies: 1;
    - currently borrowed by David Brown (1 borrower);
    - available copies: `1 - 1 = 0`;
    - included because `available_copies = 0`.

For the books **not** included:

- To Kill a Mockingbird:
    - total copies = 3;
    - current borrowers = 2;
    - available = 1.
- Pride and Prejudice:
    - total copies = 2;
    - current borrowers = 1;
    - available = 1.
- The Catcher in the Rye:
    - total copies = 1;
    - current borrowers = 0;
    - available = 1.
- Brave New World:
    - total copies = 4;
    - current borrowers = 1;
    - available = 3.

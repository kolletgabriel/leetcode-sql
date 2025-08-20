# Queries Quality and Percentage

## Tables

Table: `Queries`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
```

This table may have duplicate rows.
This table contains information collected from some queries on a database.
The `position` column has a value from 1 to 500.
The `rating` column has a value from 1 to 5. Query with `rating < 3` is a poor query.

## Problem

Write a solution to find each `query_name`, quality and poor query percentage.
We define **quality** as: The average of the ratio between query rating and its
position.
We define **poor query percentage** as: The percentage of all queries with
`rating < 3`.
Return the result table in **any order**.

## Example

### Input

`Queries` table:

```
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+
```

### Output

```
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+
```

### Explanation

`Dog` queries `quality` is `((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50`
`Dog` queries `poor_query_percentage` is `(1 / 3) * 100 = 33.33`
`Cat` queries `quality` is `((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66`
`Cat` queries `poor_query_percentage` is `(1 / 3) * 100 = 33.33`

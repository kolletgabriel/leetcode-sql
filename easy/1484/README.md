# Group Sold Products by the Date

## Tables

Table: `Activities`

```
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| sell_date   | date    |
| product     | varchar |
+-------------+---------+
```

There is no primary key (column with unique values) for this table. It may
contain duplicates.
Each row of this table contains the product name and the date it was sold in a
market.

## Problem

Write a solution to find for each date the number of different products sold and
their names.

The sold products names for each date should be sorted lexicographically.

Return the result table **ordered by** `sell_date`.

## Example

### Input

`Activities` table:

```
+------------+------------+
| sell_date  | product    |
+------------+------------+
| 2020-05-30 | Headphone  |
| 2020-06-01 | Pencil     |
| 2020-06-02 | Mask       |
| 2020-05-30 | Basketball |
| 2020-06-01 | Bible      |
| 2020-06-02 | Mask       |
| 2020-05-30 | T-Shirt    |
+------------+------------+
```

### Output

```
+------------+----------+------------------------------+
| sell_date  | num_sold | products                     |
+------------+----------+------------------------------+
| 2020-05-30 | 3        | Basketball,Headphone,T-shirt |
| 2020-06-01 | 2        | Bible,Pencil                 |
| 2020-06-02 | 1        | Mask                         |
+------------+----------+------------------------------+
```

### Explanation

For `2020-05-30`, Sold items were `Headphone`, `Basketball` and `T-shirt`. We sort them
lexicograpphically and separate them by a comma.
For `2020-06-01`, Sold items were `Pencil` and `Bible`. We sort them
lexicographically and separate them by a comma.
For `2020-06-02`, the Sold item is `Mask`. We just return it.

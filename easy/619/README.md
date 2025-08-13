# Biggest Single Number

## Tables

Table: `MyNumbers`

```
+-------------+------+
| Column Name | Type |
+-------------+------+
| num         | int  |
+-------------+------+
```

This table may contain duplicates (In other words, there is no primary key for
this table in SQL).
Each row of this table contains an integer.

## Problem

A single number is a number that appeared only once in the `MyNumbers` table.

Find the largest single number. If there is no single number, report `null`.

## Example

### Input

`MyNumbers` table:

```
+-----+
| num |
+-----+
| 8   |
| 8   |
| 3   |
| 3   |
| 1   |
| 4   |
| 5   |
| 6   |
+-----+
```

### Output

```
+-----+
| num |
+-----+
| 6   |
+-----+
```

### Explanation

The single numbers are 1, 4, 5, and 6.
Since 6 is the largest single number, we return it.

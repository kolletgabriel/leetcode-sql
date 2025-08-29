# Second Highest Salary

## Tables

Table: `Employee`

```
+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
```

`id` is the primary key (column with unique values) for this table.
Each row of this table contains information about the salary of an employee.

## Problem

Write a solution to find the second highest distinct salary from the `Employee`
table. If there is no second highest salary, return `null`.

## Example

### Input

`Employee` table:

```
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
```

### Output

```
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
```

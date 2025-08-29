# Nth Highest Salary

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

Write a solution to find the *nth* highest distinct salary from the `Employee` table.
If there are less than *n* distinct salaries, return `null`.

## Example

### Input

`n = 2`
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
+------------------------+
| getNthHighestSalary(2) |
+------------------------+
| 200                    |
+------------------------+
```

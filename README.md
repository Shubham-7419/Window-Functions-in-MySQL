# Window-Functions-in-MySQL
In MySQL, window functions are powerful tools that allow you to perform calculations across a set of table rows that are related to the current row. These functions are particularly useful for tasks like ranking, running totals, moving averages, and accessing data from other rows within the same result set.

## 1. Syntax
window_function_name(expression) OVER (
    [PARTITION BY partition_definition]
    [ORDER BY order_definition]
    [frame_definition]
)

## Components:
-PARTITION BY: Divides the result set into partitions to which the window function is applied.
-ORDER BY: Defines the order of rows within each partition.
-Frame Definition: Specifies the subset of rows within the partition to be considered for the calculation.

## Common Window Functions:
-ROW_NUMBER(): Assigns a unique sequential integer to rows within a partition.
-RANK(): Assigns a rank to each row within a partition, with gaps for ties.
-DENSE_RANK(): Similar to RANK(), but without gaps for ties.
-SUM(): Calculates the sum of values.
-AVG(): Calculates the average of values.

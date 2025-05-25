# Partitioning Performance Report

## Objective

Optimize query performance on the large Booking table by partitioning it by the `start_date` column (by year).

## Implementation

- The Booking table was partitioned by RANGE on `start_date`, with separate partitions for each year (e.g., Booking_2023, Booking_2024, Booking_2025).
- Example query tested:  
  ```sql
  SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';
  ```
- Performance was measured using `EXPLAIN ANALYZE` before and after partitioning.

## Observed Improvements

- **Before Partitioning:**  
  - The query scanned the entire Booking table, resulting in high I/O and longer execution time, especially as the table grew.
  - `EXPLAIN ANALYZE` showed a sequential scan (Seq Scan) over the whole table.

- **After Partitioning:**  
  - The query only scanned the relevant partition(s) (e.g., Booking_2024) due to partition pruning.
  - `EXPLAIN ANALYZE` showed a much smaller scan, with reduced I/O and faster execution time.
  - For date-range queries, the database engine skipped irrelevant partitions, significantly improving performance.

## Conclusion

Partitioning the Booking table by `start_date` enables the database to efficiently prune partitions for date-based queries, reducing the amount of data scanned and improving query response times. This is especially beneficial for large datasets and time-based reporting or analytics.

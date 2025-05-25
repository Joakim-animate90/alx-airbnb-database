# Database Performance Monitoring and Refinement

## 1. Monitoring Query Performance

Use `EXPLAIN ANALYZE` to monitor the execution plan and performance of frequently used queries. Example:

```sql
EXPLAIN ANALYZE
SELECT
    u.user_id,
    u.first_name,
    u.last_name,
    COUNT(b.booking_id) AS total_bookings
FROM "User" u
LEFT JOIN Booking b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name;
```

## 2. Identifying Bottlenecks

- Look for `Seq Scan` (sequential scan) on large tables, which indicates missing or unused indexes.
- High execution time or large row counts in the plan may indicate inefficiency.
- Joins on non-indexed columns can slow down queries.

## 3. Suggested Schema Adjustments

**Example Bottleneck:**  
If EXPLAIN ANALYZE shows a sequential scan on Payment(booking_id) during joins, add an index:

```sql
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

**Other Adjustments:**
- Add composite indexes if queries filter on multiple columns.
- Consider partitioning large tables (as done for Booking).
- Remove unused indexes to reduce write overhead.

## 4. Implementing Changes

- Apply new indexes or schema changes as needed.
- Re-run `EXPLAIN ANALYZE` to confirm improvements (look for `Index Scan` and reduced execution time).

## 5. Reporting Improvements

**Before:**  
- Queries used sequential scans, resulting in high I/O and slow performance.

**After:**  
- New indexes enabled index scans, reducing the number of rows scanned and improving execution time.
- Partitioning allowed the database to prune irrelevant data, further optimizing queries.

---

**Summary:**  
Continuously monitor query performance using `EXPLAIN ANALYZE`, identify bottlenecks, and refine the schema with targeted indexes and partitioning. This iterative process ensures optimal database performance as data volume and query patterns evolve.

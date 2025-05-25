# Index Performance Analysis

## How to Measure Query Performance

Use the `EXPLAIN` or `EXPLAIN ANALYZE` command before and after creating indexes to compare query plans and execution times.

---

## Example: Query to Find Total Bookings by Each User

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

- **Before adding indexes:** The database may perform a sequential scan on Booking.
- **After adding indexes:** The database should use the idx_booking_user_id index for faster lookups.

---

## Example: Query to Rank Properties by Bookings

```sql
EXPLAIN ANALYZE
SELECT
    p.property_id,
    p.name AS property_name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS property_rank
FROM Property p
LEFT JOIN Booking b ON p.property_id = b.property_id
GROUP BY p.property_id, p.name
ORDER BY property_rank;
```

- **Before adding indexes:** The database may perform a sequential scan on Booking.
- **After adding indexes:** The database should use the idx_booking_property_id index for faster joins.

---

## How to Interpret Results

- Look for changes in the query plan (e.g., use of Index Scan vs. Seq Scan).
- Compare the total execution time reported by `EXPLAIN ANALYZE`.
- Lower execution time and use of indexes indicate improved performance.

---

**Tip:** Run the EXPLAIN ANALYZE command before and after executing the CREATE INDEX statements in `database_index.sql` to observe the impact of indexing.

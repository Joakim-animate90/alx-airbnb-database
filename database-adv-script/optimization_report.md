# Query Optimization Report

## 1. Initial Query

The initial query retrieves all bookings along with user, property, and payment details:

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;
```

## 2. Performance Analysis

The query was analyzed using `EXPLAIN ANALYZE`:

```sql
EXPLAIN ANALYZE
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON pay.booking_id = b.booking_id;
```

### Key Observations:
- If indexes are missing, the database may perform sequential scans (Seq Scan) on large tables, leading to high execution time.
- The query joins four tables, which can be expensive if not properly indexed.

## 3. Identified Inefficiencies

- **Lack of Indexes:** Without indexes on `Booking.user_id`, `Booking.property_id`, and `Payment.booking_id`, join operations are slow.
- **Unnecessary Columns:** Selecting all columns increases I/O if only a subset is needed.
- **Join Types:** Using `LEFT JOIN` for Payment is appropriate if not all bookings have payments; otherwise, `INNER JOIN` may be faster.

## 4. Refactored Query

After creating indexes (see `database_index.sql`):

```sql
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);
```

The refactored query (if all bookings have payments, use INNER JOIN for Payment):

```sql
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.created_at AS booking_created_at,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.description AS property_description,
    pay.payment_id,
    pay.amount,
    pay.payment_date
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON pay.booking_id = b.booking_id;
```

Or, if not all bookings have payments, keep the `LEFT JOIN` but ensure indexes exist.

## 5. Results and Recommendations

- **After Indexing:** The query plan should show `Index Scan` or `Bitmap Index Scan` instead of `Seq Scan`, and execution time should decrease.
- **Column Selection:** Only select necessary columns to reduce I/O.
- **Join Optimization:** Use `INNER JOIN` where possible for better performance.
- **Ongoing Monitoring:** Regularly analyze query plans as data grows and adjust indexes as needed.

---

**Summary:**  
By adding indexes to high-usage columns and optimizing join types, the query execution time is reduced and performance is improved. Always use `EXPLAIN ANALYZE` to validate the impact of optimizations.

-- Initial query: Retrieve all bookings with user, property, and payment details

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

-- Analyze the query's performance using EXPLAIN ANALYZE
-- Run the following to see the query plan and execution time:
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

-- After running EXPLAIN ANALYZE, look for:
-- - Sequential scans (Seq Scan) on large tables (inefficient)
-- - Use of indexes (Index Scan or Bitmap Index Scan)
-- - High execution time

-- Potential refactoring tips:
-- - Only select necessary columns
-- - Use appropriate indexes (see database_index.sql)
-- - Consider if LEFT JOINs can be replaced with INNER JOINs if all bookings always have payments
-- - Filter with WHERE clauses if possible to reduce result set size

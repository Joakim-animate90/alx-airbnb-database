-- Indexes to improve query performance on high-usage columns
-- Performance measurement using EXPLAIN ANALYZE before and after adding indexes

-- 1. Performance for queries involving Booking.user_id

-- Before adding index on Booking.user_id
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;

-- Create index on Booking.user_id to speed up joins and WHERE clauses involving user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- After adding index on Booking.user_id
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 123;


-- 2. Performance for queries involving Booking.property_id

-- Before adding index on Booking.property_id
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id = 456;

-- Create index on Booking.property_id to speed up joins and WHERE clauses involving property_id
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- After adding index on Booking.property_id
EXPLAIN ANALYZE SELECT * FROM Booking WHERE property_id = 456;


-- 3. Performance for queries involving Property.name

-- Before adding index on Property.name
EXPLAIN ANALYZE SELECT * FROM Property ORDER BY name;

-- Create index on Property.name to improve ORDER BY performance (optional, useful if sorting by name is frequent)
CREATE INDEX idx_property_name ON Property(name);

-- After adding index on Property.name
EXPLAIN ANALYZE SELECT * FROM Property ORDER BY name;


-- Note: Primary keys (user_id in "User", property_id in Property) are already indexed by default.

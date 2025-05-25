-- Indexes to improve query performance on high-usage columns

-- Index on Booking.user_id to speed up joins and WHERE clauses involving user_id
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on Booking.property_id to speed up joins and WHERE clauses involving property_id
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on Property.name to improve ORDER BY performance (optional, useful if sorting by name is frequent)
CREATE INDEX idx_property_name ON Property(name);

-- Note: Primary keys (user_id in "User", property_id in Property) are already indexed by default.

-- Initial query: Retrieve all bookings with user, property, and payment details
EXPLAIN
SELECT
    b.*,
    u.*,
    p.*,
    pay.*
FROM
    Booking b
    INNER JOIN "User" u ON b.user_id = u.user_id
    INNER JOIN Property p ON b.property_id = p.property_id
    INNER JOIN Payment pay ON b.booking_id = pay.booking_id;

-- Analysis:
-- This query joins Booking, User, Property, and Payment tables to retrieve all relevant details for each booking.
-- Review the EXPLAIN output to identify any inefficiencies (e.g., sequential scans, missing indexes).

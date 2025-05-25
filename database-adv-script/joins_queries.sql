-- 1. INNER JOIN query to get all bookings and their users
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email
FROM Booking b
INNER JOIN "User" u ON b.user_id = u.user_id;

-- 2. LEFT JOIN query to get all properties and their reviews
SELECT 
    p.property_id,
    p.name,
    p.price_per_night,
    r.review_id,
    r.rating,
    r.comment
FROM Property p
LEFT JOIN Review r ON p.property_id = r.property_id;

-- 3. FULL OUTER JOIN query to get all users and bookings
SELECT 
    u.user_id,
    u.first_name,
    u.last_name,
    b.booking_id,
    b.start_date,
    b.end_date
FROM "User" u
FULL OUTER JOIN Booking b ON u.user_id = b.user_id;
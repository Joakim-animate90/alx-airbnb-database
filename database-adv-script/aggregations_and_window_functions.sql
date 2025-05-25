-- Aggregation and Window Function Queries

-- 1. Total number of bookings made by each user
SELECT
    user_id,
    COUNT(*) AS total_bookings
FROM
    Booking
GROUP BY
    user_id
ORDER BY
    total_bookings DESC;

-- 2. Rank properties based on the total number of bookings they have received using ROW_NUMBER()
SELECT
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS property_rank
FROM (
    SELECT
        property_id,
        COUNT(*) AS total_bookings
    FROM
        Booking
    GROUP BY
        property_id
) AS property_booking_counts
ORDER BY
    property_rank;

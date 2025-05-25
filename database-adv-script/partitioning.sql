-- Partition the Booking table by start_date (by year)
-- This assumes you are using PostgreSQL 10+ and the Booking table is being re-created for partitioning

-- Step 1: Rename the original table (if needed)
-- ALTER TABLE Booking RENAME TO Booking_old;

-- Step 2: Create the partitioned Booking table
CREATE TABLE Booking (
    booking_id   UUID PRIMARY KEY,
    property_id  UUID NOT NULL REFERENCES Property(property_id),
    user_id      UUID NOT NULL REFERENCES "User"(user_id),
    start_date   DATE NOT NULL,
    end_date     DATE NOT NULL,
    status_id    UUID NOT NULL REFERENCES BookingStatus(status_id),
    created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 3: Create partitions for each year (example: 2023, 2024, 2025)
CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Step 4: (Optional) Insert data from the old table
-- INSERT INTO Booking SELECT * FROM Booking_old;

-- Step 5: Drop the old table if migration is complete
-- DROP TABLE Booking_old;

-- Example query to test performance on the partitioned table:
-- Fetch bookings in 2024
SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Use EXPLAIN ANALYZE to observe partition pruning and improved performance:
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2024-01-01' AND '2024-12-31';

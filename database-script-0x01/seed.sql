-- Insert roles
INSERT INTO Role (role_id, name) VALUES
  (gen_random_uuid(), 'host'),
  (gen_random_uuid(), 'guest');

-- Insert booking statuses
INSERT INTO BookingStatus (status_id, name) VALUES
  (gen_random_uuid(), 'pending'),
  (gen_random_uuid(), 'confirmed'),
  (gen_random_uuid(), 'cancelled');

-- Insert payment methods
INSERT INTO PaymentMethod (method_id, name) VALUES
  (gen_random_uuid(), 'credit_card'),
  (gen_random_uuid(), 'paypal'),
  (gen_random_uuid(), 'bank_transfer');

-- Insert locations
INSERT INTO Location (location_id, street_address, city, state, country) VALUES
  (gen_random_uuid(), '123 Main St', 'Nairobi', 'Nairobi', 'Kenya'),
  (gen_random_uuid(), '456 Elm St', 'Kampala', 'Central', 'Uganda');

-- Insert users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role_id) VALUES
  (gen_random_uuid(), 'Alice', 'Mwangi', 'alice@example.com', 'hash1', '0700000001', (SELECT role_id FROM Role WHERE name = 'host')),
  (gen_random_uuid(), 'Bob', 'Odhiambo', 'bob@example.com', 'hash2', '0700000002', (SELECT role_id FROM Role WHERE name = 'guest'));

-- Insert properties
INSERT INTO Property (property_id, host_id, location_id, name, description, price_per_night) VALUES
  (gen_random_uuid(), 
   (SELECT user_id FROM "User" WHERE email = 'alice@example.com'), 
   (SELECT location_id FROM Location WHERE street_address = '123 Main St'),
   'Sunny Apartment', 
   'Cozy place in the city center', 
   60.00);

-- Insert bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, status_id) VALUES
  (gen_random_uuid(), 
   (SELECT property_id FROM Property WHERE name = 'Sunny Apartment'),
   (SELECT user_id FROM "User" WHERE email = 'bob@example.com'), 
   '2025-06-01', 
   '2025-06-05', 
   (SELECT status_id FROM BookingStatus WHERE name = 'confirmed'));

-- Insert payments
INSERT INTO Payment (payment_id, booking_id, amount, payment_method_id) VALUES
  (gen_random_uuid(), 
   (SELECT booking_id FROM Booking), 
   240.00, 
   (SELECT method_id FROM PaymentMethod WHERE name = 'credit_card'));

-- Insert review
INSERT INTO Review (review_id, property_id, user_id, rating, comment) VALUES
  (gen_random_uuid(),
   (SELECT property_id FROM Property WHERE name = 'Sunny Apartment'),
   (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
   5,
   'Excellent place!');

-- Insert message
INSERT INTO Message (message_id, sender_id, recipient_id, message_body) VALUES
  (gen_random_uuid(),
   (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
   (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
   'Hi, I have a question about check-in time.');

-- Roles Lookup
CREATE TABLE Role (
  role_id   UUID PRIMARY KEY,
  name      VARCHAR UNIQUE NOT NULL
);

-- Users
CREATE TABLE "User" (
  user_id        UUID PRIMARY KEY,
  first_name     VARCHAR NOT NULL,
  last_name      VARCHAR NOT NULL,
  email          VARCHAR UNIQUE NOT NULL,
  password_hash  VARCHAR NOT NULL,
  phone_number   VARCHAR,
  role_id        UUID NOT NULL REFERENCES Role(role_id),
  created_at     TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Locations
CREATE TABLE Location (
  location_id   UUID PRIMARY KEY,
  street_address VARCHAR NOT NULL,
  city          VARCHAR NOT NULL,
  state         VARCHAR NOT NULL,
  country       VARCHAR NOT NULL
);

-- Properties
CREATE TABLE Property (
  property_id      UUID PRIMARY KEY,
  host_id          UUID NOT NULL REFERENCES "User"(user_id),
  location_id      UUID NOT NULL REFERENCES Location(location_id),
  name             VARCHAR NOT NULL,
  description      TEXT NOT NULL,
  price_per_night  DECIMAL NOT NULL,
  created_at       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updated_at       TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Booking Status Lookup
CREATE TABLE BookingStatus (
  status_id   UUID PRIMARY KEY,
  name        VARCHAR UNIQUE NOT NULL
);

-- Bookings (no total_price stored)
CREATE TABLE Booking (
  booking_id   UUID PRIMARY KEY,
  property_id  UUID NOT NULL REFERENCES Property(property_id),
  user_id      UUID NOT NULL REFERENCES "User"(user_id),
  start_date   DATE NOT NULL,
  end_date     DATE NOT NULL,
  status_id    UUID NOT NULL REFERENCES BookingStatus(status_id),
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Payment Methods Lookup
CREATE TABLE PaymentMethod (
  method_id    UUID PRIMARY KEY,
  name         VARCHAR UNIQUE NOT NULL
);

-- Payments
CREATE TABLE Payment (
  payment_id        UUID PRIMARY KEY,
  booking_id        UUID NOT NULL REFERENCES Booking(booking_id),
  amount            DECIMAL NOT NULL,
  payment_date      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method_id UUID NOT NULL REFERENCES PaymentMethod(method_id)
);

-- Reviews
CREATE TABLE Review (
  review_id    UUID PRIMARY KEY,
  property_id  UUID NOT NULL REFERENCES Property(property_id),
  user_id      UUID NOT NULL REFERENCES "User"(user_id),
  rating       INTEGER NOT NULL CHECK (rating BETWEEN 1 AND 5),
  comment      TEXT NOT NULL,
  created_at   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Messages
CREATE TABLE Message (
  message_id   UUID PRIMARY KEY,
  sender_id    UUID NOT NULL REFERENCES "User"(user_id),
  recipient_id UUID NOT NULL REFERENCES "User"(user_id),
  message_body TEXT NOT NULL,
  sent_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
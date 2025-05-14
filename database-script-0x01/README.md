## Database Schema

The `schema.sql` file defines the database structure for the Airbnb clone. It creates a normalized database schema with the following tables:

### Core Tables

1. **Role**
   - Primary key: `role_id` (UUID)
   - Stores user roles (e.g., host, guest)
   - Fields: name (unique)

2. **User**
   - Primary key: `user_id` (UUID)
   - Stores user information
   - Fields: first_name, last_name, email (unique), password_hash, phone_number
   - Foreign key: role_id → Role

3. **Location**
   - Primary key: `location_id` (UUID)
   - Stores property locations
   - Fields: street_address, city, state, country

4. **Property**
   - Primary key: `property_id` (UUID)
   - Stores property listings
   - Fields: name, description, price_per_night
   - Foreign keys: host_id → User, location_id → Location
   - Timestamps: created_at, updated_at

### Booking and Payment Tables

5. **BookingStatus**
   - Primary key: `status_id` (UUID)
   - Lookup table for booking statuses
   - Fields: name (unique)

6. **Booking**
   - Primary key: `booking_id` (UUID)
   - Manages property bookings
   - Fields: start_date, end_date
   - Foreign keys: property_id → Property, user_id → User, status_id → BookingStatus

7. **PaymentMethod**
   - Primary key: `method_id` (UUID)
   - Lookup table for payment methods
   - Fields: name (unique)

8. **Payment**
   - Primary key: `payment_id` (UUID)
   - Records payment transactions
   - Fields: amount, payment_date
   - Foreign keys: booking_id → Booking, payment_method_id → PaymentMethod

### User Interaction Tables

9. **Review**
   - Primary key: `review_id` (UUID)
   - Stores property reviews
   - Fields: rating (1-5), comment
   - Foreign keys: property_id → Property, user_id → User

10. **Message**
    - Primary key: `message_id` (UUID)
    - Manages user communications
    - Fields: message_body, sent_at
    - Foreign keys: sender_id → User, recipient_id → User

### Key Features

- Uses UUIDs for all primary keys
- Implements proper foreign key constraints
- Includes timestamp tracking where appropriate
- Enforces data integrity through constraints (e.g., rating range check)
- Follows naming conventions and proper SQL practices
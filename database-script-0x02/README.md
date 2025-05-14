## Seed Data

The `seed.sql` file contains initial sample data for the Airbnb clone database. It populates the following tables with test data:

### Data Insertions:

1. **Roles**
   - Host and Guest roles

2. **Booking Statuses**
   - Pending, Confirmed, and Cancelled statuses

3. **Payment Methods**
   - Credit Card, PayPal, and Bank Transfer options

4. **Locations**
   - Sample addresses in Nairobi and Kampala

5. **Users**
   - Sample host (Alice) and guest (Bob) accounts with hashed passwords

6. **Properties**
   - A sample property listing ("Sunny Apartment")

7. **Bookings**
   - Sample booking for the Sunny Apartment

8. **Payments**
   - Sample payment record for the booking

9. **Reviews**
   - Sample 5-star review for the property

10. **Messages**
    - Sample communication between host and guest

The seed data uses `gen_random_uuid()` for generating unique identifiers and maintains referential integrity through appropriate foreign key relationships.
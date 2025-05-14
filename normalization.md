# 📘 Database Normalization to 3NF – Airbnb Schema

## 🎯 Objective

To apply normalization principles on the Airbnb database schema and ensure it is in **Third Normal Form (3NF)**. This improves **data integrity**, **reduces redundancy**, and enhances **efficiency**.

---

## 🧩 Step 1: Understand the Entities and Attributes

Here are the main entities in our system:

- **User**: Information about platform users (guest, host, admin)
- **Property**: Listings provided by hosts
- **Booking**: A record of a user reserving a property
- **Payment**: Payment related to a booking
- **Review**: User feedback on a property
- **Message**: Direct messages between users

---

## 🔍 Step 2: First Normal Form (1NF)

**Rule**: Each column contains atomic values. No repeating groups.

✅ Already satisfied:
- Each table has atomic values (e.g., no multiple emails or phone numbers in one field).

---

## 🧮 Step 3: Second Normal Form (2NF)

**Rule**: Must be in 1NF and every non-key column should depend on the entire primary key.

✅ Already satisfied:
- No tables have composite primary keys.
- All non-key columns are fully dependent on their table's primary key.

---

## 🔗 Step 4: Third Normal Form (3NF)

**Rule**: Must be in 2NF and non-key columns should not depend on other non-key columns (i.e., no transitive dependencies).

🎯 **Example Check**:
- In `Booking`, `status` depends only on `booking_id` ✅
- In `Payment`, `payment_method` is atomic and not derived ✅
- In `Review`, `rating` and `comment` depend on `review_id` only ✅

✅ Schema is already in 3NF — no transitive or partial dependencies found.

---

## 🛠️ Summary of Normalization Checks

| Table    | 1NF | 2NF | 3NF | Notes                            |
|----------|-----|-----|-----|----------------------------------|
| User     | ✅  | ✅  | ✅  | Proper atomic fields             |
| Property | ✅  | ✅  | ✅  | host_id is a valid foreign key   |
| Booking  | ✅  | ✅  | ✅  | All attributes depend on PK      |
| Payment  | ✅  | ✅  | ✅  | Linked cleanly to Booking        |
| Review   | ✅  | ✅  | ✅  | No derived or duplicated data    |
| Message  | ✅  | ✅  | ✅  | Atomic message details           |

---

## 🖼️ ER Diagram

![ER Diagram](./assets/images/airbnb-er-diagram.png)

---

## ✅ Conclusion

Our database schema follows **3NF principles** effectively:

- **Atomic attributes** (1NF)
- **Full functional dependency** (2NF)
- **No transitive dependencies** (3NF)

This ensures data consistency, easy maintenance, and reduced redundancy.

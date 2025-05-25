# Advanced Database Scripting and Optimization

This directory contains advanced SQL scripts and documentation for analyzing, optimizing, and maintaining a high-performance relational database, as part of the Airbnb database project.

## Contents

- **subqueries.sql**  
  Contains examples of correlated and non-correlated subqueries, such as:
  - Finding properties with average rating > 4.0
  - Identifying users with more than 3 bookings

- **aggregations_and_window_functions.sql**  
  Demonstrates SQL aggregation and window functions, including:
  - Counting total bookings per user
  - Ranking properties by number of bookings

- **database_index.sql**  
  SQL commands to create indexes on high-usage columns to improve query performance.

- **index_performance.md**  
  Instructions and examples for measuring query performance before and after indexing, using `EXPLAIN ANALYZE`.

- **perfomance.sql**  
  Complex queries joining bookings, users, properties, and payments, with performance analysis and refactoring tips.

- **optimization_report.md**  
  Documentation of query optimization steps, including performance analysis, bottleneck identification, and schema adjustments.

- **partitioning.sql**  
  SQL for partitioning the Booking table by `start_date` (by year) to optimize large dataset queries.

- **partition_performance.md**  
  Report on the performance improvements observed after partitioning the Booking table.

- **performance_monitoring.md**  
  Guide for ongoing performance monitoring, query plan analysis, and iterative schema refinement.

## Key Topics Covered

- Writing and analyzing subqueries (correlated and non-correlated)
- Using aggregation and window functions for analytics
- Indexing strategies for high-usage columns
- Measuring and interpreting query performance with `EXPLAIN ANALYZE`
- Refactoring queries and schema for optimal performance
- Table partitioning for scalable data management
- Continuous performance monitoring and improvement

## Usage

1. Review the SQL scripts for examples and templates.
2. Use the provided performance analysis and monitoring guides to assess and improve your own database queries.
3. Apply indexing and partitioning strategies as your dataset grows to maintain high performance.

---

For more details, see the individual files and documentation in this directory.

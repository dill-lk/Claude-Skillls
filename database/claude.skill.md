# Skill: Database

Design schemas, write queries, optimise performance, and manage migrations for relational and non-relational databases.

---

## Overview

Claude can assist with SQL/NoSQL schema design, query writing and optimisation, index strategy, migration planning, and data modelling. This skill covers PostgreSQL, MySQL, SQLite, MongoDB, Redis, and common ORMs.

---

## Task Patterns

### 1. Design a Relational Schema

**Prompt template:**
```
Design a normalised relational database schema for [domain].

Entities and attributes:
- [entity 1]: [attributes]
- [entity 2]: [attributes]

Relationships:
- [relationship description with cardinality]

Requirements:
- [e.g., 3NF normalisation]
- [e.g., soft deletes using deleted_at column]
- [e.g., audit columns: created_at, updated_at, created_by]

Output: CREATE TABLE statements for [PostgreSQL / MySQL / SQLite].
```

---

### 2. Write a Complex SQL Query

**Prompt template:**
```
Write a [PostgreSQL / MySQL] query that:
- [requirement 1]
- [requirement 2]
- [requirement 3]

Schema:
[paste relevant CREATE TABLE statements or describe tables]

Requirements:
- Use CTEs for readability if the query is complex
- Add a comment explaining each CTE or subquery
- Include an EXPLAIN plan analysis if performance is a concern
```

---

### 3. Optimise a Slow Query

**Prompt template:**
```
This query is running slowly (>2s) on a table with [N] rows:

```sql
[paste query]
```

Indexes currently defined:
[paste index definitions or SHOW INDEXES output]

EXPLAIN output:
[paste EXPLAIN or EXPLAIN ANALYZE output]

Suggest optimisations: index changes, query rewrites, or partitioning strategies.
```

---

### 4. Design Indexes for a Workload

**Prompt template:**
```
Design an indexing strategy for the following query workload on this schema:

Schema:
[paste schema]

Queries (most frequent first):
1. [paste query 1]
2. [paste query 2]
3. [paste query 3]

For each recommended index, explain:
- Which query it supports
- Why the index is structured this way (column order, partial index, etc.)
- Any write-performance trade-offs
```

---

### 5. Write a Database Migration

**Prompt template:**
```
Write a database migration (up + down) to:
- [change 1, e.g., add column `status` with default 'active']
- [change 2, e.g., rename table `orders` to `purchase_orders`]
- [change 3, e.g., add a foreign key constraint]

Database: [PostgreSQL / MySQL]
Migration framework: [e.g., Flyway, Liquibase, Alembic, Knex, Prisma Migrate]

Ensure the migration is zero-downtime safe for a live production database.
```

---

### 6. Design a MongoDB Document Schema

**Prompt template:**
```
Design a MongoDB document schema for [domain].

Access patterns (most frequent first):
1. [access pattern 1, e.g., fetch user with their last 10 orders]
2. [access pattern 2]

Requirements:
- [e.g., embed vs reference decision for nested data]
- [e.g., maximum document size considerations]
- [e.g., indexing for access patterns]

Show example documents and the index definitions.
```

---

### 7. Design a Redis Data Structure

**Prompt template:**
```
Design Redis data structures for [use case, e.g., session store / rate limiter / leaderboard / cache].

Requirements:
- [requirement 1]
- [requirement 2]
- TTL policy: [describe]

For each data structure:
- Justify the choice (String, Hash, List, Set, Sorted Set, Stream)
- Show the key naming convention
- Provide the Redis commands to read and write
```

---

## Advanced Techniques

### ORM Query Optimisation

```
This ORM query generates an N+1 problem:

[language]
[paste ORM code]

Rewrite it to use eager loading / joins to fetch all required data in a single query.
ORM: [e.g., Sequelize, Prisma, SQLAlchemy, Hibernate]
```

### Data Pagination Strategies

```
Compare cursor-based vs offset-based pagination for this query and recommend the best approach:

Query: [paste query]
Table size: [N rows]
Sort order: [describe]
Client type: [infinite scroll / page numbers / export]

Show the implementation for the recommended approach.
```

### Database Sharding Design

```
Design a sharding strategy for [table/collection] that currently has [N] rows and grows at [rate].

Access patterns: [describe]
Current hotspots: [describe]

Recommend: shard key, shard count, routing logic, and re-sharding approach.
```

---

## SQL Best Practices

| Practice | Why |
|---|---|
| Always use parameterised queries | Prevents SQL injection |
| Avoid `SELECT *` in production | Fetches unnecessary data; breaks on schema changes |
| Use `EXPLAIN ANALYZE` before deploying | Confirms query plan matches expectations |
| Add indexes for all foreign keys | Prevents full table scans on JOINs |
| Use transactions for multi-step writes | Maintains data consistency |
| Prefer `UPSERT` over check-then-insert | Eliminates TOCTOU race conditions |
| Set `NOT NULL` constraints explicitly | Documents intent and catches bugs at the DB level |

---

## Schema Design Checklist

- [ ] Primary keys defined on all tables
- [ ] Foreign key constraints enforced
- [ ] Indexes cover all high-frequency query patterns
- [ ] Audit columns added (created_at, updated_at)
- [ ] Soft delete strategy defined if needed
- [ ] Migration scripts include both up and down
- [ ] Migrations tested on a copy of production data
- [ ] Sensitive fields identified for encryption at rest

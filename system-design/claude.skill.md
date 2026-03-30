# Skill: System Design

Design large-scale distributed systems — from high-level architecture to detailed component specifications, capacity estimates, and operational runbooks.

---

## Overview

Claude can guide structured system design sessions, estimate capacity, design data models for scale, choose appropriate databases and communication patterns, handle failure modes, and produce clear design documents. Use this skill for technical interviews, architecture reviews, and greenfield system planning.

---

## Task Patterns

### 1. Full System Design

**Prompt template:**
```
Design [system name — e.g., a URL shortener / a ride-sharing platform / a distributed cache].

Requirements:
- Scale: [DAU, requests/s, data volume, growth rate]
- Functional requirements: [list core features]
- Non-functional requirements: [latency SLA, availability target, consistency model, geo-distribution]
- Out of scope: [what to explicitly exclude]

Walk through:
1. Clarifying questions and assumptions
2. Capacity estimation (storage, bandwidth, compute)
3. High-level design (component diagram in text)
4. Deep dive on [the hardest component]
5. Data model
6. API design (key endpoints)
7. Failure modes and mitigations
8. Trade-offs accepted
```

---

### 2. Capacity Estimation

**Prompt template:**
```
Estimate the capacity requirements for [system] given:

- Users: [total registered / DAU / MAU]
- Read/write ratio: [e.g., 100:1]
- Average request size: [bytes]
- Retention period: [e.g., 5 years]
- Peak-to-average ratio: [e.g., 3x]

Calculate:
1. Requests per second (average and peak)
2. Storage required (with replication factor)
3. Network bandwidth
4. Server count estimate (assume [X] RPS/server)

Show your working step-by-step.
```

---

### 3. Design a Data Model for Scale

**Prompt template:**
```
Design a data model for [feature/system] that scales to [scale].

Entities and relationships: [describe]
Query patterns: [list the most frequent read and write queries]
Consistency requirements: [strong / eventual / causal]
Access patterns: [point lookups / range scans / fan-out writes / etc.]

Recommend:
- Primary data store and schema (SQL table DDL or NoSQL document structure)
- Indexing strategy
- Sharding / partitioning key and rationale
- Caching layer design
- Read replica strategy
```

---

### 4. Design a Rate Limiter

**Prompt template:**
```
Design a distributed rate limiter for [API / service].

Requirements:
- Algorithm: [token bucket / sliding window log / fixed window / leaky bucket]
- Scope: [per user / per IP / per API key / global]
- Limits: [e.g., 1000 req/min per user, 10 req/s per IP]
- Distributed: [N] nodes, no single point of failure

Show:
- Data structure in Redis (commands used)
- Race condition handling
- What happens when Redis is down (fail open vs fail closed)
- API for checking and decrementing quota
```

---

### 5. Design a Notification System

**Prompt template:**
```
Design a notification system that sends [email / SMS / push / in-app] notifications for [platform].

Scale: [N] notifications/day, [M] users
Requirements:
- At-least-once delivery guarantee
- Priority tiers: [critical (< 1s) / normal (< 30s) / batch (< 1h)]
- User preferences and opt-out respected
- Notification deduplication window: [X minutes]
- Delivery status tracking

Design: producer → queue → worker → delivery provider → status tracking.
```

---

### 6. Design for High Availability

**Prompt template:**
```
Redesign the following system for [99.9% / 99.99%] availability.

Current architecture: [describe]
Single points of failure identified: [list]

For each SPOF:
1. Failure scenario
2. Detection method (health check, heartbeat, circuit breaker)
3. Mitigation (active-passive failover, active-active, retry with backoff)
4. Recovery time objective (RTO) and recovery point objective (RPO)

Produce: updated architecture diagram (text) and an availability budget breakdown.
```

---

## Advanced Techniques

### Consistent Hashing Deep Dive

```
Explain consistent hashing and design a consistent hashing ring for [use case — e.g., distributing cache keys across 10 nodes].

Show:
- How keys are assigned to nodes
- What happens when a node is added (data movement)
- What happens when a node fails (rebalancing)
- Virtual nodes and why they're needed
- Code implementation in [language]
```

### Leader Election Design

```
Design a leader election mechanism for a cluster of [N] nodes handling [use case].

Requirements:
- Only one leader at a time (safety)
- A new leader elected within [X seconds] of failure (liveness)
- No split-brain scenario

Compare approaches:
- Raft consensus
- Zookeeper / etcd ephemeral nodes
- Database-backed lease

Recommend one for this use case and show the key algorithm steps.
```

### Distributed Transaction Design

```
Design a strategy for distributed transactions across [N] services for [use case].

Services involved: [list]
Operation: [describe the multi-service operation that must be atomic]

Compare:
- 2-Phase Commit (2PC)
- Saga pattern (choreography vs orchestration)

Recommend one, show the happy path and failure/compensation flow.
```

---

## System Design Building Blocks Reference

| Component | Common Solutions | Use When |
|---|---|---|
| Relational DB | PostgreSQL, MySQL | ACID, complex queries, joins |
| Document DB | MongoDB, Firestore | Flexible schema, hierarchical data |
| Wide-column | Cassandra, DynamoDB | High write throughput, time-series |
| Cache | Redis, Memcached | Low-latency reads, session storage |
| Message queue | Kafka, RabbitMQ, SQS | Async processing, event streaming |
| Object storage | S3, GCS | Blobs, media, backups |
| Search | Elasticsearch, OpenSearch | Full-text search, faceting |
| CDN | Cloudfront, Fastly | Static assets, edge caching |
| API gateway | Kong, AWS API GW | Rate limiting, auth, routing |
| Service mesh | Istio, Linkerd | Service-to-service auth, observability |

---

## System Design Checklist

- [ ] Functional and non-functional requirements captured
- [ ] Capacity estimated (storage, QPS, bandwidth)
- [ ] High-level component diagram produced
- [ ] Data model designed with query patterns in mind
- [ ] API contract defined for key endpoints
- [ ] Single points of failure identified and mitigated
- [ ] Consistency model chosen and trade-offs acknowledged
- [ ] Caching strategy defined (what, where, invalidation)
- [ ] Failure modes and recovery strategies documented
- [ ] Scalability path clear (how to handle 10x growth)

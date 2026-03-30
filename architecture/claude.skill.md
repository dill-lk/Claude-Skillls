# Skill: Software Architecture

Design scalable, maintainable software architectures — from high-level system structure down to component boundaries, dependency rules, and architecture decision records.

---

## Overview

Claude can reason about architectural trade-offs, apply recognised patterns (layered, hexagonal, event-driven, CQRS, microservices, modular monolith), and produce diagrams-as-text, ADRs, and migration roadmaps. Use this skill to explore, validate, and document architectural decisions.

---

## Task Patterns

### 1. Design a System Architecture

**Prompt template:**
```
Design the architecture for [system name / description].

Requirements:
- Users / scale: [e.g., 100k DAU, 10k req/s peak]
- Key quality attributes: [e.g., high availability, low latency, strong consistency]
- Tech constraints: [language, cloud provider, existing services]
- Budget / team size hints: [optional]

Provide:
1. High-level component diagram (text/ASCII)
2. Responsibility of each component
3. Communication patterns (sync REST, async events, etc.)
4. Data store choices and rationale
5. Key trade-offs accepted
```

---

### 2. Evaluate Architectural Options

**Prompt template:**
```
I'm choosing between the following architectural approaches for [problem]:

Option A: [description]
Option B: [description]
Option C: [description]

Evaluate each against:
- Scalability
- Operational complexity
- Developer experience
- Cost at [scale]
- Risk / unknown unknowns

Recommend one and justify it.
```

---

### 3. Decompose a Monolith into Services

**Prompt template:**
```
I have a monolithic [language/framework] application. Here is its high-level module structure:

[paste module list or brief description]

Help me identify bounded contexts and decompose into services:
1. Identify natural seams / domain boundaries
2. Propose service candidates with their responsibilities
3. Identify shared data ownership issues and how to resolve them
4. Suggest a phased extraction roadmap (strangler fig pattern)
```

---

### 4. Apply a Specific Architecture Pattern

**Prompt template:**
```
Refactor the following system description to use [Hexagonal Architecture / CQRS / Event Sourcing / Clean Architecture / Vertical Slice Architecture].

Current system: [describe current structure]

Show:
- New layer/component structure
- How existing components map to the new pattern
- Dependency rules (what can depend on what)
- A concrete before/after example in [language]
```

---

### 5. Write an Architecture Decision Record (ADR)

**Prompt template:**
```
Write an ADR for the following decision:

Decision: [e.g., use PostgreSQL instead of MongoDB]
Context: [why this decision is needed now]
Options considered: [list options]
Decision outcome: [what was chosen]
Consequences: [positive and negative]

Use the Nygard ADR format.
```

---

### 6. Review an Existing Architecture

**Prompt template:**
```
Review the following architecture for weaknesses:

[describe current architecture — components, communication, data stores]

Evaluate against:
- Single points of failure
- Scalability bottlenecks
- Data consistency guarantees
- Security boundaries
- Operational complexity
- Developer cognitive load

Produce a prioritised list of concerns with recommended improvements.
```

---

## Advanced Techniques

### Architecture Fitness Functions

```
Define fitness functions to continuously validate the following architectural constraints for [system]:

Constraints:
- [e.g., no cross-domain database calls]
- [e.g., all services must respond within 200ms at p99]
- [e.g., no circular dependencies between modules]

For each constraint:
1. What to measure
2. How to automate the check (unit test, integration test, ArchUnit rule, linting rule)
3. Where it runs (CI, runtime monitoring)
```

### Event Storming Output → Architecture

```
Convert the following Event Storming output into a proposed service architecture:

Domain events: [list]
Commands: [list]
Aggregates: [list]
Bounded contexts: [list]

Produce:
- Service boundaries with clear ownership
- Event-driven communication between services
- Consistency model for each aggregate
```

### Migration Roadmap

```
Create a phased migration roadmap from [current architecture] to [target architecture].

Current state: [describe]
Target state: [describe]
Constraints: [zero downtime, 3-person team, 6-month timeline, etc.]

For each phase:
- Goal
- Steps
- Risk and mitigation
- Success criteria
```

---

## Architecture Pattern Quick Reference

| Pattern | Best For | Trade-offs |
|---|---|---|
| Layered (N-tier) | CRUD apps, small teams | Tight coupling across layers |
| Hexagonal / Ports & Adapters | Testability, swappable I/O | More boilerplate |
| Microservices | Independent scaling, large teams | Distributed systems complexity |
| Modular Monolith | Monolith with clear seams | Harder to scale individual parts |
| CQRS | High read/write asymmetry | Two models to maintain |
| Event Sourcing | Audit trail, temporal queries | Storage growth, eventual consistency |
| Serverless | Bursty workloads, low ops overhead | Cold starts, vendor lock-in |
| Event-Driven | Loose coupling, async workflows | Eventual consistency, harder debugging |

---

## Architecture Checklist

- [ ] Non-functional requirements captured (availability, latency, throughput, consistency)
- [ ] Single points of failure identified and mitigated
- [ ] Data ownership is unambiguous for each entity
- [ ] Communication style chosen per interaction (sync vs async justified)
- [ ] Security boundaries and trust zones defined
- [ ] Deployment and operational model considered
- [ ] Decision documented in an ADR
- [ ] Architecture reviewable by the team (diagram up to date)

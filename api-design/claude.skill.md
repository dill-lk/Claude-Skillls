# Skill: API Design

Design, review, and evolve APIs — REST, GraphQL, gRPC, and event-driven — using Claude as a collaborative API architect.

---

## Overview

Claude can help you design clear, consistent, versioned, and developer-friendly APIs. This skill covers resource modelling, endpoint design, error conventions, versioning strategy, and OpenAPI specification generation.

---

## Task Patterns

### 1. Design a REST API from a Domain Model

**Prompt template:**
```
Design a RESTful API for [domain/feature name].

Domain entities and relationships:
- [entity 1]: [attributes]
- [entity 2]: [attributes]
- Relationship: [describe]

Operations required:
- [CRUD operation list]
- [any non-CRUD operations, e.g., approve, publish, archive]

Requirements:
- Follow REST conventions (resource-based URIs, correct HTTP verbs)
- Return appropriate HTTP status codes
- Use consistent JSON response envelopes
- Support pagination for collection endpoints
```

---

### 2. Generate an OpenAPI / Swagger Specification

**Prompt template:**
```
Generate a complete OpenAPI 3.0 specification (YAML) for the following API:

[Describe endpoints, request/response shapes, and authentication]

Include:
- All path parameters, query parameters, and request bodies with schemas
- Response schemas for success and error cases
- Security scheme definition ([Bearer token / API key / OAuth2])
- Example request and response for each endpoint
```

---

### 3. Design Error Response Conventions

**Prompt template:**
```
Design a consistent error response format for a [REST / GraphQL] API.

Requirements:
- Machine-readable error codes (not just HTTP status codes)
- Human-readable messages
- Contextual field-level validation errors
- Correlation/request IDs for tracing
- No sensitive data in error bodies

Show example responses for: 400, 401, 403, 404, 409, 422, 429, 500.
```

---

### 4. Design a GraphQL Schema

**Prompt template:**
```
Design a GraphQL schema for [domain].

Entities: [list]
Queries needed: [list]
Mutations needed: [list]
Subscriptions needed (if any): [list]

Requirements:
- Use connections pattern for paginated lists
- Include input types for all mutations
- Add descriptions to all types and fields
- Design for forward compatibility (nullable fields by default)
```

---

### 5. Design a gRPC Service Definition

**Prompt template:**
```
Design a gRPC service definition (proto3) for [service name].

The service should handle:
- [RPC 1]: [description]
- [RPC 2]: [description]

Include:
- Appropriate message types with comments
- Use of google.protobuf.Timestamp for dates
- Error handling via google.rpc.Status
- Streaming RPCs where appropriate
```

---

### 6. API Versioning Strategy

**Prompt template:**
```
Recommend a versioning strategy for our [REST / GraphQL / gRPC] API.

Context:
- Current state: [describe existing API]
- Expected rate of change: [frequent / infrequent]
- Consumer types: [mobile apps / third-party / internal services]
- Breaking change policy: [describe]

Compare URI versioning, header versioning, and content negotiation. Recommend the best fit and explain why.
```

---

### 7. Review an Existing API for Problems

**Prompt template:**
```
Review the following API design and identify issues with:
1. RESTful correctness (wrong HTTP verbs, non-resource URIs)
2. Status code misuse
3. Inconsistent naming or casing
4. Missing pagination or filtering
5. Security concerns (over-exposure of data, missing auth)
6. Versioning problems

[paste OpenAPI spec or endpoint list]
```

---

## Advanced Techniques

### API-First Development Workflow

```
We follow API-first development. Help me:
1. Define the API contract in OpenAPI 3.0 before any implementation
2. Identify ambiguities in the requirements that could affect the API shape
3. Generate mock server responses from the spec
4. Generate client SDK stubs in [language]
```

### Idempotency Design

```
Design idempotency for the following mutating endpoints to make them safe to retry:

Endpoints:
- [endpoint 1]
- [endpoint 2]

Approach: [idempotency keys / natural idempotency / conditional requests]

Show the request/response pattern and how to handle duplicate requests.
```

### Rate Limiting and Throttling Design

```
Design a rate limiting strategy for our public API.

Traffic profile:
- Expected RPS: [value]
- Burst factor: [value]
- Client types: [authenticated users / API keys / anonymous]

Define:
- Limit tiers
- Rate limit headers to return
- 429 response body format
- Retry-After semantics
```

---

## API Design Principles

| Principle | Guideline |
|---|---|
| Resource-oriented | URIs name resources (nouns), not actions (verbs) |
| Predictable | Similar things work the same way everywhere |
| Consistent casing | `snake_case` for JSON fields; `kebab-case` for URL paths |
| Pagination required | Never return unbounded collections |
| Explicit versioning | Make breaking changes opt-in, not forced |
| Least privilege | Return only the data the caller needs |
| Idempotent mutations | POST with idempotency key or use PUT/PATCH |

---

## HTTP Status Code Quick Reference

| Code | When to use |
|---|---|
| 200 OK | Successful GET, PUT, PATCH |
| 201 Created | Successful POST that created a resource |
| 204 No Content | Successful DELETE |
| 400 Bad Request | Malformed request syntax or invalid parameters |
| 401 Unauthorized | Missing or invalid authentication |
| 403 Forbidden | Authenticated but not authorised |
| 404 Not Found | Resource does not exist |
| 409 Conflict | State conflict (e.g., duplicate create) |
| 422 Unprocessable Entity | Validation errors on well-formed request |
| 429 Too Many Requests | Rate limit exceeded |
| 500 Internal Server Error | Unexpected server-side failure |

---

## API Design Checklist

- [ ] All resources are nouns, all actions use correct HTTP verbs
- [ ] Pagination implemented on all collection endpoints
- [ ] Consistent error format across all endpoints
- [ ] Authentication and authorisation documented
- [ ] API versioning strategy defined
- [ ] OpenAPI spec generated and validated
- [ ] Breaking vs non-breaking change policy documented

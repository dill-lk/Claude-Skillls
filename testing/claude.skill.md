# Skill: Testing

Design, generate, and improve automated tests — unit, integration, end-to-end, and property-based — using Claude as a test-design partner.

---

## Overview

Claude can analyse code to derive test cases, identify untested edge cases, generate mock/stub objects, and write tests in any major test framework. Use this skill to build thorough, maintainable test suites.

---

## Task Patterns

### 1. Generate Unit Tests for a Function

**Prompt template:**
```
Write unit tests for the following [language] function using [test framework, e.g., Jest, pytest, JUnit].

Cover:
- Happy path (typical valid inputs)
- Boundary values
- Invalid / unexpected inputs
- Edge cases: [list any you're aware of]

[language]
[paste function]
```

---

### 2. Generate Tests from a Specification

**Prompt template:**
```
Given the following requirements, generate a complete test suite in [language] with [framework].

Requirements:
- [requirement 1]
- [requirement 2]
- [requirement 3]

Use descriptive test names that read like sentences (e.g., "should return 404 when user is not found").
```

---

### 3. Identify Untested Code Paths

**Prompt template:**
```
Review the following code and list all code paths that are NOT covered by the existing tests.
For each uncovered path, explain why it matters and provide the test case to cover it.

Code:
[language]
[paste code]

Existing tests:
[language]
[paste tests]
```

---

### 4. Generate Mock / Stub / Fake Objects

**Prompt template:**
```
Generate [mocks/stubs/fakes] for the following [interface/class/dependency] in [language] using [mocking library, e.g., Mockito, unittest.mock, Jest mocks].

The mock should:
- Implement all methods of the interface
- Allow test-specific return value overrides
- Record calls for assertion in tests

[language]
[paste interface or class]
```

---

### 5. Write Integration Tests

**Prompt template:**
```
Write integration tests for the following [API endpoint / database layer / service interaction].

Setup requirements:
- [e.g., in-memory database, test HTTP server]
- [e.g., seed data needed]

Tests should verify:
- [behaviour 1]
- [behaviour 2]

Framework: [e.g., Supertest + Jest, pytest + FastAPI TestClient]
```

---

### 6. Property-Based / Fuzz Testing

**Prompt template:**
```
Write property-based tests for the following function using [framework, e.g., Hypothesis, fast-check, QuickCheck].

Properties to test:
- [e.g., result is always a valid email address]
- [e.g., encode(decode(x)) === x for all x]
- [e.g., output length is always <= input length]

[language]
[paste function]
```

---

### 7. Snapshot / Regression Tests

**Prompt template:**
```
Generate snapshot tests for the following [component / serialisation function / template renderer] to lock in its current output and catch regressions.

Framework: [e.g., Jest snapshots, pytest snapshot plugin]

[language]
[paste component or function]
```

---

## Advanced Techniques

### Test-Driven Development (TDD) Prompt

```
I want to use TDD to implement [feature description].

Step 1: Write the minimal failing tests that describe the desired behaviour.
Do NOT write any implementation yet.
Tests should be in [language] using [framework].
```

Then after reviewing:
```
Step 2: Write the minimal implementation that makes all the tests pass.
Do not add any functionality not required by the tests.
```

### Mutation Testing Analysis

```
Here are the results of a mutation testing run on my test suite:

[paste mutation testing report]

Which surviving mutants represent real gaps in my test coverage?
Generate the additional tests needed to kill them.
```

### Test Quality Review

```
Review the following tests and rate their quality on these dimensions:
1. Clarity (do test names describe the behaviour being tested?)
2. Isolation (do tests depend on each other or on global state?)
3. Coverage (do they cover happy path, edge cases, and error paths?)
4. Flakiness risk (anything that could cause non-deterministic failures?)
5. Maintenance burden (will they break on unrelated changes?)

[language]
[paste tests]
```

---

## Test Naming Conventions

Use these naming patterns for clear, readable tests:

| Style | Example |
|---|---|
| `should_[behaviour]_when_[condition]` | `should_return_null_when_user_not_found` |
| `given_[context]_when_[action]_then_[result]` | `given_empty_cart_when_checkout_then_error` |
| `[method]_[scenario]_[expected]` | `parse_invalidJson_throwsParseError` |
| Natural language (Jest/describe) | `"returns 404 when the user does not exist"` |

---

## Best Practices

| Practice | Why |
|---|---|
| One assertion concept per test | Pinpoints failures immediately |
| Avoid test interdependency | Enables parallel execution and isolates failures |
| Use descriptive names over comments | Test name is the documentation |
| Test behaviour, not implementation | Allows safe refactoring |
| Keep test setup minimal and explicit | Reduces hidden coupling |
| Never use `sleep()` in async tests | Use proper async primitives or polling |

---

## Test Coverage Targets by Layer

| Layer | Target Coverage |
|---|---|
| Pure utility functions | 95–100% |
| Business logic / domain | 85–95% |
| API / controller layer | 70–85% |
| Integration / E2E | Cover all critical user flows |
| Infrastructure / adapters | Contract tests + happy path |

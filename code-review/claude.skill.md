# Skill: Code Review

Perform thorough, constructive code reviews — checking correctness, design, readability, performance, security, and test coverage.

---

## Overview

Claude can review pull requests, individual files, or focused diffs, applying engineering best practices tailored to the language and context. This skill produces structured, actionable review comments ranked by severity.

---

## Task Patterns

### 1. Full Code Review

**Prompt template:**
```
Perform a thorough code review of the following [language] code.

Context:
- What this code does: [brief description]
- Key constraints or conventions: [e.g., must be thread-safe, follows Clean Code principles]

Review for:
- Correctness (logic errors, edge cases, off-by-one errors)
- Design (SOLID principles, separation of concerns, coupling)
- Readability (naming, comments, structure)
- Performance (algorithmic complexity, unnecessary allocations)
- Security (injection, auth, data exposure)
- Error handling (failure modes, partial failures)
- Test coverage gaps

Format each comment as:
- Severity: Critical / Major / Minor / Nit
- Location: [function/line reference]
- Issue: [description]
- Suggestion: [recommended change with code example if helpful]

[language]
[paste code]
```

---

### 2. Review a Pull Request Diff

**Prompt template:**
```
Review this pull request diff. The PR's purpose is: [description].

diff
[paste git diff]

Focus on:
1. Does the change achieve its stated purpose?
2. Are there edge cases or failure modes not handled?
3. Are there better approaches to consider?
4. Does it follow the existing codebase style and patterns?
5. Are there missing tests?

Keep comments concise and actionable.
```

---

### 3. Security-Focused Review

**Prompt template:**
```
Review the following [language] code specifically for security vulnerabilities.

Application context: [e.g., handles user-uploaded files, processes payments, exposes public API]

[language]
[paste code]

For each finding: severity, location, exploit scenario, and remediation.
```

---

### 4. Performance-Focused Review

**Prompt template:**
```
Review the following [language] code for performance issues.

Scale context: [e.g., called 10k times/s, processes 1M record datasets]

[language]
[paste code]

Identify:
- Algorithmic complexity issues (O(n²) loops, unnecessary iterations)
- Memory allocation hotspots
- Blocking I/O in hot paths
- Missing caching opportunities
- Database N+1 query patterns
```

---

### 5. Review for a Junior Developer (Mentoring Tone)

**Prompt template:**
```
Review this code written by a junior developer. Be encouraging and educational.

[language]
[paste code]

For each issue:
- Explain *why* it's a concern (not just what to change)
- Provide a corrected example
- Link to the relevant principle (DRY, YAGNI, separation of concerns, etc.)

Also highlight what they did well.
```

---

### 6. API / Interface Review

**Prompt template:**
```
Review the following [language] API / interface design.

[language]
[paste interface, class signatures, or API schema]

Evaluate:
- Naming clarity and consistency
- Appropriate abstraction level
- Ease of correct use and difficulty of incorrect use (pit of success)
- Backward-compatibility concerns
- Missing methods or overloaded responsibilities
```

---

## Advanced Techniques

### Architectural Consistency Review

```
Review the following code for consistency with our established architectural patterns.

Our patterns:
- [e.g., Repository pattern for data access]
- [e.g., Result<T, E> for error handling]
- [e.g., Commands and queries separated]
- [e.g., All external I/O injected as interfaces]

[language]
[paste code]

Flag any deviations and suggest how to align with the patterns.
```

### Test Quality Review

```
Review the following test suite for quality and coverage.

[language]
[paste tests]

Evaluate:
1. Test naming (do names describe behaviour, not implementation?)
2. Arrange-Act-Assert structure
3. Test isolation (no shared mutable state, deterministic)
4. Coverage of happy path, sad path, edge cases, boundaries
5. Use of mocks/stubs (over-mocked?)
6. Readability and maintainability
```

### Before-and-After Review

```
I refactored this code. Review the before and after and tell me:
1. What genuinely improved
2. What regressed or introduced new concerns
3. What I missed

Before:
[language]
[paste original]

After:
[language]
[paste refactored]
```

---

## Review Severity Guide

| Severity | Meaning | Must Block? |
|---|---|---|
| **Critical** | Correctness bug, security vulnerability, data loss risk | Yes |
| **Major** | Poor design that will cause future pain, missing error handling | Usually |
| **Minor** | Style inconsistency, suboptimal but not harmful | No |
| **Nit** | Personal preference, trivial naming | Optional |

---

## Code Review Checklist

- [ ] Change achieves its stated purpose
- [ ] No logic errors or uncovered edge cases
- [ ] Error paths handled gracefully
- [ ] No security vulnerabilities introduced
- [ ] No performance regressions
- [ ] Tests added for new/changed behaviour
- [ ] Naming is clear and consistent with codebase
- [ ] No dead code, commented-out blocks, or debug statements
- [ ] Documentation updated where necessary
- [ ] No unnecessary complexity (YAGNI)

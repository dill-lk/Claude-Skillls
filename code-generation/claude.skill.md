# Skill: Code Generation

Generate high-quality, production-ready code from natural language descriptions, specifications, or design documents.

---

## Overview

Claude can generate complete implementations across any language or framework, from single functions to full modules. This skill covers patterns for getting the most precise, idiomatic, and maintainable code output.

---

## Task Patterns

### 1. Generate a Function from a Description

**Prompt template:**
```
Write a [language] function called `[name]` that:
- [requirement 1]
- [requirement 2]
- [requirement 3]

Constraints:
- [constraint 1 – e.g., no external dependencies]
- [constraint 2 – e.g., O(n) time complexity]
```

**Example:**
```
Write a TypeScript function called `groupBy` that:
- Accepts an array of objects and a key string
- Returns a record where each key maps to an array of matching objects
- Preserves original order within each group

Constraints:
- No external dependencies
- Generic – works with any object type
```

---

### 2. Scaffold a Full Module or Class

**Prompt template:**
```
Scaffold a [language] [class/module] for [domain concept].

It should expose:
- [method/export 1]: [description]
- [method/export 2]: [description]

Follow [style guide / conventions, e.g., SOLID principles, PEP 8].
Include JSDoc / docstrings for every public member.
```

**Example:**
```
Scaffold a Python class `OrderService` for an e-commerce backend.

It should expose:
- `create_order(user_id, items)`: validates stock, creates an order record, returns order ID
- `cancel_order(order_id)`: marks order as cancelled if still pending
- `get_order(order_id)`: returns full order details

Follow SOLID principles and PEP 8. Include docstrings for every public method.
```

---

### 3. Generate from an Interface / Type Definition

**Prompt template:**
```
Given the following [interface / schema / type]:

[paste interface here]

Implement [class/function/module] that satisfies it. Raise/throw descriptive errors for invalid input.
```

---

### 4. Generate Boilerplate from a Template Pattern

**Prompt template:**
```
Generate [N] variations of the [pattern name] pattern in [language]:
1. [variant 1 description]
2. [variant 2 description]

Use idiomatic [language] conventions. Add inline comments explaining each key decision.
```

---

### 5. Language / Framework Conversion

**Prompt template:**
```
Convert the following [source language] code to [target language / framework].
Keep the same logic and structure; adapt idioms appropriately.

[paste source code]
```

---

## Advanced Techniques

### Specify Output Quality Constraints

Add these constraints to any prompt to raise the quality bar:

```
Requirements:
- Handle all edge cases (null/undefined inputs, empty collections, overflow)
- Include input validation with descriptive error messages
- Write pure functions where possible (no hidden side-effects)
- Prefer readability over cleverness
```

### Request Multiple Implementations

```
Provide two implementations:
1. A simple, readable version suitable for most use cases
2. An optimised version for high-throughput scenarios
Explain the trade-offs between them.
```

### Iterative Refinement Loop

```
Here is the code you generated:
[paste code]

Refine it by:
- [specific improvement 1]
- [specific improvement 2]
Keep all other behaviour identical.
```

---

## Best Practices

| Practice | Why |
|---|---|
| Always specify the target language and version | Avoids outdated syntax (e.g., Python 2 vs 3, ES5 vs ESNext) |
| Provide input/output examples | Anchors the implementation to concrete expectations |
| Name the function/class upfront | Prevents generic names like `processData` |
| Mention the runtime environment | Enables environment-specific optimisations (browser, Node, serverless) |
| Ask for inline comments on non-obvious logic | Improves long-term maintainability |

---

## Example Output Evaluation Checklist

- [ ] Compiles / parses without errors
- [ ] Handles null/empty inputs gracefully
- [ ] Follows project naming conventions
- [ ] No unnecessary dependencies introduced
- [ ] Complexity matches the problem (not over-engineered)
- [ ] Errors are descriptive and actionable

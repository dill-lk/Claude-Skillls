# Skill: Refactoring

Improve the internal structure, readability, and maintainability of existing code without changing its observable behaviour.

---

## Overview

Claude can apply named refactoring patterns, enforce coding standards, reduce complexity, and modernise legacy code. Use this skill to systematically improve code quality one targeted change at a time.

---

## Task Patterns

### 1. Apply a Named Refactoring Pattern

**Prompt template:**
```
Apply the [refactoring name] refactoring to the following [language] code.
Keep all existing behaviour identical. Explain each change you make.

[language]
[paste code]
```

**Common refactoring names:**
- Extract Function / Method
- Inline Variable / Function
- Replace Conditional with Polymorphism
- Introduce Parameter Object
- Replace Magic Number with Named Constant
- Decompose Conditional
- Move Function / Field
- Replace Loop with Pipeline
- Encapsulate Field

---

### 2. Reduce Cyclomatic Complexity

**Prompt template:**
```
This function has high cyclomatic complexity (too many nested conditionals).
Refactor it to reduce complexity while keeping behaviour identical.
Target: no more than [N] levels of nesting.

[language]
[paste function]
```

---

### 3. Extract Reusable Components

**Prompt template:**
```
The following code has duplicated logic across [N] places.
Extract the common logic into a shared [function/class/module] that all callsites can use.

Files / snippets:
1. [paste snippet 1]
2. [paste snippet 2]

Show the refactored versions of each callsite and the new shared component.
```

---

### 4. Modernise Legacy Code

**Prompt template:**
```
Modernise the following [language] code from [old version/style] to [new version/style].

Changes to apply:
- [e.g., Replace callbacks with async/await]
- [e.g., Use destructuring instead of property access]
- [e.g., Replace var with const/let]
- [e.g., Use optional chaining (?.) where applicable]

[language]
[paste legacy code]
```

---

### 5. Enforce SOLID / Clean Code Principles

**Prompt template:**
```
Analyse this [language] class/module and refactor it to better follow [SOLID / Clean Code / DRY / YAGNI] principles.

For each violation you find:
1. Name the principle being violated
2. Explain why it's a violation
3. Show the refactored code

[language]
[paste code]
```

---

### 6. Rename for Clarity

**Prompt template:**
```
The names in the following code are unclear or misleading.
Suggest better names for all variables, functions, and classes, then show the renamed version.

[language]
[paste code]
```

---

## Advanced Techniques

### Behaviour-Preserving Refactor with Test Harness

```
I'll refactor this code. First, generate a comprehensive test suite that documents its current behaviour so I can verify nothing breaks:

[language]
[paste code]

After I confirm the tests pass, suggest the refactoring steps.
```

### Large-Scale Refactoring Plan

```
I need to refactor this [module/service/codebase] which is [N] lines long.

High-level goals:
- [goal 1]
- [goal 2]

Create a step-by-step refactoring plan where each step is small, independently testable, and does not break existing functionality. Order steps by risk (lowest first).
```

### Strangler Fig Pattern for Legacy Systems

```
I need to gradually replace this legacy [component] with a new implementation without a big-bang rewrite.

Legacy code:
[language]
[paste legacy code]

New desired behaviour: [describe]

Design a strangler fig migration plan with clearly defined phases.
```

---

## Refactoring Checklist (Before & After)

**Before refactoring:**
- [ ] Existing tests pass (or test coverage documented)
- [ ] Behaviour is understood and documented
- [ ] Scope of change agreed (single function vs module vs service)

**After refactoring:**
- [ ] All existing tests still pass
- [ ] No new public API changes (or they are intentional and documented)
- [ ] Cyclomatic complexity reduced or maintained
- [ ] Code is more readable (peer review confirms)
- [ ] No hidden behaviour changes in edge cases

---

## Best Practices

| Practice | Why |
|---|---|
| Refactor in small steps | Each step can be independently reviewed and reverted |
| Never refactor and fix bugs simultaneously | Mixes concerns; makes root-cause analysis harder |
| Commit after each safe refactoring step | Creates a clean bisect history |
| Run tests after every step | Catches behaviour changes immediately |
| Document *why* the structure changed, not just *what* | Helps future maintainers |

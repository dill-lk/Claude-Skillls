# Skill: Debugging

Systematically diagnose, trace, and fix bugs in code using Claude as an intelligent debugging partner.

---

## Overview

Claude can analyse stack traces, reason through logic errors, spot off-by-one mistakes, and suggest targeted fixes. This skill provides structured prompts and workflows to turn debugging sessions into fast, collaborative problem-solving.

---

## Task Patterns

### 1. Diagnose a Stack Trace / Error Message

**Prompt template:**
```
I'm getting the following error in [language/framework]:

[paste full stack trace or error message]

Context:
- Environment: [OS, runtime version, relevant dependencies]
- What triggered it: [brief description of user action or code path]
- Relevant code:

[language]
[paste the smallest reproducing snippet]

What is the root cause and how should I fix it?
```

---

### 2. Hunt a Logic Bug

**Prompt template:**
```
This function is supposed to [expected behaviour], but instead it [actual behaviour].

[language]
[paste function]

Example that fails:
- Input: [value]
- Expected output: [value]
- Actual output: [value]

Walk me through the logic step-by-step and identify where it goes wrong.
```

---

### 3. Debug Intermittent / Race-Condition Issues

**Prompt template:**
```
I have an intermittent bug that only appears under [specific conditions – e.g., high load, concurrent requests].

Symptoms: [describe what goes wrong]

Relevant code:
[language]
[paste concurrent/async code]

Possible causes I've already ruled out: [list]

Suggest likely root causes and how I can confirm each one.
```

---

### 4. Explain Why a Diff Broke Something

**Prompt template:**
```
After applying this diff, [feature/test] broke:

diff
[paste git diff]

Error:
[paste error or failing test output]

Identify which part of the diff introduced the regression and explain why.
```

---

### 5. Add Strategic Debug Logging

**Prompt template:**
```
Insert debug logging into the following code to help diagnose [problem description].
Log:
- Entry and exit of each function with arguments and return values
- Intermediate state at key decision points
- Timestamps for any async operations

[language]
[paste code]
```

---

## Advanced Techniques

### Rubber Duck + Hypothesis Method

Structure your prompt to force systematic reasoning:

```
Act as a senior [language] engineer doing a rubber-duck debugging session.

Problem: [describe bug]

Walk through:
1. What the code should do
2. What it actually does
3. Three plausible hypotheses for the root cause (ranked by likelihood)
4. How to test each hypothesis with a minimal reproducing case
5. The most likely fix
```

### Bisect Strategy

```
The bug was introduced somewhere between commit [A] and commit [B].
Here is a summary of changes made between those commits:
[paste git log --oneline or summary]

Which changes are most likely to have caused [symptom]? In what order should I bisect?
```

### Memory / Leak Analysis

```
This process's memory grows continuously over time and never drops.

Here is the allocation-heavy code path:
[language]
[paste code]

Identify potential memory leaks and object retention issues.
```

---

## Debugging Workflow (Step-by-Step)

```
1. Reproduce  → "Show me the smallest code snippet that triggers the bug."
2. Isolate    → "Remove everything unrelated until only the failing case remains."
3. Hypothesise → "List 3 plausible root causes."
4. Verify     → "How do I confirm or rule out each hypothesis?"
5. Fix        → "Apply the minimal change that resolves the root cause."
6. Regression-test → "Write a test that would have caught this bug earlier."
```

---

## Best Practices

| Practice | Why |
|---|---|
| Always share the full stack trace | Partial traces miss the originating frame |
| Include the runtime/library versions | Bugs are often version-specific |
| State what you've already tried | Avoids repeated suggestions |
| Provide a minimal reproducing example | Speeds up diagnosis dramatically |
| Describe *expected* vs *actual* behaviour explicitly | Prevents misunderstandings |

---

## Post-Debug Checklist

- [ ] Root cause identified and explained
- [ ] Fix applied to root cause, not just symptom
- [ ] Regression test added
- [ ] Similar code paths reviewed for the same issue
- [ ] Fix documented in code comments if non-obvious

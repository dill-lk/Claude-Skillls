# Skill: Documentation

Write, improve, and maintain technical documentation — API references, README files, architecture docs, runbooks, and inline comments.

---

## Overview

Claude can generate every layer of project documentation, from docstrings in code to high-level architecture decision records. Use this skill to produce documentation that is accurate, consistent, and useful to its audience.

---

## Task Patterns

### 1. Generate a README for a Project

**Prompt template:**
```
Generate a professional README.md for a [language/framework] project called "[name]".

Project description: [1–2 sentence summary]

Sections to include:
- Project overview and purpose
- Key features
- Prerequisites
- Installation & quick start
- Usage examples (with code blocks)
- Configuration options
- Contributing guide
- Licence

Tone: [e.g., technical and concise / friendly and approachable]
```

---

### 2. Document a Function / Class (Docstrings)

**Prompt template:**
```
Add [JSDoc / Python docstrings / Javadoc / XML doc comments] to all public members of the following code.

For each member include:
- A one-line summary
- Parameter descriptions with types
- Return value description and type
- Exceptions / errors raised
- Usage example where non-obvious

[language]
[paste code]
```

---

### 3. Generate API Reference Documentation

**Prompt template:**
```
Generate API reference documentation in [format: Markdown / OpenAPI YAML / Swagger JSON] for the following [REST / GraphQL / RPC] API.

[paste route definitions or schema]

For each endpoint include:
- HTTP method and path
- Description
- Request parameters (path, query, body) with types and validation rules
- Response schema with example
- Error codes and their meanings
- Authentication requirements
```

---

### 4. Write an Architecture Decision Record (ADR)

**Prompt template:**
```
Write an Architecture Decision Record (ADR) for the following decision:

Decision: [what was decided]
Context: [the problem being solved and constraints]
Options considered: [list alternatives]
Decision outcome: [the chosen option and why]
Consequences: [trade-offs, risks, follow-up actions]

Use the MADR (Markdown Any Decision Records) format.
```

---

### 5. Write a Runbook / Operational Guide

**Prompt template:**
```
Write a runbook for [system / service name] covering the following operational tasks:

1. [task 1, e.g., deploy a new version]
2. [task 2, e.g., roll back a failed deployment]
3. [task 3, e.g., respond to a high-latency alert]

For each task:
- Prerequisites
- Step-by-step instructions (numbered)
- Expected output at each step
- What to do if something goes wrong
```

---

### 6. Convert Code Comments into Full Documentation

**Prompt template:**
```
The following code has sparse inline comments. Convert them into full, well-structured documentation.

Output format: [Markdown / HTML / Confluence wiki / Notion]

[language]
[paste code with comments]
```

---

### 7. Write a CHANGELOG Entry

**Prompt template:**
```
Write a CHANGELOG entry for version [X.Y.Z] released on [date].

Changes made (from commit log or PR list):
[paste raw commit messages or PR titles]

Format: Keep a Changelog (https://keepachangelog.com)
Audience: end users (non-technical descriptions preferred)
```

---

## Advanced Techniques

### Audience-Aware Documentation

Specify the audience to tune the depth and vocabulary:

```
Write documentation for [topic] targeted at:
- Audience: [junior developers / senior engineers / DevOps / non-technical stakeholders]
- Assumed knowledge: [e.g., familiar with REST APIs but not this codebase]
- Goal: [e.g., set up the project in under 10 minutes]
```

### Documentation Review

```
Review the following documentation for:
1. Accuracy – does it match the actual code/behaviour?
2. Completeness – are there missing steps, parameters, or error cases?
3. Clarity – are there ambiguous sentences or undefined terms?
4. Consistency – do naming and style match the rest of the project?

[paste documentation]

Relevant code for accuracy checking:
[paste code]
```

### Automatically Detect Outdated Docs

```
Compare the following documentation with the current code.
Identify any outdated or incorrect sections.

Documentation:
[paste docs]

Current code:
[paste code]
```

---

## Documentation Style Guide

| Principle | Guideline |
|---|---|
| Use active voice | "The function returns…" not "A value is returned by…" |
| Lead with purpose | First sentence answers "what does this do?" |
| Use present tense | "Returns the user object" not "Will return" |
| Concrete examples | Every concept needs a working code example |
| Define acronyms on first use | "CI/CD (Continuous Integration / Continuous Delivery)" |
| Keep sentences short | Max ~25 words per sentence for technical docs |

---

## Documentation Checklist

- [ ] Every public function/class/method has a docstring
- [ ] README covers install, quickstart, and a working example
- [ ] All configuration options are documented with defaults
- [ ] Error messages are documented with resolution steps
- [ ] CHANGELOG is up to date
- [ ] Architecture decisions are captured in ADRs
- [ ] Runbooks exist for all common operational tasks

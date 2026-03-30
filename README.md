# Claude-Skillls

> A curated library of advanced Claude Code skills — structured prompt templates, workflows, best practices, and checklists organised by engineering discipline.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Skills](https://img.shields.io/badge/skills-18-blue)](#skill-library)
[![Install](https://img.shields.io/badge/install-one--liner-brightgreen)](#quick-install)

---

## Quick Install

### Option A — Tell Claude Code to install (zero terminal needed)

Open Claude Code and paste this single prompt:

```
Install the Claude-Skillls library from https://github.com/dill-lk/Claude-Skillls.

Fetch each raw URL below and save it to the local path shown.
Create ~/.claude/skills/ if it does not exist.

https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/code-generation/claude.skill.md → ~/.claude/skills/code-generation.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/debugging/claude.skill.md → ~/.claude/skills/debugging.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/refactoring/claude.skill.md → ~/.claude/skills/refactoring.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/testing/claude.skill.md → ~/.claude/skills/testing.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/documentation/claude.skill.md → ~/.claude/skills/documentation.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/api-design/claude.skill.md → ~/.claude/skills/api-design.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/database/claude.skill.md → ~/.claude/skills/database.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/security/claude.skill.md → ~/.claude/skills/security.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/performance/claude.skill.md → ~/.claude/skills/performance.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/devops/claude.skill.md → ~/.claude/skills/devops.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/architecture/claude.skill.md → ~/.claude/skills/architecture.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/code-review/claude.skill.md → ~/.claude/skills/code-review.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/data-science/claude.skill.md → ~/.claude/skills/data-science.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/frontend/claude.skill.md → ~/.claude/skills/frontend.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/mobile/claude.skill.md → ~/.claude/skills/mobile.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/machine-learning/claude.skill.md → ~/.claude/skills/machine-learning.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/system-design/claude.skill.md → ~/.claude/skills/system-design.md
https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/accessibility/claude.skill.md → ~/.claude/skills/accessibility.md

Confirm each file saved successfully.
```

Claude Code will fetch every skill file from GitHub and save it to `~/.claude/skills/` automatically. No terminal required.

### Option B — Shell one-liner

```bash
curl -fsSL https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/install.sh | bash
```

### Option C — Git clone

```bash
git clone https://github.com/dill-lk/Claude-Skillls.git ~/.claude/skills-repo
```

→ **Full installation guide:** [INSTALL.md](./INSTALL.md)

---

## What is this?

Claude Code is powerful, but getting consistently great output for complex engineering tasks requires well-structured prompts. This library solves that.

Each subfolder targets a specific software-engineering discipline and contains a `claude.skill.md` file with:

| Section | What's inside |
|---|---|
| **Overview** | What Claude can do in this area |
| **Task Patterns** | Ready-to-use prompt templates for the most common tasks |
| **Advanced Techniques** | Prompts for complex, multi-step scenarios |
| **Best Practices** | Principles for getting consistent, high-quality output |
| **Checklist** | Steps to validate output before using it in production |

---

## Skill Library

| Skill | Description | File |
|---|---|---|
| 🧠 Code Generation | Generate functions, classes, modules, and full implementations | [view](./code-generation/claude.skill.md) |
| 🐛 Debugging | Diagnose stack traces, logic bugs, race conditions, and memory leaks | [view](./debugging/claude.skill.md) |
| ♻️ Refactoring | Apply named patterns, reduce complexity, modernise legacy code | [view](./refactoring/claude.skill.md) |
| 🧪 Testing | Write unit, integration, property-based, and snapshot tests | [view](./testing/claude.skill.md) |
| 📝 Documentation | Write READMEs, docstrings, API references, ADRs, and runbooks | [view](./documentation/claude.skill.md) |
| 🔌 API Design | Design REST, GraphQL, and gRPC APIs with OpenAPI specs | [view](./api-design/claude.skill.md) |
| 🗄️ Database | Design schemas, write queries, optimise indexes, plan migrations | [view](./database/claude.skill.md) |
| 🔒 Security | Review code for vulnerabilities, design auth systems, audit configs | [view](./security/claude.skill.md) |
| ⚡ Performance | Profile bottlenecks, optimise algorithms, design caching strategies | [view](./performance/claude.skill.md) |
| 🚀 DevOps | Write CI/CD pipelines, Dockerfiles, Kubernetes manifests, Terraform | [view](./devops/claude.skill.md) |
| 🏛️ Architecture | Design scalable systems, apply patterns, write ADRs | [view](./architecture/claude.skill.md) |
| 👁️ Code Review | Perform thorough reviews for correctness, design, security, and performance | [view](./code-review/claude.skill.md) |
| 📊 Data Science | EDA, data cleaning, statistical tests, visualisation, pipelines | [view](./data-science/claude.skill.md) |
| 🖥️ Frontend | Components, state, CSS layouts, performance, and accessibility | [view](./frontend/claude.skill.md) |
| 📱 Mobile | React Native, Flutter, Swift, Kotlin — screens, navigation, offline support | [view](./mobile/claude.skill.md) |
| 🤖 Machine Learning | Training pipelines, evaluation, explainability, deployment, drift monitoring | [view](./machine-learning/claude.skill.md) |
| 🗺️ System Design | Distributed systems, capacity planning, data models, failure modes | [view](./system-design/claude.skill.md) |
| ♿ Accessibility | WCAG audits, ARIA patterns, keyboard navigation, screen reader testing | [view](./accessibility/claude.skill.md) |

---

## How to Use a Skill

After installing, reference a skill in any Claude Code session:

```
Read ~/.claude/skills/debugging.md and help me debug this error:
[paste your error]
```

```
Read ~/.claude/skills/security.md and do a full security review of:
[paste your code]
```

```
Read ~/.claude/skills/testing.md and write comprehensive tests for:
[paste your function]
```

```
Read ~/.claude/skills/api-design.md and design a REST API for:
[describe your domain]
```

### Make skills available globally

Tell Claude Code once, and it will remember for every future session:

```
Add to my global memory:
Skill files are at ~/.claude/skills/. Before helping with code generation,
debugging, refactoring, testing, documentation, API design, database work,
security reviews, performance optimisation, DevOps, architecture design,
code reviews, data science, frontend, mobile, machine learning,
system design, or accessibility — read the matching skill file from that
directory first.
```

### Make skills available in a project

Add to your project's `CLAUDE.md`:

```markdown
## Claude Code Skills
Skill reference files are in ~/.claude/skills/.
Read the relevant file before starting work in each area:
- code-generation.md, debugging.md, refactoring.md, testing.md
- documentation.md, api-design.md, database.md
- security.md, performance.md, devops.md
- architecture.md, code-review.md, data-science.md
- frontend.md, mobile.md, machine-learning.md
- system-design.md, accessibility.md
```

Or run: `curl -fsSL .../install.sh | bash -s -- --append-claude-md`

---

## Skill File Structure

Every `claude.skill.md` follows this consistent layout so you always know where to look:

```
# Skill: [Name]

## Overview
What Claude can do in this engineering area.

## Task Patterns
### 1. [Task name]
Prompt template with [placeholders] you fill in.
...

## Advanced Techniques
Prompts for complex, multi-step scenarios.

## Best Practices
| Practice | Why |
|---|---|
...

## Checklist
- [ ] Validation step
...
```

---

## Example — Debugging Skill in Action

**You paste into Claude Code:**

```
Read ~/.claude/skills/debugging.md

Then use the "Hunt a Logic Bug" pattern for this Python function:

def calculate_discount(price, discount_pct):
    return price - (price * discount_pct)

Expected: calculate_discount(100, 10) → 90.0
Actual:   calculate_discount(100, 10) → -900.0
```

**Claude Code:** reads the skill, applies the step-by-step debugging workflow, walks through the logic, identifies that `discount_pct` is being passed as `10` instead of `0.10`, and suggests the fix plus a regression test.

---

## Example — Security Skill in Action

**You paste:**

```
Read ~/.claude/skills/security.md

Then perform a full security review using the "Security Code Review" pattern:

def get_user(user_id):
    query = f"SELECT * FROM users WHERE id = {user_id}"
    return db.execute(query)
```

**Claude Code:** reads the skill, identifies the SQL injection vulnerability (Critical), explains exactly how it's exploitable, provides the parameterised query fix, and adds a test case that proves the vulnerability is closed.

---

## Updating Skills

Skills are actively maintained. To get the latest version:

```bash
curl -fsSL https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/install.sh | bash
```

Existing files are replaced with the latest content.

---

## Contributing

Skills are open to community contributions. To add a new skill:

1. Fork the repository
2. Create a new subfolder: `mkdir my-new-skill`
3. Create `my-new-skill/claude.skill.md` following the [skill file structure](#skill-file-structure)
4. Add a row to the table in this README
5. Open a pull request

To improve an existing skill, edit the relevant `claude.skill.md` and open a PR describing what you changed and why.

---

## FAQ

**Do I need Claude Code to use these skills?**
No — the prompt templates work in Claude.ai, the API, or any Claude interface. Claude Code is just the best experience because it can read local files directly.

**Are skills saved globally or per-project?**
When installed to `~/.claude/skills/`, they are global — available in every project on your machine. You can also copy individual skill files into a project directory if you prefer project-scoped skills.

**How do I use just one skill without installing all of them?**
Tell Claude Code:
```
Fetch https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/debugging/claude.skill.md
and use it to help me debug this issue: [paste issue]
```

**Will skills slow down my Claude Code sessions?**
No. Skills are only read when you explicitly ask Claude Code to read a file. They don't load automatically unless you configure them to in `CLAUDE.md`.

**How do I know if installation worked?**
Ask Claude Code: `List the files in ~/.claude/skills/` — you should see 10 `.md` files.

---

## Licence

[MIT](./LICENSE) — free to use, modify, and distribute.


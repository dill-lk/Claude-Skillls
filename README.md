# Claude-Skillls

A curated library of advanced Claude Code skills — structured prompt templates, workflows, and best practices organised by engineering task.

---

## What is this?

Each subfolder targets a specific software-engineering discipline and contains a `claude.skill.md` file with:

- **Task patterns** — ready-to-use prompt templates for common tasks
- **Advanced techniques** — prompts for complex, multi-step scenarios
- **Best practices** — principles to get consistent, high-quality output
- **Checklists** — to validate the output before using it in production

---

## Skill Library

| Skill | Description |
|---|---|
| [code-generation](./code-generation/claude.skill.md) | Generate functions, classes, modules, and full implementations |
| [debugging](./debugging/claude.skill.md) | Diagnose stack traces, logic bugs, race conditions, and memory leaks |
| [refactoring](./refactoring/claude.skill.md) | Apply refactoring patterns, reduce complexity, modernise legacy code |
| [testing](./testing/claude.skill.md) | Write unit, integration, property-based, and snapshot tests |
| [documentation](./documentation/claude.skill.md) | Write READMEs, docstrings, API references, ADRs, and runbooks |
| [api-design](./api-design/claude.skill.md) | Design REST, GraphQL, and gRPC APIs with OpenAPI specs |
| [database](./database/claude.skill.md) | Design schemas, write queries, optimise indexes, plan migrations |
| [security](./security/claude.skill.md) | Review code for vulnerabilities, design auth systems, audit configs |
| [performance](./performance/claude.skill.md) | Profile bottlenecks, optimise algorithms, design caching strategies |
| [devops](./devops/claude.skill.md) | Write CI/CD pipelines, Dockerfiles, Kubernetes manifests, Terraform |

---

## How to Use

1. **Navigate** to the relevant skill subfolder for your current task.
2. **Copy** the prompt template that best fits your need.
3. **Fill in** the placeholders (`[language]`, `[paste code]`, etc.) with your specifics.
4. **Paste** into Claude and iterate using the advanced techniques.
5. **Validate** output using the checklist at the bottom of each skill file.

---

## Skill File Structure

Every `claude.skill.md` follows this consistent structure:

```
# Skill: [Name]
Overview           – what Claude can do in this area
Task Patterns      – prompt templates for common tasks
Advanced Techniques – prompts for complex scenarios
Best Practices     – principles for consistent quality
Checklist          – validate before using in production
```

---

## Contributing

To add a new skill:

1. Create a new subfolder: `mkdir [skill-name]`
2. Create `[skill-name]/claude.skill.md` following the structure above
3. Add a row to the table in this README
4. Open a pull request

---

## Licence

[MIT](./LICENSE)

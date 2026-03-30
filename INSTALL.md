# Installation Guide

There are three ways to install Claude-Skillls. Choose the one that fits your workflow.

---

## Method 1 — Auto-install with Claude Code (recommended)

Open **Claude Code** in any project and paste the following prompt exactly. Claude Code will fetch every skill file from this repository and save it locally so you can reference it in any future session.

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

> **What happens:** Claude Code fetches each file over the network, creates the `~/.claude/skills/` directory, and writes each skill file. After that, every project on your machine can reference these skills.

---

### After installing — tell Claude Code to use a skill

Once the skill files are on disk, use them in any session:

```
Read ~/.claude/skills/debugging.md and then help me debug this error:
[paste your error here]
```

```
Read ~/.claude/skills/security.md and do a full security review of:
[paste your code here]
```

```
Read ~/.claude/skills/testing.md and write comprehensive tests for:
[paste your function here]
```

---

## Method 2 — One-liner shell script

Open a terminal and run:

```bash
curl -fsSL https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/install.sh | bash
```

This downloads and runs `install.sh`, which:
- Creates `~/.claude/skills/` (if it doesn't exist)
- Downloads all 10 skill files into that directory
- Prints next steps

### Options

Install to a custom directory:

```bash
curl -fsSL https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/install.sh | bash -s -- --dir /path/to/skills
```

Install and also update your project's `CLAUDE.md` so Claude Code automatically knows about the skills:

```bash
curl -fsSL https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/install.sh | bash -s -- --append-claude-md
```

---

## Method 3 — Manual / git clone

If you prefer to keep the skills as a git repository you can pull updates from:

```bash
git clone https://github.com/dill-lk/Claude-Skillls.git ~/.claude/skills-repo
```

Then reference individual files by path:

```bash
cat ~/.claude/skills-repo/debugging/claude.skill.md
```

To update all skills later:

```bash
cd ~/.claude/skills-repo && git pull
```

---

## Adding skills to a project's CLAUDE.md

To make skills automatically available in a specific project, add references to your project's `CLAUDE.md`:

```markdown
## Available Claude Code Skills

Read the relevant skill file before starting a task in these areas:

- Code generation:  ~/.claude/skills/code-generation.md
- Debugging:        ~/.claude/skills/debugging.md
- Refactoring:      ~/.claude/skills/refactoring.md
- Testing:          ~/.claude/skills/testing.md
- Documentation:    ~/.claude/skills/documentation.md
- API design:       ~/.claude/skills/api-design.md
- Database:         ~/.claude/skills/database.md
- Security:         ~/.claude/skills/security.md
- Performance:      ~/.claude/skills/performance.md
- DevOps:           ~/.claude/skills/devops.md
- Architecture:     ~/.claude/skills/architecture.md
- Code review:      ~/.claude/skills/code-review.md
- Data science:     ~/.claude/skills/data-science.md
- Frontend:         ~/.claude/skills/frontend.md
- Mobile:           ~/.claude/skills/mobile.md
- Machine learning: ~/.claude/skills/machine-learning.md
- System design:    ~/.claude/skills/system-design.md
- Accessibility:    ~/.claude/skills/accessibility.md
```

Or run the installer with `--append-claude-md` to do this automatically.

---

## Adding skills to global Claude memory

To make all skills available globally across every project, tell Claude Code:

```
Add the following to my global memory so you remember it in every session:

Skill files are installed at ~/.claude/skills/. When I ask you to help with:
- code generation  → read ~/.claude/skills/code-generation.md first
- debugging        → read ~/.claude/skills/debugging.md first
- refactoring      → read ~/.claude/skills/refactoring.md first
- writing tests    → read ~/.claude/skills/testing.md first
- documentation    → read ~/.claude/skills/documentation.md first
- API design       → read ~/.claude/skills/api-design.md first
- databases        → read ~/.claude/skills/database.md first
- security review  → read ~/.claude/skills/security.md first
- performance      → read ~/.claude/skills/performance.md first
- DevOps / CI/CD   → read ~/.claude/skills/devops.md first
- architecture     → read ~/.claude/skills/architecture.md first
- code review      → read ~/.claude/skills/code-review.md first
- data science     → read ~/.claude/skills/data-science.md first
- frontend / UI    → read ~/.claude/skills/frontend.md first
- mobile apps      → read ~/.claude/skills/mobile.md first
- machine learning → read ~/.claude/skills/machine-learning.md first
- system design    → read ~/.claude/skills/system-design.md first
- accessibility    → read ~/.claude/skills/accessibility.md first
```

---

## Updating skills

Skills are updated as the library grows. To update to the latest version, re-run the installer:

```bash
curl -fsSL https://raw.githubusercontent.com/dill-lk/Claude-Skillls/main/install.sh | bash
```

Existing files are overwritten with the latest content.

---

## Uninstalling

```bash
rm -rf ~/.claude/skills
```

If you added the block to `CLAUDE.md`, remove the lines between `<!-- claude-skillls:start -->` and `<!-- claude-skillls:end -->`.

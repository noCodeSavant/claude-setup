---
description: Friday weekly summary for clients + manager (WhatsApp-ready)
allowed-tools: Bash(git log:*), Bash(basename:*), Bash(git rev-parse:*), Bash(date:*)
disable-model-invocation: true
---
## Context
- Project: !`basename "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"`
- Date: !`date +%Y-%m-%d`
- This week's changes: !`git log --since="last monday" --oneline 2>/dev/null || echo "(not a git repo — summarize from our session/notes)"`

## Task
Write the weekly summary in TWO clearly separated blocks so I can send each one on its own. Format both for WhatsApp.

Start with the line: `[Project Name] | [Date]`, then the two blocks below, each divided by a bold label line. If there's no git history above, base it on what we did this week in our sessions.

`*— CLIENT VERSION —*`
- Brief, scannable in 10–20 seconds, no jargon.
- "This week" as a list of 2–3 outcome items.
- Current status, live link if available, next steps.

`*— MANAGER VERSION —*`
- More detail, still no jargon.
- Week's progress, blockers/risks, current status, live link if available, next steps.

WhatsApp formatting rules (use ONLY these — WhatsApp does not render Markdown):
- Bold via single asterisks: `*Status:*`. Never use `#` headers or `**double**` asterisks.
- Bullets as lines starting with `- `.
- Paste links as raw URLs — no `[text](url)` syntax.
- Keep lines short; blank line between sections.

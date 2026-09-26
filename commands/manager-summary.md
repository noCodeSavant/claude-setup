---
description: Daily manager summary (more detail, no jargon, WhatsApp-ready)
allowed-tools: Bash(git log:*), Bash(git status:*), Bash(basename:*), Bash(git rev-parse:*), Bash(date:*)
disable-model-invocation: true
---
## Context
- Project: !`basename "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"`
- Date: !`date +%Y-%m-%d`
- Today's changes: !`git log --since=midnight --oneline 2>/dev/null || echo "(not a git repo — summarize from our session)"`
- Working state: !`git status -s 2>/dev/null || echo "(no repo)"`

## Task
Write a daily summary for my manager, formatted for WhatsApp.

Content rules:
- Start with the line: `[Project Name] | [Date]` using the values above.
- More detailed than a client update, but still no technical jargon.
- Include: current status, what moved today, any blockers/risks, live link if available, and next steps.
- Tight and structured — readable in under a minute.
- If there's no git history above, base the summary on what we did in this session.

WhatsApp formatting rules (use ONLY these — WhatsApp does not render Markdown):
- Bold via single asterisks: `*Status:*`. Never use `#` headers or `**double**` asterisks.
- Bullets as lines starting with `- `.
- Paste links as raw URLs — no `[text](url)` syntax.
- Keep lines short; blank line between sections.

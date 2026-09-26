---
description: Daily client-facing summary (brief, no jargon, WhatsApp-ready)
allowed-tools: Bash(git log:*), Bash(git status:*), Bash(basename:*), Bash(git rev-parse:*), Bash(date:*)
disable-model-invocation: true
---
## Context
- Project: !`basename "$(git rev-parse --show-toplevel 2>/dev/null || pwd)"`
- Date: !`date +%Y-%m-%d`
- Today's changes: !`git log --since=midnight --oneline 2>/dev/null || echo "(not a git repo — summarize from our session)"`
- Working state: !`git status -s 2>/dev/null || echo "(no repo)"`

## Task
Write a client-facing daily summary, formatted for WhatsApp.

Content rules:
- Start with the line: `[Project Name] | [Date]` using the values above.
- Plain language only. Zero technical jargon. No file names, no stack/tool names.
- Scannable in 10–20 seconds.
- "Today" must be a list of 2–3 items (outcomes the client cares about, not implementation).
- Include: current status, today's items, live link if one exists, and next steps.
- If there's no git history above, base the summary on what we did in this session.

WhatsApp formatting rules (use ONLY these — WhatsApp does not render Markdown):
- Bold via single asterisks: `*Status:*`. Never use `#` headers or `**double**` asterisks.
- Bullets as lines starting with `- `.
- Paste links as raw URLs (e.g. https://example.com) — no `[text](url)` syntax.
- Keep each line short; use a blank line between sections so it reads well in a chat bubble.

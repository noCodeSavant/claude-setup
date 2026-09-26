---
description: Production stabilization / readiness review of a codebase (writes a full report)
argument-hint: "[path or area to focus on] (optional — defaults to the whole repo)"
allowed-tools: Bash(git ls-files:*), Bash(ls:*), Bash(cat:*), Bash(rg:*), Bash(find:*)
disable-model-invocation: true
---
## Target
- Focus: `$ARGUMENTS` (empty = the whole repository)

## Task
Run a full production-readiness review using the **production-audit** skill.

- Follow the skill's grounding rules: read the real code, cite `file:line`, verify don't
  speculate, say "none found" for clean areas, and DO NOT modify any code (review only).
- Cover the skill's full taxonomy (security, auth, validation, error handling, frontend
  reliability, database, API, performance, scalability 10→10k, background processing,
  observability, code quality) and use its severity definitions.
- Model growth from 10 → 100 → 1,000 → 10,000 users for the scalability section.

## Output
1. In chat: the Executive Summary, the Production Readiness Score (6 axes, each /10), and the
   Critical + High issues only — kept scannable.
2. Write the complete findings (every area, each issue with issue / why / impact / severity /
   remediation / affected files / implementation rec) plus the remediation roadmap and
   estimated effort to `_audit/production-review.md`.

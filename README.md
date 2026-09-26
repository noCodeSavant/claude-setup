# Claude Code setup

A personal Claude Code configuration, versioned in place at `~/.claude`.

## What's here

- `agents/` — custom subagents: `codebase-auditor` (deep repo audit), `qa-handover` (hostile black-box QA), `seo-auditor`
- `commands/` — slash commands: `/audit-prod`, `/audit-handover`, `/review-ui`, `/redesign-ui`, daily/weekly summary drafts
- `skills/` — curated design & engineering skills (mix of self-authored and public third-party)
- `bin/ccs` — cross-project session picker (below)
- `hooks/context-guard.sh` — Stop hook that captures session learnings into CLAUDE.md before auto-compaction
- `statusline.sh` — status line: `[git-account] project branch* ▮▮▮▯▯ 62% Model`
- `CLAUDE.md`, `settings.json` — reply style, estimate rules, hooks wiring

The `.gitignore` is an allowlist: credentials, history, sessions, and caches in `~/.claude` can never be staged.

## Use it

```sh
git clone https://github.com/noCodeSavant/claude-setup.git ~/.claude
ln -s ~/.claude/bin/ccs ~/.local/bin/ccs   # needs fzf
```

## bin/ccs — session picker

Fuzzy picker over every Claude Code session on the machine plus a `▸ new session` row for each
project under `$CCS_BASE` (default `~/projects`). Needs `fzf`; opens sessions in Windows Terminal
tabs when `wt.exe` is on PATH (WSL), otherwise resumes in place.

| Key / flag | Effect |
|---|---|
| `Enter` | resume in a new tab (`ctrl-w` new window, `ctrl-e` this tab) |
| `Tab` | mark several rows, then `Enter` opens each in its own tab |
| `ctrl-r` / `ccs --restore [hours] [--yes]` | reopen the newest session of every project active in your last working day (skips ones already running) |
| `ccs --list` / `--all` | plain listing / include agent and sdk sessions |

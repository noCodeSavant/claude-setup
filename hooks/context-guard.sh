#!/usr/bin/env bash
# Stop hook: when the context window is nearly full, make Claude capture what the session learned
# into CLAUDE.md (claude-md-management's /revise-claude-md) BEFORE auto-compaction erases it.
# Fires once per session. Tunables: CCS_CTX_THRESHOLD (percent, default 85), CCS_CTX_WINDOW (tokens).
set -u
in=$(cat)
j() { jq -r "$1 // empty" <<<"$in" 2>/dev/null; }
[ "$(j .stop_hook_active)" = "true" ] && exit 0            # we are the reason Claude continued; don't loop
t=$(j .transcript_path); sid=$(j .session_id); cwd=$(j .cwd)
[ -f "$t" ] || exit 0
# only where there is a CLAUDE.md to update (cwd or git root)
root=$(git -C "$cwd" rev-parse --show-toplevel 2>/dev/null || echo "$cwd")
[ -f "$cwd/CLAUDE.md" ] || [ -f "$root/CLAUDE.md" ] || exit 0
mark="$HOME/.cache/ccs/ctx-guard-$sid"; [ -e "$mark" ] && exit 0
thr=${CCS_CTX_THRESHOLD:-85}
win=${CCS_CTX_WINDOW:-}
# last assistant record: its usage = tokens currently in context, its model tells the window size
last=$(tail -c 200000 "$t" | grep '"type":"assistant"' | grep -v '"model":"<synthetic>"' | tail -1)
[ -n "$last" ] || exit 0
used=$(jq -r '.message.usage | ((.input_tokens // 0) + (.cache_read_input_tokens // 0) + (.cache_creation_input_tokens // 0))' <<<"$last" 2>/dev/null)
model=$(jq -r '.message.model // ""' <<<"$last" 2>/dev/null)
if [ -z "$win" ]; then
  case "$model" in
    *fable*|*opus-5*|*sonnet-5*|*haiku-5*) win=1000000 ;;   # Claude 5 family: 1M window
    *) grep -q '\[1m\]' "$HOME/.claude/settings.json" 2>/dev/null && win=1000000 || win=200000 ;;
  esac
fi
[ -n "$used" ] && [ "$used" -gt 0 ] || exit 0
pct=$(( used * 100 / win ))
[ "$pct" -ge "$thr" ] || exit 0
mkdir -p "$(dirname "$mark")"; touch "$mark"
jq -n --arg r "Context window is at ${pct}% (${used} of ${win} tokens); auto-compaction is close. Before anything else, run the /revise-claude-md command (claude-md-management plugin) to capture this session's durable learnings into CLAUDE.md, apply the edits, then stop. Keep the reply short." \
  '{decision:"block", reason:$r}'

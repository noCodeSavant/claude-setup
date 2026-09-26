---
description: Hostile black-box QA handover pass on the running app (invokes the qa-handover agent)
argument-hint: "[base URL of the running app] [optional: focus area]"
allowed-tools: Bash(curl:*), Bash(echo:*), Bash(awk:*)
disable-model-invocation: true
---
## Context
- Target: `$ARGUMENTS`
- App reachable: !`curl -so /dev/null -w "%{http_code}" "$(echo "$ARGUMENTS" | awk '{print $1}')" 2>/dev/null || echo "(no response — is the app running?)"`

## Task
Run a full hostile QA handover pass by delegating to the **qa-handover subagent**.

1. Confirm the app is actually running and reachable at the target URL (and that the
   webapp-testing / Playwright skill is available). If it isn't running, or no URL was given,
   ask me before doing anything — this is a black-box test of the LIVE app, not the code.
2. Hand the target (and any focus area in the arguments) to the qa-handover subagent and let it
   run its full process: discover the app, attack it, and report.
3. When it returns, surface the Blockers and Criticals here, and confirm the full report was
   written to `_qa/qa-report.md`.

Notes: best run AFTER `/audit-prod` and once the app is stabilized enough to run. For an unbiased
pass, this should be a fresh session — not the one that built the app.

---
description: Design + frontend-engineering critique of existing UI (writes a full report)
argument-hint: "[screen/route/component to review] (optional — defaults to the main UI)"
allowed-tools: Bash(ls:*), Bash(cat:*), Bash(rg:*), Bash(find:*)
disable-model-invocation: true
---
## Target
- Review: `$ARGUMENTS` (empty = the primary screens/flows)

## Task
Critique this UI as if it were being evaluated for launch at Linear/Stripe/Vercel/Notion, using
the **design-excellence** skill. Your job is not to be polite — find why it feels average and how
it becomes exceptional. Review BOTH the product design and the frontend implementation.

Follow the skill's grounding rule: look at the rendered UI (read the components, run it, or use a
screenshot) — never critique in the abstract. Be specific; cite the screen/component.

Cover:
- **Product design** — first impression & primary action; visual hierarchy & eye path;
  information architecture & grouping; workflow efficiency (unnecessary clicks, friction,
  decision fatigue, context switching); UX quality (discoverability, learnability, feedback,
  empty/loading/error states); accessibility (keyboard nav, focus states, screen-reader, contrast,
  touch targets, semantic HTML).
- **Frontend engineering** — component architecture & reusability; state ownership/duplication/
  data flow; performance (re-renders, bundle size, network, lazy loading, code splitting);
  responsive (mobile/tablet/desktop/large); design-system consistency (type, color, spacing,
  buttons, inputs, cards, modals); error handling (network/API/empty/loading failures);
  production readiness (scalability, maintainability, extensibility, DX).

## Output
1. In chat: the maturity verdict (Junior / Mid / Senior / Staff-level) and exactly what's blocking
   the next level; the Top 5 design weaknesses and the single most important change.
2. Write the full critique to `_audit/ui-review.md`: per-area findings, the Remove / Simplify /
   Consolidate / Prioritize / Hide lists, refactoring recommendations, the scorecard (each axis
   /10 per the skill's calibration), and the Top 10 highest-impact improvements.

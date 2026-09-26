---
description: Propose a redesign of a product experience (token system + new structure)
argument-hint: "[screen/flow/app to redesign] (optional — defaults to the main experience)"
allowed-tools: Bash(ls:*), Bash(cat:*), Bash(rg:*), Bash(find:*)
disable-model-invocation: true
---
## Target
- Redesign: `$ARGUMENTS` (empty = the primary experience)

## Task
Redesign this experience using the **design-excellence** skill and the principles that make
Linear, Stripe, Notion, Vercel, Figma and GitHub feel exceptional. This is generative — propose a
better design, not just a critique. Do NOT just make it prettier; improve clarity, hierarchy,
focus, workflow efficiency, and information architecture.

Ground it first: look at the current screens and the product's real subject/brand (read the UI,
use a screenshot if available). Then follow the skill's token-system-first method — and check your
plan against the AI-default looks before committing.

Apply: clarity over decoration · strong hierarchy · fewer decisions · deliberate density ·
workflow-first · progressive disclosure · consistency · product thinking.

## Output
1. A **token system** for the redesign: Color (4–6 named hex), Type (2+ roles), Layout concept,
   and the one Signature element — with a line on why each choice fits this product (not a default).
2. The redesign plan: What to Remove / Simplify / Combine / Emphasize / Hide; the new Information
   Hierarchy; the ideal User Flow; the new Screen Structure.
3. Top 10 improvements, expected impact, and "what Linear would do differently."
4. A design-maturity assessment of the current vs. proposed.
Keep the high-level plan in chat; if it's long, write the full redesign spec to
`_design/redesign.md`.

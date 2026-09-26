---
name: design-excellence
description: >
  Principles and method for making product UI exceptional rather than average — used for both
  design/frontend critiques and redesigns. Holds the Linear/Stripe/Notion benchmark thinking,
  the token-system-first method, and the anti-"AI-default" guidance. Use when reviewing or
  redesigning any screen, flow, component, or app for visual quality, clarity, hierarchy, and
  workflow.
---

# Design Excellence

Benchmark against the products that feel exceptional: **Linear, Stripe, Notion, Vercel, Figma,
GitHub, Airbnb.** The goal is never "make it prettier" — it's clarity, hierarchy, focus,
workflow efficiency, and information architecture.

## How to work (read this first)
- Critique/redesign the REAL, RENDERED UI — read the components, run it, or use a screenshot.
  Never critique in the abstract. A picture is worth 1000 tokens; look before judging.
- Be specific and grounded: name the exact screen/component and what's wrong, not generic advice.
- Don't pad. If something is already strong, say so briefly and move on.

## Core principles
Clarity over decoration · strong hierarchy · fewer decisions · deliberate information density ·
workflow-first · progressive disclosure · consistency · product thinking (design the job, not the
screen).

## The method that makes UI distinctive (token-system-first, two passes)
1. **Avoid the AI-default looks.** Current AI design clusters into three tells — (a) warm cream
   bg + high-contrast serif + terracotta accent; (b) near-black bg + a single acid-green/vermilion
   accent; (c) broadsheet hairline rules, zero radius, dense columns. These appear regardless of
   subject. Use them ONLY if the brief explicitly asks; otherwise they signal "templated."
2. **Plan a token system first** (before any code): Color (4–6 named hex values), Type (2+
   typefaces with defined roles — a characterful display used with restraint, a clean body, a
   utility/data face), Layout (a concept, in prose + a quick ASCII wireframe), and a **Signature**
   — the one element this design is remembered by, derived from the subject's real world.
3. **Critique the plan against the generic default** ("would I produce this for any similar
   prompt?"). Revise anything that reads as default; say what changed and why. THEN build.
4. **Spend boldness in one place.** One signature element; everything around it quiet and
   disciplined. Generic comes from spreading effort evenly. Before shipping, remove one accessory.
5. **Ground in the subject** and treat **copy as design material** — name things by what users
   control (active voice: "Save changes," not "Submit"); errors say what happened and how to fix
   it; empty states invite action; consistent vocabulary throughout.
6. **Quality floor, always:** responsive to mobile, visible keyboard focus, reduced-motion
   respected, real loading/empty/error states.

## Stack that raises the floor
Prefer **shadcn/ui + Tailwind + Radix** (accessible, professional defaults Claude knows deeply),
a Tailwind theme derived from the token system (not ad-hoc utilities), lucide-react icons,
framer-motion for deliberate motion, and a considered type pairing (e.g. Geist/Space Grotesk +
Inter). Motion serves the subject; excess motion reads as AI-generated.

## Scoring calibration (when scoring /10)
9–10 staff-level (could ship at Linear) · 7–8 senior (strong, minor gaps) · 5–6 mid (works but
generic/uneven) · 3–4 junior (unclear hierarchy, friction, templated) · 1–2 broken.

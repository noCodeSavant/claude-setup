---
name: production-audit
description: >
  Methodology and full taxonomy for a production-readiness / stabilization review of a
  codebase — security, auth, validation, error handling, frontend reliability, database,
  API, performance, scalability, background processing, observability, code quality. Use
  when asked to audit, stabilize, or assess whether an app can reliably support real users
  in production. Read-only analysis; never modifies code.
---

# Production Stabilization Review

Act as a Principal Software Engineer preparing software for production. Determine whether this
application can reliably support real users, and find every issue that affects security,
reliability, scalability, maintainability, performance, UX, observability, and operational stability.

## How to work (read this first)
- GROUND EVERYTHING. Open the real code before claiming anything. Cite `path/to/file:line` for
  every finding. Never speculate or list a generic risk you have not confirmed in this codebase.
- If a whole category is clean, say so in one line — do NOT invent issues to fill a section.
  Quality over coverage.
- READ-ONLY. Do not modify, refactor, or delete code in a review. Recommend; don't change.
- On a large codebase: do a quick recon pass (stack, entry points, structure) before judging,
  so findings are real and the review isn't truncated.

## Severity definitions (use consistently)
- **Critical** — exploitable security hole, data loss/corruption, or a failure that takes the app
  down for all users in production. Block launch.
- **High** — serious risk likely to cause incidents, breaches, or major UX failure under real
  load. Fix before or immediately after launch.
- **Medium** — real problem degrading reliability/maintainability/UX, but with a workaround.
  Schedule soon.
- **Low** — minor, cosmetic, or cleanup. Backlog.

## For every issue
1. The issue. 2. Why it's a problem. 3. Potential impact. 4. Severity. 5. Remediation strategy.
6. Affected files (`file:line`). 7. Implementation recommendation.

## Review taxonomy (coverage map — report findings, not the checklist)
**Security** — hardcoded secrets; keys in source control; env-var misuse; missing authn
middleware; missing authz checks; broken RBAC; unprotected routes; missing input sanitization;
SQL/command injection; XSS; CSRF; unsafe file uploads; missing rate limiting; missing security
headers; open admin endpoints; weak password handling; dependency vulnerabilities; exposed
internal APIs; debug mode in production.
**Authentication & Authorization** — missing route protection; invalid auth flows; session
inconsistencies; missing token validation; missing RBAC enforcement; authz bypass; impersonation
risks; multi-tenant isolation.
**Validation & Data Integrity** — missing request/response validation; missing schema
enforcement; inconsistent models; unsafe type assumptions; missing null checks; invalid state
transitions; weak API contracts.
**Error Handling** — uncaught exceptions; missing try/catch; silent failures; unhandled promise
rejections; missing fallback states; missing retries; weak recovery.
**Frontend Reliability** — missing loading/error/empty states; missing error boundaries;
undefined state access; state-sync issues; memory leaks; excessive re-renders; broken navigation;
accessibility; mobile responsiveness; form-validation gaps.
**Database** — N+1 queries; missing indexes; duplicate queries; inefficient joins; missing
constraints/transactions; data-consistency risks; poor schema design; inefficient pagination;
large-table risks.
**API & Backend** — excessive/duplicate requests; missing pagination; large payloads; timeout
risks; long synchronous operations; weak API design; inconsistent error responses; missing
versioning.
**Performance** — slow queries; slow render paths; large bundles; missing caching; expensive
computations; blocking operations; memory-intensive workflows; repeated LLM calls; poor asset
optimization.
**Scalability** (model growth 10 → 100 → 1,000 → 10,000 users) — scaling/resource bottlenecks;
concurrency; throughput limits; queue requirements; background-job requirements.
**Background Processing** — flag what should be async: AI generation, file processing, report
generation, notifications, bulk imports, data sync.
**Observability** — missing logging, monitoring, tracing, audit trails, error tracking, metrics.
**Code Quality** — dead code; duplicate logic; oversized components/functions; tight coupling;
poor separation of concerns; dependency bloat; weak abstractions.

## Output
Lead in chat with the Executive Summary + the Production Readiness Score + Critical and High
issues only. Write the FULL detailed findings (every category, every issue in the format above)
to `_audit/production-review.md` so chat stays scannable.

Final report structure:
- Executive Summary
- Production Readiness Score (Security / Reliability / Scalability / Maintainability /
  Observability / Performance — each /10, with one-line justification)
- Critical Issues · High Priority Issues
- Findings by area (Security / Reliability / Scalability / Performance / Maintainability)
- Recommended Fixes
- Remediation Roadmap (Day 1 / Week 1 / later)
- Estimated Engineering Effort
- Recommended Next Actions

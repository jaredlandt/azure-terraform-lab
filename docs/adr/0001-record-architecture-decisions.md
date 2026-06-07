# 0001 — Record architecture decisions

**Status:** Accepted
**Date:** 2026-06-07

## Context

We need to track significant architectural decisions for azure-terraform-lab so future contributors (including future-us) can understand the *why* behind structural choices — not just the *what*.

Without this, decisions get re-litigated every time someone new touches the code, or worse, get silently undone because the original reasoning was forgotten.

## Decision

Use Architecture Decision Records (ADRs) in the format described by [Michael Nygard](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).

ADRs live in `docs/adr/`, numbered monotonically, with explicit status values (Proposed / Accepted / Deprecated / Superseded). See [`README.md`](README.md) for the full convention.

## Consequences

**Good:**

- Future contributors see the reasoning behind architectural choices
- Decisions are auditable — we know *when* and *why* something was decided
- Reversing a decision requires writing a superseding ADR, which forces explicit thought rather than silent drift

**Bad:**

- One more thing to write when making a decision
- ADRs can drift from reality if not maintained — needs review during major refactors
- Risk of over-applying — small reversible decisions don't need ADRs and shouldn't get them

## Alternatives considered

- **No formal record** — relies on git blame and commit messages. Works for small projects, loses signal as the project grows or when the original author is gone.
- **Wiki / Confluence** — separates the record from the code. Tends to rot when out of sight, and breaks when the wiki tool changes.
- **Code comments** — fine for local decisions, doesn't scale to architectural ones that span multiple files or systems.
- **Verbal tradition** — works for a team of one until it doesn't.

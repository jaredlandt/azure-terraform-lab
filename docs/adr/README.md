# Architecture Decision Records (ADRs)

> Lightweight records of significant architectural decisions, why they were made, and the alternatives considered. Pattern: [Michael Nygard's ADR format](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).

## When to write an ADR

File an ADR when you make a decision that:

- Constrains how future work is built
- Is non-obvious or has real tradeoffs
- You don't want future-you (or the next contributor) to second-guess without context

Examples: choice of database, choice of framework, deployment model, auth strategy, big "we won't support X" decisions.

If the decision is reversible and low-stakes, skip the ADR. ADRs are for decisions that *bind*.

## File naming

```
NNNN-short-decision-name.md
```

Number monotonically: `0001`, `0002`, etc. Don't reuse numbers even when a decision is reversed — write a new ADR that supersedes the old one.

## Status values

- **Proposed** — discussed, not yet acted on
- **Accepted** — in effect
- **Deprecated** — old but still in use; new work shouldn't follow it
- **Superseded by [link]** — replaced by a newer ADR

## ADR structure

Each ADR contains:

1. **Context** — what's the situation that requires a decision?
2. **Decision** — what was decided?
3. **Consequences** — what does this make easier or harder, now and later?
4. **Alternatives considered** — what else was on the table, and why was each rejected?

See [`0001-record-architecture-decisions.md`](0001-record-architecture-decisions.md) for an example.

## Index

- [0001 — Record architecture decisions](0001-record-architecture-decisions.md)

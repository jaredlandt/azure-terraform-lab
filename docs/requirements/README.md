# Requirements

> Problem statements, user stories, and acceptance criteria (SOP § 4.1 — Discovery output).

## What lives here

Each significant requirement gets its own file. The initial one (`0001-initial-problem.md`) is written by `/scaffold-new`. After that, file new requirements as you discover them.

## File naming

```
NNNN-short-problem-name.md
```

Number monotonically: `0001`, `0002`, etc.

## What a requirement file contains

At minimum:

- **Problem** — what is being solved
- **Who's affected** — who feels the pain
- **Success criteria** — concrete, testable definition of "done"
- **Known risks** — constraints, gotchas, dependencies

See [`0001-initial-problem.md`](0001-initial-problem.md) for the template structure.

## Issue templates vs requirement files

| | Use issue template | Use requirement file |
|---|---|---|
| Quick feature request | ✓ | |
| Bug report | ✓ | |
| Multi-step initiative needing real thought | | ✓ |
| Long-lived problem space that spawns many tickets | | ✓ |

For lightweight feature requests, use [`.github/ISSUE_TEMPLATE/feature.md`](../../.github/ISSUE_TEMPLATE/feature.md). Promote to a requirements file when scope justifies more thought.

## Status lifecycle

- **Draft** — captured, not fully thought through
- **Active** — accepted; work in flight
- **Met** — success criteria satisfied; closed out
- **Abandoned** — decided not to pursue; keep the file as a record of *why*

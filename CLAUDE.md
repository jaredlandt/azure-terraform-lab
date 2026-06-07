# azure-terraform-lab

> A learning sandbox for provisioning and tearing down Azure resources with Terraform, end-to-end.

## What this is

[Replace: 2-4 sentence description of the project, its goals, and its current state.]

## How to run

```bash
# Install
terraform init

# Run
terraform plan && terraform apply

# Test
terraform validate && terraform plan
```

## Conventions

### Working style
- **Structure over prose.** Headers, bullets, short lines. Front-load the important.
- **One next step at a time.** Don't hand a 10-step plan and self-sequence — confirm each chunk.
- **Restate context** when referencing decisions from earlier in the session.

### Code style
- Follow existing patterns in this repo before introducing new ones.
- No comments unless the WHY is non-obvious. Identifiers should explain WHAT.
- Don't add error handling, fallbacks, or validation for cases that can't happen.
- Trust internal code and framework guarantees. Validate at system boundaries only.

### Testing
- Run the full test suite after changes. Report counts and failures.
- TypeScript: project's test command. Python: `pytest`.

## SDLC discipline (sdlc-core)

This repo uses the `sdlc-core` plugin for lifecycle gating:

- **Secret scan + file protection** — block writes containing credentials or to sensitive paths.
- **Type-check on edit** — advisory; surfaces errors, doesn't block.
- **Review-freshness gate** — `git push` is blocked until `/review` has run on the current HEAD. Run `/review` to update `.last-review`.
- **Ship** — use `/ship` to stage, commit, push, and open a PR.

To loosen or tighten any gate per-repo, edit `.claude/settings.json` → `enabledPlugins` (set the plugin entry to `false` to disable everything from it).

## Project-specific notes

[Replace: anything Claude needs to know about this codebase that isn't obvious from reading it. Stack quirks, deployment targets, weird constraints. Keep this section short — if it's getting long, the code probably needs the docs more than this file does.]

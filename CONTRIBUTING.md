# Contributing to azure-terraform-lab

This repo follows the **SDLC Standard Operating Procedure**. Branch, commit, review, and release conventions all live here.

## Branch naming (§ 4.3)

```
feature/short-description    new functionality
bugfix/short-description     non-emergency bug fix
hotfix/short-description     emergency production fix
docs/short-description       documentation-only change
```

Examples:
- `feature/csv-export`
- `bugfix/null-token-on-refresh`
- `hotfix/auth-loop-on-expired-session`

## Commit messages (§ 4.3)

Format:

```
Type: Brief description
```

Examples:
- `Add CSV export logic`
- `Fix Graph connection error handling`
- `Update README usage examples`

Keep the subject line under 72 characters. If the change needs more context, add a blank line and a longer description below.

## Pull requests (§ 4.4)

Every PR uses the template in [`.github/pull_request_template.md`](.github/pull_request_template.md). The reviewer checks for:

- Correctness
- Readability
- Security concerns
- Error handling
- Logging
- Test coverage
- Documentation updates
- Unnecessary complexity
- Hardcoded secrets or environment-specific values

## Definition of Done (§ 6)

A change is done when:

- [ ] Requirement is satisfied
- [ ] Acceptance criteria are met
- [ ] Code is reviewed and approved
- [ ] Tests pass
- [ ] Documentation is updated
- [ ] Change is deployed or ready for deployment
- [ ] Monitoring confirms expected behavior
- [ ] Follow-up work is documented

## Emergency changes (§ 7)

Emergency changes may bypass parts of the normal process **only** when immediate action is required to restore service, prevent security impact, or reduce business risk.

After the emergency change is complete, file a postmortem in [`docs/postmortems/`](docs/postmortems/README.md) covering:

- [ ] What happened
- [ ] What was changed
- [ ] Confirm the fix worked
- [ ] Risks introduced by the change
- [ ] Follow-up tickets
- [ ] Missing tests or docs that allowed the issue

**No cowboy hero bullshit.** Emergency changes are sometimes necessary, but they still need a paper trail.

## Lifecycle phases at a glance

```
Discovery → Planning → Development → Code Review → Testing
→ Build/Package → Deployment → Monitoring → Iteration
```

Each phase produces artifacts in `docs/` or `.github/`. The loop feeds back into the next cycle.

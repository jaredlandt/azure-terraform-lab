# Postmortems

> Incident retrospectives — what broke, why, what we changed, what we learned (SOP § 5).

## When to write a postmortem

- Any production outage or user-visible incident
- Any § 7 emergency change (required follow-up per the SOP)
- Any "we got away with that one" near-miss worth documenting
- Major bug that took significant time to diagnose

## File naming

```
YYYY-MM-DD-short-incident-name.md
```

Use the date the incident *occurred*, not when the postmortem was written.

## What a postmortem contains

- **What happened** — chronological summary (start, detection, mitigation, resolution)
- **Impact** — who was affected, duration, severity
- **Root cause** — five-whys; underlying technical or process cause
- **What was changed** — the actual fix(es), with PR links
- **Risks introduced** — emergency changes often skip steps; name what was skipped
- **Follow-up work** — missing tests, alerts, doc gaps, process gaps
- **Lessons** — what would have caught this earlier? What prevents it next time?

## Tone

**Blameless.** Focus on systems and process, not individuals. People do their best given the information available to them — postmortems are about exposing the gaps in that information, not assigning fault.

If a name appears in a postmortem, it's because they were a *witness* to the failure, not because they *caused* it. The system caused it. Their actions revealed it.

## Two-track flow

For active incidents, file the quick-capture form in [`.github/ISSUE_TEMPLATE/postmortem.md`](../../.github/ISSUE_TEMPLATE/postmortem.md) first — captures facts while they're fresh and adrenaline is high. Once stable, write the considered version here.

Quick capture beats no capture. Don't let "I'll write the full one later" mean "I'll forget and write nothing."

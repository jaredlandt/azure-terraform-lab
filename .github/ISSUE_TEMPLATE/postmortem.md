---
name: Postmortem
about: Document an incident, emergency change, or unexpected failure. Required after any § 7 emergency change.
title: 'Postmortem: '
labels: ['postmortem']
---

<!--
This template is the QUICK-FILE form. After triage, the full written-up
postmortem belongs in docs/postmortems/<date>-<slug>.md.

Goal: capture facts while they're fresh. Blameless tone. Focus on systems
and process, not individuals.
-->

## What happened

<!-- Chronological summary. When did it start? When was it detected? When was it resolved? -->



## Impact

<!-- Who was affected, and how badly? Duration, scope, severity. -->



## Root cause

<!-- The underlying technical or process cause. Five-whys this if needed. -->



## What was changed

<!-- The actual fix(es) applied. Link the PR(s). -->

- PR:

## Confirm the fix worked

- [ ] Verified in target environment
- [ ] Monitoring shows expected behavior
- [ ] No new related errors observed

## Risks introduced by the change

<!-- Emergency changes often skip steps. What did this one skip, and what risk does that carry forward? -->



## Follow-up work

<!-- Tickets to file: missing tests, missing alerts, doc gaps, process gaps. -->

- [ ]
- [ ]

## Lessons

<!-- What would have caught this earlier? What process change would prevent it next time? -->



---

*This was filed using the postmortem issue template. Once triaged, copy the written-up version to `docs/postmortems/<date>-<slug>.md` and close this issue with a link.*

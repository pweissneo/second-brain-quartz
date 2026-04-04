---
created: 2026-04-03
updated: 2026-04-03
confidence: medium
type: frontier-exploration
author-type: ai-assisted
lifecycle: draft
gap-severity: useful
tags:
  - verification
  - frontier-exploration
  - edge-case
---

# Frontier Exploration - Verification Impractical Knowledge

## The Problem

The Seed provides verification mode rules (empirical, source, social, self-consistency) but assumes verification is possible. What about knowledge where verification methods are impractical, unavailable, or impossible?

**Examples of verification-impractical knowledge:**

1. **Historical events with destroyed records** - Primary sources lost to war, fire, or censorship
2. **Personal experiences of deceased people** - No longer verifiable by the individual
3. **Proprietary or classified information** - Sources won't share evidence
4. **Knowledge that would require destruction to verify** - "Does this burn at 400°F?" requires destroying the sample
5. **Time-delayed verification** - Knowledge that can only be verified in the future (predictions, long-horizon outcomes)
6. **Extremely rare events** - Can't reproduce, only observed once
7. **Knowledge dependent on specific individuals** - Verification requires a specific person who's unavailable

## Current Seed Gaps

The Seed's verification rules don't explicitly address:
1. What to do when NO verification method is available
2. How to categorize unverifiable knowledge
3. When to exclude knowledge because verification is impossible
4. How to communicate verification limitations to users

## Proposed Approach

### Tier 0: Verification Impractical

When verification is genuinely impractical:
- Mark with `verification-approach: impractical`
- Add `impractical-reason:` (destroyed-sources|proprietary|time-delayed|rare-events|deceased-source)
- Set `confidence: low` or `confidence: unknown`
- Document what WOULD verify it if constraints were removed

### Usage Guidelines

- Don't exclude impractical knowledge automatically — some knowledge is valuable even with unknown validity
- Distinguish "not yet verified" from "practically unverifiable"
- Make verification impracticality explicit to users
- Consider whether the knowledge is worth storing given verification limitations

## Questions for Seed

- Should the Seed include a rule for handling verification-impractical knowledge?
- What's the minimum confidence threshold for including unverifiable knowledge?
- Should impractical knowledge be segmented (separate vault/folder)?

## Related Notes

- [[Verification Workflow]]
- [[Seed Gap - Verification Method Unavailability]]
- [[Seed Gap - Verification Timeline Management]]
- [[Confidence Markers]]
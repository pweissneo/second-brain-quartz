---
created: 2026-04-03
updated: 2026-04-03
confidence: medium
type: seed-gap
author-type: ai-assisted
lifecycle: identified
gap-severity: useful
tags:
  - verification
  - seed-gap
  - edge-case
---

# Seed Gap - Verification Impractical Knowledge Handling

## Gap Identification

**Problem:** The Seed provides verification approaches (empirical, source, social, self-consistency) but assumes at least one approach is available. There's no guidance for knowledge where verification is practically impossible.

**Examples:**
- Historical events with destroyed/lost records
- Personal experiences of deceased individuals
- Proprietary/classified information
- Knowledge requiring destruction to verify
- Time-delayed verification (future outcomes only)
- Extremely rare events (cannot reproduce)

## Proposed Rule

**Rule:** For knowledge where verification is practically impossible, mark with `verification-approach: impractical` and document the reason.
**Why:** Including valuable but unverifiable knowledge is preferable to excluding it, BUT users must know the verification status. Without explicit tagging, unverifiable knowledge appears equivalent to verified knowledge.
**Test:** Can you identify knowledge where verification is impractical? Is it tagged with verification-approach: impractical? Is the reason documented?

**Implementation:**
```yaml
verification-approach: impractical  # vs empirical|source|social|self-consistency
impractical-reason: destroyed-sources|proprietary|time-delayed|rare-events|deceased-source|impossible-test
confidence: low  # or unknown - do not inflate confidence for unverifiable knowledge
would-verify-if: "Description of what would enable verification"
```

**Edge cases:**
- "Not yet verified" ≠ "practically unverifiable" — don't conflate these
- Consider segmenting verification-impractical knowledge in separate note structure
- Users should be able to filter for verification status

## Impact Assessment

- **Severity:** Useful (not blocking, but improves vault quality)
- **Frequency:** Uncommon but affects multiple domains
- **Effort:** Low (add frontmatter field + document approach)

## Related Notes

- [[Frontier Exploration - Verification Impractical Knowledge]]
- [[Seed Gap - Verification Method Unavailability]]
- [[Verification Workflow]]
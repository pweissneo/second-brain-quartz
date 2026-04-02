---
tags: [frontier-exploration, verification, uncertainty, self-reference]
created: 2026-04-02
confidence: emerging
lifecycle: seed-extension
last-reviewed: 2026-04-02
author-type: ai-assisted
---

# Frontier Exploration - Verification Method Unavailability

## The Gap

The Seed covers:
- **Unverifiable knowledge** — knowledge that cannot be verified with current resources
- **Service dependencies** — knowledge that depends on external APIs/services
- **Temporal knowledge** — knowledge that expires over time
- **Single-point dependency knowledge** — knowledge fragile to a single new discovery

But it does NOT clearly cover:
- **Verification method unavailability** — when the METHOD to verify knowledge is unavailable, not just the source or service

## The Problem

Different from:

| Case | What's Unavailable | Seed Coverage |
|------|---------------------|---------------|
| Unverifiable knowledge | No verification method exists | Covered |
| Service dependency | External API/service is down | Covered |
| Source unavailable | Citation link is dead | Covered |
| Verification method unavailable | The tool/process to test is inaccessible | NOT CLEARLY COVERED |

When a knowledge worker cannot verify a note because:
- They lack the required equipment
- The environment changed (moved, no longer has access)
- The certification/credentials expired
- The verification process requires a specific physical location
- The tool is broken and cannot be replaced

This is different from the knowledge being unverifiable — the method EXISTS but is CURRENTLY UNAVAILABLE.

## Examples

1. **Equipment-dependent verification**: "To verify this wood finish is dry, wait 24 hours" — verified by touch test, but verifier no longer has access to the piece
2. **Environment-dependent verification**: "Check the calibration using the lab's spectrometer" — lab access revoked
3. **Credential-dependent verification**: "Verify by checking FAA database" — certification expired
4. **Time-dependent verification**: "Check for blooming at dawn" — missed the window
5. **Consumption-dependent verification**: "Taste the sauce at stage 3" — already consumed the stage 3 sample

## Why This Matters

Knowledgebases should track:
1. What verification METHOD is required (not just verification status)
2. Whether that method is CURRENTLY AVAILABLE to the knowledge worker
3. What ALTERNATIVE methods exist if primary is unavailable
4. The EXPECTED IMPACT of unavailability on knowledge confidence

## The Challenge

Current Seed rules assume verification capability:
- "Drill-verify" implies you have a drill
- "Taste-test" implies you can taste
- "Check the source" implies access to the source

When verification is impossible but not because the knowledge is unverifiable — it becomes a different category of knowledge fragility.

## Proposed Seed Enhancement

```yaml
verification-methods:
  - method: "Drill test with 3/4" bit
    available: true  # Current availability status
    last-verified: 2026-03-15
    alternatives: ["Screw hole gauge", "dowel test"]
  - method: "Professional tasting"
    available: false
    unavailable-since: 2026-03-20
    reason: "Certification expired"
    alternatives: ["Self-palate development", "community feedback"]
```

## Test Cases

1. Pick 10 notes with verification requirements. Can you determine if the verification method is currently available?
2. For notes where verification method is unavailable — is there an alternative method documented?
3. Can you distinguish "unverifiable" from "currently unavailable verification method"?

## Related Notes

- [[Frontier Exploration - Verification Hierarchy]]
- [[Frontier Exploration - Verification Mode Conflict Resolution]]
- [[Frontier Exploration - Single-Point Dependency Knowledge]]
- [[Confidence Markers]]
- [[Frontier Exploration - API and External Service Dependencies]]
- [[Seed Gap - Knowledge Prioritization Decision Framework]]

## Proposed Seed Rule

**Rule (NEW - 2026-04-02):** Track verification method availability separately from verification status — distinguish between knowledge that cannot be verified (method doesn't exist) vs. knowledge where the verification method exists but is currently unavailable (equipment missing, access revoked, credentials expired, window missed).

**Why:** The Seed covers unverifiable knowledge and service dependencies, but not verification method unavailability. When knowledge is accurate but the verifier lacks access to the verification method, treating it as "unverified" creates different maintenance actions than "unverifiable." The former can be verified later when access is restored; the latter may never be verifiable.

**Test:** Can you categorize each unverified note as: (1) unverifiable (method doesn't exist), (2) verification method unavailable (method exists but currently inaccessible), or (3) verification pending (method available, just not yet done)? For category 2, is there an alternative verification method documented?

**Implementation:**
```yaml
verification-status: unverified|verified|unverifiable|method-unavailable
verification-method-unavailable-since: 2026-04-02
verification-method-unavailable-reason: equipment-missing|access-revoked|credentials-expired|window-missed
verification-method-alternatives: ["alternative-method-1", "alternative-method-2"]
```

## Questions to Explore

1. Should verification method availability be tracked separately from verification status?
2. How do you distinguish "I cannot verify" (unavailable) from "It cannot be verified" (unverifiable)?
3. Should there be different lifecycle rules for knowledge with unavailable verification methods?
4. How do you communicate "could verify if I had access" vs "cannot ever verify"?

## Related Seed Sections

- Section 4 (Verification): Covers verification status but not method availability
- Section 6 (Knowledge Types): Equipment-dependent, experiential knowledge
- Section 9 (Correction Workflow): Handles outdated knowledge but not temporarily unverifiable

---

*This is a frontier note — captures an emerging insight about verification method unavailability that differs from current Seed categories. Proposed rule added 2026-04-02.*
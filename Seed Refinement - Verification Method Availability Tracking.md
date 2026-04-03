---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-refinement
confidence: high
author-type: ai-assisted
knowledge-type: principle
verification-status: verified
gap-resolution: resolved
tags:
  - seed-refinement
  - verification
  - status-values
  - method-availability
---

# Seed Refinement: Verification Method Availability Tracking

> **Status:** RESOLVED → Integrated into Seed (2026-04-03)

## The Gap

The Seed currently covers:
- **Unverified** — knowledge not yet checked but checkable
- **Unverifiable** — knowledge that cannot be verified by any known method

But it does NOT cover:
- **Verification method unavailable** — the method EXISTS but is currently inaccessible to the verifier

This creates a gap where knowledge that IS verifiable but not currently verifiable (equipment missing, access revoked, credentials expired, verification window missed) gets incorrectly labeled as "unverified" or treated as "unverifiable."

## Why This Matters

The distinction matters for different maintenance actions:

| Status | What It Means | Maintenance Action |
|--------|---------------|-------------------|
| Unverified | Not yet checked | Schedule verification |
| Verification method unavailable | Checkable but currently inaccessible | Track alternative methods or wait for access |
| Unverifiable | Cannot ever be verified | Mark with verification-pathway: none |

Conflating these creates:
- Wasted effort trying to verify the unverifiable
- Lost information about when verification might become possible
- Incorrect confidence assignment

## Proposed Seed Rule

**Rule (PROPOSED - 2026-04-03):** Track verification method availability separately from verification status — distinguish between knowledge that cannot be verified (method doesn't exist) vs. knowledge where the verification method exists but is currently unavailable (equipment missing, access revoked, credentials expired, verification window missed).

**Why:** The Seed covers unverifiable knowledge but not verification method unavailability. When knowledge is accurate but the verifier lacks access to the verification method, treating it as "unverified" creates different maintenance actions than "unverifiable." The former can be verified later when access is restored; the latter may never be verifiable. This distinction enables appropriate tracking and future verification planning.

**Test:** Can you categorize each unverified note as: (1) unverifiable (method doesn't exist), (2) verification method unavailable (method exists but currently inaccessible), or (3) verification pending (method available, just not yet done)? For category 2, is there an alternative verification method documented?

**Implementation:**
```yaml
verification-status: unverified|verified|unverifiable|method-unavailable
verification-method-unavailable-since: 2026-04-03
verification-method-unavailable-reason: equipment-missing|access-revoked|credentials-expired|window-missed
verification-method-alternatives: ["alternative-method-1", "alternative-method-2"]
```

**Verification workflow update:**
1. Assess: Can this be verified? Through what method?
2. Check availability: Is the method currently accessible?
3. Tag: Set appropriate verification-status and availability
4. Execute: Perform verification when method becomes available
5. Update: Change status based on result

## Relationship to Existing Seed Rules

- Complements verification-status tracking (lines 340+)
- Works with tool-dependent verification (line 465+)
- Distinguishes from unverifiable knowledge (line 471+)
- Enables better verification backlog management

## Edge Cases

1. **Partial availability** — Some verification methods available, others not. Tag with `verification-methods:` array showing each method's status.

2. **Time-bounded unavailability** — Access might return at known time. Add `verification-method-available-when: 2026-05-01` (e.g., equipment returns from repair).

3. **Alternative methods exist** — When primary method unavailable but alternatives exist. Document alternatives in frontmatter.

## Test for Vault Evaluation

- [ ] Can you identify notes where verification method is unavailable?
- [ ] Do these have appropriate status and reason documented?
- [ ] Are alternative methods tracked where they exist?
- [ ] Can you distinguish "cannot verify" from "cannot yet verify"?

## Related Notes

- [[Verification Workflow]] — current verification guidance
- [[Frontier Exploration - Verification Method Unavailability]] — frontier exploration that identified this gap
- [[AI-Assisted Knowledge Management Seed]] — where this rule should be integrated

---

**Analysis:** This refinement addresses a gap where the Seed conflates "unverified" (not yet checked) with "verification method unavailable" (method exists but inaccessible). The proposed rule adds a distinct status value, enabling better verification backlog management and appropriate confidence assignment.

**Seed integration target:** Section on verification workflows, around line 340-360, as a complement to the existing verification-status and verification-mode rules.
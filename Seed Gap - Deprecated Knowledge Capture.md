---
author-type: ai-assisted
gap-status: resolved
last-reviewed: 2026-04-02
lifecycle: exploratory
confidence: medium
gap-priority: medium
gap-phase: discovery
gap-source: frontier-exploration
analyzed: 2026-04-01
analysis-conclusion: "Largely addressed. Seed already covers handling of 'outdated' knowledge (line 652) with deprecated: true, superseded-by:, deprecation-rationale:. The gap note overlaps with existing Seed rules. Recommend deprecation - the distinction between 'outdated' (was correct, now uncertain) and 'deprecated' (was valid, intentionally superseded) is semantic - both use same metadata."
---

# Seed Gap - Deprecated Knowledge Capture

## The Problem

The Seed handles verification of knowledge (how to confirm something is true) and staleness detection (when knowledge has expired), but it doesn't address **knowledge that is known to be incorrect or superseded but still has value**.

This is distinct from:
- **Outdated knowledge** — was true, now uncertain (handled by temporal validity)
- **Disproven knowledge** — was believed true, now known false (handled by confidence markers)
- **Hypothetical knowledge** — might be true, not yet verified

**Deprecated knowledge** is knowledge that was valid but has been **intentionally superseded** — a better approach exists, the domain has evolved, or the method has been replaced. It's "wrong" in the present tense but historically significant.

## Why This Matters

In mature knowledge bases:
- Previous approaches inform current thinking (don't repeat mistakes)
- Understanding evolution of a field requires seeing superseded methods
- "Why we stopped using X" is as valuable as "how to use Y"
- Transition knowledge (how to migrate from deprecated to current) is critical

Without explicit handling, agents may:
1. Delete superseded knowledge (losing historical context)
2. Keep it without flagging (confusing users about current best practices)
3. Merge deprecated and current (creating contradiction)
4. Fail to capture migration/transitional knowledge

## Where the Gap Manifests

**Example scenarios:**
- A programming language version that was deprecated for a newer version
- A medical treatment that was superseded by better options
- A design pattern that was replaced by a better pattern
- A tool/vendor that was discontinued in favor of alternatives

**Current Seed has no rule for:**
- When to capture deprecated knowledge vs. when to delete
- How to distinguish "abandoned but worth keeping" from "just wrong"
- What metadata to use for deprecation status
- How to capture the transition path (deprecated → current)
- When deprecation becomes historical curiosity vs. actively harmful

## Proposed Rule (Draft)

**Rule:** Capture deprecated knowledge when it represents a significant approach that was intentionally superseded, has instructional value for understanding evolution, or documents migration paths.

**Why:** Deprecated knowledge often represents real investment in solutions that proved incomplete. Recording why approaches were abandoned and how to migrate provides context that pure "current best practice" knowledge lacks.

**Test:** (1) Is there a current approach that replaced this? (2) Did practitioners genuinely use this method? (3) Does understanding why it was deprecated provide value? If yes to 2-3, capture with deprecation metadata; if yes to 1, add migration path.

**Implementation:**
- Use `deprecated: true` frontmatter
- Add `superseded-by:` link to current approach
- Include `deprecation-rationale:` (why it was abandoned)
- Add `deprecated-date:` when known
- Capture migration steps if non-trivial

**Edge cases:**
- If deprecated approach is actively harmful (e.g., dangerous medical treatment), note harm and redirect to current — don't provide "how-to" for superseded method
- If deprecated method is merely suboptimal and no one would reasonably use it, delete rather than preserve
- If deprecation is due to domain evolution (old terminology, renamed concepts), preserve as historical reference with `historical: true`

## Related Notes

- [[Seed Gap - Knowledge with Inherent Expiration Windows]] (related but different — expiration is automatic, deprecation is intentional)
- [[Frontier Exploration - Knowledge That Requires Active Practice to Validate]] (related — deprecated knowledge often requires practice to understand why it failed)
- [[Seed Refinement - Temporal Validity Bounds Rule]] (temporal aspect)

## Gap Status

This is a **frontier exploration** — identifying a potential gap in the Seed's coverage. The rule above is a draft proposal that needs:
1. Stress testing across multiple domains
2. Refinement of boundary conditions (what counts as "significant" vs. "trivial")
3. Integration with existing verification and staleness rules
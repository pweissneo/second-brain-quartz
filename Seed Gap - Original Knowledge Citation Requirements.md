---
last-reviewed: 2026-04-01
lifecycle: deprecated
confidence: emerging
author-type: ai-assisted
gap-status: deprecated
gap-priority: medium
gap-severity: useful
gap-source: structural-health
discovered: 2026-03-31
resolved: 2026-03-31
resolved-by: Seed updated with source-type edge case
deprecated: true
replaced-by: Seed Rule Addition - Knowledge Without External Sources
replaces: Frontier Exploration - Knowledge Without Sources
tags:
  - seed-gap
  - source-handling
  - gap-identified
  - deprecated
---

# Seed Gap: Original Knowledge Citation Requirements

## Gap Description

The Seed's source citation rule assumes external sources exist. It does not address:
- Original insights and synthesis (no external source)
- Personal experiments (methodology from you, not a source)
- Personal experience knowledge (implicit, not documented)
- Intuitive knowledge (hard to source but valuable)

The [[Frontier Exploration - Knowledge Without Sources]] note identifies this gap but is not yet reflected in the Seed.

## Evidence

- Note "Frontier Exploration - Knowledge Without Sources" has `confidence: emerging` but is not referenced in Seed
- No Seed rule distinguishes source types (external vs original vs empirical vs experiential)
- No frontmatter guidance for source-type classification

## Proposed Rule

**Rule:** Distinguish source types and apply appropriate citation requirements.

**Why:** An AI agent following the current Seed might reject or undervalue original knowledge (synthesized insights, personal experiments, experiential learning). The Seed's "cite sources" rule was designed for external knowledge but creates false barriers for original knowledge that has equal or greater value.

**Test:** For notes with no external sources: (1) Can you classify source-type (original|empirical|experiential)? (2) Does the note mark originality appropriately? (3) Is confidence assigned based on evidence type, not just source presence?

## Implementation

### Frontmatter for source-type classification

```yaml
source-type: external | original | empirical | experiential
```

| Type | Description | Citation Requirement |
|------|-------------|---------------------|
| external | Books, articles, web | Required |
| original | Your synthesis | Not required, mark as original |
| empirical | Personal experiments | Document methodology |
| experiential | Personal experience | Mark as experiential |

### Additional fields

```yaml
# For original:
originality: synthesis | hypothesis | invention

# For empirical:
verification-status: pending-validation
methodology: "brief description"

# For experiential:
experience-context: "when/how learned"
```

## Related Notes

- [[Frontier Exploration - Knowledge Without Sources]]
- [[Confidence Markers]]
- [[Handling Contradictory Sources]]

## Resolution Path

1. Add source-type frontmatter guidance to Seed ✅ DONE (2026-03-31)
2. Update "Cite sources" rule with edge case for original knowledge ✅ DONE
3. Mark this gap as "proposed" when Seed updated ✅ DONE

## Update Log

- **2026-03-31:** Seed updated with source-type edge case. Gap resolved.
---
last-reviewed: 2026-03-30
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-rule
  - source-missing
  - original-knowledge
  - frontier-gap
---

# Seed Rule Addition - Knowledge Without External Sources

> Original insights, untested hypotheses, and novel syntheses are valid vault entries even without external citations.
> Related: [[Frontier Exploration - Knowledge Without Sources]], [[AI-Assisted Knowledge Management Seed]]

## The Rule

**Rule:** For knowledge without external sources (original synthesis, personal experiments, untested hypotheses, novel ideas), use `source-origin: original` frontmatter and apply appropriate confidence calibration.
**Why:** The Seed's source-citation expectations may cause AI agents to undervalue or reject genuinely original knowledge. Original insights (your synthesis of multiple experiences, novel hypotheses, creative leaps) are often the highest-value vault content — they compound uniquely and cannot be found via web search. Without explicit handling, source-less knowledge gets marked low-confidence or excluded entirely.
**Test:** For notes without `source:` or `source-url:` frontmatter: (1) Is this marked with appropriate `source-origin:` (original|synthesis|empirical|experiential|intuition)? (2) Does confidence match the knowledge type (original synthesis = medium, untested hypothesis = emerging, personal experiment = emerging/confirmed)? (3) Is the note's uniqueness explicitly stated (what makes this YOUR insight, not restatable from public sources)?

**Implementation:** Use frontmatter:
```yaml
source-origin: original  # vs. external (has cited source)
source-origin-type: synthesis|hypothesis|invention|intuition|experiential|empirical
# Synthesis: Combined 2+ experiences/ideas into new insight
# Hypothesis: Proposed explanation without testing
# Invention: Novel creation or method
# Intuition: Pattern recognition from deep experience
# Experiential: From personal practice (no external validation)
# Empirical: From your own experiments (documented methodology)
originality-contribution: "What this adds beyond existing public knowledge"
# For synthesis-type:
synthesis-basis: ["experience 1", "experience 2", "observation"]
reasoning-chain: "Brief explanation of how insight emerged"
confidence: emerging  # Original: emerging or higher; hypothesis: speculative-emerging
# For hypothesis-type:
hypothesis-status: untested|planned-test|failed|confirmed
test-protocol: "How to test this hypothesis"
# For empirical-type:
experiment-context: "Your specific conditions/methodology"
results: "What you observed"
verification-status: pending-validation  # vs. verified or failed
```

**Confidence calibration by source-origin:**
| Type | Default Confidence | Rationale |
|------|-------------------|-----------|
| synthesis (from multiple experiences) | medium | Pattern recognition, needs confirmation |
| hypothesis (proposed but untested) | speculative/emerging | Unvalidated, may be wrong |
| invention (novel creation) | emerging (rising with use) | No comparison point yet |
| intuition (from extensive experience) | medium-high (if expert-level) | Expert pattern recognition |
| experiential (personal practice) | emerging/verified | Depends on iteration count |
| empirical (documented experiment) | emerging/confirmed | Depends on results and replication |

**Test for AI agents:** When processing a note without external sources:
1. Does `source-origin: original` exist? If no and note has no source, add it
2. Is `source-origin-type:` specified? If no, infer from content
3. Is confidence calibrated appropriately? (synthesis = medium, hypothesis = speculative)
4. Is there an explicit statement of what makes this YOUR insight vs. restatable public knowledge?

**Distinction from sourced knowledge:**
- External (sourced): confidence based on source quality + verification status
- Original (no external): confidence based on reasoning chain quality + testing status

**Distinction from unverified knowledge:** "Unverified" means "not yet checked" — original knowledge may never have external sources to verify against, but can still have high confidence if reasoning chain is strong and hypothesis tests confirm it.

**See also:** [[Frontier Exploration - Knowledge Without Sources]] (frontier exploration documenting this gap), [[Seed Rule - Knowledge Source Type Tracking]] (existing rule that inspired this addition)
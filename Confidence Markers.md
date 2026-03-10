---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
  - seed-extension
  - metadata
  - confidence
---

# Confidence Markers

Signal the reliability of knowledge in your vault through structured confidence levels.

## The Problem

Not all knowledge is equal. Some facts are firmly established; others are emerging hypotheses, disputed theories, or outdated information. Readers need to understand reliability without tracing every source.

## The Solution: Confidence Markers

Add frontmatter to notes indicating confidence level:

```yaml
confidence: high | emerging | disputed | obsolete
```

## Confidence Levels

### high
- Established consensus
- Multiple independent sources agree
- Low likelihood of change
- Example: "Water boils at 100°C at sea level"

### emerging
- Newer findings that may evolve
- Limited confirmation
- Active area of research
- Example: "Recent studies suggest..."

### disputed
- Significant disagreement among experts
- Conflicting but credible sources
- No clear consensus
- Example: "Debate continues on..."

### obsolete
- Superseded by newer understanding
- Was previously accepted but now known to be wrong
- Keep for historical context with clear deprecation
- Example: "Previously believed X, now known to be Y"

## When to Use

Use confidence markers when:
- Sources disagree on factual claims
- New research challenges established views
- You're capturing personal interpretations vs. facts
- Temporal changes affect accuracy

## Relationship to Lifecycle

| Lifecycle | Typical Confidence |
|-----------|---------------------|
| draft | emerging |
| active | emerging or disputed |
| evergreen | high or emerging |
| deprecated | obsolete |

## Source Quality Tiers (Advanced)

For domains with established evidence hierarchies (medicine, law, science), the Seed requires capturing source quality tier alongside confidence. Add frontmatter to notes indicating the type of evidence supporting major claims:

```yaml
source-tier: systematic-review | rct | observational | case-study | expert-opinion | anecdote
```

### Tier Definitions

| Tier | Description | Example |
|------|-------------|---------|
| systematic-review | Synthesizes multiple studies, highest evidence | Cochrane review |
| rct | Randomized controlled trial | Clinical drug trial |
| observational | Study without intervention | Cohort study |
| case-study | Single patient/event report | "Patient presented with..." |
| expert-opinion | Expert viewpoint | "In my experience..." |
| anecdote | Unverified personal account | "I heard that..." |

### Combining with Confidence

Source tier and confidence are complementary but distinct:

- **source-tier: systematic-review** + **confidence: high** = Strong evidence, established knowledge
- **source-tier: rct** + **confidence: emerging** = Good evidence, may change as more research emerges
- **source-tier: expert-opinion** + **confidence: disputed** = Weak source, experts disagree

### Application by Domain

**Medicine:** Evidence hierarchy is well-established. Notes about treatments, drug efficacy, and diagnostic methods should capture what type of study supports each major claim.

**Law:** Different source weights — constitutional/statutory text (highest), case law precedent, legal commentary, expert opinion.

**Science:** Distinguish peer-reviewed journal articles, pre-prints (not yet reviewed), conference abstracts, and informal sources.

**Other Domains:** Many fields lack formal evidence hierarchies. Use source-tier metadata only if meaningful; otherwise rely on confidence markers alone.

## Related

- [[Handling Contradictory Sources]] — Using confidence markers when sources disagree
- [[Trust and Verify]] — Source verification process
- [[Source Validation Over Time]] — Keeping sources accessible
- [[Note Lifecycle Management]] — Note stages and progression
- [[Stress Test - Confidence Markers Rule in Legal Knowledge]] — Stress testing confidence markers in legal domain

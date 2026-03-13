---
last-reviewed: 2026-03-09
lifecycle: seedling
confidence: emerging
tags:
  - seed-extension
  - evidence-hierarchy
  - source-quality
  - frontier
---

# Source Evidence Quality Tiers

> Some knowledge domains have built-in source quality hierarchies. A knowledge base for medicine, law, or science needs rules for capturing this.

## The Problem

The Seed's Confidence Markers address: "How certain are we about this knowledge?" (knowledge-level reliability)

But there's a separate question: "How reliable is the source itself?" (source-level quality)

In domains like medicine, law, and science, the *type* of evidence matters as much as the *amount*:

- A randomized controlled trial (RCT) is more reliable than a case report
- A peer-reviewed study carries more weight than a pre-print
- A systematic review outranks individual studies
- Legal precedent differs from legislative text

The Seed has no guidance for capturing source quality tiers.

## The Gap

When an AI agent encounters a source in a high-evidence domain:
1. **No rule** tells it to note the evidence type
2. **No metadata** exists for source quality
3. **No distinction** between "this is well-supported" vs "this is just one study"

A knowledge base built with current rules would treat all cited sources equally — losing critical information about evidence quality.

## Proposed Approach: Source Tier Metadata

Add frontmatter for source quality:

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

Source tier and confidence are complementary:

- **source-tier: systematic-review** + **confidence: high** = Strong evidence, established knowledge
- **source-tier: rct** + **confidence: emerging** = Good evidence, may change
- **source-tier: expert-opinion** + **confidence: disputed** = Weak source, experts disagree

## Application to Domains

### Medicine
Evidence hierarchy is well-established. Notes about treatments, drug efficacy, and diagnostic methods should capture:
- What type of study supports this?
- How many patients/ trials?
- Is there a systematic review?

### Law
Different source weights:
- Constitutional/statutory text (highest)
- Case law precedent
- Legal commentary
- Law review articles
- Expert opinion

### Science
- Peer-reviewed journal article
- Pre-print (not yet reviewed)
- Conference abstract
- Blog post
- Personal communication

### Other Domains
Many fields lack formal evidence hierarchies. For these:
- Use source-tier metadata if meaningful
- Otherwise rely on confidence markers alone
- Don't force a structure where none exists

## The Test

For notes in domains with evidence hierarchies:
1. Does the note indicate what type of source supports each major claim?
2. Is the source-tier metadata present in frontmatter?
3. Do claims from different-tier sources receive different treatment (e.g., different confidence markers)?

## Relationship to Other Rules

- [[Confidence Markers]] — Signal knowledge-level reliability
- [[Handling Contradictory Sources]] — When sources disagree
- [[Trust and Verify]] — Source validation process

## Proposed Seed Rule

**Rule:** For knowledge domains with established evidence hierarchies (medicine, law, science), capture source quality tier in addition to confidence levels. Use tier metadata to distinguish between high-quality evidence (systematic reviews, RCTs, peer-reviewed studies) and lower-quality evidence (case reports, expert opinion, anecdotes).

**Why:** Treating all sources equally loses critical information about reliability. In high-stakes domains, readers need to know not just whether knowledge is certain, but whether the underlying evidence is strong.

**Test:** For notes in medicine, law, or science: (1) Does each major claim cite a source? (2) Is there source-tier metadata? (3) Do claims from systematic reviews get different confidence than anecdotes?

---

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Confidence Markers]]
- [[Handling Contradictory Sources]]
- [[Trust and Verify]]
- [[Domain-Specific Knowledge Bases]]

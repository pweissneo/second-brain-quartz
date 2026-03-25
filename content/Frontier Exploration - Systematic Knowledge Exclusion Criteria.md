---
last-updated: 2026-03-23
last-reviewed: 2026-03-24
author-type: ai-assisted
lifecycle: seed-extension
verification-status: unverified
confidence: emerging
evidence-tier: established-convention
knowledge-source-type: analysis
analysis-type: deductive
applicability: universal
recurring: false
utility-type: potential
thought-tool: true
thinking-tool-type: cognitive-strategy
tags: [knowledge-management, curation, exclusions]
seealso: [[AI-Assisted Knowledge Management Seed]]
---

# Frontier Exploration - Systematic Knowledge Exclusion Criteria

> What knowledge should be explicitly excluded from a knowledge base, and why?

## The Gap

The Seed contains extensive guidance on:
- What to capture (priority signals, diminishing returns, 5:1 ratio)
- How to structure notes (atomicity, linking, navigation)
- How to verify and maintain (verification workflow, decay management)

But the Seed lacks explicit guidance on:
- What to systematically EXCLUDE
- What categories of knowledge should never enter the vault
- How to make exclusion decisions consistently rather than ad-hoc

Without exclusion criteria, vaults accumulate based on what capture agents find interesting rather than what actually serves the vault's purpose. The inverse of "what to capture" is not "what not to capture" — it's "what creates negative value."

## Why This Matters

Exclusion is not just "don't capture junk." Systematic exclusions:

1. **Prevent drift** — Without explicit boundaries, vaults drift toward miscellaneous accumulation
2. **Signal clarity** — Explicit exclusions communicate what's out of scope to contributors
3. **Maintenance reduction** — Excluded knowledge doesn't need ongoing curation
4. **Quality signal** — A vault that excludes junk signals that retained knowledge is high-value

## Proposed Exclusion Categories

### 1. Public Utility Knowledge
Knowledge that is:
- Easily found via web search in <30 seconds
- Standardized and unlikely to change
- Not personalized to your context

**Test:** Could a search engine replace this note with identical or better information?

**Example:** Generic recipe for scrambled eggs (vs. your specific technique modifications)

**Threshold:** General knowledge is acceptable when frequently referenced OR synthesized with personal analysis OR domain-specific enough to be hard to find — but otherwise should be excluded.

### 2. Ephemeral Temporal Knowledge
Knowledge that:
- Becomes stale within 7 days
- Requires updates just to remain accurate
- Provides no unique context beyond "current state"

**Test:** Will this note be meaningfully different in 7 days? Does it capture a pattern or just a snapshot?

**Example:** Current stock prices, today's weather forecast, current news headlines

**Exception:** Pattern knowledge about temporal dynamics (e.g., "how prices fluctuate seasonally") is NOT ephemeral — capture that, not the snapshots.

### 3. Duplicate Knowledge
Knowledge that:
- Exists in the vault already (same concept, different phrasing)
- Could be merged into an existing note rather than creating new
- Adds no unique connection or perspective

**Test:** Before creating any note — does a note covering this idea already exist?

**Threshold:** Use "diminishing returns" test: utility + connection + uniqueness + effort

### 4. Decorative Knowledge
Knowledge that:
- Exists only to satisfy a structural requirement (link count, tag count)
- Has no standalone value beyond graph decoration
- Cannot be summarized in one sentence as a standalone idea

**Test:** Can you explain why a reader would follow THIS link, not just ANY link? Does the note make sense in isolation?

### 5. Scope-Violating Knowledge
Knowledge that:
- Violates the vault's stated purpose
- Serves a different audience than intended
- Requires different conventions than the vault uses

**Test:** Does this serve the vault's primary purpose? Would this note confuse someone expecting the stated focus?

### 6. High-Maintenance Low-Value Knowledge
Knowledge that:
- Requires frequent updates to stay accurate
- Changes frequently (version-sensitive, price-sensitive)
- Provides low utility (easily looked up elsewhere)
- Lacks your unique personalization

**Test:** Is this knowledge high-maintenance AND low-utility AND lacks your unique context? If 2-3 are true and 1 is false, exclude.

**Implementation:** Use frontmatter `maintenance-burden:` and `volatility-type:` to identify.

### 7. Sensitive-Risk Knowledge
Knowledge that:
- Could cause harm if exposed (others' private information, liability risk)
- Was captured without appropriate consent
- Creates legal or ethical exposure

**Test:** Could this knowledge cause harm if the vault were public? Did you have consent to capture?

### 8. Incomplete Speculation
Knowledge that:
- Is purely speculative with no evidence basis
- Has not been verified even as a hypothesis
- Could mislead if treated as knowledge rather than speculation

**Test:** Is this documented as speculation (mark as `confidence: emerging`, `status: speculative`) or is it being presented as knowledge?

**Exception:** Exploratory notes for hypothesis development are acceptable — but mark them as such and don't mix with verified knowledge.

## When Exclusions Don't Apply

Some categories are NOT exclusions:

- **Foundational knowledge** — Even if simple, core primitives are needed
- **Personal experiments** — Your failed experiments have value even if general versions exist
- **Contextualized knowledge** — Your specific adaptations of general knowledge are personal
- **Emerging domains** — Early-stage domains may not have established "public" knowledge yet
- **Error knowledge** — Your errors are personal even if the error is common
- **Relation knowledge** — How things relate in YOUR system is personal

## Implementation Guidance

### Frontmatter for Exclusion Decisions
```yaml
exclusion-considered: true
exclusion-reason: public-utility|ephemeral|duplicate|decorative|scope-violation|high-maintenance|sensitive-risk|incomplete-speculation
exclusion-alternative: "What to capture instead (pattern vs snapshot)"
```

### Workflow Integration
1. **Capture phase**: Tag with `exclusion-considered: true` for uncertain captures
2. **Processing phase**: Review exclusion tags within 48 hours
3. **Maintenance phase**: Periodically audit for exclusion category drift

### Documentation
Maintain an Exclusion Policy note that lists:
- Current exclusion categories (may evolve with vault maturity)
- Rationale for each category
- Exceptions and their justification

## Test for the Seed

A knowledge base using ONLY the current Seed rules would:
- Know WHAT to capture (priority signals, diminishing returns)
- Know HOW to structure (atomicity, linking, navigation)
- Know HOW to verify (verification workflow, decay management)
- BUT NOT know what to EXCLUDE → creates drift toward accumulation

## Related Seed Rules

- [[[Frontier Exploration - Knowledge Maintenance]]] — Related but focuses on maintenance, not initial exclusion
- [[Vault Boundaries]] — Defines categories to keep, not what to exclude
- [[Diminishing Returns Testing]] — Tests utility of captures, not systematic exclusions
- [[Capture Priority Signals]] — What to prioritize, not what to reject

## Questions This Gap Raises

1. Should exclusion criteria be domain-specific or universal?
2. How do you handle "borderline" cases that could go either way?
3. Does exclusion apply at capture time or processing time?
4. Can excluded knowledge ever become valuable (re-capture triggers)?

---

**Status:** This is an exploratory note identifying a potential Seed gap. The concept may warrant a Seed rule if systematic exclusion improves vault quality.
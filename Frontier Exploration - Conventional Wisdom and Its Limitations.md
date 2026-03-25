---
last-reviewed: 2026-03-22
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-quality
  - verification
  - conventional-wisdom
related-seed-rule: handling-incorrect-knowledge
---

# Frontier Exploration: Conventional Wisdom and Its Limitations

> How to capture "generally accepted" knowledge while acknowledging it may be wrong.

## The Problem

Some knowledge in a vault represents "conventional wisdom" — the accepted view, the standard advice, what "everyone knows." But conventional wisdom is often wrong (or partially wrong), and the history of knowledge is littered with accepted truths that were later overturned.

The Seed covers:
- Handling incorrect knowledge (correction workflow)
- Contradiction detection (resolving conflicts between notes)
- Verification status (unverified → verified)

But it doesn't explicitly address: **How do you initially capture knowledge that you suspect might be conventional-but-wrong?**

## Why This Matters

Without explicit handling:

1. **False confidence** — Notes present conventional wisdom as established fact
2. **Confirmation bias** — Future edits reinforce the conventional view, not challenge it
3. **Revision reluctance** — Once captured, notes are treated as authoritative
4. **Missed signals** — Early signs of conventional wisdom being wrong go unnoticed

## The Challenge

Conventional wisdom presents a paradox:
- Dismissing it outright loses potentially valuable knowledge
- Accepting it uncritically perpetuates errors
- Waiting for certainty delays capture of useful information

## Proposed Approach

### Tag: `conventional-wisdom: true`

For notes capturing generally accepted knowledge that could be wrong:

```yaml
conventional-wisdom: true
conventional-wisdom-strength: strong  # strong (universally accepted) | moderate (common belief) | weak (emerging consensus)
conventional-wisdom_sources:
  - "What the dominant sources say"
  - "What experts generally agree on"
conventional_challenges:
  - "Known challenges to this view"
  - "Recent evidence questioning this"
conventional_review_indicators:
  - "What would change this view"
  - "What evidence would falsify it"
```

### Distinction from Other Tags

| Tag | When to Use |
|-----|-------------|
| `verification-status: unverified` | Don't know if it's true |
| `confidence: emerging` | Think it's probably wrong |
| `conventional-wisdom: true` | Think it's probably right BUT historically conventional wisdom is often wrong |

### The "Challenge Log" Pattern

For each conventional-wisdom note, track:
1. **Initial capture**: What did you believe when you captured it?
2. **Active challenges**: What evidence or arguments challenge this?
3. **Update signals**: What would make you update this note?
4. **Historical tracking**: When did conventional wisdom change in this domain?

### Example: Nutrition Advice

```
Note: "Eating fat makes you fat"

conventional-wisdom: true
conventional_wisdom_strength: strong (1990s-2010s)
conventional_challenges:
  - "Recent studies show dietary fat doesn't correlate with body fat"
  - "Low-fat diets performed worse than expected in clinical trials"
conventional_review_indicators:
  - "Large-scale meta-analyses"
  - "Mechanism clarification"
```

The note captures what was conventionally believed, notes challenges, and signals when to re-evaluate.

## Test for Seed

**Rule:** Explicitly tag conventional wisdom and track challenges

**Why:** Conventional wisdom that turns out wrong is the most damaging because it feels authoritative. Explicit tagging creates healthy skepticism and prompts re-evaluation.

**Test:** For knowledge representing mainstream consensus: (1) Is it tagged as conventional-wisdom? (2) Are known challenges documented? (3) Are update signals explicit?

## Domain-Specific Considerations

### Medicine
- Much "standard care" has been overturned
- Tag with `conventional_wisdom_strength` and track clinical trial challenges

### Finance
- "Markets always revert to mean" — backtested but may not hold
- Track historical failures

### Personal Productivity  
- " multitasking is efficient" — now generally accepted as false
- Track personal experiments that challenge it

### Technical Fields
- "X is the best framework" — conventional at one point, obsolete the next
- Track version/context dependencies

## Interaction with Other Rules

- **Contradiction handling**: When conventional wisdom contradicts new evidence, prefer the new evidence but keep conventional-wisdom note as historical record
- **Verification workflow**: Conventional-wisdom notes should be prioritized for verification
- **Correction workflow**: When conventional wisdom is overturned, apply correction workflow with `correction-type: outdated` (was never wrong, but context changed) vs `correction-type: factual-error` (was always wrong)

## Questions for Seed

1. Should conventional-wisdom notes have a mandatory review period (e.g., must be re-evaluated within 6 months)?
2. How do you distinguish "still-valid conventional wisdom" from "overturned conventional wisdom"?
3. Should vaults track a "conventional wisdom health" metric (% of conventional-wisdom notes with documented challenges)?

---

**Related:** [[Handling Incorrect Knowledge]] — How to correct wrong notes
**Related:** [[Contradiction Detection]] — Resolving conflicts between notes  
**Related:** [[Knowledge Verification Workflow]] — How to verify claims
**Related:** [[Frontier Exploration - Knowledge Consensus Level Tracking]] — Tracking agreement levels

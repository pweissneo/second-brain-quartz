---
last-reviewed: 2026-03-26
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
meta-type: capture-process
schema-version: "1.0"
level: frontier
tags:
  - frontier-exploration
  - completeness
  - functional-threshold
  - bootstrap
  - gap-identified
verification-status: unverified
---

# Seed Gap - Functional Threshold for Knowledge Bases

## The Identified Gap

The Seed has comprehensive guidance for:
- **Construction phases** (skeleton → flesh → muscle → maturity) — structural milestones
- **Bootstrap completion criteria** — orphan rate <10%, core domains have hubs, verification ratio >50%, schema stable 60+ days, compliance score >85%
- **Diminishing returns** — when to stop adding content

**Missing:** A functional readiness test — **when can a knowledge base actually answer real questions?** The existing criteria measure structural quality, not practical utility.

## Why This Matters

An AI agent building a knowledge base needs to know:
1. **"Is this vault usable yet?"** — Can I ask questions and get answers?
2. **"What's the minimum needed to be useful?"** — What's the functional floor?
3. **"How do I know I'm ready to stop bootstrapping?"** — Beyond structural metrics, when does the vault actually work?

Without this, agents either:
- Stop too early (vault is structurally complete but not useful)
- Keep bootstrapping forever (chasing structural metrics that don't guarantee utility)

## The Problem in Practice

Consider two vaults with 50 notes:

**Vault A:**
- 5 hub notes with good structure
- 50% verification ratio
- Schema stable for 60 days
- BUT: No entry point, no common questions answered, orphan-like connections

**Vault B:**
- 30 notes, messy structure
- 20% verification ratio
- Unstable conventions
- BUT: Has clear entry point, answers 10+ common questions, useful for daily work

**Current Seed says:** Vault A is more "complete" (passes construction criteria)
**Reality:** Vault B is more useful

## What Makes a Vault "Functional"

A functional knowledge base should be able to answer:

### Entry-Level Questions (Newcomer Test)
- "What is this vault about?" → Can find purpose statement
- "Where do I start?" → Can find 2+ entry points
- "How is this organized?" → Can find navigation guidance

### Common Questions (Utility Test)
- Can answer 5+ questions someone in this domain would actually ask
- Answers are self-contained (don't require external lookup)
- At least one answer connects 2+ notes together

### Breadth Test
- Covers at least 2 distinct topic areas
- Each area has a hub with 3+ incoming links
- Cross-topic connections exist

## Proposed Seed Rule

### Rule: Define Minimum Viable Knowledge Base (MVKB) threshold — functional readiness beyond structural metrics

**Why:** Structural metrics (orphan rate, verification ratio, schema stability) measure vault health, not vault utility. A vault can be structurally sound but unusable. Functional readiness ensures the vault can actually serve its purpose before the agent moves to maintenance mode.

**Test:** Can the vault pass the functional threshold test?

### Cross-Domain Application

This gap applies to ALL domains. The question "Is this vault useful yet?" cannot be answered by current Seed metrics. A philosophy vault with 100 notes could pass all structural metrics but still be unable to answer "What is the trolley problem?" or explain major philosophical positions.

The Seed measures **structural health**, not **practical utility**.

### Domain-Specific Utility Test Examples

**For philosophy:**
- Can explain 3+ major philosophical positions
- Can identify core arguments for 2+ traditions
- Can navigate between related philosophical concepts
- Can distinguish between major philosophical traditions

**For cooking:**
- Can answer 3+ "how do I do X?" questions without external lookup
- Can provide guidance on ingredient substitutions
- Can explain technique rationale

**For home repair:**
- Can provide guidance on 3+ common tasks
- Can identify safety considerations for procedures
- Can troubleshoot common problems

**For medical (with appropriate caveats):**
- Can verify claims using internal sources
- Can identify confidence levels
- Can distinguish source quality

### Functional Threshold Test

**Entry Point Test (all must pass):**
1. Does a newcomer understand the vault's purpose from the root note?
2. Can a reader find 2+ clear starting points?
3. Is there a navigation mechanism (hub, index, or table of contents)?

**Utility Test (pass 3+ of 5):**
1. Can you answer "What is X?" for at least 5 topics in the vault?
2. Can you answer "How do I do Y?" for at least 3 common tasks?
3. Can you find prerequisite knowledge for 2+ advanced topics?
4. Can you identify at least 3 connections between topics?
5. Can you verify at least 2 claims using internal sources (not external)?

**Breadth Test (pass all):**
1. At least 2 distinct topic areas with hubs
2. Each hub has 3+ incoming links
3. At least 1 cross-topic connection

### MVKB Criteria

A vault passes MVKB when:
- ✅ All Entry Point Tests pass
- ✅ 3+ Utility Tests pass
- ✅ All Breadth Tests pass
- ✅ At least 20 notes exist

**After passing MVKB:** Transition from bootstrap mode to active curation. Continue adding content but shift focus from structure-building to depth, verification, and gap-filling.

## Distinction from Existing Rules

| Concept | What It Measures | What's Missing |
|---------|-----------------|----------------|
| Construction completion | Structural health (orphans, hubs, verification) | Practical utility |
| Diminishing returns | When to stop adding | When to start using |
| Bootstrap phases | Note count milestones | Functional readiness |
| Knowledge staging | Individual note completeness | Vault-level capability |

## Why This Isn't Just "Done"

"Complete" is dangerous because:
1. Structural completion doesn't guarantee utility
2. Agents may keep building structure forever
3. No clear signal that "this is usable now"

MVKB provides:
1. Clear functional milestone
2. Differentiates "built" from "usable"
3. Actionable transition trigger

### Domain-Specific Utility Test

These examples were validated through SEED_STRESS_TEST across multiple domains including philosophy, cooking, home repair, and medical knowledge bases.

## Related Notes

- [[Seed Gap - Functional Threshold Extended]] — ~~This note's domain-specific extensions~~ (merged into this note 2026-03-29)
- [[AI-Assisted Knowledge Management Seed]] — Construction completion criteria (Section on bootstrap)
- [[Frontier Exploration - Emerging Domain Bootstrapping]] — Related bootstrap phases
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — Completion heuristics
- [[Frontier Exploration - Knowledge Base Utility Assessment]] — Related utility testing
- [[Seed Stress Test - Philosophy Knowledge Base]] — Domain-specific stress test

---

*This gap was identified during frontier exploration on 2026-03-26. Additional stress testing in philosophy domain on 2026-03-29 confirmed the gap. The rule needs testing across domains to validate the functional threshold.*
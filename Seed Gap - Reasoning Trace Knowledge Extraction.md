---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
confidence: established
lifecycle: seed-gap-resolved
author-type: ai-assisted
tags:
  - seed-gap
  - reasoning-traces
  - session-knowledge
  - knowledge-extraction
  - resolved
level: seed-gap
gap-status: resolved
gap-priority: medium
gap-source: frontier-exploration
discovered: 2026-04-05
resolved: 2026-04-05
resolved-by: AI-Assisted Knowledge Management Seed.md line 5478
integration-date: 2026-04-05
---

# Seed Gap - Reasoning Trace Knowledge Extraction

> Identified Gap: The Seed says reasoning traces should be "ephemeral" but provides no mechanism for extracting reusable insights before discarding.

## The Gap

The Seed includes this rule (line ~5463):

> **Rule (NEW - 2026-03-28):** Document reasoning traces for complex queries — ... Default: ephemeral (discard after response). Optional: session-based or permanent storage for audit.

**What's missing:** The mechanism for actually handling ephemeral reasoning traces. The rule says "discard after response" but provides no guidance on:
1. **What to extract** — How to identify session-specific vs reusable content
2. **How to extract** — The actual process before discarding
3. **Where to store** — How to link extracted insights to permanent notes

This creates an asymmetric gap: the rule commits to "discard" but provides no "extract first" guidance.

## Why This Matters

Without extraction guidance:
1. AI agents discard ALL reasoning trace content by default
2. Valuable meta-knowledge about reasoning strategies is lost
3. No mechanism to improve the vault based on reasoning failures
4. The "optional: permanent storage for audit" has no implementation guidance

## What's Already Covered

The Seed covers:
- Reasoning strategies and their selection → [[Seed Stress Test - Reasoning Strategies Rules]]
- Query answering reasoning strategy gaps → [[Seed Refinement - Reasoning Strategy Implementation Gaps]] (merged from duplicate 2026-04-05)
- Reasoning trace documentation requirement (line 5460-5463)
- Vault-level pattern discovery (extracting latent knowledge from vault structure)

## The Missing Piece

**What should happen between "generate reasoning trace" and "discard"?**

### Required: Extraction Mechanism

The Seed needs a rule that says:

> **Rule (PROPOSED):** Before discarding reasoning traces, extract reusable knowledge — identify session-specific content vs. transferable insights, and link extracted insights to permanent notes.

**Test:** (1) Can you distinguish session-specific reasoning (query context, user-specific details) from transferable insights (generalizable patterns, reusable strategies)? (2) Is there a documented process for extracting before discarding? (3) Are extracted insights linked to existing notes or created as new notes?

### Implementation Guidance

```yaml
# In reasoning trace metadata
reasoning-trace-handling:
  session-specific: discard
  reusable-insights: extract-to-permanent
  audit-relevant: retain-conditionally

# Extraction criteria
extract-from-trace:
  - Novel reasoning strategy used
  - Gap identified in vault
  - Unexpected note-to-note connection discovered
  - Confidence calibration insight
```

### The Specific Gap

The rule at line 5463 says "Default: ephemeral (discard after response)" but doesn't address:

| What's Missing | Why It Matters |
|---------------|----------------|
| How to identify reusable vs session-specific | Without criteria, everything gets discarded |
| What to extract to permanent notes | Even if we want to, we don't know what |
| Link-back mechanism | Extracted insights need to connect to existing notes |
| Timing | When in the session does extraction happen? |

### Related Notes

- [[Seed Stress Test - Reasoning Strategies Rules]] — covers strategy selection but not trace handling
- [[Seed Refinement - Reasoning Strategy Implementation Gaps]] — identifies reasoning strategy gaps (merged from duplicate 2026-04-05)
- [[Frontier Exploration - Knowledge That Should Be Obvious]] — related meta-knowledge extraction
- [[Seed Refinement - Reasoning Trace Documentation]] — existing but incomplete

## Proposed Seed Rule Addition

**Rule (PROPOSED):** Implement reasoning trace extraction workflow — before discarding ephemeral traces, identify and extract reusable insights to permanent notes.

**Why:** The "default: ephemeral" rule commits to discarding but provides no extraction mechanism. This loses valuable meta-knowledge about reasoning execution that could improve the vault. AI agents need explicit criteria for what to keep vs discard.

**Test:** For a reasoning trace marked "ephemeral": (1) Can you apply criteria to identify reusable content? (2) Is there a documented extraction process? (3) Do extracted insights become notes or get linked to existing notes? (4) Can you identify what's session-specific (user context, query details) vs transferable?

**Implementation:**
```yaml
reasoning-trace:
  handling: ephemeral|session-based|permanent
  extract-before-discard: true|false
  
# What to extract
extract-criteria:
  reusable-strategy: "Novel reasoning approach that could apply elsewhere"
  vault-gap: "Identified missing knowledge that would improve reasoning"
  unexpected-connection: "Discovered note-to-note link not in graph"
  calibration-insight: "Confidence was wrong, learn from this"
  
# What to discard
discard-criteria:
  user-specific: "Query context unique to this session"
  temporary-state: "Current vault state that will change"
  session-bound: "References to this specific interaction"
```

---

*Gap identified during frontier exploration 2026-04-05 while reviewing reasoning trace handling in the Seed.*
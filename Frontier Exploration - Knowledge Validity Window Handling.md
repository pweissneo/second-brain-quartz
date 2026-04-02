---
last-reviewed: 2026-04-02
last-updated: 2026-04-02
lifecycle: evergreen
confidence: medium
author-type: ai-assisted
gap-status: identified
gap-priority: medium
---

# Frontier Exploration - Knowledge Validity Window Handling

> How should knowledge bases handle knowledge that is temporally bounded — valid only within a specific window of applicability?

## The Gap

The Seed addresses verification timelines (when to verify) and temporal validity bounds (how long knowledge remains accurate) but lacks explicit guidance for knowledge whose validity window is context-dependent rather than time-dependent.

### What is a Validity Window?

A validity window defines when captured knowledge **applies**, not just when it was verified. Some knowledge:

1. **Expires after a specific event or date** — e.g., "this lease terms apply until 2027-01-01"
2. **Is conditional on external state** — e.g., "this applies when using firmware version X"
3. **Is bounded by scope** — e.g., "this applies only for jurisdictions A, B, C"
4. **Requires prerequisites to be valid** — e.g., "this recipe works only with ingredients X and Y"

The current approach treats verification as time-bounded (verify within 30 days) but doesn't capture **applicability windows** — the conditions under which knowledge is correct in the first place.

## Why This Matters for Seed Construction

When building a knowledge base in a new domain using only the Seed's rules, an AI agent would capture knowledge at time T and verify it at time T, but would not track:

- Whether the knowledge applies beyond the capture moment
- What conditions could invalidate it without any content change
- Whether recomputation/reverification is needed when conditions change

This creates a subtle reliability gap: knowledge can remain "verified" but become inapplicable without any indication.

## Domain Examples

### Legal Knowledge
- Jurisdiction-specific laws have implicit validity windows tied to legislative cycles
- Precedents can be overturned — the knowledge is still accurate (case existed) but no longer applicable

### Technology Knowledge
- Software versions, API versions, hardware generations create hard validity windows
- "How to configure X" in version Y may break in version Z

### Personal Knowledge
- Preference knowledge ("I prefer dark chocolate") has implicit validity windows
- Life circumstances may invalidate captured preferences without content change

### Medical/Safety Knowledge
- Guidelines can be updated by authorities — verified knowledge can become outdated
- Equipment recalls invalidate previously-accurate safety information

## Proposed Handling Approach

### Metadata Schema

```yaml
validity-window-type: temporal|conditional|scope|prerequisite
validity-window-start: 2026-04-01  # when knowledge becomes valid
validity-window-end: 2027-04-01    # when knowledge expires
validity-conditions:               # conditional applicability
  - condition: "firmware-version"
    operator: equals
    value: "3.2.1"
validity-window-scope:             # scope applicability  
  - jurisdiction: ["US-CA", "US-NY"]
validity-check-trigger:              # when to recheck applicability
  - event: version-update
  - event: regulatory-change
validity-window-status: valid|pending-review|expired|superseded
last-validity-check: 2026-04-02
```

### Triggered Revalidation

Unlike standard verification (time-based), validity window revalidation is **event-based**:

1. **Version update detected** → revalidate technology knowledge
2. **Regulatory change announced** → revalidate legal knowledge  
3. **Preference change noted** → revalidate personal preference knowledge
4. **Recall announced** → revalidate safety knowledge

### Separating Accuracy from Applicability

Key distinction:
- **Accuracy:** The knowledge was correct when captured
- **Applicability:** The knowledge is currently correct in context

A note can be accurate but inapplicable:
- Captured correctly: "Firmware 3.2.1 supports these commands"
- Now inapplicable: "Firmware has been updated to 4.0"

## Gap Status: Identified → Needs Analysis

This gap requires further analysis:
1. Is this distinct from existing temporal validity bounds rules?
2. Should validity windows be tracking scope (where applies) vs. time (when applies)?
3. Is triggered revalidation feasible within current Seed architecture?

Related notes:
- [[Seed Refinement - Temporal Validity Bounds Rule.md]]
- [[Seed Gap - Knowledge with Inherent Expiration Windows.md]]
- [[Frontier Exploration - Context-Gated Knowledge.md]]
- [[Seed Gap - Conditional Knowledge Handling]] (compare)

---

**Question for exploration:** Does the Seed's temporal validity bounds rule adequately cover conditional/scope validity windows, or is this a distinct gap requiring new rules?
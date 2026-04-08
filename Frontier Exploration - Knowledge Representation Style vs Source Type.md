---
lifecycle: provisional
confidence: medium
author-type: ai-assisted
knowledge-type: conceptual
access-pattern: learning
last-updated: 2026-04-04
last-reviewed: 2026-04-08
---

# Frontier Exploration - Knowledge Representation Style vs Source Type

## The Distinction

The Seed already covers **knowledge source type** — how knowledge was acquired:
- Intuition (pattern recognition, expert tacit, gut-feeling)
- Analysis (statistical, deductive)
- Authority (trusted sources)
- Direct experiment

But there's a separate, under-explored dimension: **representation style** — how knowledge exists and "feels" when you access it in your mind.

| Dimension | Question It Answers | Example |
|-----------|---------------------|---------|
| Source | "Where did this knowledge come from?" | "I learned this from 10 years of woodworking" |
| Representation | "How does this knowledge feel when I access it?" | "This technique feels intuitive — I just know" |

## Why This Matters

**You can have analytical knowledge that feels intuitive** — after thousands of repetitions, a chef's knife technique is analytical knowledge (there's a correct form) that feels intuitive (they don't consciously think about it).

**You can have intuitive knowledge you've analytically reconstructed** — a master woodworker might articulate their "feel" for wood grain in analytical terms, but originally learned it through experience.

The **source-representation gap** causes problems:
1. **Transfer failure** — Analytically-reconstructed intuitive knowledge looks transferable but isn't
2. **Overconfidence** — Knowledge that feels intuitive but came from weak sources is dangerously overconfident
3. **Verification mismatches** — Intuition-sourced knowledge needs different verification than analysis-sourced

## Representation Style Taxonomy

```yaml
knowledge-representation-style: intuitive-analytical|analytical-intuitive|balanced|mixed
```

- **intuitive-analytical**: Acquired analytically (studied, reasoned) but now feels intuitive through practice
- **analytical-intuitive**: Acquired through experience (intuitive source) but have analytically reconstructed it
- **balanced**: Both representations are available; can access either way
- **mixed**: Some aspects feel intuitive, others analytical

## Handling Intuition-Analysis Conflicts

When your intuition and analysis disagree, the Seed doesn't have clear guidance:

**Scenario**: Your gut says this design will work (intuition), but your analysis shows statistical problems (analysis).

**Proposed approach**:
1. **Preserve both** — The conflict itself is knowledge
2. **Document context applicability** — When does each apply?
3. **Track resolution history** — How did you resolve this? What would change your mind?

```yaml
conflict-status: active|resolved|superseded
intuition-position: "..."
analysis-position: "..."
resolution-context: "Analysis wins when X; intuition wins when Y"
resolution-evidence: "What would convince you otherwise?"
```

## Test for Knowledge Base

Can you identify for key knowledge:
1. The **source type** (how acquired)?
2. The **representation style** (how it feels when accessed)?
3. The **source-representation relationship** (did source match current feel)?
4. **Conflict notation** if intuition and analysis disagree?

## Related Notes

- [[Seed Gap - Intuition vs. Analysis Knowledge Representation]] — The residual gap this addresses
- [[Frontier Exploration - Intuition vs Analysis Knowledge]] — Primary source coverage
- [[Frontier Exploration - Tacit Knowledge Capture]] — Related transfer mechanisms
- [[Seed Rule - Vault Change Tracking]] — For tracking representation changes over time

---

This note captures a frontier dimension the Seed partially covers but doesn't fully articulate — the representation-style distinction from source-type.
---
last-reviewed: 2026-03-26
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - review-cycle
  - knowledge-aging
  - domain-adapted
---

# Frontier Exploration - Knowledge-Aware Review Cycles

> Different knowledge types age differently — review cycles should match their volatility.

## The Insight

The Seed tracks verification status and handles corrections, but assumes a uniform review approach. Knowledge in different domains ages at dramatically different rates, and even within a domain, different knowledge types have different volatility profiles.

**Key insight:** Review frequency should be a function of knowledge volatility, not arbitrary time intervals. The same 30-day window that makes sense for software versions is absurd for fundamental principles.

## Domain Variation in Volatility

### High Volatility (Review quarterly or more frequently)
- **Software/tech:** API changes, framework updates, best practices evolve
- **Market/financial:** Prices, conditions, regulations
- **Medical/health:** New research, updated guidelines

### Medium Volatility (Review annually)
- **Craft techniques:** Tool-specific approaches, material recommendations
- **Domain-specific procedures:** Methods that depend on specific equipment
- **Equipment-dependent knowledge:** Knowledge tied to specific tools/software versions

### Low Volatility (Review every 2-5 years)
- **Fundamental principles:** Core concepts that rarely change
- **Foundational techniques:** Basic methods that transcend specific tools
- **Historical knowledge:** Past events, established facts

### Minimal Volatility (Review rarely or never)
- **Mathematical truths:** Theorems, proofs, fundamental relationships
- **Philosophical frameworks:** Core arguments, historical positions
- **Universal principles:** Knowledge that applies across contexts

## The Gap in Current Seed

The Seed has:
- `last-reviewed` field (when reviewed)
- `verification-status` (whether verified)
- `expiration-interval` (for time-sensitive knowledge)
- `validation-cycle` for seasonal knowledge

What's missing:
- **Volatility classification** — explicit categorization of how fast knowledge changes
- **Review frequency by volatility** — guidance on matching review cycles to volatility
- **Aging indicators** — what signals suggest knowledge has aged beyond its validity
- **Dynamic review scheduling** — can review cycles be triggered by external events, not just time?

## Proposed Seed Rule

```yaml
Rule: Classify knowledge by volatility and apply domain-appropriate review cycles — 
match review frequency to how fast the knowledge changes, not arbitrary intervals.

Why: Uniform review cycles cause inefficiency (reviewing stable knowledge too often) 
or staleness (reviewing volatile knowledge too rarely). Volatility classification 
enables targeted review that matches knowledge behavior.

Test: Can you categorize notes by volatility (high/medium/low/minimal)? Do high-
volatility notes have shorter review cycles than low-volatility? Is review frequency 
documented in frontmatter?

Implementation:
```yaml
volatility: high|medium|low|minimal
review-frequency: quarterly|annual|biannual|rarely|never
next-review: 2026-06-26
review-trigger: time-based|usage-based|event-based
```

**Volatility classification guidance:**
- high: changes within months (software APIs, market conditions, current events)
- medium: changes within 1-3 years (equipment updates, technique refinements)
- low: changes within 3-5 years (domain conventions, best practices evolution)
- minimal: rarely or never changes (fundamentals, principles, historical facts)

**Event-based triggers** (supplement time-based):
- Software version releases
- New edition of reference material
- Significant domain event (regulation change, new discovery)
- Usage pattern change (frequently accessed but older than threshold)
```

## Testing the Rule

### Cooking Domain Test

In cooking, different knowledge types have different volatility:

- **Fundamental techniques** (sauteing, roasting, braising): volatility = low, review = 2-3 years
- **Recipe procedures**: volatility = medium, review = annual (seasonal ingredients change)
- **Food safety guidelines**: volatility = high, review = quarterly (guidelines evolve)
- **Equipment-specific knowledge** (oven temperature calibration): volatility = medium, review = when equipment changes
- **Ingredient sourcing** (where to buy): volatility = high, review = as-needed (stores close, suppliers change)

Does the rule make sense for cooking? Yes — a recipe from 2019 is still valid; food safety guidelines from 2019 may not be.

Is the Test executable? Yes — an AI can assess volatility based on knowledge type and assign appropriate review frequency.

Edge cases found: Some knowledge crosses volatility categories. "How to make stock" is fundamental (low volatility) but ingredient sourcing is high volatility. Handle by using the lower volatility for the core knowledge and noting context-specific variations.

### Programming Domain Test

- **Language fundamentals** (syntax, core concepts): volatility = minimal
- **Framework-specific patterns** (React hooks, Django views): volatility = high
- **Design patterns**: volatility = low (patterns transcend specific implementations)
- **Error resolutions**: volatility = high (version-specific)
- **Tool configurations**: volatility = high (tool updates change behavior)

Does the rule make sense? Yes — a for-loop syntax note from 2010 is still valid; a "how to use React useEffect" note from 2020 is likely outdated.

## Integration with Existing Seed

This rule complements:
- **Verification ratio** — verification checks correctness, review cycles check currency
- **Expiration intervals** — explicit expiration for time-bound knowledge vs. volatility-based review
- **Correction workflow** — what happens when aged knowledge is found incorrect
- **Long-horizon verification** — separate from review cycles (verification = correctness, review = currency)

## Related Notes

- [[Frontier Exploration - Knowledge Aging and Review Cycle Management]] — original gap identification
- [[Frontier Exploration - Knowledge Maintenance]] — ongoing maintenance
- [[Frontier Exploration - When a Note Has Become Obsolete]] — deprecation
- [[AI-Assisted Knowledge Management Seed]] — verification rules

## Status

This is an emerging frontier — the rule needs testing across domains to validate volatility classifications. The proposed implementation is a starting point, not a final answer.
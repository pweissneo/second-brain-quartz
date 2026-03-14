---
lifecycle: draft
last-reviewed: 2026-03-13
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-type
  - institutional-knowledge
---

# Frontier Exploration - Institutional Knowledge

> Knowledge about how organizations, systems, and processes work internally — distinct from procedural "how-to" knowledge.

## The Gap

The Seed covers:
- Procedural knowledge (recipes, code, tutorials)
- Conceptual knowledge (principles, theories, frameworks)
- Factual knowledge (data, definitions, citations)
- Personal knowledge (experiences, decisions, insights)
- Tacit knowledge (intuition, judgment, feel)

But it lacks guidance on **institutional knowledge** — knowledge about how specific organizations operate internally:
- Unwritten rules and cultural norms
- Decision-making hierarchies and approval processes
- Internal jargon and abbreviations
- Historical context for current practices ("why we do it this way")
- Org structure and role responsibilities
- Political dynamics and stakeholder relationships

## Why It Matters

Institutional knowledge is:
- **High-value**: Can't be found in external sources — only exists within the organization
- **Perishable**: Changes when people leave or orgs restructure
- **Context-dependent**: Applies only to specific organizations, not generalizable
- **Sensitive**: May include internal politics, personnel issues, confidential processes

## Seed Rule Proposal

**Rule:** For institutional knowledge, explicitly tag with `institutional-scope:` identifying the organization and include `review-trigger:` for organizational changes (leadership changes, restructurings, mergers).
**Why:** Institutional knowledge becomes harmful when treated as universal truth or when it persists beyond its validity period. Tagging enables appropriate skepticism and timely refresh.
**Test:** Can you identify: (1) Which organization this knowledge applies to? (2) When was it last verified? (3) What organizational change would make it stale?

## Related Notes

- [[Frontier Exploration - Personal Relationship Knowledge]] — knowledge about specific people
- [[Frontier Exploration - Tacit Knowledge Capture]] — unwritten, experiential knowledge
- [[Handling Temporal Knowledge]] — temporal aspects of institutional knowledge
- [[Frontier Exploration - Knowledge Debt]] — Maintenance and debt tracking
- [[Frontier Exploration - Knowledge Ethics and Exclusion]] — What to include/exclude
- [[Self-Improvement Cycle]] — Continuous improvement
- [[Frontier Exploration - Multi-Vault Architecture]] — Separate vaults for different organizations
- [[Frontier Exploration - Access-Controlled Knowledge]] — Handling sensitive organizational knowledge

## Questions for Refinement

1. Should institutional knowledge be kept in the same vault as general knowledge, or separate?
2. How do you handle knowledge that's partly institutional (org-specific) and partly procedural (general method)?
3. What's the appropriate retention period for institutional knowledge after someone leaves the organization?

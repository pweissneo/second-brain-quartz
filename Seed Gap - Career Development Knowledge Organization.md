---
last-reviewed: 2026-04-01
last-updated: 2026-04-01
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-status: analyzed
gap-priority: medium
gap-type: seed-missing
discovered: 2026-04-01
analyzed: 2026-04-01
domain: career-development
analysis-conclusion: "Valid gap. Career knowledge is distinct from other knowledge types due to personal/contextual nature, time-sensitivity, network-dependency, and outcome-orientation. The proposed rule should be integrated into the Seed under the Personal Knowledge section or as a new domain-specific guidance note."
---

# Seed Gap - Career Development Knowledge Organization

## The Gap

The Seed lacks explicit guidance for organizing **career development knowledge** — knowledge about professional growth, job transitions, skill development, networking, compensation negotiation, and career decision-making. This is a different category than existing knowledge types because it is:

1. **Highly personal/contextual** — what works for one career path may not work for another (industry, geography, company size, personal circumstances)
2. **Time-bound** — job market conditions, compensation benchmarks, and role definitions change rapidly
3. **Network-dependent** — career success heavily depends on relationships, mentorship, and visibility
4. **Outcome-oriented** — career knowledge is about achieving results (promotion, transition, compensation), not just accumulating information

## Why This Matters for the Seed

An AI agent using the Seed to build a career development knowledge base would face challenges the Seed doesn't address:

- **Personal vs. General tension**: Career knowledge often mixes personal experience with general advice. How should these be separated?
- **Time sensitivity**: Market data (salary ranges, in-demand skills) expires quickly. How should temporal validity be handled?
- **Network knowledge**: Contacts, mentors, and relationships are knowledge but don't fit standard note types
- **Decision frameworks**: Career decisions involve multiple factors (financial, personal, professional) that need explicit weighting
- **Confidentiality**: Career knowledge often involves sensitive information about people, companies, or negotiations

## Proposed Seed Rule

**Rule:** For career development knowledge bases, separate personal career experience notes from general career principle notes, and tag temporal knowledge with validity windows.
**Why:** Personal experience (I got this job through X) differs from general principles (networking leads to more job opportunities than applying cold). Mixing them creates confusing advice. Temporal knowledge (salary data, in-demand skills) expires and needs explicit dating.
**Test:**
1. Can you distinguish personal career experience from general career principles?
2. Does temporal knowledge (market data, compensation benchmarks) have validity windows?
3. Is network/relationship knowledge explicitly tracked separately from general advice?

## Implementation Guidance

For career development knowledge bases:

```yaml
knowledge-type: career-development
career-knowledge-category: personal-experience|general-principle|market-data|network-knowledge|decision-framework
temporal-validity: 
  valid-from: 2026-01-01
  valid-until: 2027-01-01
  update-frequency: quarterly
confidentiality-level: personal|shared|public
```

**Note structure:**
- **Career Principles** — General knowledge (how to negotiate, networking strategies)
- **Career Experience** — Personal stories (how I transitioned, my interview process)
- **Market Data** — Time-stamped compensation, job market trends
- **Network Knowledge** — Contacts, mentors, relationships (with privacy considerations)
- **Decision Frameworks** — Frameworks for evaluating career choices

**Verification approach:**
- Market data: Requires frequent refresh (quarterly)
- Principles: Cross-reference with multiple sources
- Personal experience: Mark as anecdotal, not generalizable

## Related Seed Rules That Apply

- [[Frontier Exploration - Personal Experience vs Published Knowledge Conflicts]]
- [[Frontier Exploration - Knowledge Calibration by Use Intent]]
- [[Frontier Exploration - Temporal Validity Bounds Rule]]
- [[Seed Gap - Knowledge with Inherent Expiration Windows]]

## Questions for Seed Refinement

1. Should career knowledge have its own verification mode (different from factual/creative)?
2. How should network knowledge handle privacy/confidentiality?
3. What is the appropriate verification ratio for time-sensitive career data?
4. How do we handle contradictory career advice (different coaches give different advice)?

---
This note documents a Seed gap discovered during frontier exploration. The gap relates to organizing career development knowledge, which has unique characteristics (personal/contextual, time-bound, network-dependent) that existing Seed rules don't explicitly address.

---
last-reviewed: 2026-03-31
lifecycle: embryonic
confidence: low
author-type: ai-assisted
gap-status: identified
gap-source: frontier-exploration
---

# Frontier Exploration - Knowledge Exclusion and Boundary Management

> What happens when knowledge management meets its limits?

## The Problem

The Seed provides extensive guidance on:
- How to capture knowledge (atomicity, linking, verification)
- How to organize knowledge (hubs, graph structure, naming conventions)
- How to maintain knowledge (lifecycle, review cycles, deprecation)

But the Seed is silent on:
- What knowledge should NOT be captured
- How to handle knowledge that violates the vault's purpose
- When knowledge capture is ethically or legally problematic
- How to set boundaries around a knowledge base

## Real-World Scenarios

### 1. Collaborative Vaults with Different Access Levels
A team vault where different members should see different information. The Seed has no guidance on:
- Access-controlled notes
- "Need-to-know" knowledge boundaries
- Privacy levels within a single vault

### 2. Knowledge That Could Cause Harm
Medical knowledge base with experimental treatments, DIY repair guides with safety implications. The Seed discusses verification but not:
- Risk classification for potentially dangerous knowledge
- Disclaimer requirements
- Liability boundaries

### 3. Ephemeral or Sensitive Knowledge
Passwords, authentication tokens, personal secrets, PII. The Seed doesn't address:
- Knowledge that should exist only in memory
- Knowledge that must not be persisted
- Knowledge with strict retention requirements

### 4. Vault Purpose Violations
A cooking knowledge base that starts accumulating stock trading notes. The Seed has no rule for:
- Detecting off-topic accumulation
- Quarantining irrelevant content
- Archive vs. delete decisions for out-of-scope knowledge

### 5. Legal and Compliance Boundaries
Knowledge bases in regulated industries (healthcare, finance, legal). The Seed lacks:
- Compliance-aware capture rules
- Audit trail requirements
- Data residency considerations

## Gap Analysis

| Gap Type | Current Seed Coverage | Needed Addition |
|----------|----------------------|-----------------|
| Access control | None | Privacy levels, access tiers |
| Harmful knowledge | Verification only | Risk classification, disclaimers |
| Sensitive data | None | Retention rules, exclusion criteria |
| Off-topic content | None | Purpose enforcement, quarantine |
| Compliance | None | Industry-specific rules |

## Questions for the Seed

1. How should an AI agent determine if knowledge belongs in the vault?
2. What metadata is needed for access-controlled knowledge?
3. How do you handle knowledge that becomes inappropriate over time?
4. What's the process for excluding entire topic areas?

## See Also

- [[Frontier Exploration - Access-Controlled Knowledge]]
- [[Frontier Exploration - Knowledge Sensitivity and Responsible Capture]]
- [[Frontier Exploration - Systematic Knowledge Exclusion Criteria]]
- [[Seed Gap - Collaborative Knowledge Base Governance]]

---

## Proposed Seed Rule

**Rule:** Establish explicit knowledge exclusion criteria before vault creation — document what DOES NOT belong before defining what does.
**Why:** Every knowledge base has boundaries whether explicit or implicit. Without explicit exclusion criteria, off-topic knowledge accumulates gradually, diluting the vault's purpose. Explicit exclusion criteria create a filter that prevents drift and enables principled quarantine or deletion decisions.
**Test:** Can you state what topics are explicitly excluded from this vault? Do exclusion criteria exist in writing? Can an AI agent determine if new knowledge is out-of-scope without human judgment?

**Rule:** For collaborative vaults with varied access levels, implement tiered access through frontmatter — use `access-tier:` to distinguish visibility levels.
**Why:** Team knowledge bases often contain information that should be visible to some users but not others. Without access-tier tagging, AI agents cannot enforce boundaries and may expose sensitive information.
**Test:** For collaborative vaults: (1) Is access-tier specified for sensitive notes? (2) Can an AI agent query what it should not expose to certain users? (3) Are there clear boundaries between tiers?

---

*This note explores a frontier gap. The Seed currently provides no guidance on knowledge exclusion or boundary management. This is increasingly important as knowledge bases become more collaborative, regulated, and domain-specific.*

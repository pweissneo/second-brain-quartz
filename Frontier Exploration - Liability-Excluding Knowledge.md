---
last-updated: 2026-04-05
last-reviewed: 2026-04-05
author-type: ai-assisted
lifecycle: seed-extension
verification-status: unverified
confidence: emerging
evidence-tier: reasoning-from-first-principles
knowledge-source-type: analysis
analysis-type: deductive
applicability: universal
recurring: false
utility-type: potential
tags:
  - knowledge-management
  - liability
  - legal
  - risk
  - exclusions
seealso:
  - "[[AI-Assisted Knowledge Management Seed]]"
  - "[[Frontier Exploration - Systematic Knowledge Exclusion Criteria]]"
---

# Frontier Exploration - Liability-Excluding Knowledge

> What knowledge creates legal or liability risk for the vault, and how should AI agents handle it?

## The Gap

The Seed contains extensive guidance on what to capture, structure, and verify. The "Systematic Knowledge Exclusion Criteria" note covers public utility, ephemeral, duplicate, and decorative knowledge. But there's no explicit guidance on:

- **Liability-creating knowledge** — knowledge that if shared could create legal exposure
- **Disclaimered knowledge** — knowledge requiring explicit disclaimers to limit vault owner liability
- **Risk-tiered knowledge** — knowledge where capture/processing tier determines liability management

This gap matters because an AI agent managing a knowledge base could inadvertently capture knowledge that creates real legal or financial risk for the human whose vault it manages.

## Why This Matters

A knowledge base is not neutral — it can create liability in several ways:

1. **Professional advice claims** — If the vault contains advice in domains requiring licenses (law, medicine, finance, engineering), a user acting on it could claim reliance
2. **Duty of care** — A vault that knowingly contains dangerous procedures without warnings could face negligence claims
3. **Defamation risk** — Knowledge about living individuals that is false could create defamation exposure
4. **Intellectual property** — Knowledge that violates copyrights, trade secrets, or licensing terms
5. **Regulatory compliance** — Knowledge in regulated domains (financial advice, medical info, legal guidance) may trigger compliance requirements

The inverse of "good knowledge management" is not "bad" — it's "risky." An AI agent operating without liability awareness could systematically accumulate knowledge that creates exposure for the vault owner.

## Liability Knowledge Categories

### Tier 1: Prohibited Knowledge (Never Capture)

Knowledge that should NEVER enter the vault:
- **Defamatory content**: False statements about living individuals that could trigger legal claims
- **Copyrighted material**: Full reproductions of copyrighted works beyond fair use
- **Private data**: Personal information about others without consent (GDPR, privacy law considerations)
- **Trade secrets**: Proprietary information disclosed without authorization

**Test:** Could capturing this lead to immediate legal consequences? If yes, prohibit.

### Tier 2: Disclaimer-Required Knowledge (Capture with Protection)

Knowledge that CAN be captured but REQUIRES explicit disclaimer:
- **Professional advice in regulated domains**: Legal, medical, financial, engineering advice
- **Safety-critical procedures**: Anything that could cause physical harm if followed incorrectly
- **Expert opinions presented as fact**: Any knowledge where the source is not authoritative

**Test:** Could someone reasonably rely on this as professional advice? If yes, add disclaimer.

**Implementation:** Use frontmatter:
```yaml
liability-tier: disclaimer-required
disclaimer-type: professional-advice|safety-critical|non-expert-opinion
disclaimer-text: "This is not professional [advice/guidance]. Consult a qualified [professional]."
```

### Tier 3: Context-Required Knowledge (Capture with Attribution)

Knowledge that should include source context:
- **Unverified claims**: Anything with confidence below established
- **Single-source knowledge**: Facts from only one source
- **Personal experience presented as universal**: Subjective knowledge that could be misread as objective

**Test:** Is there ambiguity about whether this is verified fact or personal perspective? If yes, add context.

**Implementation:**
```yaml
liability-tier: context-required
attribution-required: true
verification-status: unverified|partial
confidence: emerging|moderate
```

### Tier 4: Risk-Visible Knowledge (Capture with Acknowledgment)

Knowledge that should have visible risk acknowledgment:
- **Time-sensitive knowledge**: Facts that will become outdated
- **Contested knowledge**: Topics where significant disagreement exists
- **Jurisdiction-specific knowledge**: Legal, regulatory, or cultural knowledge that varies by location

**Test:** Could acting on this knowledge without awareness of its limitations cause harm? If yes, add risk visibility.

## AI Agent Liability Awareness Protocol

When processing notes, the AI agent should:

1. **Scan for liability triggers**: Check for professional advice keywords, safety procedures, claims about individuals

2. **Apply tier classification**: Determine which liability tier applies

3. **Add required protections**: Insert disclaimers, attribution, or risk visibility as appropriate

4. **Flag for human review**: For Tier 1 and ambiguous cases, flag for human decision

5. **Log liability decisions**: Track what liability management was applied for audit

### Liability Trigger Keywords
```
# Professional advice triggers
legal advice, medical advice, financial advice, tax advice, 
investment advice, career advice, relationship advice

# Safety-critical triggers  
dangerous, hazardous, lethal, toxic, explosive, flammable,
critical infrastructure, emergency procedure

# Defamation triggers
[specific living person name], allegations, accusations,
misconduct allegations, scandal
```

## Relationship to Existing Seed Rules

This extends but does not replace:

- **[[Frontier Exploration - Professional Credentialing Requirements]]** — Domain-specific, this provides universal framework
- **[[Frontier Exploration - Systematic Knowledge Exclusion Criteria]]** — Adds liability dimension to exclusion decisions
- **[[Frontier Exploration - Knowledge Sensitivity and Responsible Capture]]** — Complements with ethical capture perspective
- **[[Confidence Markers]]** — Confidence levels map to liability tier (low confidence = higher liability risk)

## Proposed Seed Rule Addition

**Rule (PROPOSED):** Classify knowledge by liability risk and apply appropriate protections — prohibited knowledge never enters, disclaimer-required knowledge carries explicit warnings, context-required knowledge includes source attribution, risk-visible knowledge includes limitation acknowledgments.

**Why:** An AI agent without liability awareness could systematically accumulate knowledge that creates legal or financial exposure for the vault owner. Knowledge management is not neutral — what you capture affects what you're responsible for.

**Test:** (1) Can you identify liability tiers for all notes involving professional domains, safety procedures, or claims about individuals? (2) Do disclaimer-required notes have visible disclaimers? (3) Do unverified claims include attribution? (4) Is time-sensitive or jurisdiction-specific knowledge marked with limitation acknowledgment? (5) Are prohibited categories (defamation, copyright violation, unauthorized trade secrets) never captured?

**Implementation:** Use frontmatter `liability-tier: prohibited|disclaimer-required|context-required|risk-visible` with sub-fields for specific protection. Audit quarterly for liability compliance.

## Questions This Gap Raises

1. Should liability-aware processing differ for personal vs. shared vaults?
2. How do you handle knowledge that becomes more/less risky over time?
3. What liability training should an AI agent have before managing a vault?
4. How do you balance liability protection with knowledge utility?

---

**Status:** This is an exploratory note identifying a potential Seed gap. The concept may warrant a Seed rule addition if systematic liability management improves vault risk profile.
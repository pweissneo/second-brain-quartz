---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
lifecycle: evergreen
confidence: high
author-type: ai-assisted
verification-status: verified
tags:
  - seed
  - stress-test
  - 5-1-ratio
  - domain-adaptation
---

# Seed Stress Test: 5:1 Personal-to-General Ratio Across Multiple Domains

> Testing the "5:1 personal-to-general knowledge ratio" rule across multiple domains to identify domain-specific adaptations.
> Date: 2026-03-18

## Rule Under Test

**Rule:** Apply the 5:1 personal-to-general knowledge ratio — capture insights, decisions, and experiences (personal) over restatable facts (general).

**Why:** Personal knowledge compounds and provides unique value no web search can match. General knowledge takes maintenance effort but offers little unique value.

**Test:** Pick 10 recent notes. For each: (1) Could a web search replace this note in <30 seconds? (2) Does it contain original insight, decision, or experience? Ratio should be 5:1 personal to general.

---

## Domain: Legal Knowledge Base

### Analysis

Legal knowledge is heavily precedent-based. Much of law IS "general knowledge" in the sense that it consists of:
- Statutes and regulations (publicly available)
- Case law holdings (published opinions)
- Legal treatises and form books (reference materials)

However, personal legal experience provides UNIQUE value:
- How a specific judge ruled on similar facts
- What arguments succeeded or failed in practice
- Which procedural strategies worked
- Client-specific outcomes and lessons learned

**Finding:** The rule PARTIALLY applies. The ratio concept is sound, but the ratio itself may need adjustment for legal domains.

### Edge Cases Discovered

#### 1. Jurisdiction-Specific Knowledge
A note about "California LLC formation" is technically "general" (statutes are public), but for a practitioner in California, it provides unique value because it includes:
- Local filing nuances
- Common rejection reasons
- Practice tips from California-specific experience

**Recommendation:** Add `jurisdiction:` frontmatter. Notes with jurisdiction-specific implementation details count as personal even if the underlying law is public.

#### 2. Attorney-Client Privilege Constraints
Much of a lawyer's most valuable personal knowledge CANNOT be captured due to confidentiality obligations.

**Recommendation:** Allow notes to be tagged with `confidentiality-constrained: true` and exclude from ratio calculations.

#### 3. Legal Research Methodology
How to find relevant cases is personal expertise that's hard to capture but extremely valuable.

**Recommendation:** Add `thinking-tool: true` notes for legal research methodology. These count as personal by virtue of being expertise-developed.

#### 4. Temporal Validity
Legal knowledge has unique temporal properties - a case interpretation from 5 years ago may be outdated.

**Recommendation:** Add `temporal-validity:` with `current`, `historical`, or `superseded` values.

---

## Domain: Parenting Knowledge Base

### Analysis

Parenting knowledge sits at the intersection of:
- Expert advice (pediatricians, child psychologists, educators)
- Cultural traditions (generations of passed-down wisdom)
- Personal experience (what worked for YOUR child)
- Child-specific knowledge (each child is different)

### Edge Cases Discovered

#### 1. Safety-Critical Knowledge
The 5:1 rule would prioritize personal experience over general safety advice. But safety knowledge (SIDS prevention, car seat guidelines) should follow expert consensus.

**Recommendation:** For safety-critical domains, reverse the ratio: prioritize expert consensus over personal experience.

#### 2. Child-Specific Knowledge
Personal knowledge about ONE child may not apply to ANOTHER child.

**Recommendation:** Use `subject:` frontmatter to tag applicability. The 5:1 ratio applies to transferable personal insights, not child-specific records.

#### 3. Cultural/Traditional Knowledge
Parenting advice often comes from cultural traditions. This is neither personal nor general - it's traditional knowledge.

**Recommendation:** Add a third category: "cultural/traditional" knowledge tagged with `knowledge-type: cultural`.

---

## Domain: Personal Finance / Investing

### Analysis

Personal finance sits in an middle ground:
- Some knowledge IS personal (your specific tax situation, your risk tolerance)
- Some knowledge IS general but essential (tax laws, market mechanics)
- Much knowledge becomes personal through APPLICATION

### Edge Cases Discovered

#### 1. General Knowledge with Personal Context
"Tax-loss harvesting" is a general concept. But "I used tax-loss harvesting in 2024" is personal.

**Recommendation:** Notes should be counted as "personal-equivalent" if they include personal APPLICATION of general knowledge.

#### 2. Domain-Specific Reliability Sources
In investing, some sources are universally referenced (SEC, IRS). A note citing "IRS Publication 590-B" with YOUR interpretation counts as personal.

#### 3. Decision Documentation vs. Outcome Documentation
"I decided to allocate 60% stocks/40% bonds" - personal decision. "The 60/40 portfolio returned 8% in 2024" - general market data. Both are valuable.

**Recommendation:** Track "decision notes" and "outcome notes" separately. Both count toward personal ratio.

#### 4. Timing Knowledge
"I rebalanced annually" - personal decision pattern. Both are useful.

**Recommendation:** Personal timing decisions should count as personal even if they could be generalized.

---

## Domain: Scientific Research

### Analysis

Scientific research knowledge bases present unique challenges:
1. **Literature IS the knowledge** — Excluding published knowledge would gut the vault
2. **Reproducibility requires detail** — Detailed methods that seem "general" are essential
3. **Peer review insights are high-value personal knowledge**

### Edge Cases Discovered

#### 1. Literature as Personal Knowledge
Synthesizing literature IS a form of personal knowledge. A note that connects 5 papers across disciplines provides unique value.

**Recommendation:** Add `synthesis-type:` field (comparison|contradiction|extension|methodology-review).

#### 2. Methodological Knowledge is Tacit
Statistical choices, experimental design decisions, and lab techniques are tacit knowledge.

**Recommendation:** Methodological notes count as personal when they document why YOU chose a specific method.

#### 3. Negative Results Are High-Value Personal Knowledge
What didn't work, what was refuted, what was a dead end - these are often more valuable than positive results.

**Recommendation:** Tag with `result-type: negative` and count as personal.

#### 4. Temporal Validity Is Critical in Science
Scientific knowledge expires as new research emerges.

**Recommendation:** Add `temporal-validity:` field with `current`, `contested`, or `superseded` values.

---

## Domain: Music Composition

### Analysis

Creative skill domains where mastery requires extensive general knowledge as prerequisite:
- Composers must learn music theory before creating original works
- Deep study of masterworks creates foundation for personal style

### Edge Cases Discovered

#### 1. Learning Phase Ratio
Allow higher general ratio (3:1 or 2:1) during foundational skill acquisition.

#### 2. Mastery Phase Ratio
Shift to 5:1 as personal insights emerge from practice.

#### 3. Tacit Knowledge Exemption
Perceptual and kinesthetic knowledge (developing ears, feel, intuition) counts as personal.

#### 4. Canonical Repertoire as Proxy
Studying existing compositions (general knowledge) creates the foundation for personal style.

---

## Universal Edge Cases Summary

| Domain | Key Modification |
|--------|------------------|
| Legal | Jurisdiction-specific + confidentiality constraints |
| Parenting | Safety-critical reversal + child-specific tagging |
| Personal Finance | Personal application of general + temporal decay |
| Scientific Research | Synthesis + methodology + negative results |
| Music Composition | Learning phase ratio adjustment |

---

## Proposed Seed Rule Update

**Edge case:** The 5:1 ratio requires domain-specific modifications:

1. **Source-referenced personal:** Notes that cite authoritative general sources but include YOUR interpretation or application count as personal-equivalent
2. **Decision + outcome tracking:** Both decision notes and outcome notes count toward personal ratio
3. **Domain-specific adaptations:**
   - Safety-critical: Reverse ratio (general > personal)
   - Temporal knowledge: Add validity period
   - Synthesis knowledge: Add synthesis-type tagging
4. **Confidence calibration:** Different domains have different reliability signals

**Modified test:** For any domain:
1. Does this include personal context (your specific situation, decisions, outcomes)?
2. Does this include YOUR interpretation of general knowledge?
3. Does this document a decision you made?
4. Does this include an outcome (what happened when you tried something)?

Count as "personal-equivalent" if yes to ANY of these.

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Original Seed rule
- [[Frontier Exploration - Domain-Specific Knowledge Bases]]
- [[Stress Test - Confidence Markers Rule Across Domains]]

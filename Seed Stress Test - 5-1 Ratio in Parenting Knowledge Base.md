---
last-reviewed: 2026-03-15
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - parenting-domain
  - personal-vs-general
---

# Seed Stress Test: 5:1 Personal-to-General Ratio in Parenting Knowledge Base

## Seed Rule Being Tested

**Rule:** Apply the 5:1 personal-to-general knowledge ratio — capture insights, decisions, and experiences (personal) over restatable facts (general).

**Why:** Personal knowledge compounds and provides unique value no web search can match. General knowledge takes maintenance effort but offers little unique value.

**Test:** Pick 10 recent notes. For each: (1) Could a web search replace this note in <30 seconds? (2) Does it contain original insight, decision, or experience? Ratio should be 5:1 personal to general.

**Edge case:** General knowledge is acceptable when: frequently referenced (saves lookup time), synthesized with personal analysis, or domain-specific enough to be hard to find.

---

## Application to Parenting Knowledge Base

### Why Parenting is a Challenging Domain

Parenting knowledge sits at the intersection of:
- **Expert advice** (pediatricians, child psychologists, educators)
- **Cultural traditions** (generations of passed-down wisdom)
- **Personal experience** (what worked for YOUR child)
- **Child-specific knowledge** (each child is different)

The 5:1 rule assumes personal knowledge is MORE valuable than general knowledge. But in parenting:

1. **General knowledge can be hard to find** — advice that's "obvious" to experts may not be well-documented
2. **Personal experience is highly context-dependent** — what worked for one child may not work for another
3. **Expert consensus matters** — some advice (safety, sleep) has evidence behind it
4. **Cultural knowledge is neither personal nor general** — it's traditional knowledge passed down

---

## Edge Cases Identified

### Edge Case 1: Safety-Critical Knowledge

**Problem:** The 5:1 rule would prioritize personal experience over general safety advice. But safety knowledge (SIDS prevention, car seat guidelines, crib safety) should follow expert consensus, not personal experimentation.

**Example:**
- ❌ "In my experience, babies sleep better on their stomach" (personal, but contradicts safe sleep guidelines)
- ✅ "AAP recommends back sleeping" (general, but critical for safety)

**Test Failure:** The rule's test ("Could a web search replace this note?") would incorrectly flag safety guidelines as "general knowledge to skip."

**Proposed Refinement:**
> For safety-critical domains (parenting, medicine, finance), reverse the ratio: prioritize expert consensus over personal experience. Personal experience can be ADDED as context, but should not be the primary knowledge.

### Edge Case 2: Child-Specific Knowledge

**Problem:** Personal knowledge about ONE child may not apply to ANOTHER child. The 5:1 ratio assumes personal knowledge is universally valuable, but in parenting, child-specific notes are only valuable to the parent of that child.

**Example:**
- "My daughter started walking at 10 months" — personal, but useless for other parents
- "Most children start walking between 9-15 months" — general, but more useful

**Test Failure:** A parent's vault would have many notes about their specific child that fail the "utility" test for a general knowledge base.

**Proposed Refinement:**
> For knowledge that is specific to one individual (your child), use `subject:` frontmatter to tag applicability. The 5:1 ratio applies to transferable personal insights, not child-specific records.

### Edge Case 3: Cultural/Traditional Knowledge

**Problem:** Parenting advice often comes from cultural traditions ("in my family we do X"). This is neither personal (your individual experience) nor general (widely-known facts). It's traditional knowledge.

**Example:**
- "We give honey to babies over 1 year" — cultural tradition, has some factual basis
- "We don't cut hair before age 1" — purely cultural, no factual basis

**Test Failure:** The test can't categorize cultural knowledge as personal or general.

**Proposed Refinement:**
> Add a third category: "cultural/traditional" knowledge. This should be tagged with `knowledge-type: cultural` and evaluated separately from the 5:1 ratio.

### Edge Case 4: Expert vs. Layperson Knowledge

**Problem:** Pediatrician advice is "general" (not personal to you) but has higher value than your personal experience. The 5:1 rule doesn't distinguish between expert consensus and random blog posts.

**Example:**
- "Dr. Smith recommended..." — looks like a source, but is it credible?
- "A study showed..." — general, but what quality of evidence?

**Test Failure:** The test assumes all general knowledge is equal, but in parenting, expert credentials matter enormously.

**Proposed Refinement:**
> For domains where expertise varies significantly (parenting, health, finance), add a "source quality" dimension to the 5:1 rule. Expert-sourced general knowledge > personal experience > layperson general knowledge.

### Edge Case 5: Age-Specific Knowledge Decay

**Problem:** Parenting knowledge has a built-in expiration date. Advice for newborns is useless for teenagers. The 5:1 rule doesn't account for time-dependent utility.

**Example:**
- "Sleep training at 4 months worked for us" — personal, but only useful for parents of infants
- "Teenagers need autonomy" — general, applies for years

**Test Failure:** Personal notes about specific ages become less useful over time as the child ages out of that stage.

**Proposed Refinement:**
> For time-sensitive knowledge domains (parenting, education), add `applies-to-age-range:` frontmatter. Personal knowledge with narrow age range should be evaluated differently than general knowledge with broad applicability.

---

## Proposed Test Refinement

### Original Test:
> Pick 10 recent notes. For each: (1) Could a web search replace this note in <30 seconds? (2) Does it contain original insight, decision, or experience? Ratio should be 5:1 personal to general.

### Revised Test:
1. **Categorize each note:**
   - Personal: Original insight, decision, or experience unique to you
   - General: Facts, principles, or advice from external sources
   - Cultural: Traditional knowledge passed down
   - Safety-critical: Knowledge where expert consensus > personal experience

2. **Apply different ratios by category:**
   - Safety-critical domains: 1:5 (general > personal)
   - Personal knowledge: 5:1 (personal > general)  
   - Cultural knowledge: Evaluate separately (not counted in ratio)
   - Child-specific records: Tag with `subject: [child name]`, evaluate for transferability

3. **Additional checks:**
   - For general notes: Is the source expert (pediatrician, certified) or layperson?
   - For personal notes: Does it have `context:` explaining WHY it worked?
   - For time-sensitive notes: Does it have `age-range:` or `valid-until:`?

---

## Summary

| Edge Case | Problem | Solution |
|-----------|---------|----------|
| Safety-critical | Personal experience contradicts expert consensus | Reverse ratio for safety domains |
| Child-specific | Personal knowledge doesn't transfer | Tag with `subject:` |
| Cultural | Neither personal nor general | Add `knowledge-type: cultural` |
| Expert vs layperson | All general knowledge treated equal | Add source quality dimension |
| Age-specific decay | Personal notes expire with child age | Add `age-range:` frontmatter |

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Original Seed
- [[Frontier Exploration - Parenting Knowledge Capture]]
- [[Seed Stress Test - Experiential Knowledge Rule (Cross-Domain Analysis)]]
- [[Stress Test - Confidence Markers Rule Across Domains]]
- [[Domain-Specific Knowledge Bases]]

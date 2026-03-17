---
last-reviewed: 2026-03-16
confidence: emerging
lifecycle: active
author-type: ai-assisted
domain-familiarity: learning
tags:
  - seed-stress-test
  - atomicity
  - philosophy
  - edge-cases
---

# Seed Stress Test - Atomicity Rule in Philosophy Knowledge Base

> Testing whether the atomicity rule (100-300 words, one idea per note) works for philosophical concepts

## The Rule Under Test

**Seed Rule:** Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas. Every note must contain exactly one idea, summarizable in one sentence.

## Domain: Philosophy

Philosophy presents unique challenges for atomicity:
1. Concepts are often defined in opposition to other concepts (materialism vs idealism)
2. Philosophical arguments are multi-premise structures
3. Key philosophical works contain multiple interconnected arguments
4. Historical development of ideas spans multiple eras and thinkers

## Stress Test Analysis

### Challenge 1: Opposition-Dependent Concepts

**Issue:** Some philosophical concepts only make sense in opposition to another concept. The Seed acknowledges this with an edge case, but testing reveals complications.

Example: "Free Will" cannot be understood without understanding "Determinism" - but both are major concepts worth exploring independently.

**Test Result:** PASS with edge case application. The Seed's opposition-dependent concepts edge case handles this correctly:
- Create bidirectional pairs
- Neither note is complete alone
- Both reference each other

### Challenge 2: Multi-Premise Arguments

**Issue:** Philosophical arguments often have 3-5 premises leading to a conclusion. The Seed says argument structures are valid atomic units "even when referencing multiple concepts."

**Test Result:** PASS. The argument itself is the atomic unit. However:
- Individual premises MAY be separate notes for reuse
- This creates a judgment call: when to keep argument together vs. split premises

### Challenge 3: Philosophical Works as Atomic Units

**Issue:** Major philosophical works (e.g., "Critique of Pure Reason") contain multiple interconnected arguments covering metaphysics, epistemology, ethics, aesthetics.

**Test Result:** PARTIAL PASS with complications. The Seed's single creative work edge case applies:
- The work is referenced by multiple other notes
- Splitting would lose essential context

However: A 500-page philosophical work clearly violates word count. The solution (overview + linked deep-dives) works but requires significant upfront curation effort.

### Challenge 4: Historical Development

**Issue:** Tracking the development of an idea across centuries (e.g., "the concept of liberty from Aristotle to modern political philosophy") spans multiple historical periods and thinkers.

**Test Result:** FAIL for naive application. This is clearly multiple ideas:
- Ancient concept (Aristotle)
- Medieval developments (Aquinas, Augustine)
- Modern formulations (Locke, Rousseau, Kant)
- Contemporary debates

**Recommendation:** Split into:
- [[Philosophy - Concept of Liberty (Ancient)]]
- [[Philosophy - Concept of Liberty (Medieval)]] 
- [[Philosophy - Concept of Liberty (Modern)]]
- [[Philosophy - Concept of Liberty (Contemporary)]]

With a hub: [[Philosophy - Concept of Liberty]]

### Challenge 5: Schools of Thought

**Issue:** Stoicism, Epicureanism, Existentialism - each is a school of thought with multiple interconnected ideas (metaphysics, ethics, epistemology, practices).

**Test Result:** PARTIAL PASS. The hub pattern handles this well:
- Hub: [[Stoicism]]
- Spokes: [[Stoic Ethics]], [[Stoic Physics]], [[Stoic Logic]], [[Stoic Practices]]

But: Where does one draw the line between "school overview" and "specific doctrine"?

## Edge Cases Discovered

### Edge Case 1: Philosophical Jargon

Philosophy uses precise technical terms (epistemology, ontology, phenomenology) that are inherently brief but essential. These are like domain unit concepts in the Seed.

**Test:** These should be allowed under 100 words with `type: terminology` tag.

### Edge Case 2: Thought Experiments

Classic thought experiments (Trolley Problem, Ship of Theseus, Brain in a Vat) are atomic units even when brief because:
- They are referenced as complete units
- They can be applied across multiple philosophical debates
- Breaking them apart loses their identity

**Test:** Allow under 100 words with `type: thought-experiment` tag.

### Edge Case 3: Interpretive Debates

Major philosophical texts have centuries of interpretation. A note on "Kant's Categorical Imperative" might need to present multiple interpretive positions.

**Test:** This is where the Seed's "perspectives" structure applies. The note presents multiple views, which IS the single idea ("how Kant's imperative has been interpreted").

## Rule Refinements Needed

1. **Add explicit guidance for historical跨度知识:** When a concept's development spans multiple distinct historical periods, prefer temporal splitting over comprehensive treatment.

2. **Add thought experiment type:** Allow brief notes for canonical thought experiments with `type: thought-experiment` tag.

3. **Clarify school of thought boundaries:** Guidance on when overview note becomes too comprehensive vs. when spokes should be created.

4. **Add epistemological confidence for philosophical claims:** Philosophy has much lower consensus than empirical domains. Notes should default to `confidence: low` unless explicitly marking established consensus positions.

## Test Execution

Can an AI agent apply atomicity rules to philosophy knowledge?

**Result:** Yes, but requires:
- Understanding of opposition-dependent concepts
- Willingness to use hub+spoke patterns for schools
- Comfort with the perspectives structure for interpretive debates
- Willingness to split historically-developed concepts

The rule works but requires more domain-specific guidance than typical domains.

---

## Rule Update Proposal

Add to Seed section 2 (Atomicity):

> **Additional Edge Case - Philosophical Concepts:** For philosophy knowledge bases:
> - Opposition-dependent concepts (materialism/idealism): create bidirectional pairs
> - Historical development across eras: prefer temporal splitting with hub
> - Canonical thought experiments: allow brief notes with `type: thought-experiment`
> - Schools of thought: use hub+spoke with clear doctrine boundaries
> - Interpretive debates: use perspectives structure
> - Default to `confidence: low` for contested philosophical claims

**Test:** Can you apply atomicity rules to philosophy concepts without artificial fragmentation?

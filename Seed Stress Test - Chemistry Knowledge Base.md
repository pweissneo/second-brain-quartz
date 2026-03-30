---
last-reviewed: 2026-03-21
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - chemistry-domain
  - edge-case
---

# Seed Stress Test: Chemistry Knowledge Base

Testing Seed rules against the chemistry domain reveals unique challenges for managing chemical knowledge.

## Domain Overview

Chemistry knowledge bases face distinct challenges:
- Hierarchical organization (elements → compounds → reactions)
- Massive canonical knowledge (periodic table, reaction types)
- Procedural knowledge (lab procedures, safety protocols)
- Temporal/conditional knowledge (reaction conditions, yields)
- Cross-domain knowledge (biochemistry, materials science, pharmacology)
- Safety-critical content (hazardous chemicals, reaction conditions)

---

## 1. Word Count / Atomicity Rule

**Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Chemistry Application:**
- Element notes: vary from brief (noble gases) to extensive (carbon)
- Reaction mechanisms: 500-2000 words for complex mechanisms
- Synthesis procedures: multi-step protocols

**Edge Cases:**
1. **Periodic element notes**: "Hydrogen" at 150 words — single element, straightforward
   - Verdict: Appropriate atomic unit
2. **Reaction mechanism (SN1 vs SN2)**: 800 words covering mechanism, conditions, examples
   - Verdict: Should split into "SN1 Mechanism" and "SN2 Mechanism" as distinct concepts
3. **Synthesis procedure (Aspirin synthesis)**: 600 words covering steps, conditions, yield
   - Verdict: Keep together — procedural knowledge must stay atomic for usability

**Suggested Improvement:**
> For procedural chemistry (syntheses, lab protocols): notes >300 are acceptable when they represent complete, executable procedures. For conceptual chemistry (mechanisms, theories): apply strict 100-300 limit and split when exceeded.

---

## 2. At Least 2 Links Rule

**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.

**Chemistry Application:**
- Elements link to periodic table, properties, compounds
- Reactions link to reactants, products, mechanism, conditions

**Edge Cases:**
1. **Noble gases**: "Helium" — links to periodic table, properties
   - Verdict: Has 2+ links, passes
2. **Lab equipment (Erlenmeyer flask)**: Single link to glassware hub
   - Verdict: Tag with `specialized: true` — specific instrument in limited contexts
3. **Single compound (NaCl)**: Links to sodium, chlorine, properties
   - Verdict: Has 3+ links, passes

**Foundational Tag Application:**
- "Atom" — foundational: true (all chemistry builds from atomic theory)
- "Chemical Bond" — foundational: true
- "Periodic Table" — foundational: true (organizing principle)
- "Mole (unit)" — foundational: true (fundamental quantification)

**Suggested Improvement:**
> Chemistry domains should preemptively tag foundational concepts (atom, molecule, bond, periodic table, mole) with `foundational: true` to avoid false orphan detection.

---

## 3. Every Link Must Be Explainable

**Rule:** Every link must be explainable in one sentence — no decorative or keyword-match links.

**Chemistry Application:**
- Reactant links: "[[Sodium]] reacts with [[Chlorine]]"
- Mechanism links: "SN1 differs from [[SN2 Reaction]] in rate-determining step"

**Edge Cases:**
1. **Link to periodic table**: "Elements are organized in the [[Periodic Table]]"
   - Verdict: Explainable — provides organizational context
2. **Link to "Chemistry" hub**: Too vague
   - Verdict: Remove or replace with specific concept
3. **Citation links to literature**: "This mechanism was first proposed by [[Ingold, 1934]]"
   - Verdict: Explainable as authority attribution in chemistry

**Suggested Improvement:**
> In chemistry, links to primary literature (original discovery papers) should be allowed as "authority" links even if readers wouldn't follow them for learning — they establish scientific credibility.

---

## 4. 3-Hop Rule

**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.

**Chemistry Application:**
- Root → Chemistry → Organic Chemistry → Reaction Mechanisms → SN1 Reaction (4 hops)
- Root → Chemistry → Inorganic Chemistry → Transition Metals → Iron (4 hops)

**Edge Cases:**
1. **Deep taxonomic paths**: Chemistry → Organic → Functional Groups → Carboxylic Acids → Esters → Esterification
   - Verdict: Natural domain taxonomy — may exceed 3 hops legitimately
2. **Specific reaction conditions**: Path is too deep for practical navigation
   - Verdict: Add intermediate hub notes where possible

**Suggested Improvement:**
> Chemistry's natural hierarchical organization (element → compound → reaction → condition) may require 4-5 hops. Apply relaxed 4-hop threshold for chemistry vaults, or create more hub notes at intermediate levels.

---

## 5. Verification Status

**Rule:** Track verification ratio — at least 50% of new captures verified within 30 days.

**Chemistry Application:**
- Theoretical chemistry (quantum mechanics): can be verified through calculation
- Experimental procedures: require practical verification
- Safety information: critical to verify

**Edge Cases:**
1. **Theoretical pKa values**: From reputable sources (NIST, literature)
   - Verdict: verification-status: verified (source authority sufficient)
2. **Lab procedure (crystallization)**: Requires practical execution
   - Verdict: verification-status: unverified until personally tested
3. **Safety data (toxicity, flammability)**: From SDS sheets
   - Verdict: verification-status: verified (authoritative source)

**Suggested Improvement:**
> Chemistry should distinguish "theoretically verified" (calculation, literature) from "practically verified" (personally executed). For safety-critical content, require authoritative source verification.

---

## 6. Knowledge Types in Chemistry

**Challenge:** Chemistry spans multiple knowledge types:
- Factual (periodic properties, constants)
- Procedural (syntheses, lab techniques)
- Conditional (reaction conditions, yields)
- Relational (structure-activity relationships)
- Temporal (reaction rates, stability)

**Suggested Improvement:**
> Chemistry vaults should use explicit `knowledge-type:` frontmatter to distinguish factual, procedural, conditional, relational, and temporal knowledge types.

---

## 7. Handling Contradictory Sources

**Rule:** Detect and resolve simultaneous contradictions.

**Chemistry Application:**
- Different textbooks give different pKa values
- Competing reaction mechanisms proposed
- Conflicting yield reports from different conditions

**Edge Cases:**
1. **pKa values differ by source**: Note A says 4.76, Note B says 4.87 for acetic acid
   - Verdict: Document variance, note it's within experimental error
2. **Competing mechanisms (SN1 vs SN2)**: Different sources favor different pathways for same substrate
   - Verdict: Keep both, tag with `framework-dependent: true`
3. **Yield variations**: Note A claims 80% yield, Note B claims 60%
   - Verdict: Note conditions, tag with `condition-dependent: true`

**Suggested Improvement:**
> Chemistry contradictions often reflect different conditions (solvent, temperature, concentration). Before marking as contradiction, check if context resolves the apparent conflict.

---

## 8. Structural Recommendations for Chemistry Vaults

Based on stress testing, a chemistry vault should have:

### Recommended Hub Structure:
- `_root.md` → Chemistry
  - Inorganic Chemistry → Elements, Transition Metals, Main Group
  - Organic Chemistry → Functional Groups, Reaction Mechanisms, Synthesis
  - Physical Chemistry → Thermodynamics, Kinetics, Quantum
  - Analytical Chemistry → Spectroscopy, Chromatography
  - Lab Techniques → Glassware, Safety, Procedures

### Frontmatter Fields:
```yaml
knowledge-type: factual|procedural|conditional|relational|temporal
verification-status: verified|unverified|source-verified
safety-critical: true|false
```

### Domain-Specific Tags:
- #element, #compound, #reaction, #mechanism, #procedure, #safety

---

## Summary of Edge Cases

| Seed Rule | Chemistry Challenge | Resolution |
|-----------|-------------------|------------|
| Atomicity | Complex mechanisms, synthesis procedures | Allow >300 for procedural content |
| 2+ Links | Lab equipment may have single link | Tag with specialized: true |
| 3-Hop Rule | Deep taxonomic hierarchies | Relax to 4 hops OR add hubs |
| Verification | Theoretical vs practical | Distinguish source vs personal verification |
| Contradictions | Different conditions → different results | Check context before marking conflict |

---

## Conclusion

The chemistry domain reveals that:
1. Procedural knowledge (syntheses, protocols) needs different atomicity rules than conceptual knowledge
2. Domain taxonomies legitimately exceed 3-hop limits
3. Verification in chemistry is multi-dimensional (theoretical vs practical, source authority)
4. Many apparent contradictions resolve when conditions are considered

The Seed should acknowledge chemistry as a domain requiring relaxed rules for procedural content and taxonomic depth.

**See also:** [[Frontier Exploration Hub]]

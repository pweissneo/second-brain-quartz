---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - philosophy-domain
  - argument-structure
  - thought-experiment
---

# Seed Stress Test: Philosophy Knowledge Base

## Seed Rule Being Tested

Testing Seed rules against philosophy as a domain — a discipline with unique characteristics:
- Highly abstract concepts
- Historical development of ideas
- Contested definitions with no consensus
- Thought experiments as primary units
- Argument structures rather than procedures
- High proportion of secondary sources

---

## 1. Atomicity & Concept Definitions

**Seed Rule:** Notes should be 100-300 words. Every note must contain exactly one idea, summarizable in one sentence.

**Philosophy Application:**

### Edge Case: Contested Concepts

**Problem:** Some philosophical concepts have no consensus definition. "Consciousness," "free will," "meaning of life," "justice" — these cannot be captured in a single definition because experts fundamentally disagree.

**Seed Test:** "Can the note be summarized in one sentence that captures its core purpose?"

**Analysis:** For contested concepts, a single summary would be misleading. The note MUST present multiple perspectives.

**Resolution:** Use perspectives structure with sections for each major view. The test should be: "Does the note acknowledge the contested nature and present major positions?"

### Edge Case: Historical Development

**Problem:** A concept like "liberty" has evolved from Aristotle to modern philosophy. A single note trying to cover all historical periods would be bloated.

**Seed Test:** "Is this one idea or multiple ideas?"

**Resolution:** This is similar to the Seed's edge case about historical development in humanities. Create hub + temporal variants pattern:
- [[Liberty (Concept)]] — hub note
- [[Liberty in Ancient Philosophy]]
- [[Liberty in Modern Philosophy]]

### Edge Case: Thought Experiments

**Problem:** Thought experiments (Trolley Problem, Ship of Theseus, Brain in a Vat) are canonical atomic units referenced across multiple debates. They may be brief but are complete units.

**Seed Edge Case:** The Seed already acknowledges this with `type: thought-experiment` tag.

**Test:** Is the thought experiment referenced as a complete unit in multiple contexts? If yes, it's valid as a brief note.

---

## 2. Link Density & Foundational Concepts

**Seed Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true` OR be tagged `specialized: true`.

**Philosophy Application:**

### Edge Case: Philosophical Primitives

**Problem:** Concepts like "being," "existence," "truth," "knowledge" — these are so fundamental that they don't naturally link to 2+ other concepts. They're what other concepts link TO.

**Resolution:** These are domain primitives. Tag with `foundational: true`.

### Edge Case: Schools of Thought

**Problem:** "Stoicism" as a note might naturally link to:
- Ancient Greek philosophy
- Ethics
- Epistemology

That's only 2-3 links, but Stoicism is a major school that SHOULD be a hub.

**Resolution:** Hub notes can have fewer links if they're high-quality hubs. Use `hub: true` frontmatter.

---

## 3. Confidence & Consensus

**Seed Rule:** Use confidence markers appropriately.

**Philosophy Application:**

### Edge Case: Philosophical Confidence Defaults

**Problem:** Philosophy has lower consensus than empirical domains. Most philosophical claims are contested.

**Seed Test:** Does the note appropriately mark confidence?

**Resolution:** Philosophy notes should default to `confidence: emerging` unless marking established historical consensus positions. Add explicit `consensus-level:` frontmatter:
- `consensus-level: universal` — nearly uncontested (e.g., modus ponens validity)
- `consensus-level: mainstream` — dominant position in contemporary debate
- `consensus-level: minority` — serious but contested view
- `consensus-level: historical` — position held in past but now rejected

---

## 4. Source Quality

**Seed Rule:** For knowledge with established evidence hierarchies, capture source quality tier.

**Philosophy Application:**

| Source Type | Reliability | Example |
|-------------|-------------|---------|
| Primary sources | High for historical | Plato, Aristotle |
| Peer-reviewed journals | High for contemporary | Philosophy journals |
| Commentary | Variable | Depends on scholar |
| Tertiary summaries | Lower | Encyclopedias |
| Pop philosophy | Lower | Non-academic books |

### Edge Case: Interpretive Authority

**Problem:** Philosophy has interpretive disputes. A note about Plato's Republic might present one scholar's interpretation vs. another's.

**Test:** Does the note acknowledge interpretive plurality? Is the source attributed?

---

## 5. Verification Status

**Seed Rule:** For procedural content, include verification-status.

**Philosophy Application:**

**Problem:** Philosophy is not procedural, but it IS about reasoning. How do you "verify" a philosophical argument?

**Resolution:** Use different status for philosophical content:
- `verification-status: sound` — argument structure is valid
- `verification-status: soundness-pending` — valid structure but contested premises
- `verification-status: contested` — serious objections in literature
- `verification-status: historical` — historically significant but no longer accepted

---

## 6. Diminishing Returns

**Seed Rule:** Use diminishing returns testing before adding notes.

**Philosophy Application:**

### Edge Case: Infinite Philosophical Literature

**Problem:** Every major philosopher has written extensively. You cannot capture "everything" about Plato.

**Resolution:** Apply the test strictly in philosophy:
- Does this note connect to my existing knowledge?
- Is this a canonical concept or obscure detail?
- Will I actually use this in future reasoning?

---

## Summary

| Seed Rule | Philosophy Challenge | Solution |
|-----------|----------------------|----------|
| Atomicity | Contested definitions | Use perspectives structure |
| Atomicity | Historical development | Hub + temporal variants |
| Link Density | Foundational concepts | Tag `foundational: true` |
| Confidence | Low consensus defaults | Use `consensus-level:` |
| Source Quality | Interpretive disputes | Attribute interpretations |
| Verification | Non-procedural | Use soundness status |

---

## Related Notes

- [[AI-Assisted Knowledge Management Seed]]
- [[Stress Test - Knowledge Abstraction Levels Rule in Philosophy]]
- [[Frontier Exploration - Interpretive Knowledge]]
- [[Domain-Specific Knowledge Bases]]

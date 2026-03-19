---
last-reviewed: 2026-03-18
last-updated: 2026-03-18
confidence: high
author-type: ai-assisted
lifecycle: evergreen
verification-status: verified
tags: [seed, stress-test, 5-1-ratio, scientific-research, domain-specific]
related-seed-rules: [5-1-personal-to-general-ratio]
---

# Seed Stress Test: 5-1 Ratio in Scientific Research Knowledge Base

> Testing the "Apply the 5:1 personal-to-general knowledge ratio" rule in scientific research domains.

## Domain: Scientific Research

Scientific research knowledge bases present unique challenges for the 5:1 ratio:

### Does the Rule Make Sense?

**Partially.** The core principle (prioritize personal insights over restatable facts) remains valid, but scientific research has unique characteristics:

1. **Literature IS the knowledge** — In many fields, the "general knowledge" (published papers, established methods) IS the core value. Excluding it would gut the vault.
2. **Reproducibility requires detail** — Detailed methods that seem "general" are essential for reproducing results
3. **Peer review insights are high-value personal knowledge** — Understanding what reviewers criticize is expertise developed through practice

### Is the Test Executable by an AI?

**Partially.** The current test ("Could a web search replace this?") works but needs refinement:

- Literature citations can be searched but the personal synthesis cannot
- Lab-specific protocols are often undocumented and not searchable
- Statistical method choices reflect expertise not captured in textbooks

### Edge Cases Found

#### 1. Literature as Personal Knowledge

In scientific research, synthesizing literature IS a form of personal knowledge. A note that connects 5 papers across disciplines provides unique value no single paper contains.

**Edge case:** Literature synthesis notes should count as personal-equivalent when they:
- Cross-reference findings across 3+ papers
- Identify patterns or contradictions the individual papers don't discuss
- Include your interpretation of methodology strengths/weaknesses

Modified approach: Add `synthesis-type:` field (comparison|contradiction|extension|methodology-review) to distinguish synthesis from mere citation.

#### 2. Methodological Knowledge is Tacit

Statistical choices, experimental design decisions, and lab techniques are often tacit knowledge — learned through practice but rarely explicitly documented.

**Edge case:** Methodological notes should count as personal when they:
- Document why YOU chose a specific method (vs. alternatives considered)
- Include practical troubleshooting not in the published protocol
- Reflect decisions made during execution (what worked/didn't in YOUR lab)

This parallels the "tacit knowledge exemption" in creative domains but with different mechanism — not perceptual/kinesthetic but experiential/practical.

#### 3. Reproducibility Notes Are Critical Personal Knowledge

Notes about making something reproducible — your specific adaptations to protocols, your lab's specific conditions, your specific troubleshooting steps — are extremely high value and fully personal.

**Edge case:** Add `reproducibility-context:` field:
- `reproducibility-context: lab-specific` — adaptations specific to your setup
- `reproducibility-context: protocol-deviation` — intentional changes from published method
- `reproducibility-context: troubleshooting-log` — what failed and how you fixed it

All of these count as personal knowledge.

#### 4. Negative Results Are High-Value Personal Knowledge

What didn't work, what was refuted, what was a dead end — these are often more valuable than positive results but seem like "general" knowledge about what doesn't work.

**Edge case:** Negative results should count as personal because:
- They're rarely published (not searchable)
- They represent your specific experimental experience
- They save others (and your future self) from repeating failures

Tag with `result-type: negative` and count as personal.

#### 5. Collaborative Knowledge Has Complex Ownership

In research, knowledge is often developed collaboratively. Who "owns" the insight?

**Edge case:** For collaborative knowledge:
- If you contributed original thinking, it counts as personal
- Add `contribution-type:` field (led-developed|co-developed|curated|synthesized)
- Co-developed knowledge counts for both contributors

#### 6. Database and Tool Proficiency Is Personal Knowledge

Knowing how to use specialized databases (PubMed, Web of Science, GenBank), software (R, Python, SPSS), or lab equipment is personal knowledge — it took time to learn and involves tacit expertise.

**Edge case:** Tool proficiency notes count as personal when they:
- Include your specific workflow/tips not in documentation
- Document error messages you encountered and solutions
- Represent accumulated expertise, not basic tutorial content

#### 7. Temporal Validity Is Critical in Science

Scientific knowledge expires as new research emerges. A 2015 paper may be obsolete.

**Edge case:** Add `temporal-validity:` field:
- `temporal-validity: current` — still supported by recent literature
- `temporal-validity: contested` — newer evidence challenges this
- `temporal-validity: superseded` — replaced by newer understanding

Notes with `temporal-validity: superseded` should be reviewed for ratio purposes — they may no longer provide value.

### Modified Test for Scientific Research

For scientific research notes:

1. **Literature synthesis:** Does this connect 3+ sources with YOUR interpretation? → Personal-equivalent
2. **Methodology:** Does this document why YOU chose this approach, including practical adaptations? → Personal
3. **Reproducibility:** Does this include YOUR lab-specific modifications and troubleshooting? → Personal
4. **Negative results:** Does this document what didn't work in YOUR experiments? → Personal
5. **Tool proficiency:** Does this include YOUR accumulated expertise beyond basic tutorials? → Personal
6. **Temporal validity:** Is the scientific knowledge current, or has it been superseded?

Count notes as personal if yes to 1-5. For ratio calculation, treat `temporal-validity: superseded` notes as neither personal nor general — they should be archived or updated.

### Interaction with Other Seed Rules

- **Verification:** Scientific knowledge requires verification through reproducibility. Apply verification-status rigorously.
- **Source quality:** Add `source-quality:` field (peer-reviewed|preprint|review-article|personal-communication|own-experiment)
- **Construction phase:** Scientific vaults may need extended skeleton phase due to extensive prerequisite knowledge (statistics, methods, domain fundamentals)

### Conclusion

The 5:1 rule needs significant modification for scientific research:

1. Literature synthesis IS personal knowledge when it adds interpretation
2. Methodological decisions are tacit knowledge worth capturing
3. Reproducibility context is uniquely valuable personal knowledge
4. Negative results are high-value personal knowledge (rarely published)
5. Tool proficiency represents accumulated personal expertise
6. Temporal validity must be tracked — superseded knowledge loses value

The spirit of the rule remains valid — capture your unique insights — but the implementation must accommodate scientific research's unique knowledge dynamics.

---

**See also:**
- [[Seed Stress Test - 5-1 Ratio in Legal Knowledge Base]]
- [[Seed Stress Test - 5-1 Ratio in Parenting Knowledge Base]]
- [[Seed Stress Test - 5-1 Rule Music Composition]]
- [[Frontier Exploration - Scientific Research Knowledge Bases]] (if it exists)
- [[AI-Assisted Knowledge Management Seed]] (source of rules being tested)

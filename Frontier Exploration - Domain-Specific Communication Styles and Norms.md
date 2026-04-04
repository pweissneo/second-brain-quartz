---
last-reviewed: 2026-04-04
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
- frontier-exploration
- knowledge-presentation
- communication
- domain-conventions
knowledge-type: meta
retrieval-mode: hybrid
---

# Frontier Exploration: Domain-Specific Communication Styles and Norms

## The Gap

The Seed covers how to structure knowledge (atomicity, linking, navigation) and how to verify it (verification-status, evidence-tier, source-type). But the Seed doesn't address HOW knowledge should be presented based on the target audience's professional communication conventions.

Different domains have distinct communication norms that affect:
- **Tone**: Formal vs informal, hedging vs confident
- **Precision**: Exact specifications vs ranges vs qualitative
- **Terminology**: Standard jargon vs plain language
- **Structure**: Required formats vs自由格式
- **Evidence presentation**: Citations, proof standards
- **Uncertainty communication**: How to express doubt, confidence, probability

## Why This Matters

Knowledge captured without considering domain communication norms may:
1. **Mislead about certainty**: Using hedge language in a domain where precision is expected (or vice versa) miscommunicates confidence
2. **Fail verification**: Notes that don't meet domain documentation standards may appear unverified even when they're correct
3. **Reduce utility**: Readers expecting domain-appropriate formatting can't find what they need
4. **Create false authority**: Notes that sound authoritative in a domain where that's inappropriate

## Domain Examples

### Medical/Clinical Communication
- **Conventions**: SOAP format (Subjective, Objective, Assessment, Plan), precise terminology, uncertainty expressed probabilistically
- **Example**: "Patient presents with" not "I think the patient has"
- **Implication**: Clinical knowledge notes should follow SOAP or similar structure; uncertainty should be quantified ("70% probability") not hedged ("might", "possibly")

### Legal Communication  
- **Conventions**: Precise language where "may" ≠ "shall", specific citation formats (Bluebook), defined terms
- **Example**: "may" (permissive) vs "shall" (mandatory) has legal significance
- **Implication**: Legal notes must use precise terminology; hedging that would be appropriate in academic writing is inappropriate in legal contexts

### Engineering/Technical Communication
- **Conventions**: Units, tolerances, specifications, precise notation
- - **Example**: "50mm ±0.5mm" not "about 50mm"
- **Implication**: Technical notes should include precise specifications; ranges and tolerances matter

### Academic/Scientific Communication
- **Conventions**: Citation formats, hedging conventions, peer-review language
- **Example**: "This suggests" vs "This proves" - different certainty levels
- **Implication**: Academic notes should follow domain citation standards; use appropriate hedging based on evidence strength

### Creative/Artistic Communication
- **Conventions**: Expressive language, interpretation-focused, opinion-based
- **Example**: "Creates mood of" vs "is"
- **Implication**: Creative domain notes can be more expressive; opinion and interpretation are valid, not weaknesses

### Financial/Investment Communication
- **Conventions**: Risk disclosures, performance disclaimers, specific disclaimers required
- **Example**: "Past performance does not guarantee future results"
- **Implication**: Financial notes need standard disclaimers; speculation must be labeled as such

### Software Development Communication
- **Conventions**: Code examples, API documentation, version specificity
- **Example**: Code should be runnable, not pseudo-code; version numbers matter
- **Implication**: Code samples should be complete and runnable; version/context specificity is expected

## The Test

Can you identify the appropriate communication style for each of your notes based on their domain? Do your notes:
1. Use domain-appropriate terminology (not just any synonym, but the standard term)?
2. Express certainty in domain-appropriate ways (hedging vs precise probability)?
3. Follow domain-appropriate structure (required formats, conventions)?
4. Include domain-required disclaimers or caveats?

## Implementation Options

### Option 1: Frontmatter Field
```yaml
communication-style: clinical|legal|technical|academic|creative|financial|software
```

### Option 2: Context-Frame Extension
Extend context-frame to include communication norms:
```yaml
context-frame: patient-education|clinical-legal|technical-reference|academic-discourse
```

### Option 3: Separate Conventions Notes
Create domain-specific convention notes that document how to present knowledge in that field.

## Related Seed Rules

- [[Context-Dependent Knowledge Interaction]] - context-frame tagging handles some presentation differences
- [[Confidence Markers]] - handles certainty expression, but domain-specific variations apply
- [[Verification Status]] - verification meaning varies by domain
- [[Domain-Specific Knowledge Bases]] - adapting knowledge management for different fields

## See Also

- [[Domain-Specific Knowledge Bases]] — How to adapt knowledge management for different fields
- [[Atomic Note Principle]] - structuring knowledge for different use cases
- [[Knowledge Graph Structure]] - how presentation affects graph connectivity

## Open Questions

1. How many communication styles are there? Is this a finite set or domain-dependent?
2. How do you handle multi-domain notes (e.g., "medical device documentation" = medical + technical)?
3. Does communication style affect verification? Is a technically correct note "unverified" if it doesn't meet domain documentation standards?

---

**This is a frontier gap note** - it explores an area where the Seed doesn't yet have clear rules. If this proves valuable, consider incorporating as a Seed rule with specific test criteria.
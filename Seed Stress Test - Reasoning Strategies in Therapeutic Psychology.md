---
last-reviewed: 2026-04-04
lifecycle: deprecated
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
- seed-stress-test
- reasoning-strategies
- edge-case
- psychology
- therapeutic
redirect_to: [[Seed Stress Test - Reasoning Strategies Rules]]
correction-type: merged
correction-date: 2026-04-04
corrected_by: [[Seed Stress Test - Reasoning Strategies Rules]]
---

# ⚠️ DEPRECATED: Reasoning Strategies in Therapeutic Psychology

> **Status:** This note has been merged into [[Seed Stress Test - Reasoning Strategies Rules]]
> 
> All content from this note has been integrated into the main reasoning strategies stress test (Edge Case 7). This file is kept as a redirect.

---

> Testing Seed rule: "Define reasoning strategies for query answering — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection."

This note explored how reasoning strategies apply to therapeutic psychology knowledge - a domain with unique challenges: multiple competing frameworks, evidence tiers, high-stakes decision making, and complex client-specific factors.

**All therapeutic psychology edge cases have been integrated into [[Seed Stress Test - Reasoning Strategies Rules]].**

## The Rule

**Rule:** Define reasoning strategies for query answering — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection.

**Why:** A perfectly structured vault is useless without strategies for traversing and synthesizing knowledge. Without reasoning guidance, AI agents over-traverse, under-traverse, or miss key connections.

**Test:** For a complex query, can you: (1) decompose it into atomic sub-questions? (2) plan traversal paths before executing? (3) score note relevance using explicit criteria? (4) aggregate confidence from component notes? (5) detect and flag knowledge gaps encountered during reasoning?

---

## Domain: Therapeutic Psychology

Therapeutic psychology (counseling, psychotherapy) presents unique challenges for knowledge base reasoning:

### Domain Characteristics

1. **Multiple competing frameworks**: CBT, DBT, ACT, Psychodynamic, Existential, Humanistic, etc.
2. **Evidence tiers**: Some therapies have strong RCT evidence (CBT for depression), others have modest evidence (psychodynamic), others are emerging (EMDR, psychedelic-assisted)
3. **Client-specific factors**: Age, culture, comorbidities, preferences affect what "works"
4. **High stakes**: Poor therapeutic fit can cause harm or waste critical treatment time
5. **Temporal dimension**: Client progress changes over time; what works early may not work later
6. **Ethical constraints**: Some interventions require specific training/certification

---

## Does the Rule Make Sense?

**Partially.** The reasoning strategies rule is essential for therapeutic psychology, but the basic framework needs significant expansion:

### What Works

- **Query decomposition**: Essential - "help with client anxiety" decomposes into: evidence-based interventions for anxiety, client assessment, cultural factors, comorbidity considerations
- **Traversal planning**: Important - need to navigate from symptom to intervention to technique
- **Confidence aggregation**: Critical - different interventions have different evidence strength
- **Gap detection**: Vital - missing information about client context could lead to poor recommendations

### What's Missing

The rule doesn't account for:
1. **Framework-specific reasoning**: CBT reasoning differs from psychodynamic reasoning
2. **Evidence tier integration**: How to weight gold-standard RCT evidence vs. case studies vs. expert consensus
3. **Client factor reasoning**: How to incorporate individual differences into recommendations
4. **Ethical constraint reasoning**: What interventions require what credentials
5. **Temporal reasoning**: How client progress affects intervention selection

---

## Is the Test Executable?

**Partially.** The test asks if an AI can perform 5 tasks. For therapeutic psychology:

### Decompose (1) ✅ Possible but complex
- "Client has depression with suicidal ideation" → intervention safety, evidence level, immediate vs. long-term, contraindications
- Challenge: Decomposition depends on client factors unknown at query time

### Plan traversal (2) ✅ Possible
- Path: symptom → assessment → evidence-based interventions → technique selection → adaptation
- Challenge: Multiple valid paths exist (different frameworks take different paths)

### Score relevance (3) ⚠️ Needs domain-specific criteria
- Current criteria: generic relevance scoring
- Needed: Framework alignment, evidence strength, client fit, safety priority

### Aggregate confidence (4) ⚠️ Needs expansion
- Current: aggregate confidence from component notes
- Needed: Weight by evidence tier, distinguish intervention evidence from assessment evidence

### Detect gaps (5) ⚠️ Needs domain-specific gap types
- Current: generic gap detection
- Needed: Safety gaps (missing risk factors), ethical gaps (missing training checks), client factor gaps

---

## Edge Cases

### Edge Case 1: Conflicting Framework Recommendations

Different therapeutic frameworks may recommend different interventions for the same presenting problem:

> Query: "Client with depression and chronic pain"
> - CBT: Behavioral activation + cognitive restructuring of pain catastrophizing
> - ACT: Acceptance-based approaches, values-based action
> - Psychodynamic: Explore meaning of illness, attachment patterns

**Problem:** How does the reasoning strategy aggregate these conflicting recommendations?

**Resolution:** 
- Present framework-specific recommendations separately
- Add `framework:` to each recommendation
- Weight by evidence tier (CBT has strongest evidence for depression + pain)
- Flag when frameworks fundamentally disagree on approach

### Edge Case 2: Evidence Tier Confusion

Therapeutic psychology has complex evidence hierarchies:

| Tier | Example | Confidence |
|------|---------|------------|
| Gold standard | CBT for depression (multiple RCTs) | High |
| Good evidence | DBT for BPD | High |
| Moderate evidence | Psychodynamic for depression | Medium |
| Emerging | EMDR for PTSD | Emerging |
| Insufficient | Rebirthing therapy | Disputed/obsolete |

**Problem:** The Seed's confidence markers don't capture evidence tiers - "confidence: high" for CBT is different from "confidence: high" for a historical consensus.

**Resolution:** Add `evidence-tier:` for therapeutic interventions:
```yaml
evidence-tier: gold-standard | good-evidence | moderate-evidence | emerging | insufficient
```

### Edge Case 3: Client-Specific Factor Gaps

A query might be unanswerable without client information:

> Query: "What intervention should I use?"
> Missing: Age, cultural background, previous treatment history, comorbidities, client preferences, severity

**Problem:** Generic reasoning strategies don't know what client factors matter.

**Resolution:** 
- Add `required-factors:` to intervention notes
- Flag queries missing required factors
- Create client-factor gap types:
  - Assessment gaps (missing diagnostic info)
  - Context gaps (missing cultural/preference info)
  - Safety gaps (missing risk factors)

### Edge Case 4: Ethical Constraint Reasoning

Some interventions require specific training:

> Query: "Techniques for trauma processing"
> - EMDR: Requires certified training
> - Prolonged Exposure: Requires specific training
> - Basic supportive therapy: No special training

**Problem:** Recommending interventions the practitioner isn't qualified to deliver causes harm.

**Resolution:**
- Add `required-credentials:` to intervention notes
- Include credential check in reasoning strategy
- Flag when recommended intervention requires credentials query hasn't addressed

### Edge Case 5: Temporal Reasoning for Client Progress

Interventions change as clients progress:

> Early therapy: Psychoeducation, rapport building, safety planning
> Middle therapy: Skill-building, processing, insight
> Late therapy: Consolidation, relapse prevention, termination

**Problem:** A reasoning strategy might recommend termination techniques for a new client.

**Resolution:**
- Add `therapeutic-phase:` to intervention notes: assessment | early | middle | late | termination
- Include phase detection in reasoning strategy
- Flag recommendations mismatched to apparent phase

### Edge Case 6: Harm Potential Weighting

In therapeutic psychology, some interventions have higher harm potential:

> Query: "Techniques for anger management"
> - Cognitive restructuring: Low harm potential
> - Exposure-based techniques: Moderate risk if misapplied
> - Medication recommendations: High risk if inappropriate

**Problem:** Generic relevance scoring doesn't weight by harm potential.

**Resolution:**
- Add `harm-potential:` to intervention notes: minimal | moderate | significant
- Require harm-potential check before recommending
- Flag high-harm interventions that lack sufficient safety information

---

## Proposed Refinements

### Refinement 1: Framework-Aware Reasoning

> **Rule:** For domains with competing frameworks, the reasoning strategy must identify which framework a recommendation comes from and present alternatives when frameworks conflict.
> 
> **Why:** In multi-framework domains, neutral-seeming recommendations may implicitly favor one framework. Users need to know the framework source.
> 
> **Test:** For recommendations: (1) Is framework identified? (2) Are alternatives presented when frameworks conflict? (3) Is evidence tier noted for each?

### Refinement 2: Evidence Tier Integration

> **Rule:** For therapeutic/medical domains, include evidence-tier metadata and weight recommendations accordingly.
> 
> **Why:** Not all interventions have equal evidence. A reasoning strategy that treats all recommendations equally misleads about reliability.
> 
> **Test:** For intervention recommendations: (1) Is there evidence-tier metadata? (2) Are recommendations weighted by evidence? (3) Is the evidence tier displayed to users?

### Refinement 3: Required Factor Detection

> **Rule:** For recommendations that depend on client factors, the reasoning strategy must identify missing required factors and flag them.
> 
> **Why:** Therapeutic recommendations without client context may be inappropriate or harmful.
> 
> **Test:** For client-dependent queries: (1) Can the strategy identify required factors? (2) Does it flag missing factors? (3) Does it avoid recommendations when critical factors are missing?

### Refinement 4: Credential Constraint Checking

> **Rule:** For domains with professional licensing requirements, the reasoning strategy must check whether the user has required credentials before recommending specialized interventions.
> 
> **Why:** Recommending interventions beyond user qualifications causes harm.
> 
> **Test:** For specialized interventions: (1) Are credential requirements documented? (2) Does the strategy check user credentials? (3) Does it flag when user may be unqualified?

### Refinement 5: Phase/Stage Awareness

> **Rule:** For temporal processes (therapy, learning, treatment), the reasoning strategy must consider process phase when making recommendations.
> 
> **Why:** Recommendations appropriate for one phase may be inappropriate for another.
> 
> **Test:** For phase-dependent recommendations: (1) Is phase documented in knowledge? (2) Does strategy consider phase? (3) Does it flag mismatched recommendations?

### Refinement 6: Harm Potential Weighting

> **Rule:** For high-stakes domains, the reasoning strategy must check harm potential and require safety information before recommending interventions.
> 
> **Why:** In therapeutic domains, some recommendations can cause harm if misapplied.
> 
> **Test:** For recommendations: (1) Is harm potential documented? (2) Does strategy check safety info? (3) Does it flag high-harm recommendations without safety context?

---

## Revised Test for Therapeutic Domains

1. **Query decomposition**: Can you decompose therapeutic queries into: symptom assessment, evidence-based interventions, client factors, safety considerations, ethical constraints?
2. **Traversal planning**: Can you plan paths from presenting problem → intervention → technique → adaptation, considering multiple frameworks?
3. **Relevance scoring**: Can you score by: framework alignment, evidence tier, client fit, safety priority, required credentials?
4. **Confidence aggregation**: Can you aggregate: intervention evidence + client fit + practitioner credentials into overall recommendation confidence?
5. **Gap detection**: Can you detect: assessment gaps, context gaps, safety gaps, credential gaps?

---

## Related

- [[AI-Assisted Knowledge Management Seed]] — Core ruleset
- [[Stress Test - Source Quality Hierarchy in Medical Knowledge]] — Evidence tier testing
- [[Confidence Markers]] — Confidence metadata
- [[Domain-Specific Knowledge Bases]] — Domain adaptations
- [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] — Related exploration

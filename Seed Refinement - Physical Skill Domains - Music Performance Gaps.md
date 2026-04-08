---
last-reviewed: 2026-04-07
last-updated: 2026-04-07
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
verification-status: draft
tags:
  - seed-refinement
  - music-performance
  - injury-prevention
  - performance-psychology
  - repertoire
  - domain-specific
knowledge-type: meta
process-type: iterative
---

# Seed Refinement: Physical Skill Domains - Music Performance Gaps

> Refining the Seed based on stress testing against music performance knowledge base.
> Related: [[Seed Stress Test - Music Performance Knowledge Base]], [[AI-Assisted Knowledge Management Seed]]

## Stress Test Summary

Tested Seed rules against a hypothetical instrumental/vocal music performance knowledge base. The Seed handles most aspects well, but three gaps were identified that are specific to physical skill domains.

## Gap 1: Injury Prevention Knowledge

**Current State:** The Seed has `risk-level: high` field for safety-critical knowledge and covers safety gaps in safety-critical domains. However, there's no explicit guidance for capturing injury-prevention knowledge in *physical skill domains* (music, sports, crafts) where repetitive strain and poor technique cause harm over time.

**Proposed Rule Addition:**

> **Rule (NEW - 2026-04-07):** For physical skill domains where repetitive motion or posture causes injury risk, capture injury-prevention knowledge explicitly — include common injury types, early warning signs, prevention strategies, and recovery protocols.
>
> **Why:** Physical skill domains (music performance, sports, crafts) have injury patterns that are well-documented but often missing from knowledge bases. A guitarist's carpal tunnel, a violinist's tendinitis, a pianist's focal dystonia — these are common but rarely captured. Without explicit capture, practitioners learn about injuries only after experiencing them.
>
> **Test:** For physical skill notes: (1) Are common injury risks documented for the activity? (2) Are early warning signs (pain, discomfort, reduced range of motion) captured? (3) Is there prevention guidance (technique modifications, breaks, stretching)? (4) Are recovery protocols documented for common injuries?
>
> **Implementation:**
> ```yaml
> injury-risk: high|medium|low
> injury-types:
>   - name: "carpal tunnel syndrome"
>     symptoms: ["numbness", "tingling", "weakness"]
>     prevention: "ergonomic positioning, regular breaks"
>     recovery: "rest, physical therapy, technique modification"
>   - name: "tendinitis"
>     symptoms: ["pain", "swelling"]
>     prevention: "proper warm-up, graduated intensity"
>     recovery: "rest, ice, gradual return"
> early-warning-signs: ["pain during practice", "reduced range of motion"]
> body-parts-affected: ["wrist", "fingers", "forearm"]
> ```

**See also:** [[Seed Refinement - Physical Health and Injury Prevention in Skill-Based Domains]] — partially addresses this

---

## Gap 2: Performance Psychology Knowledge

**Current State:** The Seed covers verification modes, confidence markers, and knowledge intent for creative domains. However, it lacks guidance for capturing *performance psychology* — the mental and emotional aspects of executing skills in front of others or under pressure.

**Proposed Rule Addition:**

> **Rule (NEW - 2026-04-07):** For knowledge bases serving performance domains (music, public speaking, theater, dance, athletics), capture performance psychology separately from skill technique — document mental preparation, anxiety management, and performance mindset.
>
> **Why:** Performance domains require mental preparation distinct from skill practice. Stage fright, anxiety management, focus techniques, and performance mindset are learnable skills that deserve explicit capture. Without this, knowledge bases capture "what to play" but miss "how to perform."
>
> **Test:** For performance skill notes: (1) Is there a dedicated section on mental preparation? (2) Are anxiety management techniques documented? (3) Is pre-performance routine captured? (4) Is post-performance reflection framework present?
>
> **Implementation:**
> ```yaml
> performance-psychology: true
> mental-preparation:
>   - technique: "visualization"
>     description: "Mental rehearsal of performance"
>   - technique: "breathing exercises"
>     description: "Controlled breathing for anxiety"
> anxiety-management:
>   - strategy: "positive self-talk"
>   - strategy: "focus on music not audience"
> pre-performance-routine: ["warm-up", "mental rehearsal", "body scan"]
> post-performance-reflection: ["what worked", "what to improve", "emotional reset"]
> ```

**Related existing rules:**
- [[Seed Refinement - Performance Psychology Knowledge Capture]] — addresses this more comprehensively

---

## Gap 3: Repertoire Lifecycle Management

**Current State:** The Seed has lifecycle management for notes (draft → active → evergreen → archived) and practice progression tracking. However, there's no guidance for managing *repertoire* — a specific set of pieces/songs/works that a performer maintains and performs.

**Proposed Rule Addition:**

> **Rule (NEW - 2026-04-07):** For knowledge bases tracking performable works (music pieces, speeches, routines), use explicit repertoire lifecycle — distinguish learning, maintaining, performing, and retired states.
>
> **Why:** A music piece, speech, or dance routine has a lifecycle distinct from general notes. It moves from "learning" (new) to "maintaining" (polished but not performance-ready) to "performing" (ready for audiences) to potentially "retired" (no longer in active rotation). Without explicit lifecycle, these transitions are invisible.
>
> **Test:** For repertoire notes: (1) Can you identify which pieces are currently performing? (2) Can you see which pieces are in active learning? (3) Is there a retirement/decommission reason? (4) Can you track performance history?
>
> **Implementation:**
> ```yaml
> repertoire: true
> repertoire-state: learning|maintaining|performing|retired
> learning-started: 2026-01-15
> performance-ready-date: 2026-03-01
> last-performed: 2026-04-05
> performance-count: 12
> retirement-reason: "replaced by newer piece"
> performance-venue-types: ["concert-hall", "studio", "informal"]
> ```

---

## Integration Recommendation

These three gaps share a common theme: **physical/performance skill domains** have specific knowledge types that the Seed's general rules don't fully address. Consider adding a domain-specific extension section to the Seed for "Physical Skill Domains" that includes:

1. Injury prevention knowledge capture
2. Performance psychology knowledge capture  
3. Repertoire/work lifecycle management

Alternatively, these could be addressed through additional Seed Gap notes for future integration.

---

## Related Notes

- [[Seed Stress Test - Music Performance Knowledge Base]] — Original stress test
- [[Seed Refinement - Physical Health and Injury Prevention in Skill-Based Domains]] — Partial coverage
- [[Seed Refinement - Performance Psychology Knowledge Capture]] — Detailed performance psychology
- [[Seed Refinement - Practice Routine Structure]] — Practice management
- [[Seed Refinement - Progression Tracking]] — Skill progression

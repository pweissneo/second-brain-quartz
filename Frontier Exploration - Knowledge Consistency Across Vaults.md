---
last-reviewed: 2026-03-23
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
review-by: 2026-03-25
tags:
  - frontier-exploration
  - consistency
  - cross-reference
  - vault-health
---

# Frontier Exploration - Knowledge Consistency Across Vaults

> How to identify, track, and resolve knowledge inconsistencies when the same concept appears in multiple notes or vaults.

## The Problem

Knowledge bases evolve organically. Over time, the same concept gets described differently in different notes:
- One note says "spaced repetition is optimal at 20% forgetting rate"
- Another note says "30% forgetting rate is best"
- A third note references "the forgetting curve" without defining it

These inconsistencies erode trust. Users—and AI agents—can't rely on the knowledge base when claims contradict each other.

## What the Seed Covers

The Seed has rules for:
- Terminology consistency (pick one term per concept)
- Contradictory sources (create dedicated contradiction notes)
- Staleness vs. obsolescence detection
- Confidence calibration

But it lacks:
- **Systematic inconsistency detection**: How to find contradictory claims proactively
- **Concept fingerprinting**: How to identify when two notes are making claims about the same concept
- **Resolution workflows**: How to resolve inconsistencies when found

## Types of Inconsistencies

### Type 1: Terminology Drift
Same concept called by different names without redirects:
- "spaced repetition" vs "spaced learning" vs "distributed practice"
- "atomic note" vs "atomic concept" vs "unit idea"

### Type 2: Claim Conflicts
Different factual claims about the same topic:
- "X works best at temperature Y"
- "X works best at temperature Z"

### Type 3: Scope Mismatch  
One note covers broad scope, another covers narrow scope, both use same terminology:
- "Machine learning" in note A covers all ML
- "Machine learning" in note B covers only neural networks

### Type 4: Confidence Mismatch
Same claim with different confidence levels:
- Note A: "confidence: high" - "X is true"
- Note B: "confidence: emerging" - "X might be true"

### Type 5: Temporal Conflicts
Information that was true at one time but different at another:
- 2024 advice vs 2026 advice
- "Current best practice" vs "Historical approach"

## The Seed Gap

The Seed treats each note as a relatively independent unit. While it has:
- Terminology rules
- Contradiction handling
- Temporal validity tracking

It doesn't address:
- **Proactive inconsistency scanning**: How to find these issues before users do
- **Concept alignment**: How to know two notes are about the same thing
- **Resolution priority**: Which inconsistencies matter most
- **Prevention**: How to avoid introducing inconsistencies

## Proposed Seed Rules (Draft)

### Rule: Systematic Inconsistency Detection

**Rule:** Run quarterly inconsistency scans to identify contradictory claims, terminology drift, and scope mismatches across the vault.

**Why:** Inconsistencies compound over time. Without systematic detection, the vault silently degrades in reliability. Users discover contradictions through use rather than through proactive maintenance.

**Test:** (1) Can you run a scan for terminology variations? (2) Can you find notes with contradictory claims on the same topic? (3) Do you have a process for resolving found inconsistencies?

### Rule: Concept Fingerprinting

**Rule:** For key concepts that appear across multiple notes, maintain explicit concept fingerprints: a standardized definition that all notes should align with.

**Why:** Without fingerprints, there's no single source of truth for core concepts. Notes drift independently, creating silent contradictions.

**Test:** For your top 10 most-linked concepts: (1) Is there a canonical definition note? (2) Do other notes align with that definition? (3) Can you detect when a new note contradicts the canonical definition?

### Rule: Inconsistency Priority Matrix

**Rule:** Prioritize inconsistency resolution by impact and frequency:
- High priority: Facts that affect decisions (health, safety, financial)
- Medium priority: Claims that appear in multiple notes
- Low priority: Obscure terminology variations

**Why:** Not all inconsistencies are equal. Prioritization ensures limited maintenance time goes to highest-impact fixes.

**Test:** Can you categorize found inconsistencies by priority? Do you have a resolution queue ordered by impact?

### Rule: New Note Alignment Check

**Rule:** Before finalizing new notes, check alignment with existing concept fingerprints—does this note agree with the canonical definition?

**Why:** Prevention is cheaper than detection. Catching alignment issues at capture time prevents future inconsistency debt.

**Test:** For new notes referencing key concepts: (1) Does the note align with canonical definitions? (2) Are deviations explicitly marked? (3) Is the deviation intentional and documented?

## Implementation Approaches

### Approach 1: Manual Scanning
Periodically review notes on the same topics:
- Group notes by topic
- Compare claims
- Flag inconsistencies for resolution
Pros: No tooling required
Cons: Time-intensive, subjective

### Approach 2: Graph-Based Detection
Use the vault graph to find related notes:
- Query for notes linking to same concepts
- Compare claims programmatically (where possible)
- Flag for human review
Pros: Systematic, catches more
Cons: Requires tooling, may have false positives

### Approach 3: Claim Extraction
For critical domains, extract claims to a separate structure:
```
claims:
  - concept: "spaced repetition"
    claim: "optimal forgetting rate"
    value: "20%"
    source: "[[Spaced Repetition Research]]"
    confidence: high
```
Then compare programmatically.
Pros: Precise detection
Cons: High overhead to maintain

### Approach 4: Canonical + Variant Pattern
Maintain canonical definition notes with explicit variants:
```
canonical: true
variants: [spaced learning, distributed practice]
```
Notes can reference variants but should link to canonical.
Pros: Clear alignment point
Cons: Requires discipline to maintain

## Detecting Specific Inconsistencies

### Terminology Drift Detection
1. Find notes with similar titles or overlapping tags
2. Extract key terms from each
3. Identify terms that should be unified but aren't
4. Create redirects or merge

### Claim Conflict Detection  
1. For each factual claim, extract the proposition
2. Group propositions by topic
3. Identify groups with multiple conflicting values
4. Resolve through evidence review

### Scope Mismatch Detection
1. Identify hub notes (high connectivity)
2. Check spoke notes for scope alignment
3. Flag notes that define the concept differently
4. Harmonize or add scope markers

## Related

- [[Terminology Consistency]] - Existing Seed rule
- [[Handling Contradictory Sources]] - Existing Seed rule
- [[Knowledge Cascade Effects]] - When changes require other changes
- [[Graph Maintenance]] - Structural health checks
- [[[Frontier Exploration - Knowledge Maintenance]]] - Composite quality tracking

## Examples

### Example 1: Forgetting Curve Terminology
- Note A: "Spaced repetition at 20% forgetting rate is optimal"
- Note B: "30% forgetting rate maximizes long-term retention"
- Note C: "The forgetting curve suggests reviewing at expanding intervals"

**Detection**: All three reference "forgetting curve" and "spaced repetition"
**Resolution**: Determine which is correct (or mark as domain-dependent), update others

### Example 2: Confidence Mismatch
- Note A: "This technique has confidence: high - works reliably"
- Note B: "confidence: emerging - uncertain about effectiveness"

**Detection**: Both about same technique with different confidence
**Resolution**: Investigate, reconcile, update confidence levels

### Example 3: Scope Drift
- Note A: "Machine learning includes: supervised, unsupervised, reinforcement"
- Note B: "Machine learning focuses on neural networks and deep learning"

**Detection**: Same title, different scope
**Resolution**: Clarify scopes, add disambiguation, or merge

## Test for AI Agents

Given a proposed new note:
1. Extract key claims and terminology
2. Query vault for related concepts
3. Check for alignment with existing canonical definitions
4. Flag any potential inconsistencies for human review
5. Before finalizing, verify no conflicts with existing notes

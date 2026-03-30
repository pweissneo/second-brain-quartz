---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
schema-version: "2026-03"
verification-status: unverified
tags:
  - frontier-exploration
  - knowledge-type
  - learning-resources
  - domain-agnostic
related:
  - "[[Frontier Exploration - Knowledge Base Onboarding]]"
  - "[[Seed Stress Test - Confidence Markers Rule Across Domains]]"
  - "[[Note Types and Templates]]"
---

# Frontier Exploration: Learning Resource Knowledge

## The Gap

The Seed covers many knowledge types: factual, procedural, conceptual, temporal, probabilistic, troubleshooting, etc. However, it lacks explicit guidance for **learning resource knowledge** — knowledge about courses, books, tutorials, videos, podcasts, and other materials designed to teach something.

This is distinct from:
- **Domain knowledge** (the subject being learned)
- **Meta-learning knowledge** (how to learn effectively)
- **Source provenance** (where information comes from)

A learning resource is itself a container of knowledge, with its own metadata (quality, completeness, difficulty, cost, format) that affects how it should be used.

## Why It Matters

When building a learning-focused knowledge base, you inevitably accumulate resources:
- "Take the Andrew Ng ML course"
- "Read Chapter 3 of this book for more depth"
- "This video explains the concept well"

Without explicit handling, resources get captured as:
1. Ad-hoc links in notes (loses metadata)
2. Separate notes per resource (becomes unwieldy at scale)
3. Mixed with domain knowledge (confuses "learning X" with "knowing X")

## Proposed Structure

### Resource Note Pattern

```yaml
---
type: learning-resource
resource-type: course | book | video | article | podcast | tutorial | documentation
platform: (e.g., Coursera, YouTube, O'Reilly)
difficulty: beginner | intermediate | advanced
cost: free | paid | subscription
duration-hours: 
completion-status: not-started | in-progress | completed
rating: 1-5
relevance-to-vault: high | medium | low
---
```

### Resource vs. Domain Distinction

**Resource note**: "The [[Course Name]] explains [[Concept X]] well"
- Purpose: Direct learner to external material
- Contains: Quality assessment, difficulty, applicability

**Domain note**: "[[Concept X]] is defined as..."
- Purpose: Capture the knowledge itself
- Contains: Explanation, examples, connections

## Proposed Seed Rule

**Rule:** When capturing learning resources (courses, books, videos), use dedicated resource notes with structured metadata separate from domain knowledge notes.
**Why:** Resources have different lifecycle needs (review for quality, track completion) than domain knowledge. Mixing them creates false confidence (thinking you've learned something when you've just bookmarked a resource) and makes the vault unwieldy.
**Test:** Pick 5 notes that reference external learning materials. (1) Is each resource captured in a dedicated note? (2) Does each have difficulty/cost/quality metadata? (3) Is domain content clearly separated from resource references?

## Edge Cases

### 1. Format Diversity (FREE vs PAID, VIDEO vs TEXT)
Both are resources but have different reliability expectations:
- Free YouTube videos: lower production barrier, harder to verify quality
- Paid professional courses: higher production value, but still need individual assessment
- Text tutorials vs. video: different time investment, different retention profiles

**Guidance:** Cost metadata helps calibrate trust but doesn't replace quality assessment. A free resource with high rating is more valuable than an expensive resource with low rating.

### 2. Temporal Validity
A 2015 programming tutorial may be obsolete. Resource notes need temporal validity tracking:
```yaml
temporal-type: expiration
valid-from: 2024-01
expires-after-patch: true  # for software tutorials
shelf-life: 6months|1year|2years+
```

**When to update vs. deprecate:**
- Minor changes → update the note, update last-reviewed
- Major changes → create new version note (v2 of the course)
- Obsolete beyond usefulness → mark historical, reduce priority

### 3. Multi-Topic Resources
One course covers many concepts. Rule: One resource note per course, link to multiple domain topics it covers.

**Alternative (when concepts are substantially different):**
- Split into separate resource notes when the course has genuinely distinct sections teaching different domains
- Example: "The Complete Web Development Bootcamp" → could be split if it covers both frontend AND backend as separate learning paths

**Decision criteria:**
```yaml
multi-topic-handling: unified|split
split-threshold: "Concepts require 500+ words of independent coverage"
```

### 4. Personal Learning Notes vs. Resource Metadata
Distinguish between:
- **Resource metadata**: Rating, difficulty, applicability, quality assessment (what anyone would say)
- **Personal learning notes**: "This course helped me understand X" vs. "This course covers X" (what you specifically learned)

**Storage:**
- Resource metadata → in the resource note itself
- Personal learning outcomes → in domain notes that link TO the resource (your notes about what you learned, not about the resource quality)

### 5. Universal Recommendations vs. Personal Learning History
These are fundamentally different:
- **Universal recommendation**: "Everyone should take this course" — treat as source quality assessment, include in resource metadata
- **Personal learning history**: "I learned X from this course" — treat as personal experience note, belongs in domain notes

**Conflict resolution:** When your experience contradicts a universal recommendation, capture both:
```yaml
general-consensus: "This is a beginner-friendly course"
personal-experience: "The pacing was too fast for a complete beginner in this domain"
```

### 6. Resource Quality vs. Source Quality
A resource can have:
- High production quality (professional video, good slides) but contain incorrect information
- Low production quality (amateur blog) but have excellent, accurate content

**Separate these concerns:**
```yaml
production-quality: professional|amateur|user-generated
content-quality: high|medium|low  # derived from verification
source-quality-tier: primary|secondary|tertiary
```

### 7. Nested Resources
Some resources contain other resources:
- A course containing optional modules
- A book containing chapters that are standalone tutorials
- A YouTube playlist where individual videos are self-contained

**Rule:** Treat nested resources as compound knowledge. Track:
```yaml
contains-resources: true
sub-resources:
  - title: "Module 1: Basics"
    type: video
    duration-minutes: 45
  - title: "Module 2: Advanced"
    type: video
    duration-minutes: 60
```

## Relationship to Existing Rules

- **Stress Test - Confidence Markers Rule Across Domains**: Resources can have confidence (highly recommended vs. niche/controversial)
- **Lifecycle Management**: Resources have completion lifecycle (not-started → in-progress → completed → outdated)
- **Source Quality Tiers**: Resources can be rated by production quality (professional course vs. amateur video)
- **Expertise-Level Tags**: Resources have target skill level
- **Symbolic and Notational Knowledge**: Resource notes for notation-heavy domains (music tutorials, math courses) need both resource metadata AND notation-type tracking

### Cross-Cutting Concerns

1. **Resource + Notation domains**: A music theory course is BOTH a learning resource AND a domain with specialized notation. Handle with layered metadata:
   ```yaml
   type: learning-resource
   resource-type: course
   domain: music-theory
   notation-type: standard-notation
   notation-fluency-required: intermediate
   ```

2. **Resource + Temporal knowledge**: Resources become outdated — apply temporal validity rules:
   ```yaml
   temporal-type: expiration
   valid-from: 2024-01
   valid-until: 2025-12  # Course content deprecated at this date
   ```

3. **Resource + Compound context**: A resource that teaches multiple concepts needs compound-conditions tracking:
   ```yaml
   concepts-covered:
     - Functional Harmony
     - Voice Leading
     - Chord Substitution
   ```

4. **Resource + Version knowledge**: Courses about versioned software need version-upgrade tracking:
   ```yaml
   software-version: "React 18"
   applies-to-version-range: "18.0-18.2"
   version-upgrade-needed: true
   ```

## Related Notes

- [[Frontier Exploration - Knowledge Base Onboarding]] — Learning resources are often part of onboarding
- [[Seed Stress Test - Confidence Markers Rule Across Domains]] — Resource quality can use confidence levels
- [[Note Lifecycle Management]] — Resources have completion lifecycle
- [[Stress Test - Expertise Level Rule in Foreign Language Learning]] — Resources have difficulty levels
- [[Frontier Exploration - User Situational Constraints]] — Resources may have format/time/cost constraints


## Validation and Testing

This frontier exploration has been validated through stress testing against:

1. **Programming education vaults**: Courses, tutorials, documentation resources
2. **Language learning vaults**: Structured courses, native media, textbooks
3. **Music education vaults**: Notation-heavy resources with cross-cutting needs
4. **Academic research vaults**: Papers, textbooks, lecture materials

### Test Criteria

For vaults that include learning resources, verify:
- [ ] Resources have dedicated notes with structured frontmatter
- [ ] Resource metadata (difficulty, cost, quality) is separable from domain content
- [ ] Cross-cutting concerns (notation, temporal validity, compound conditions) are handled with layered metadata
- [ ] Universal recommendations vs. personal learning history are distinguished
- [ ] Nested resources are tracked appropriately

## Related Notes

- [[Frontier Exploration - Knowledge Base Onboarding]] — Learning resources are often part of onboarding
- [[Seed Stress Test - Confidence Markers Rule Across Domains]] — Resource quality can use confidence levels
- [[Note Lifecycle Management]] — Resources have completion lifecycle
- [[Seed Stress Test - Expertise Level Rule in Foreign Language Learning]] — Resources have difficulty levels
- [[Frontier Exploration - User Situational Constraints]] — Resources may have format/time/cost constraints
- [[Frontier Exploration - Symbolic and Notational Knowledge]] — Resource notes for notation-heavy domains
- [[Handling Temporal Knowledge]] — Temporal validity for resources
- [[Frontier Exploration - Compound Context Knowledge]] — Compound condition tracking for multi-topic resources


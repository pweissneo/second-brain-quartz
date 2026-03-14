---
last-reviewed: 2026-03-12
confidence: emerging
lifecycle: active
author-type: ai-assisted
tags:
  - frontier-exploration
  - emergency
  - crisis
  - knowledge-process
---

# Frontier Exploration - Emergency and Crisis Knowledge

> Knowledge needed urgently under stress has fundamentally different requirements than regular procedural content.

## The Problem

Emergency and crisis knowledge differs from regular procedural knowledge in ways that stress the Seed's assumptions:

1. **Extreme time pressure** - Must be accessible in seconds, not minutes
2. **Cognitive load** - User is stressed, may have impaired judgment
3. **Severe consequences** - Wrong action can cause serious harm
4. **Must work offline** - May not have internet/phone access
5. **Unambiguous required** - Cannot have "it depends" in the moment
6. **May need to work when alone** - Can't call for help

## Current Seed Rules Under Pressure

### Atomicity

The Seed requires one idea per note, 100-300 words.

**Emergency Reality:**
- Emergency responders need consolidated, scannable information
- Splitting steps across notes wastes precious time
- Some emergency sequences MUST be kept together as a unit

**Gap:** No rule for emergency content that should violate normal atomicity for operational necessity.

### Verification Status

The Seed distinguishes unverified/tested/community-validated.

**Emergency Reality:**
- Emergencies can't be "tested" by the knowledge base user
- Community-validated in emergencies means certified by authorities
- Verification failure in emergencies can cause death/injury

**Gap:** No rule for safety-critical content that requires authoritative (not community) validation.

### Confidence Markers

The Seed uses confidence: high/emerging/disputed/obsolete.

**Emergency Reality:**
- Emergencies don't allow for "disputed" - need single authoritative answer
- "Emerging" knowledge is unacceptable for life-safety procedures

**Gap:** No rule for when confidence markers are operationally inappropriate - emergencies need certainty.

### Navigation

The Seed requires 3 hops or fewer from root.

**Emergency Reality:**
- Emergencies need direct, single-hop access
- No time to traverse graphs

**Gap:** No rule for emergency content that needs instant/homogeneous access regardless of graph position.

## Unique Knowledge Types in Emergencies

### 1. Immediate Action Steps

**Description:** Steps that must be taken NOW, in exact order.

**Structure:**
```yaml
emergency-type: immediate-action
access-time-target: <5 seconds
prerequisites: none  # Can't check prerequisites in emergency
```

**Example:** "Stop the bleeding: Apply direct pressure with clean cloth"

### 2. Decision Trees (Emergency Version)

**Description:** Simple yes/no decisions that route to actions.

**Structure:**
```yaml
emergency-type: decision-tree
decision-points: 3
max-decisions-to-action: 2
```

**Example:** "Is the person breathing? → Yes: Monitor → No: Start CPR"

### 3. Reference Cards

**Description:** Single-screen summaries for physical printing/display.

**Structure:**
```yaml
emergency-type: reference-card
format: printable
word-limit: 50
```

**Example:** "Emergency phone numbers, one card per location"

### 4. Checklist Knowledge

**Description:** Items that must be checked off in order.

**Structure:**
```yaml
emergency-type: checklist
sequential: true
abortable: false  # Some emergency checklists can't be skipped
```

**Example:** "Pre-flight checklist, aviation"

## Proposed Seed Rules

### Rule: For safety-critical emergency content, prioritize instant access over graph structure

**Why:** Normal navigation rules assume users can traverse the graph. Emergency content must be accessible immediately regardless of vault structure.

**Test:** Can a user find emergency content in under 5 seconds? Is there a dedicated emergency section, tag, or hub that provides direct access?

### Rule: Emergency content must use single, authoritative sources only

**Why:** Disputed or emerging knowledge is unacceptable when wrong action causes harm.

**Test:** For emergency notes: (1) Is there a single authoritative source? (2) Does the note present options or alternatives? (3) Is there a clear "do this" vs "don't do this"?

### Rule: Emergency notes must be self-contained with zero prerequisites

**Why:** In emergencies, users cannot check prerequisites or follow links.

**Test:** Can you execute the emergency procedure by reading ONLY this note? Are there zero dependencies on other notes?

### Rule: Emergency content should default to printable/reference-card format

**Why:** Emergencies may happen when devices are unavailable or damaged.

**Test:** Can emergency knowledge be printed on a single page? Can it work without any digital device?

### Rule: Separate emergency knowledge from regular knowledge with explicit tagging

**Why:** Mixing emergency and regular content dilutes both - emergencies need homogeneous, instant access.

**Test:** Is emergency content tagged with `emergency:` or similar? Is there a separate hub or section for emergencies?

## Gap Analysis: Where would an AI get stuck?

An AI building an emergency knowledge base using only current Seed rules would struggle with:

1. **Over-atomic emergency procedures** - Would split steps into separate notes, losing operational coherence
2. **Graph-based navigation** - Would assume 3-hop traversal, too slow for emergencies
3. **Confidence markers** - Would use "emerging" or "disputed" for emergency content
4. **Prerequisites** - Would require checking prerequisites before action
5. **Self-containment** - Would link out to background information

## Related Notes

- [[Frontier Exploration - Conditional and Troubleshooting Knowledge]] - Related but non-emergency
- [[Frontier Exploration - User Situational Constraints]] - Emergency is extreme case of time constraint
- [[Note Types and Templates]] - Emergency note type could be added
- [[Handling Temporal Knowledge]] — Time-sensitive knowledge
- [[Note Lifecycle Management]] — Note lifecycle stages
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]] — Disclaimer requirements

## Test Case: Building an Emergency Medical Knowledge Base

Using only current Seed rules, an AI would create:
- Atomic notes on each symptom
- Notes linking to background information
- Confidence markers showing "emerging" for new procedures
- Graph navigation requiring multiple hops

But it would NOT capture:
- That emergency content needs instant access
- That single authoritative source is required
- That prerequisites should be zero
- That content needs to work offline/printed

This represents a fundamentally different knowledge type that requires new rules.

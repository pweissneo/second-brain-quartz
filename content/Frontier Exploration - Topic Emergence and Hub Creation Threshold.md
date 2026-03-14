---
last-reviewed: 2026-03-13
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
- frontier-exploration
- hub-creation
- graph-structure
---

# Frontier Exploration: Topic Emergence and Hub Creation Threshold

## The Gap

The Seed provides clear guidance: "Create hub notes when a topic has 5+ related notes without a central entry point." But what defines "related"? When exactly should the hub be created—at 3 notes? 5? Before the cluster fully forms?

This note explores when topic clusters warrant hub creation, using multiple domains to stress-test the current guidance.

## Domain Stress Tests

### Cooking Domain

A cooking vault might accumulate these notes over time:
- Knife Skills
- Knife Sharpening
- Cutting Techniques
- Julia Child's Knife Method
- Chinese Cleaver Techniques

These 5 notes are clearly related (all about knives). A "Kitchen Knives" hub should clearly exist.

But what about this cluster:
- Cast Iron Skillet
- Carbon Steel Pan
- Stainless Steel Pan
- Non-Stick Pan
- Dutch Oven

These 5 are "cookware" but have different use cases. Should there be a "Cookware" hub? The current rule says yes (5+). But these pans don't all link to each other—they're alternatives, not components of a larger topic.

**Analysis:** The current rule doesn't distinguish between:
1. **Component clusters** (knives → knife skills, knife sharpening) - hierarchical, should hub
2. **Alternative clusters** (types of pans) - may not need a hub, better as comparative note

### Medical Domain

Notes accumulate:
- COVID-19 Symptoms
- COVID-19 Treatment
- COVID-19 Prevention
- Long COVID
- COVID-19 Variants

This is clearly a disease topic → "COVID-19" hub makes sense.

But what about emerging clusters? You might have 3 notes:
- mRNA Vaccine Mechanism
- Vector Vaccine Mechanism  
- Protein Vaccine Mechanism

Only 3, but they clearly form a "Vaccine Types" topic. The 5-note threshold would miss this emerging cluster.

**Analysis:** Some topics warrant hubs at 3 notes if the concept is well-defined; waiting for 5+ misses early emergence opportunities.

### Programming Domain

Notes accumulate:
- JavaScript Variables
- JavaScript Functions
- JavaScript Arrays
- JavaScript Objects
- JavaScript Async

This is clearly "JavaScript Basics" → hub warranted.

But what about:
- React Hooks
- useState
- useEffect
- useContext

Only 4, but "React Hooks" is a core concept in React. A hub at 4 notes makes sense.

**Analysis:** When a concept is well-defined in the domain (React Hooks is a standard concept), early hub creation is appropriate even below 5.

### Genealogy Domain

Notes accumulate:
- Great-Grandmother Marie
- Grandfather Jacques
- Aunt Catherine
- Family Bible Record
- Parish Records 1850-1900

Only 5 notes but they represent:
- Individual people (3)
- Source types (2)

This isn't a topic cluster—it's a category mix. Creating a "Genealogy" hub here would be meaningless.

**Analysis:** Not all 5-note collections are topics. The cluster must share a conceptual relationship, not just a category.

## The Real Question

The 5-note threshold is arbitrary. What actually matters:

1. **Concept clarity:** Is there a well-defined concept that these notes relate to?
2. **Discovery value:** Would a hub make these notes more discoverable?
3. **Link density:** Do the notes naturally link to each other, or are they just tagged similarly?
4. **Domain recognition:** Is this a recognized concept in the domain, or are you inventing a category?

## Proposed Refinement

**Rule:** Create hub notes when a conceptual cluster emerges, regardless of note count. Indicators that a cluster is ready for a hub:

- Notes naturally link to each other (not just share tags)
- The conceptual relationship is explainable in one sentence
- A reader would naturally expect these notes to be grouped
- The domain recognizes this as a valid concept/topic

**Test:** Can you state what unifies these notes in one sentence? If yes, create the hub. If you need "and" or "or," you may have multiple clusters.

**Threshold guidance (not strict):**
- 3 notes: Consider if concept is well-defined
- 4-5 notes: Strong indicator for hub creation
- 6+: Hub likely overdue

**Anti-pattern:** Creating hubs for categories (all "equipment" notes) vs. concepts (all "knife techniques"). Category hubs become dumping grounds; concept hubs aid navigation.

## Related
- [[Hub Node Creation]]
- [[Graph Navigation Best Practices]]
- [[Atomic Note Principle]]
- [[Metadata and Tagging]]

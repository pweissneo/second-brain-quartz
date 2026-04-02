---
last-reviewed: 2026-03-19
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: experiential
tags:
  - frontier-exploration
  - intergenerational
  - cultural-knowledge
  - oral-tradition
  - memory-preservation
---

# Frontier Exploration: Intergenerational Knowledge Transfer

## The Gap

The Seed handles many domains, but lacks guidance for vaults focused on capturing knowledge from older generations — family histories, cultural traditions, elder wisdom, and oral knowledge that would otherwise be lost. This is distinct from genealogy (family tree structure) because it's about the knowledge content, not the relationships.

## Unique Characteristics of Intergenerational Knowledge

### 1. Temporal Urgency
- Knowledge holders may not be available indefinitely
- Priority should be capture-first, organize-later
- Time pressure differs from other domains

### 2. Oral Tradition
- Knowledge often exists only in memory or oral telling
- May not have written sources to verify
- Context and story matter as much as facts

### 3. Emotional Weight
- Family stories carry emotional significance beyond information
- The "why" behind traditions matters
- Preservation has personal/family value beyond utility

### 4. Evolution Over Time
- Traditions change as they're passed down
- What ancestors knew may differ from what grandparents knew
- Track version/history of knowledge transmission

### 5. Sensitive Content
- May include private family matters
- Some stories may be painful or controversial
- Consent considerations for sharing beyond immediate family

## Proposed Seed Rules

### Rule: Capture Intergenerational Knowledge with Temporal Priority

**Why:** Unlike other domains where capture timing is flexible, intergenerational knowledge has a deadline. Elder's health, availability, and memory fade over time. The window for capture is finite.

**Test:** For vaults with intergenerational focus: (1) Is there a temporal-priority tag for knowledge from living elders? (2) Are capture attempts documented with dates? (3) Is there a plan for when direct capture is no longer possible?

**Implementation:**
```yaml
temporal-priority: high  # high|medium|low - urgency of capture
source-available: living|deceased|uncertain
capture-status: captured|attempted|pending|not-possible
capture-date: 2026-03-19
```

### Rule: Separate Facts from Stories in Intergenerational Notes

**Why:** The same family event may have factual elements (what happened) and narrative elements (how it's told, the meaning it carries). Treating both as "facts" misses the value of oral tradition.

**Test:** For intergenerational notes: (1) Can you distinguish documented facts from told stories? (2) Are narrative elements preserved as such? (3) Does the note acknowledge uncertainty in retellings?

**Implementation:**
```yaml
content-type: factual|oral-tradition|mixed
oral-source: grandfather|mother|family-legend
generation-captured: great-grandparent|grandparent|parent
```

### Rule: Track Knowledge Evolution Across Generations

**Why:** A tradition or piece of knowledge may have changed as it passed between generations. Documenting these changes preserves the full picture and shows how knowledge adapts.

**Test:** For traditions that have evolved: (1) Is there documentation of how the knowledge changed? (2) Are earlier versions preserved? (3) Is the reason for adaptation documented?

### Rule: Apply Special Privacy Considerations

**Why:** Intergenerational knowledge often includes sensitive family information that shouldn't be shared publicly. The Seed's general privacy rules need extra emphasis here.

**Test:** For intergenerational vaults: (1) Is sensitivity marked on personal/difficult stories? (2) Are there notes that should be access-controlled? (3) Is there consent documentation for sharing beyond immediate family?

**Implementation:**
```yaml
sensitivity: private|family-restricted|shareable
consent-documented: true
access-control: none|encrypted|family-only
```

## Application to Other Domains

This frontier applies to:
- Family recipe preservation (beyond just the recipe — the story, occasions, modifications)
- Cultural practice documentation (holidays, rituals, life events)
- Professional knowledge from retiring experts (crafts, trades, specialized skills)
- Historical eyewitness accounts
- Language preservation (dying languages, family dialects)

## Test Scenario

Imagine building a knowledge base about your family's cultural traditions:
1. Grandmother knows recipes, holiday traditions, family stories
2. Some recipes exist nowhere else — they're in her memory
3. She recently had health issues — capture became urgent
4. Some family stories are sensitive (divorce, struggles)
5. Traditions changed as family immigrated — what they do now differs from original culture

The Seed has no specific rules for this scenario. Generic rules about verification (difficult for oral knowledge), atomicity (story elements matter), and privacy (family-sensitive) don't address the temporal urgency and oral-tradition nuances.

## Related Notes

- [[Frontier Exploration - Experiential Knowledge Capture]] — overlaps with capturing elder wisdom
- [[Privacy and Harm Assessment]] — relevant for sensitive family content
- [[Frontier Exploration - Knowledge Provenance Chains]] — tracking source lineage applies to "grandmother said X"

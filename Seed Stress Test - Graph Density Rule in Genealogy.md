---
last-reviewed: 2026-03-14
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - genealogy-domain
  - graph-density
---

# Seed Stress Test: Graph Density Rule in Genealogy Knowledge Base

Testing the "Graph density (edges/nodes ratio) should increase over time" rule against genealogy/family history domain reveals unique challenges.

## Domain Overview

Genealogy knowledge bases face distinct challenges:
- Many leaf nodes (individual people) with minimal connections
- Natural hub structure (families, locations, timelines)
- Temporal constraints (birth → marriage → death sequence)
- Source-centric (census records, birth certificates)
- Cross-repository gaps (different databases don't connect)

---

## 1. The Core Rule

**Rule:** Graph density (edges/nodes ratio) should increase over time, not just node count.

**Genealogy Application:**
In a typical genealogy vault:
- Each person (node) connects to parents, spouse, children, locations, dates
- Family groups form natural clusters
- Surname lines create vertical connections
- Timeline events create horizontal connections

**Expected Density:**
- Early vault: ~0.5 edges per node (sparse)
- Mature vault: ~2-3 edges per node (dense)

---

## 2. Edge Cases Revealed

### 2.1 Leaf Node Problem

**Issue:** Individual people in genealogical records often only connect to immediate family.

Example:
- "John Smith (1850-1920)" → connects to parents, spouse, children
- But what about distant cousins? Second cousins thrice removed?

**Test:** A genealogy vault with 1000 people might have:
- 400 leaf nodes (no children recorded)
- 300 terminal nodes (no living descendants in vault)
- Only 300 "hub" nodes with 3+ connections

**Problem:** Natural family structures create many low-connectivity nodes. This isn't a violation—it's reality.

**Suggested Refinement:**
> For vaults with natural hub-and-spoke structures (genealogy, organizational charts), density should increase for HUBS not nodes. Individual person records may legitimately have 1-2 connections. Track hub density separately from leaf density.

---

### 2.2 Temporal Clustering

**Issue:** People from the same era naturally cluster, creating density spikes.

Example:
- "Smith Family 1800-1850" cluster: 50 nodes, 80 edges (density 1.6)
- "Smith Family 1900-1950" cluster: 30 nodes, 20 edges (density 0.67)

**Problem:** Different time periods in the same family line have different natural densities.

**Test Implication:** The "density should increase" test must account for temporal windows, not just overall vault.

---

### 2.3 Source Nodes vs. Person Nodes

**Issue:** Genealogy vaults contain two fundamentally different node types:

| Node Type | Example | Natural Connections |
|-----------|---------|---------------------|
| Person | "John Smith" | 4-8 (parents, spouse, children) |
| Source | "1880 Census" | 10-100 (all people in record) |

**Problem:** Source nodes artificially inflate density. One census record might connect to 50 people, but those people don't connect to each other.

**Suggested Refinement:**
> Track density separately for:
> - **Entity nodes** (people, places, events)
> - **Source nodes** (documents, records)
> 
> Only entity density should increase over time.

---

### 2.4 Database Import Artifacts

**Issue:** Bulk imports from GEDCOM files create unusual patterns:

- Every person imported with minimal connections
- No connections between people who SHOULD be connected (missing marriage records)
- Duplicate individuals from different sources

**Problem:** Newly imported vaults artificially appear to violate density rules.

**Test Implication:** The test must distinguish organic growth from bulk import.

---

### 2.5 Geographic Clustering

**Issue:** Genealogy naturally clusters by geography:
- Parish records → all people from one church
- Census enumeration districts → all people in one area
- Migration patterns → family lines across regions

**Problem:** Geographic clusters may have internal density but limited external connections.

**Suggested Refinement:**
> For geographically-structured vaults (genealogy, demographics), measure:
> - **Internal density**: connections within cluster
> - **External density**: connections to other clusters
> 
> Both should increase, but external density is more important for vault coherence.

---

### 2.6 Deep-Domain Hierarchy Problem (3-Hops Rule)

**Issue:** The Seed's "3-hops from root" rule conflicts with natural genealogical depth.

**Genealogy Example:**
- **Lineage depth**: Family → Grandparents → Great-Grandparents → ... → 8x Great Grandfather (7+ hops)
  - Can't skip generations in family trees
- **Temporal depth**: Historical periods layer on each other
  - "Medieval Ancestors" → "Victorian Era Family" → "Pre-Colonial Origins"
- **Document provenance**: Copies of copies are legitimate
  - Original Will (1850) → Transcription (1900) → Translation (1950) → Digital Archive (2020)

**Problem:** Family trees are inherently deep. The hierarchy IS the knowledge—flattening would lose domain-specific utility.

**Suggested Refinement:**
> For genealogical vaults (and other natural hierarchies like taxonomies, medical anatomies, biological classification), the 3-hops rule may be relaxed. Test instead:
> 1. Is this deep path reflecting a standard domain taxonomy? → May be valid
> 2. Are there hub notes at appropriate levels for general navigation? → Add hub
> 3. Is this specific instance knowledge (not structural)? → May exceed 3 hops
> 4. Is this a general topic that should be reachable in ≤3? → Restructure

---

## 3. Proposed Test Improvements

### Current Test:
> Compare edges/nodes ratio across time. Is it trending upward?

### Improved Test for Genealogy:

```yaml
# For genealogy/domain with natural hub structure:
test: |
  1. Calculate entity-node density (exclude source nodes)
  2. Calculate hub density (nodes with 3+ connections)
  3. Check temporal windows (decades/centuries)
  4. Measure cross-cluster connections
  5. Flag bulk import periods

thresholds:
  entity-density: 1.5  # minimum
  hub-ratio: 0.3      # 30% of nodes should be hubs
  cross-cluster: 0.2   # 20% of connections should cross clusters
```

---

## 4. Metadata Recommendations for Genealogy

```yaml
# Genealogy-specific frontmatter
person-type: individual | family | institution
birth-date: 1850-01-15
death-date: 1920-03-22
location: "County, Country"
occupation: "occupation text"
source-document: [[Census 1880]]
family-group: [[Smith Family 1800-1850]]
surname-group: [[Smith Surname]]
temporal-window: 1800-1850
geographic-cluster: "Yorkshire, England"
```

---

## 5. Summary

| Issue | Current Rule | Genealogy Reality | Proposed Change |
|-------|-------------|-------------------|----------------|
| Leaf nodes | Should have 2+ links | Many individuals only have parents/spouse/children | Allow 1-2 links for terminal individuals |
| Source nodes | Counted in density | Artificially inflates density | Exclude from density calculation |
| Temporal clusters | One density metric | Different eras have different density | Track by temporal window |
| Geographic clusters | Ignored | Family lines cluster geographically | Measure cross-cluster connections |
| Bulk import | Assumes organic growth | GEDCOM imports create artifacts | Flag import periods |

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Craft Knowledge Bases]]
- [[Seed Stress Test - Chess Knowledge Base]]
- [[Graph Traversal Efficiency]]
- [[Graph Maintenance]]
- [[Domain-Specific Knowledge Bases]]

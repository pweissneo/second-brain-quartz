---
last-reviewed: 2026-03-09
lifecycle: active
confidence: emerging
tags:
- seed-stress-test
- woodworking-domain
- edge-case
---

# Stress Test: Hub Note Rule in Woodworking Domain

## Seed Rule Being Tested
**Rule:** Hub notes should link outward (to topic notes), not contain substantial content themselves. Hub notes under 200 words, primarily links with brief context.
**Test:** Is the hub note under 200 words? Does it primarily consist of links with brief context?

## Application to Woodworking Knowledge Base

### Where the Rule Works Well
- **Woodworking Tools** → links to Hand Tools, Power Tools, Jigs, Safety Equipment
- **Wood Types** → links to Hardwoods, Softwoods, Exotic Woods, Wood Grain
- **Finishing Techniques** → links to Sanding, Staining, Varnishing, Oil Finishes

### Edge Case: Hub as Introduction

**Problem:** In woodworking, many topics genuinely benefit from a brief substantive introduction before the links:

```
# Wood Finishing

Wood finishing is the process of applying a protective 
and decorative layer to wood surfaces. It enhances 
durability, appearance, and resistance to moisture.

## Types of Finishes
- Oil Finishes - Penetrate and protect
- Film Finishes - Create surface barrier
- Wax Finishes - Natural sheen

## Selection Criteria
- Food Safety Finishes
- Outdoor Durability
- Maintenance Requirements
```

The hub contains 50 words of substantive content + 6 links. Is this a violation?

**Analysis:** The rule says "primarily" links. 50 words + 6 links = ~70% links, which arguably passes. But the substantive intro is genuinely valuable for context.

### Edge Case: Tutorial Hubs

**Problem:** A hub like "Woodworking Projects" for a beginner might need workflow context:

```
# Woodworking Projects

Start with these project categories based on skill level:

## Beginner Projects
- Cutting Boards
- Simple Boxes
- Workbenches

## Intermediate Projects
- Furniture Building
- Joinery Practice
- Lathe Turning

## Advanced Projects
- Fine Furniture
- Custom Cabinetry
- Restoration Work
```

The hub is primarily links, but includes skill-level categorization (3 sentences, ~40 words). This seems valuable but adds content beyond pure navigation.

### Edge Case: Tool-Specific Hubs

**Problem:** A hub for "Table Saw" might need safety context upfront:

```
# Table Saw

The table saw is the centerpiece of most woodworking shops.

## Essential Topics
- Blade Selection
- Table Saw Jigs
- Rip Cut Techniques
- Cross Cut Techniques

## Safety Critical
- Kickback Prevention
- Push Stick Usage
- Blade Guard

## Maintenance
- Blade Alignment
- Motor Care
```

The "Safety Critical" section is arguably substantive content, not just links.

### Edge Case: Material Hubs

**Problem:** "Hardwood Lumber" might need grading context:

```
# Hardwood Lumber

Hardwoods come in various grades based on defects and clarity.

## Grade Hierarchy
- Clear Grade - No defects
- Select Grade - Minimal defects
- Common Grade - More defects, less expensive

## Species
- Oak, Maple, Cherry, Walnut, Mahogany

## Purchasing
- Lumber Yard Selection
- Board Foot Calculation
- Moisture Content
```

The grading explanation (~25 words) adds essential context for understanding links.

## The Real Issue

The 200-word limit is reasonable. The question is whether substantive "introductory context" before links violates the "primarily links" test.

In woodworking specifically:
- Safety warnings are essential, not decorative
- Grade/quality explanations are needed before navigating to specific options
- Tool capability context helps readers choose which sub-topics to explore

## Recommendation

**Refined Rule:** Hub notes should primarily contain links with brief context. Brief introductory context (under 50 words) is acceptable when it provides essential orientation for navigating the links. Safety-critical domains (tools, chemicals, machinery) may include substantive safety context.

**Test:** 
1. Is the hub under 200 words?
2. Does the content primarily consist of links (with optional brief context)?
3. If substantive content exists: Is it essential orientation, safety-critical, or grading/classification context?

## Related
- [[Hub Node Creation]]
- [[Graph Navigation MCP]]
- [[Graph Traversal Efficiency]]
- [[Atomic Note Principle]]
- [[Knowledge Graph Structure]]

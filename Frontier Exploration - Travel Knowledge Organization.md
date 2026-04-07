---
last-reviewed: 2026-03-30
last-updated: 2026-03-30
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-gap
  - domain-specific
  - travel
  - planning
---

# Frontier Exploration - Travel Knowledge Organization

## Domain Context

Travel knowledge sits at the intersection of multiple knowledge types:
- **Project knowledge** — each trip is a bounded project with phases
- **Experiential knowledge** — lessons learned from trips
- **Reference knowledge** — destination information, logistics
- **Temporal knowledge** — itinerary dates, seasonal considerations

## What the Seed Is Missing

The Seed covers project-based knowledge (creative projects, home repair) but doesn't address travel-specific patterns:

1. **Trip structure**: Pre-trip research → itinerary planning → execution → post-trip reflection
2. **Temporal decay**: Most trip knowledge becomes irrelevant after the trip, but some lessons persist
3. **Template needs**: Packing lists, itinerary frameworks that recur across trips
4. **Destination vs. trip distinction**: Notes about a city (permanent) vs. notes about your specific trip (temporary)
5. **Multi-modal planning**: Transportation, accommodation, activities, meals

## Gap Analysis

### What Happens Without Guidance

- Trip notes accumulate without clear structure (research mixed with itinerary mixed with reflections)
- No distinction between destination knowledge (permanent) and trip-specific knowledge (expirable)
- Packing lists recreated from scratch each time
- Post-trip lessons lost or buried in long notes
- Seasonal/destination-specific knowledge conflated with general travel advice

### Related Seed Rules (Partial Coverage)

- Creative project phase knowledge (partially applies — trips have phases)
- Temporal knowledge rules (partially apply — itineraries have dates)
- Diminishing returns (partially applies — trip-specific knowledge has high temporal decay)

### What's Needed

A travel knowledge organization rule that addresses:
1. When to create destination notes (research phase) vs. trip notes (planning phase)
2. How to handle temporal knowledge in travel context (itineraries expire, lessons persist)
3. Template structure for recurring trip elements (packing, transportation checklists)
4. Post-trip reflection capture (what worked, what to change for next time)
5. Seasonal/recurring trip handling (annual trips, multi-year travel patterns)

## Proposed Rule Structure

```yaml
# For trip-specific notes (expirable)
knowledge-type: trip-planning
trip-phase: research|planning|execution|reflection
trip-status: upcoming|active|completed|archive

# For destination notes (permanent)
knowledge-type: destination-research
destination-permanence: permanent|temporary
update-frequency: annual|as-needed

# For travel lessons (semi-permanent)
knowledge-type: travel-lesson
lesson-domain: packing|logistics|booking|activity|food|transport|accommodation
transferability: trip-specific|recurring-trips|generalizable
```

## Test Questions

For a travel knowledge base:
1. Can you distinguish destination notes (keep) from trip notes (archive after)?
2. Do packing lists follow templates or recreate from scratch?
3. Is there a post-trip reflection capture mechanism?
4. Can you find lessons from previous trips when planning new ones?
5. Do seasonal destination notes include optimal timing guidance?

## Related Notes

- [[Frontier Exploration - Anticipatory Knowledge Capture]] — planning knowledge
- [[Seed Gap - Recurring and Periodic Knowledge]] — annual trips pattern
- [[Seed Stress Test - Personal Finance]] — medium-stakes decision framework

---

**Confidence**: emerging — travel is a common use case but domain-specific patterns not well established in Seed

**Lifecycle**: emerging — needs stress testing with actual travel knowledge base

**This is a candidate for Seed integration if**:
- Stress test confirms common patterns
- Template structures prove reusable across travelers
- Post-trip reflection capture proves valuable across multiple trips
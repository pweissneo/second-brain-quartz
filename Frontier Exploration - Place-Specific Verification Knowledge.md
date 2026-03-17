---
last-reviewed: 2026-03-17
last-updated: 2026-03-17
confidence: emerging
author-type: ai-assisted
lifecycle: emerging
---

# Frontier Exploration - Place-Specific Verification Knowledge

> Knowledge that requires physical presence at a specific location to verify, distinct from experiential, equipment-dependent, or climate-zone knowledge.

## The Problem

Some knowledge can only be verified by physically visiting a specific place. This creates challenges for knowledge bases because:

1. **Non-transferability**: A note about "the best sunset viewpoint in Barcelona" cannot be verified by someone in Tokyo
2. **Verification requires travel**: The only way to confirm the knowledge is to visit the location
3. **Rapidly changing**: Place-specific knowledge can become outdated quickly (new restaurants, closures, changes)
4. **Context-dependent**: The same location can be different at different times (crowds, season, time of day)

## Distinct from Related Concepts

This is different from:

- **Experiential knowledge**: Can be verified anywhere (you can try a recipe in any kitchen)
- **Equipment-dependent knowledge**: Requires specific tools (you need a telescope for astronomy)
- **Climate-zone knowledge**: Outdoor conditions that vary by climate (gardening zones)
- **Location-sensitive knowledge**: Knowledge that varies by geographic conditions

Place-specific knowledge is about human-created or human-experienced aspects of a specific location that cannot be verified remotely.

## Examples of Place-Specific Knowledge

- "This trailhead parking lot fills by 8am on summer weekends"
- "The acoustics in this concert hall make bass muddy"
- "This restaurant's outdoor seating is worth the wait"
- "The museum's lighting is terrible for photography"
- "This coffee shop has reliable WiFi and outlets"
- "The view from this viewpoint is blocked by trees in summer"

## Verification Challenges

Unlike other knowledge types:

1. **Cannot test remotely**: You cannot verify "good coffee" without going there
2. **Time-sensitive**: A place that's great now may be crowded, closed, or changed
3. **Subjective to personal judgment**: What matters to you (quiet, lively, service speed) differs
4. **Requires recency**: Stale place-specific knowledge is actively misleading

## Proposed Handling

### Frontmatter Fields

```yaml
place-verification:
  verified-by: human-visit
  visit-date: 2026-03-17
  time-of-day: evening
  day-of-week: Saturday
  recency-review: 90d  # Review after 90 days
place-type: restaurant|trail|viewpoint|venue|service|general
place-verified-for: [specific claim being verified]
```

### Suggested Rules

**Rule:** Place-specific knowledge should include explicit recency markers and review intervals.
**Why:** Unlike static knowledge, place-specific knowledge has a short shelf life. Without recency markers, readers cannot assess whether the knowledge is still valid.
**Test:** For place-specific notes: (1) Is there a visit-date? (2) Is there a recency-review interval? (3) Can readers determine if this might be outdated?

**Rule:** Distinguish permanent features from transient conditions.
**Why:** "The trail is 3 miles" (permanent) differs from "The parking lot is full by 8am" (transient, varies by season/day). Permanent features need less frequent review; transient conditions need more.
**Test:** Can you categorize each place-specific claim as permanent vs. transient?

**Rule:** Include specific verification criteria.
**Why:** "This is a good coffee shop" is subjective. "This coffee shop has reliable WiFi, outlets at every table, and consistent espresso" is verifiable.
**Test:** Can someone visit this place and confirm/deny the specific claims?

## Open Questions

1. How should knowledge bases handle conflicting place-specific reports from different visitors?
2. Should place-specific knowledge include "as of" dates even for permanent features?
3. How to handle place-specific knowledge when the place no longer exists?
4. What's the appropriate review interval - 30 days? 90 days? Depends on the type?

## Related Concepts

- [[Frontier Exploration - Experiential Knowledge]] - Knowledge requiring hands-on testing
- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]] - Knowledge varying by climate
- [[Frontier Exploration - User Situational Constraints]] - Knowledge dependent on user context

---

**Confidence**: emerging - This is a newly identified gap; rules are provisional and need stress testing.

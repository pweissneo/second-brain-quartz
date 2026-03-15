---
last-reviewed: 2026-03-13
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-quality
  - incomplete-knowledge
---

# Frontier Exploration - Incomplete and Provisional Knowledge

> How to capture knowledge that isn't fully formed — sketches, hypotheses, partial insights, and work-in-progress ideas that are worth saving but not ready for prime time.

## The Problem

The Seed emphasizes high-quality, atomic, well-linked notes. But real knowledge work involves:

- Partial insights that emerge mid-thought
- Hypotheses that need testing before becoming "knowledge"
- Connections you're not certain about
- Notes that are 80% done but might be abandoned
- "Whisper" ideas that might become something

Traditional knowledge management says: "capture everything" or "capture nothing until ready." Both fail. The first creates noise. The second loses fleeting insights.

## The Gap in Current Seed Rules

The Seed covers:

- [[Atomic Note Principle]] — one idea per note
- [[Note Lifecycle Management]] — draft → active → evergreen → deprecated
- [[Confidence Markers]] — high/emerging/disputed/obsolete

What's missing: **guidance for capturing knowledge in transitional states** — knowledge that isn't a complete note but isn't nothing either. The lifecycle assumes a note exists; there's no guidance for the pre-note state.

## Proposed Pattern: Knowledge Staging

### Three States Beyond "Complete Note"

1. **Whisper** (`status: whisper`) — A fleeting insight, single sentence or fragment. No structure expected. Review within 48 hours to promote to draft or discard.

2. **Draft** (`status: draft`) — A note in progress. May have missing links, incomplete citations, unresolved questions. Clearly marked as work-in-progress.

3. **Probe** (`status: probe`) — A hypothesis or uncertain connection. Marked with explicit uncertainty: "This link might be wrong" or "Need to verify this claim."

### Frontmatter Pattern

```yaml
---
status: whisper|draft|probe
stage-confidence: low|medium|high
stage-reason: "fragment from meeting" | "hypothesis needs testing" | "incomplete research"
review-by: 2026-03-20
---

# Working Title

[Content...]
```

## Handling Each Stage

### Whisper → Draft

When promoting a whisper:

- Expand to at least 100 words or mark as stub
- Add at least one link (even if uncertain)
- State what's missing: "Need to verify X, explore Y"
- Set explicit review date

### Draft → Active/Evergreen

When a draft is ready:

- All required links present (minimum 2)
- Claims have sources or explicit "unverified" markers
- Passes atomicity test
- Self-contained enough to stand alone

### Probe Handling

Probes are special:

- They can have speculative links marked as `relationship: speculative`
- They should explicitly state what's needed to confirm/reject
- Convert to active when confirmed, deprecate (with explanation) when rejected

## When to Use Each Stage

### Use Whisper When:

- An idea hits you mid-task and you can't expand now
- Someone mentions something you want to research later
- A connection seems interesting but you can't articulate why yet

### Use Draft When:

- You've started writing but it's incomplete
- You have partial research but need more sources
- The note makes sense but might change significantly

### Use Probe When:

- You suspect a connection but haven't verified it
- A claim sounds right but you can't confirm
- You're exploring a hypothesis, not stating a fact

## Integration with Seed Rules

### Atomicity

Incomplete notes seem to violate atomicity, but they don't:

- The **intent** to be atomic is what matters
- Whisper/draft/probe notes explicitly mark their incompleteness
- They graduate to fully atomic notes through the review process

### 2+ Links Requirement

Notes in staging can have reduced link requirements:

- Whisper: 0 links required
- Draft: 1 link minimum
- Probe: 1 speculative link minimum
- Active: full 2+ links required

### Confidence Markers

The staging system is orthogonal to confidence:

- A draft can have `confidence: high` if the core claim is solid but surrounding context is missing
- A probe can have `confidence: emerging` as it represents a hypothesis
- When promoted to active, re-assess confidence normally

## Practical Workflow

### Daily Whisper Review

1. Check for whispers older than 48 hours
2. For each whisper:
   - Can you expand it now? → Promote to draft
   - Is it still just a feeling? → Extend review by 48h
   - Is it noise? → Delete

### Weekly Draft Review

1. Check for drafts not updated in 7 days
2. For each draft:
   - What's missing? (sources, links, expansion)
   - Is it worth completing? → Continue working
   - Is it dead-ended? → Archive or deprecate

### Probe Decision Cycle

1. Probes should have explicit "decide by" dates
2. When date arrives:
   - Evidence found → Promote to active
   - Evidence contradicted → Deprecate with explanation
   - Still uncertain → Extend or convert to draft for further research

## Connection to Existing Seed Rules

- Relates to [[Note Lifecycle Management]] — stages extend lifecycle backward
- Relates to [[Confidence Markers]] — staging provides workflow for confidence assessment
- Relates to [[Frontier Exploration - Knowledge Without Sources]] — provides structure for capturing uncertain knowledge
- Relates to [[Self-Improvement Cycle]] — staging enables iterative knowledge building

## Test Cases

### Test 1: Fragment from Meeting

> During the meeting, someone mentioned that "user retention drops when notification timing shifts." I want to explore this.

- Stage: whisper
- Review-by: 48 hours
- Action: Research whether this is documented; if so, draft a note

### Test 2: Unverified Claim

> I think this note relates to that other note, but I'm not certain why yet.

- Stage: probe
- Relationship: speculative
- Review-by: 1 week
- Action: Try to articulate the connection; if failed, deprecate with note about attempted exploration

### Test 3: Half-Written Note

> I've written 200 words about X but need more sources and haven't finished the links section.

- Stage: draft
- Review-by: 1 week
- Status: in-progress

## When This Matters Most

This pattern is especially valuable for:

- **Research workflows** — where hypotheses are constantly forming and testing
- **Creative work** — where ideas emerge incompletely
- **Learning** — where understanding evolves over time
- **Collaboration** — where drafts need sharing before completion

## Open Questions

1. Should whispers automatically escalate to deletion after multiple failed reviews?
2. How many "probe" failures before the pattern is considered unhelpful?
3. Can a vault be "mostly whispers" if the human captures frequently?

## Related Frontier Explorations

- [[Frontier Exploration - Knowledge Without Sources]] — Unverified knowledge handling
- [[Frontier Gap - Embodied Knowledge]] — Hard-to-articulate knowledge
- [[Frontier Exploration - Knowledge Debt]] — Incomplete capture as debt
- [[Note Lifecycle Management]] — Full lifecycle from draft to deprecated

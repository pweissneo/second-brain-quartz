---
last-reviewed: 2026-03-26
last-updated: 2026-03-29
lifecycle: evergreen
confidence: high
verification-status: verified
author-type: ai-assisted
tags:
  - best-practice
  - capture
  - selection
  - note-hoarding
schema-version: "1.0"
counterpart-antipattern: [[Anti-Pattern - Note Hoarding]]
---

# Best Practice: Selective Capture

> Capture less, but capture better. Apply the diminishing returns test before every capture.
> 
> **Note (2026-03-30):** [[Anti-Pattern - Note Hoarding]] has been consolidated here — redirect references to this note. This note now contains both the positive guidance and the failure mode it prevents.

## The Problem: Note Hoarding

Saving everything without processing undermines a second brain's effectiveness. Note hoarding manifests in three ways:

**1. Processing Failure:** Capturing without processing leads to:
- Hundreds of unprocessed bookmarks
- Notes that are just copied text
- No links between notes
- The vault becomes a graveyard of unconnected fragments

**2. Selection Failure:** Capturing noise clutters the vault:
- Notes on easily retrievable information
- Ephemeral content that won't be referenced
- Duplicate knowledge
- Capturing during momentum instead of staying in flow

**3. Timing Confusion:** Trying to fully process at capture time breaks the workflow:
- Time spent capturing but never processing
- No distinction between quick capture and processed notes
- Ideas lost before they can be captured

### Signs of Note Hoarding

- Inbox never gets processed
- Notes are verbatim copies from sources
- No wikilinks exist between notes
- Notes that are just facts a web search finds in 5 seconds
- One-off conversation notes
- Duplicate content already in vault
- Capture breaks your flow
- Every note takes 30+ minutes to create (trying to process at capture)

**Tool-focused (related failure mode):**
- More time researching tools than creating content
- Notes about tools but no substantive content notes
- Vault is "setup" but nearly empty after 30+ days
- Can't remember the last time a content note was created

## The Solution: Two-Phase Workflow

The note-hoarding anti-pattern shows what happens when capture and processing blur together. The solution is strict separation:

1. **Capture** — Quick save, any format, get the idea down. No structure required. Stay in flow.
2. **Process** — Within 48 hours, transform into atomic notes with links. This is where structure happens.

Never try to fully process notes at capture time — it leads to either no capture (ideas lost) or no processing (note hoard). The goal of capture is to capture; the goal of processing is to structure. They have different mindsets and belong in different sessions.

**Why it works:** The two-phase approach separates intent. Capture mode is about getting the signal down with minimal friction. Process mode is about building the graph with full attention. Mixing them creates cognitive load that kills both.

See [[Anti-Pattern - Note Hoarding]] for what happens when this separation breaks down.

## The Diminishing Returns Test

Before capturing any note, evaluate it against four criteria:

1. **Utility** — Does this improve vault answers? Would it help answer questions you actually have?
2. **Connection** — Does this naturally connect to 2+ existing notes? Can you explain the connections?
3. **Uniqueness** — Does this add knowledge that doesn't already exist in the vault?
4. **Effort** — Is the maintenance burden worth the value this provides?

**Skip if it fails 2+ criteria.**

### The Reverse Test

Ask before creating any note:

**Will I need this in 6 months?**
- Does this connect to something I already know?
- Is this my insight or someone else's?
- Can I find this in 30 seconds on the web?

If no → skip. Your second brain will thank you.

## When to Capture

Capture knowledge that:
- You'd actually search for later
- Provides context you can't find elsewhere
- Represents your unique perspective or experience
- Connects to knowledge you already have

## When NOT to Capture

| Type | Why Skip | Alternative |
|------|----------|-------------|
| Easily retrievable | Web search finds it fast | Don't capture |
| Ephemeral | One-off, won't reference | Process if it creates insight |
| Duplicate | Already exists | Update existing note |
| Momentum capture | Breaks flow | Jot quick note, process later |

## Capture the Negative Too

For every "how to X" note, consider adding:
- A note about what doesn't work when trying X
- Context about when X doesn't apply
- Failed experiments and why they failed

This makes your knowledge base complete, not just positive. Complete knowledge includes failures — they often teach more than successes.

Document negative knowledge with:
```yaml
experiment: What you tried
outcome: What happened  
reason-for-failure: Why it didn't work
context: Your specific situation
```

See [[Best Practice - Balanced Capture]] for more on capturing negative knowledge.

## Related

- [[Atomic Note Principle]]
- [[Note Lifecycle Management]]
- [[Best Practice - Balanced Capture]]
- [[Graph Maintenance]]
- [[Self-Improvement Cycle]]
- [[Anti-Pattern - Note Hoarding]] — The failure case this best practice prevents

---

**Note:** This best practice and [[Anti-Pattern - Note Hoarding]] share substantial content (two-phase workflow, diminishing returns test). The anti-pattern covers the failure mode; this note covers the solution. See [[Note Lifecycle Management]] for the refinement cycle that prevents perfectionism-driven hoarding.
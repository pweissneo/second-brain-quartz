---
last-reviewed: 2026-03-27
last-updated: 2026-03-27
lifecycle: evergreen
confidence: high
author-type: ai-assisted
tags:
  - anti-pattern
  - quality
  - capture
  - note-hoarding
level: pattern
verification-status: verified
schema-version: "1.0"
counterpart-bestpractice: [[Best Practice - Selective Capture]]
---

# Anti-Pattern: Note Hoarding

Saving everything without processing undermines a knowledge base's effectiveness.

## Problem

Note hoarding creates:
- Hundreds of unprocessed captures
- Notes that are just copied text with no links
- A vault of unconnected fragments
- Time spent capturing but never processing

## Signs

**Capture-related:**
- Inbox never gets processed (capture-process separation broken)
- Notes are verbatim copies from sources
- No wikilinks exist between notes
- Notes contain easily retrievable facts (web search finds in 5 seconds)
- Every note takes 30+ minutes to create (trying to process at capture time)
- Duplicate content already in vault

**Tool-focused (related failure mode):**
- More time researching tools than creating content
- Notes about tools but no substantive content notes
- Vault is "setup" but nearly empty after 30+ days
- Can't remember the last time a content note was created

## The Solution

Follow [[Best Practice - Selective Capture]]:
1. **Quick capture** to inbox (save the idea, any format)
2. **Process within 48 hours** (transform into atomic notes)
3. **Create atomic notes with links** (connect to existing knowledge)

Never try to fully process notes at capture time — it breaks flow and leads to either no capture (ideas lost) or no processing (note hoard).

## The Diminishing Returns Test

Before capturing, ask:
1. **Utility** — Does this improve vault answers?
2. **Connection** — Does this connect to 2+ existing notes?
3. **Uniqueness** — Does this add knowledge that doesn't already exist?
4. **Effort** — Is the maintenance burden worth the value?

Skip if it fails 2+ criteria.

## Test Criteria (for AI Evaluation)

- [ ] Is the inbox processed within 48 hours?
- [ ] Are captured notes processed into atomic notes with links?
- [ ] Does each note require more than a web search to obtain?
- [ ] Are there duplicate notes that should be merged?
- [ ] Does captured knowledge pass the diminishing returns test?

## Related

- [[Best Practice - Selective Capture]] — The corresponding best practice
- [[Anti-Pattern - Over-Organization]] — Related anti-pattern: over-organizing vs. under-processing (linked symptoms)
- [[Anti-Pattern - Tool Overfocus]] — Related anti-pattern: obsessing over tools vs. doing the work (linked symptoms)
- [[Note Lifecycle Management]]
- [[Knowledge Base Workflow]]
- [[Anti-Patterns in Knowledge Management]]

---

**Note:** [[Best Practice - Selective Capture]] covers the positive solution; this note covers the failure mode. Both share the two-phase workflow and diminishing returns test because they are mirror images of the same principle. See [[Note Lifecycle Management]] for how refinement cycles prevent both hoarding and perfectionism.
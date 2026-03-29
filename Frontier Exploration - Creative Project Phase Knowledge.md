---
last-reviewed: 2026-03-28
last-updated: 2026-03-28
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - creative
  - project-management
  - phase-model
  - gap-identified
---

# Frontier Exploration - Creative Project Phase Knowledge

> How should knowledge bases handle creative projects with non-linear, iterative phases and subjective outputs?

**Related:** [[Seed Stress Test - Construction Phase Model in Music Composition]], [[Frontier Exploration - Iterative Creative Knowledge]], [[Frontier Exploration - Workflow Knowledge]], [[AI-Assisted Knowledge Management Seed]]

---

## The Gap

Current Seed rules cover:
- **Construction-phase model:** skeleton → flesh → muscle → maturity
- **Sequential-skill domains:** modified thresholds for language learning, music
- **Creative composition:** principles + examples (not standalone procedures)

What the Seed does NOT cover:
- **Multi-phase creative projects** where phases are non-linear (revisit, iterate, pivot)
- **Phase transitions** driven by creative judgment, not completion criteria
- **Subjective outputs** where "done" is a judgment call, not a checkbox
- **Iteration tracking** — storing versions, abandoned directions, pivots as knowledge
- **Timeline and deadline knowledge** — when to move on vs. polish more
- **Project-retrospective knowledge** — what worked/didn't for future projects

**Example domains this affects:**
- Album production (songwriting → recording → mixing → mastering → release)
- Film/Video production (pre-production → production → post → distribution)
- Novel/Book writing (outline → draft → revise → edit → publish)
- Game development (concept → prototype → development → testing → release)
- Photography projects (concept → capture → post → curation → presentation)
- Podcast series (research → recording → editing → publishing)

---

## Why Current Rules Fail

**Construction-phase model assumes:**
- Progress is measurable (note count, link density)
- Phases have completion criteria
- Quality is verifiable through source checking or testing

**Creative project phases differ:**
- Rewriting is normal, not failure to complete
- "Good enough" is judgment, not metric
- Abandoment of direction is learning, not waste
- Deadlines exist externally (release dates, bookings)
- Multiple valid outputs (different mixes, endings, versions)

**Edge case: Non-linear workflow**
- Recording happens before "final" songwriting is done
- Mixing reveals new issues requiring re-recording
- Mastering triggers mix changes
- Post-production may require re-shoots or reshoots don't exist — only ADR

---

## Proposed Approach

### Phase Structure for Creative Projects

Distinct from construction-phase:
- **Project phases** are about the creative output, not vault maturity
- Track phase as metadata on the project note:
```yaml
project-type: album|film|novel|game|project
project-phase: concept|production|post|release|retrospective
iteration-current: 3
iteration-previous:
  - version-1: "Initial concepts, 12 songs"
  - version-2: "Refined to 10 songs, basic tracks"
iteration-tracking: explicit  # vs implicit
```

### Decision Knowledge

Store decisions as notes:
- Why this song/track/scene was included or excluded
- What trade-offs were made (time vs quality)
- What was abandoned and why (not failure, information)
- What would do differently in future project

### Timeline Milestones

Different from temporal knowledge:
- External deadlines (release dates, shows, submissions)
- Phase duration norms (baseline tracking for estimation)
- Buffer allocation (mixing ALWAYS takes longer)
- Deadline trade-offs explicit (what gets cut?)

### Retrospective Knowledge

Distinct from regular review:
- What worked for THIS project type
- What would change for next similar project
- What knowledge was missing going in
- What knowledge was gained during project

### Track Abandoned Directions

Critical gap: Storing abandoned work as knowledge:
- "Why this direction was abandoned" has value
- Keep abbreviated versions with rationale
- Cross-link to what replaced it

---

## Seed Rule Proposal

**Rule:** For creative project knowledge bases, structure notes around project phases and iteration tracking, not just atomic principles.

**Why:** Creative output differs from procedural orfactual knowledge. Phases are non-linear, decisions are subjective, and abandonment is normal process, not failure. Current Seed rules create shallow vaults that miss project-phase knowledge, iteration learning, and the judgment calls that define professional creative work.

**Test:** For a knowledge base about album/film/book production:
1. Can you track which iteration a note belongs to?
2. Are phase transitions documented with rationale?
3. Is abandoned direction stored with learning?
4. Are deadline trade-offs explicit?
5. Are retrospective insights captured separately from regular notes?

**Implementation:**
```yaml
# On project phase notes
project-type: album|film|novel|game|podcast
project-phase: pre-production|production|post|release
belongs-to-iteration: 2
abandoned-direction: true  # if applicable
abandonment-rationale: "Why direction was dropped"
phase-transition-rationale: "Why moved to this phase"
deadline-trade-off: "What was deprioritized for deadline"

# On retrospective notes
retrospective-type: project|novel|series
project-completed: true|false|partial
key-learning: "What was learned"
would-change: "Would do differently next time"
knowledge-gap-identified: "What didn't know at start"
```

---

## Related Gaps

- [[Frontier Exploration - Iterative Creative Knowledge]] — covers iteration in creative work
- [[Seed Stress Test - Construction Phase Model in Music Composition]] — specific to music
- [[Frontier Exploration - Sequential Workflow Knowledge]] — more linear than creative projects
- [[Seed Gap - Practice Routine Structure]] — different from project structure
- [[Frontier Exploration - Temporal Knowledge in Projects]] — might overlap

---

## Questions for Further Exploration

1. How to handle "director cut" vs "released version" as knowledge?
2. Should abandoned directions live in same vault or separate archive?
3. How to verify "quality" in subjective creative output?
4. What's minimum viable iteration tracking for small projects?
5. How to structure cross-project learning (what transfers)?

---

## Next Steps

- [ ] Review existing Seed rules for project-phase gaps
- [ ] Create seed rule proposal in Rule/Why/Test format
- [ ] Stress test against specific creative domains (music, film, writing)
- [ ] Define minimum viable iteration tracking schema
- [ ] Consider integration with construction-phase model
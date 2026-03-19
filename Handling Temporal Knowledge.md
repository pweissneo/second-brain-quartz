---
last-reviewed: 2026-03-12
lifecycle: evergreen
confidence: high
verification-status: verified
tags:
  - seed-extension
  - temporal
  - time-sensitive
  - sequential-knowledge
level: principle
author-type: ai-assisted
---

# Handling Temporal and Outdated Knowledge

Knowledge that changes over time requires different treatment than static knowledge. This note covers both proactive handling of temporal knowledge and reactive handling of outdated information.

## The Problem

### Temporal Knowledge
Some knowledge is inherently time-bound:
- Current events and news
- Market data (stock prices, crypto rates)
- Weather forecasts
- Sports scores and standings
- Technology versions and releases
- Population statistics

The Seed's normal rules assume knowledge is relatively static. But temporal knowledge needs special handling.

### Outdated Information
Notes become outdated over time:
- Technology changes
- Understanding evolves
- Facts become incorrect
- Links break

---

## Source Validation and Confidence

*Guidance merged from Source Validation Over Time*

### Source Confidence Signaling

When citing sources, include source-specific confidence metadata in frontmatter or inline:

- `source: live` — URL verified working within last 30 days
- `source: archived` — Only archive.org snapshot available  
- `source: unavailable` — Source no longer accessible (citation preserved for provenance)

### Freshness Thresholds by Content Type

Different content types need different review frequencies:

| Content Type | Review Interval |
|--------------|-----------------|
| Tech/Software | Every 6 months |
| Concepts/Theory | Every 1 year |
| History/Facts | Every 2 years |

### Red Flags for Source Quality

Watch for these warning signs in your notes:

| Flag | Action |
|------|--------|
| Old `created` date | Verify accuracy |
| No sources | Add or mark unverified |
| Contradiction found | Add context from multiple sources |
| Broken links | Fix or deprecate note |

### The Verification Habit

1. When using a note, glance at frontmatter `last-reviewed` date
2. If older than the freshness threshold for its type, schedule verification
3. When verifying, check that all source URLs still work
4. Update `last-reviewed` to current date after verification
5. For dead sources, add archive.org fallback or mark as unavailable

---

## Part 1: Proactive Temporal Knowledge Handling

### Strategy 1: Separate Static from Dynamic

Create distinct note types:
- **Static notes**: Concepts, principles, methods (normal notes)
- **Dynamic notes**: Time-sensitive data (with clear expiration)

```
Tesla Stock Analysis.md     ← Static: analysis methods, factors
Tesla Price Data.md         ← Dynamic: current price (with date)
```

### Strategy 2: Use Point-in-Time References

Instead of embedding the value:
```markdown
# Tesla Stock Price

As of March 9, 2026, TSLA was trading at $XXX.

See Stock Price API for current data.
```

### Strategy 3: Link to Live Sources

For rapidly changing data, don't capture — link:
```markdown
# Current Market Data

- S&P 500: [TradingView](https://tradingview.com/spx)
- Bitcoin: [CoinGecko](https://coingecko.com)
```

### Strategy 4: Temporal Metadata

Add frontmatter for time-sensitive notes:
```yaml
---
temporal: true
valid-from: 2026-03-09
valid-until: 2026-03-10
refresh-frequency: daily
---
```

### Strategy 5: Archive Strategy

For historical tracking:
- Create dated snapshots periodically
- Link to archive rather than live source
- Note: "As of Q1 2026, the data showed..."

### Domain Examples

| Domain | Static Notes | Dynamic Notes |
|--------|-------------|---------------|
| Weather | Weather Patterns, Climate Zones | "Today's forecast" → link to service |
| Technology | Python Programming, React Framework | "Python 3.14 Release Notes" (with date) |
| Finance | Investment Strategies, Risk Management | "Current Interest Rates" → link to Fed |
| News | Political Systems, Economic Theories | "2026 Election Results" → archive link |

---

## Part 2: Reactive Outdated Information Handling

### Strategy 6: Version Tracking

Add metadata to track changes:

```yaml
---
created: 2025-01-15
modified: 2026-03-09
status: [current|needs-update|deprecated]
---
```

### Strategy 7: Deprecation Markers

For outdated notes:

```markdown
# Deprecated: [Old Concept]

> **Status:** This concept has been superseded by [[Note Types and Templates]]

**Reason:** [Brief explanation]
**Date:** 2026-03-07
```

### Strategy 8: Evergreen Updates

Per [[Note Lifecycle Management]], iterate on notes rather than abandoning:
- Update instead of creating new
- Keep historical context
- Link to updated versions

### Strategy 9: Regular Review Schedule

Per [[Graph Maintenance]]:
- Quarterly review of old notes
- Check for broken links
- Verify accuracy

### Red Flags for Outdated Content

- Notes with old dates
- Contradictions between notes
- Broken [[Wikilinks]]
- Outdated tool recommendations

---

## The Three Categories of Time-Related Knowledge

*Content integrated from frontier exploration on temporally stale knowledge*

### 1. Time-Sensitive Data
- Specific values that change rapidly (stock prices, weather)
- Solution: Separate from knowledge, link to live sources

### 2. Disproven/Superseded
- Was never correct OR was correct but replaced by better understanding
- Solution: `status: historical-superseded` with `superseded-by:`

### 3. Temporally Stale (But Historically Accurate)
- Was accurate when captured, still factually correct as historical record
- But now stale — rankings changed, tools evolved, best practices shifted
- **Requires:** Temporal context, staleness indicators, explicit "as-of" dates

This third category is the most commonly missed. An AI using current Seed rules would either delete useful historical knowledge OR present stale knowledge as current. The solution:

### Handling Stale-but-Accurate Knowledge

| Type | Example | Solution |
|------|---------|----------|
| Rankings | "X was the best in 2019" | Add `as-of: 2019` and `staleness: confirmed` |
| Tool recommendations | "React was most popular in 2019" | Add temporal context, update to current |
| Best practices | "Waterfall was recommended" | Mark `status: historical-superseded` if no longer valid |

#### Key Frontmatter for Stale Knowledge:
```yaml
---
as-of: 2019-03
staleness: confirmed
---
```

---

## Obsolescence Detection Methods

*Enhanced content from Knowledge Obsolescence Detection frontier exploration*

### The Detection Challenge

The Seed assumes obsolescence is knowable, but doesn't provide a method for identifying it. Without obsolescence detection, an AI agent cannot:
1. **Distinguish stale from obsolete** — Is this knowledge simply old, or has the underlying reality changed?
2. **Identify context shifts** — Knowledge that was correct for a specific situation but is no longer applicable
3. **Know when to escalate** — What triggers human review vs. automated updates

### Obsolescence Triggers

#### External Triggers (detectable)
- **Source changed** — The source document/article was updated
- **Version mismatch** — The tool/version the knowledge applies to has changed
- **Link rot** — External references are dead
- **Authority superseded** — Legal precedent changed, scientific consensus shifted

#### Internal Triggers (inferred)
- **Contradiction detected** — New knowledge contradicts existing knowledge
- **Gap in applicability** — Knowledge assumes context that no longer exists
- **Negative evidence accumulation** — Multiple failed applications suggest the knowledge is wrong

#### Context Shift Triggers (requires user input)
- **Situation changed** — Your context differs from what the note assumes (job, location, relationship)
- **Tool/technology changed** — You switched tools and the knowledge no longer applies
- **Goals changed** — Your objectives shifted and the knowledge is no longer relevant

### Special Case: External Extinction

**When the thing described no longer exists** — a specific type of obsolescence that requires different handling.

#### Examples of External Extinction
- **Product Discontinuation** — Knowledge about a discontinued camera model, out-of-print book
- **Service Shutdown** — Knowledge about a defunct API, discontinued platforms
- **Relationship Dissolution** — Knowledge about former employers, ex-partners
- **Organizational Death** — Knowledge about dissolved companies, defunct institutions
- **Biological/Physical Extinction** — Knowledge about extinct species, destroyed landmarks

#### Why Standard Rules Fail
Standard obsolescence assumes knowledge can be refreshed, the thing described still exists, and updates are possible. External extinction breaks all three.

#### Tagging Strategy for External Extinction
```yaml
extinction-type: product|service|relationship|organization|location
extinction-date: YYYY-MM-DD
extinction-source: discontinuation-notice|shutdown-announcement|verified-absence
historical-status: archived|reference-only|deprecated
```

### Confirmation Methods
- Product discontinuation: Check manufacturer website, press releases, archive.org
- Service shutdown: Check status pages, news articles, social media
- Organizational death: Business registries, news archives

---

## Part 3: Sequential Knowledge — Where Order IS the Knowledge

*Content integrated from Frontier Exploration on sequential knowledge*

The Seed covers static knowledge, procedural knowledge, and time-sensitive data. But there's a critical gap: **knowledge where sequence itself is the core knowledge**.

### Examples of Sequential Knowledge

1. **Historical narratives**: The causes and effects that led to an event
   - "Why did World War I start?" requires understanding a sequence of diplomatic failures

2. **Musical composition**: The arrangement of notes in time
   - "How does this symphony work?" requires understanding the sequence, not just the chords

3. **Story structure**: Narrative arcs, plot points in order
   - "How does this story build tension?" requires temporal understanding

4. **Scientific discovery history**: The sequence of experiments and insights
   - "How did we discover the structure of DNA?" is a temporal narrative

5. **Biological processes**: Metabolic pathways, cell division, ecosystems
   - The ORDER of steps IS the knowledge being captured

6. **Learning progressions**: Concepts that MUST be learned in sequence
   - "What prerequisites are required for calculus?" is about temporal dependency

### Key Question: Sequential vs. Static?

| Type | Question | Example |
|------|----------|---------|
| Static | "What is X?" | Photosynthesis definition |
| Sequential | "How did X happen?" OR "How does X unfold?" | Photosynthesis discovery history |

### Emerging Rules for Sequential Knowledge

**Rule:** Distinguish prerequisite links from relevance links

- "You need to understand A before B" is a different relationship than "A relates to B"
- Prerequisite links create learning paths; relevance links create understanding web
- Test: Can you identify which links represent temporal dependencies (must learn first) vs. conceptual relationships (related but not sequential)?

**Rule:** For sequential knowledge, capture both the sequence AND the key moments

- A sequence without key moments is overwhelming
- Key moments without sequence loses causal structure
- Test: For a historical event note: (1) Can you identify the key moments? (2) Can you trace the causal chain between them?

**Rule:** Tag temporal scope — is this knowledge about a point in time, a period, or a sequence?

- "The Battle of Hastings" (point), "The Renaissance" (period), "How photosynthesis evolved" (sequence)
- Test: Can you categorize each temporal note as: point-in-time | period | sequence | cyclical?

### Test Case: Building a Music Theory Knowledge Base

An AI building a music theory vault using only current Seed rules would:
- ✓ Create atomic notes on chords, scales, harmony
- ✓ Link between concepts
- ✗ Not know how to capture a chord progression (sequence IS the knowledge)
- ✗ Not know whether to link to "the notes" or "the order of notes"
- ✗ Not distinguish between harmonic theory (static) and compositional form (sequential)

The AI would create excellent static knowledge but miss the sequential essence of music.

### Test Case: Building a History Knowledge Base

An AI building a history vault using only current Seed rules would:
- ✓ Create atomic notes on events, figures, dates
- ✓ Link related events
- ✗ Not know how to present causes and effects as connected narrative
- ✗ Might fragment the narrative into atomic facts, losing the temporal chain
- ✗ Not distinguish between "what happened" (fact) and "why it happened" (causal sequence)

---

## The Test

For any note containing time-specific data:

1. **Will this be wrong in 1 month? 1 year?**
2. **Is there a source URL that provides updated values?**
3. **Should this be a link instead of embedded data?**
4. **Has this note been reviewed in the last 90 days?**

If yes to 1-2 and no to 3 → Refactor to separate static from dynamic.
If no to 4 → Add to review queue.

---

## Best Practices Summary

1. **Date everything** - Frontmatter with created/modified
2. **Version your ideas** - Don't delete, deprecate
3. **Review regularly** - [[Self-Improvement Cycle]]
4. **Trust but verify** - Don't assume notes are correct
5. **Separate static from dynamic** - Link to live sources for rapidly changing data
6. **Use temporal metadata** - Mark time-sensitive notes with valid-from/valid-until

---

## Relationship to Seed Rule

The Seed includes this rule:

> **Rule:** Separate time-sensitive data from static knowledge — link to live sources for rapidly changing information, use point-in-time references with dates for moderately temporal knowledge.

This note provides comprehensive implementation guidance, covering both:
- **Proactive handling**: Strategies 1-5 for temporal knowledge
- **Reactive handling**: Strategies 6-9 for outdated information

### Enhanced Rules (from frontier exploration)

**Rule:** Use `as-of:` frontmatter for knowledge captured at a specific point in time — rankings, recommendations, and comparisons that were accurate when captured but may be stale now.

**Rule:** Mark temporally stale notes with `staleness: confirmed` — knowledge that was accurate when captured but is now outdated without being wrong.

**Rule:** Archive stale recommendations rather than deleting — preserve historical accuracy while maintaining current advice separately.

### Additional Edge Cases for Discredited Knowledge

*Content integrated from frontier exploration on discredited and historically superseded knowledge*

When handling knowledge that was once considered true but has been fundamentally disproven, apply these additional considerations:

#### 1. Partially Wrong Theories

Some theories were partially right:
- Newtonian physics: wrong at relativistic speeds, but accurate for everyday scales
- "Germs cause disease": true for infectious disease, but incomplete (doesn't cover genetic, autoimmune)

**Solution:** Use `scope:` tags to specify when the theory applies vs. fails

#### 2. Paradigm Shifts

Some superseded theories require complete worldview changes:
- Ptolemaic → Copernican: not just different model, different understanding of humanity's place in cosmos
- Four humors → germ theory: completely different disease model

**Solution:** Note the paradigm shift explicitly - these aren't just "updates"

#### 3. Still-Useful Approximations

Some "wrong" theories are still useful:
- Ideal gas law: technically wrong (real gases deviate), but useful approximation
- Classical mechanics: wrong for quantum scales, still used for everyday engineering

**Solution:** Distinguish "fundamentally disproven" from "approximate but useful"

#### 4. Cultural vs. Scientific Supersession

Some knowledge isn't "wrong" but outdated:
- Etiquette rules from 1950s
- Fashion trends
- Cultural norms

**Solution:** These are `status: historical` (not "discredited") - they were never claims about objective truth

#### 5. Dangerous Discredited Knowledge

Some discredited knowledge could cause harm if used:
- Anti-vaccine ideas from discredited research
- Dangerous medical treatments that were once standard
- Racial "science" that was used to justify atrocities

**Solution:** Mark with `harm-potential:` and include strong warnings. Historical preservation ≠ endorsement.

#### Historical Accuracy Tier

Add `historical-accuracy:` tier to distinguish:
- `historically-accurate`: True representation of what was believed/known at the time
- `partially-inaccurate`: Some elements were wrong even for the time
- `known-false-at-time`: Even contemporaries knew this was disputed

**Why:** Not all historical knowledge was considered equally valid at the time. Some theories were contested even before being superseded.

#### Test for AI Agents

Given a note about an old scientific theory:
1. Is it marked `status: historical-superseded`?
2. Does it explain *why* the theory was abandoned?
3. Does it link to the replacement knowledge?
4. Is there context about what was right/useful even in the wrong theory?
5. Is there a warning if applying the old theory could cause harm?

### Confirmation Methods

- Product discontinuation: Check manufacturer website, press releases, archive.org
- Service shutdown: Check status pages, news articles, social media
- Organizational death: Business registries, news archives

---

## Proposed Seed Rule

**Rule:** Implement obsolescence detection with explicit triggers — separate staleness (time-based) from obsolescence (reality-based) and context shift (user-based).

**Why:** Staleness is mechanical (time passed); obsolescence is semantic (reality changed); context shift is personal (your situation changed). Treating all three the same causes false positives (flagging accurate but old knowledge) and false negatives (missing genuinely obsolete knowledge).

**Test:** Can you categorize knowledge gaps as: (1) time-stale (review needed), (2) reality-obsolete (replace needed), (3) context-shift (user-specific)? Do you have detection methods for each?

---

## Questions for the Seed

1. Should obsolescence be a lifecycle stage separate from deprecation?
2. How do we distinguish "was never accurate" from "was accurate, now obsolete"?
3. What's the minimum evidence threshold for marking something obsolete vs. stale?

---

## Related
- [[Note Types and Templates]]
- [[Note Lifecycle Management]]
- [[Graph Maintenance]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Real-Time and Sensor-Based Knowledge]] — Continuous data streams vs point-in-time
- [[Frontier Exploration - Iterative Creative Knowledge]] — Related: covers cyclic evaluation and decision-making processes
- [[Frontier Exploration - Multi-Modal Knowledge Representation]] — Related: temporal knowledge often involves multiple modalities
- [[Frontier Exploration - Simulation-Based Knowledge]] — Related: simulation models often encode temporal/sequential relationships
- [[Frontier Exploration - Learning vs Reference Knowledge Bases]] — Related: learning progressions are sequential
- [[AI-Assisted Knowledge Management Seed]] — covers temporal knowledge including predictions

---

## Additional Strategies: Knowledge Evolution and Versioning

*Content merged from Frontier Exploration notes on knowledge evolution and version-dependent knowledge*

### Approach 1: Snapshot Model

Keep historical versions with timestamps:
```
Knowledge Note/
  ├── current.md (latest understanding)
  ├── 2024-01.md (superseded version)
  └── 2023-01.md (earlier version)
```

**Pros**: Clear history, easy to trace evolution
**Cons**: Duplication, complexity, unclear when snapshots are needed

### Approach 2: Change Log Model

Single canonical note with explicit change history:
```markdown
# Topic Understanding

## Current Understanding (2026-03)
Current best practice is X because...

## Evolution History
- **2025-06**: Changed from Y to X based on new research
- **2024-01**: Changed from Z to Y based on field study
- **2023-03**: Original understanding Z
```

**Pros**: Single source of truth, explicit history
**Cons**: Note bloat, harder to find "current" quickly

### Approach 3: Delta Model

Track changes as separate "delta" notes:
```
Topic/
  ├── Understanding (current summary)
  ├── Delta-2025-06 (what changed)
  └── Delta-2024-01 (what changed)
```

**Pros**: Separation of current state from history
**Cons**: Multiple notes to maintain, potential fragmentation

### Approach 4: Replace-with-Reference Model

When knowledge changes significantly:
1. Mark old note as deprecated with pointer to new
2. Create entirely new note
3. Link from old to new explicitly

**Pros**: Clean current state, clear replacement path
**Cons**: Loses context about WHY changes happened

### Evolution Triggers

Not all changes need full versioning. Key triggers include:
- New research publication
- Major world event
- Technology shift
- Framework abandonment
- Significant paradigm shifts

### Version-Specific Knowledge

For software/tool/library versions:

**LTS Versions**: Some versions have extended support. Mark with `version-lts: true` and note support end date.

**Rolling Releases**: For continuous deployment (Chrome, Firefox), use `version: latest` and note the knowledge was verified against latest at `last-reviewed` date.

**Breaking Changes**: When a new version introduces breaking changes, create a synthesis note comparing versions rather than overwriting.

### Bidirectional Supersession Links

When knowledge is superseded:
- Deprecated note should link forward to replacement note
- Replacement note should acknowledge the superseded note

This enables tracing how understanding evolved over time.

### Review Triggers for Evolving Domains

For domains with high change velocity (technology, science), set explicit `review-when` triggers rather than relying on arbitrary time intervals:

```yaml
---
review-when:
  - major-version-release
  - eol-announcement
  - security-advisory
---
```

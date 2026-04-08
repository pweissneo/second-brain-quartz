---
last-updated: 2026-04-08
last-reviewed: 2026-04-08
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
tags:
  - knowledge-management
  - capture-strategy
  - frontier-exploration
  - resource-allocation
  - timing
seealso:
  - AI-Assisted Knowledge Management Seed
  - Note Creation Decision Framework
  - Frontier Exploration - Systematic Knowledge Exclusion Criteria
  - Best Practice - Selective Capture
  - Knowledge Base Workflow
---

# Frontier Exploration - Knowledge Capture Strategy

> How should an AI agent decide what to capture, when to capture it, how to capture it, and how to allocate resources between capturing new knowledge and verifying existing knowledge?

> **Note (2026-04-08):** This note consolidates three related frontier explorations:
> - Frontier Exploration - Knowledge Capture Strategy (capture prioritization, timing, resource allocation)
> - Frontier Exploration - Knowledge Capture Threshold Determination (how much is enough, when to stop)
> - Frontier Exploration - Capture Method Optimization (how to capture, methods and trade-offs)

This consolidated note covers four related aspects of knowledge capture:
1. **Capture prioritization** — what to capture now vs. later vs. never
2. **Capture timing** — when in the learning lifecycle to capture
3. **Capture method** — how to capture (speed vs. quality trade-offs, method-to-type matching)
4. **Resource allocation** — how to balance capture vs. verification vs. deepening

---

## Part 1: Capture Prioritization During Active Learning

### The Problem

The Seed covers what to capture (priority signals, diminishing returns, exploration/exploitation) and when to create notes (Note Creation Decision Framework). But there's a temporal gap: when an AI agent is actively working through a domain, it encounters a continuous stream of knowledge items. The Seed doesn't tell it how to prioritize capture in real-time.

### Real-World Scenario

An AI agent starts learning about **coffee roasting**:
- Reads about heat transfer physics
- Learns about bean density variations
- Discovers the Maillard reaction timing
- Finds that roasters debate convection vs conduction
- Notes that altitude affects boiling point
- Sees that bag freshness degrades in 2 weeks

**The problem:** All of this is relevant. But capture capacity is finite (~3-5 notes/session). How does the agent decide:
1. Capture NOW (immediately write note)
2. Capture LATER (queue for future processing)
3. Capture ON-DEMAND (only when needed, don't pre-capture)
4. IGNORE (not worth capturing at all)

### Proposed Capture Priority Framework

#### Priority 1: IMMEDIATE (capture now)

- Prerequisites for upcoming work (blocking knowledge)
- Insights that connect to existing knowledge (high utility)
- Non-obvious patterns (not easily rediscoverable)
- Time-sensitive knowledge (seasonal, current events)
- Safety-critical information

**Test:** Is this blocking progress OR connecting strongly OR non-obvious AND won't be rediscovered easily?

#### Priority 2: DEFER (queue for later)

- General background knowledge (can look up later)
- Things you'll encounter again naturally
- Nice-to-have extensions of captured knowledge
- Knowledge in your "comfort zone" that's already covered

**Test:** Will this still be available when you need it? Will you encounter it again naturally?

#### Priority 3: ON-DEMAND (capture only when needed)

- Well-documented standard knowledge (easy to find)
- Highly volatile (changes frequently)
- Your specific preferences (not generalizable)
- Equipment/model-specific that may become obsolete

**Test:** Is this easily searchable? Does it change often? Is it highly specific to your setup?

#### Priority 4: IGNORE

- Already in your vault
- Purely decorative (satisfies no real need)
- Out of scope for your vault's purpose
- Below diminishing returns threshold

**Test:** Already captured? No real utility? Out of scope?

### Real-Time Decision Heuristics

When encountering knowledge during active learning:

1. **The "blocker" test** — Is this preventing progress on something I want to do?
2. **The "connection" test** — Does this link to 2+ existing notes meaningfully?
3. **The "rediscover" test** — If I leave this, will I spend >5 minutes finding it again?
4. **The "unique" test** — Does this contain your personal context/analysis, or just facts?
5. **The "shelf-life" test** — Will this still be accurate in 30 days?

**Scoring approach:**
```
Priority Score = (blocker × 3) + (connection × 2) + (not-rediscoverable × 2) + (unique × 1) + (shelf-life × 1)

Where each factor is 0 or 1.

Score >= 5: IMMEDIATE
Score 3-4: DEFER
Score 1-2: ON-DEMAND
Score 0: IGNORE
```

### Edge Cases for Prioritization

- **Prerequisite chains** — If A → B → C, capture A immediately even if lower priority alone, because it's needed for B and C
- **Compounding knowledge** — Some knowledge becomes MORE valuable as you learn more (capture early)
- **Sunk cost** — If you already captured something, don't re-capture just because you see it again
- **Batch vs. stream** — Some learning sessions should be "batch" (capture everything, sort later) vs. "stream" (triage in real-time)

---

## Part 2: Capture Timing During Learning Lifecycle

### The Gap

The Seed addresses what to capture and how to verify, but doesn't explicitly cover the timing dimension: at what point in the learning process should knowledge be captured? Different knowledge types have optimal capture windows.

### Capture Timing Framework

#### Phase 1: Discovery (first encounter)

Capture what would be hard to rediscover:
- Unique insights that won't appear in standard sources
- Personal reactions and questions that arise
- Connections to existing knowledge

**Focus:** Don't try to capture everything — capture what you'll lose

#### Phase 2: Consolidation (after initial learning)

Capture the framework and structure:
- How concepts relate to each other
- Prerequisites and dependencies
- Hub-level notes for navigation

**Focus:** Build structure around the knowledge

#### Phase 3: Application (practical use)

Capture what practice reveals:
- Edge cases that theory didn't cover
- Trade-offs discovered through doing
- Corrections to earlier understanding

**Focus:** Capture experience, not just theory

#### Phase 4: Review (periodic)

Capture meta-knowledge about what works:
- Patterns across multiple applications
- What you'd do differently
- What proved most valuable

**Focus:** Capture synthesis, not raw content

### Timing Principles

1. **Capture fresh, verify later** — Don't delay capture to verify; capture immediately, verify systematically
2. **Context is time-sensitive** — Capture context at the moment of discovery; you can't recreate it later
3. **Structure after flood** — Let content accumulate, then organize after initial capture phase
4. **Review reveals gaps** — Regular review shows what wasn't captured that should have been

---

## Part 3: Capture Method Optimization

### The Gap

The Seed covers what knowledge to capture (diminishing returns, priority signals, 5:1 ratio) and how to organize it (atomicity, linking, schema). However, it lacks explicit guidance for **how to capture** knowledge optimally — which methods work for different knowledge types, the mechanics of capture-to-integration flow, and how capture method choice affects knowledge quality.

### Problems Where Capture Method Choice Matters

1. **Transient ideas captured via voice vs. text** — Voice capture is faster but loses detail; text capture is slower but enables editing. The Seed doesn't guide which to use when.

2. **Research capture during active reading vs. post-reading synthesis** — Capturing as you read creates more complete notes but interrupts flow; capturing after creates synthesis but loses ephemeral insights. No guidance exists.

3. **Error capture immediately after encountering vs. later** — Immediate capture preserves context but interrupts work; later capture may lose details but allows reflection. Timing trade-offs unaddressed.

4. **Multi-source synthesis during capture vs. after collection** — Synthesizing during capture (comparing sources as you go) creates integrated notes but slows capture; collecting first creates raw material that can be synthesized later. The Seed mentions synthesis but not timing trade-offs.

5. **Capture in domain-native format vs. neutral format** — Some knowledge (code snippets, formulas) is best captured in native format; other knowledge (concepts, insights) is better in neutral format. No guidance on format selection.

### Why This Matters

Without capture method optimization:
- Fast capture methods (voice, quick notes) may result in lower quality notes that require extensive cleanup
- Slow capture methods (full writing) may cause knowledge to be lost before capture
- The vault accumulates capture artifacts rather than usable knowledge
- Time spent capturing doesn't correlate with knowledge value produced
- Different knowledge types may benefit from different capture methods but this is unrecognized

### Capture Method Selection Guidance

#### Speed vs. Quality Trade-off

- **Fast capture methods** (voice, quick notes, screenshots): sacrifice detail/explicitness for speed
- **Slow capture methods** (full writing, structured templates): produce higher quality but risk losing transient knowledge

**Rule:** Match capture method to knowledge type.

| Knowledge Type | Recommended Method | Timing | Rationale |
|---------------|-------------------|--------|-----------|
| Error/issue | Quick note or voice | Immediate | Context decays fastest |
| Transient idea | Voice or quick note | Immediate | May forget entirely |
| Insight/reflection | Quick note, expand later | Immediate capture, delayed expansion | Quality requires reflection |
| Research source | Batch capture | After reading session | Synthesis requires multiple sources |
| Reference/fact | Direct to structured note | When needed | No time pressure |
| Experiential result | Structured capture | After execution | Need results context |
| Meeting/discussion | Quick note | During or immediate after | Details decay quickly |

#### Context Preservation

**What context should be captured at capture time:**
- Task or goal at time of capture
- Emotional state if relevant
- Time constraints
- Source and why it was being reviewed

**What can be reconstructed later:**
- Background information
- Related concepts
- Alternative perspectives

#### Capture-to-Integration Flow

- **Staging (inbox):** 48-hour maximum before processing
- **Immediate capture:** For time-sensitive knowledge
- **Delayed expansion:** For insights that need reflection time
- **Batch processing:** For research that benefits from multi-source synthesis

### Implementation

```yaml
capture-method: voice|quick-note|structured-writing|batch-research|reference-capture
capture-timing: immediate|delayed|batch
knowledge-type-match: appropriate|mismatched
capture-quality: high|medium|low
post-capture-processing: needed|none
```

### Capture Quality Indicators

Evaluate capture method effectiveness by:
- **Completeness**: Does the note contain what's needed to be useful later?
- **Context preservation**: Can you reconstruct why you captured this?
- **Findability**: Will you be able to find this when needed?
- **Integration readiness**: Does the note need significant cleanup before linking?

---

## Part 4: Resource Allocation Between Capture and Verification

### The Problem

The Seed emphasizes capture (adding new notes) but doesn't set boundaries. This creates a capture trap:
- More notes = more maintenance burden
- More topics = more surface area to verify
- More links = more potential broken connections
- No stopping rule = infinite growth with no quality guarantee

### Capture Threshold Determination

The Seed provides clear guidance on:
- **What to capture** (utility, connection, uniqueness)
- **When to create notes** (Note Creation Decision Framework)
- **How to organize** (atomicity, linking, taxonomy)
- **How to verify** (confidence markers, verification modes)

But it lacks explicit guidance on:
- **How much** is enough for a given topic
- **When** to stop capturing and start verifying
- **How to determine** if a piece of knowledge is "notable" enough to warrant its own note

### The Capture-Verify Balance

#### Rule: Maintain Explicit Capture-Verify Ratios

**Rule:** Maintain explicit capture-to-verify ratio based on vault maturity — new vaults (first 50 notes) capture at 70/30, mature vaults (200+ notes) verify at 70/30. When unverified notes exceed 40% of total vault, pause capture and prioritize verification.

**Why:** Without explicit thresholds, AI agents default to capture (more visible, more fun) and neglect verification (invisible, tedious). This creates accumulation of unverified knowledge that undermines trust.

**Test:**
1. Can you calculate your current capture-to-verify ratio?
2. Is your ratio appropriate for your vault's maturity?
3. Do you have a process to shift from capture to verify when thresholds are hit?

**Implementation:**
```yaml
vault-metrics:
  capture-verify-ratio: 65/35  # capture/verify
  unverified-percentage: 38
  verification-backlog: 23  # notes pending verification
  capture-pause-threshold: 40  # pause capture at 40% unverified
```

### Notability Threshold

**Rule:** Use the "3-strike" rule — if the same piece of knowledge is needed 3+ times across different contexts, it warrants its own note. Until then, keep it as part of another note.

**Why:** Notability should be driven by actual utility, not speculation. Waiting for 3-use pattern ensures the note will actually be retrieved.

**Test:**
1. Can you track knowledge fragments needed across your vault?
2. Do any fragments appear 3+ times?
3. Have you created notes for high-frequency fragments?

### Domain-Velocity-Aware Thresholds

**Rule:** Define explicit capture thresholds based on domain velocity — low-velocity domains require fewer but higher-quality notes (minimum 15-20 foundational notes before verification), high-velocity domains allow more shallow notes but require faster verification cycles.

**Why:** Domain velocity determines how quickly knowledge changes, which affects capture density. Static domains need deep, few notes; rapidly evolving domains need shallow, numerous notes with faster refresh.

**Test:**
1. Can you classify your domain's velocity as low/medium/high?
2. Does your note count match the expected range for your velocity?
3. Are you capturing at the right depth for your domain?

### Calculate Marginal Capture Value

**Rule:** Before adding a new note, evaluate marginal value: Does this note address a retrieval gap, prerequisite gap, or high-frequency need? Low-value captures (curiosity-driven without clear utility) should be deprioritized in favor of verified high-value additions.

**Why:** Every note has cost: storage, maintenance, verification burden, link management. Without marginal value assessment, vaults accumulate low-utility notes that create noise without improving capability.

**Marginal Value Assessment:**
| Factor | High Value | Low Value |
|--------|------------|-----------|
| Retrieval gap | Fills a known search failure | No demonstrated need |
| Prerequisite | Enables understanding of existing topics | Standalone curiosity |
| Frequency | Addresses recurring need | One-time interest |
| Verification | Can be verified in reasonable time | Unverifiable |

### Define Completion Thresholds

**Rule:** A knowledge domain is "complete enough" when: (1) can answer 80% of typical queries for that domain, (2) core concepts have verification status, (3) hub nodes have 5+ outgoing links each, (4) orphan rate <15%. Beyond this threshold, prioritize verification over new capture.

**Why:** Without completion thresholds, capture continues indefinitely. Explicit thresholds prevent infinite capture and ensure minimum quality before moving on.

### Evaluate Capture ROI

**Rule:** Monthly, calculate knowledge capture ROI: (utility delivered / effort invested). Measure utility via retrieval success rate, query satisfaction, and knowledge application frequency. If ROI is declining for 3+ consecutive periods, shift from capture to verification/depth.

**Why:** Capture ROI naturally declines as easy knowledge is captured and only edge cases remain. Declining ROI is a signal to shift strategy. Without measurement, this signal is invisible.

### Apply Pareto Analysis

**Rule:** Identify the 20% of knowledge domains that deliver 80% of utility. Focus verification and deepening effort there first. Don't over-invest in low-utility domains just because they're interesting.

### Resource Allocation Edge Cases

- **New domain entry** — Capture-first mode is appropriate when entering a new domain. The rules should apply after initial bootstrap (20+ notes in domain).
- **Research vs. application** — Research vaults may have lower utility metrics (knowledge captured for future use). Adjust ROI expectations accordingly.
- **Safety-critical domains** — In safety-critical domains (medical, legal, engineering), verification requirements should be stricter.

---

## Integration with Seed

This framework complements:

- **[[Note Creation Decision Framework]]** — When to create new notes (but doesn't cover when or how to prioritize)
- **[[Frontier Exploration - Systematic Knowledge Exclusion Criteria]]** — What NOT to capture (but doesn't cover when)
- **[[Best Practice - Progress Over Perfection]]** — Capture selection criteria
- **[[Best Practice - Regular Review]]** — Maintenance and verification scheduling
- **[[Seed Gap - Note Deletion Criteria]]** — Low-value note handling
- **[[Knowledge Base Workflow]]** — End-to-end workflow (covers capture phase)

### What the Seed Covers vs. This Note

A knowledge base using ONLY the current Seed rules would know:
- **What to capture** — diminishing returns, priority signals
- **When to create** — note creation framework
- **What to exclude** — systematic exclusions
- **How to find gaps** — gap identification
- **How to verify** — confidence markers, verification modes
- **How to organize** — atomicity, linking, taxonomy

BUT would NOT have guidance for:
- **Real-time capture prioritization** during active learning
- **Capture timing** during learning lifecycle
- **Capture method selection** (speed vs. quality trade-offs)
- **Resource allocation** between capture and verification
- **Completion thresholds** with verification requirements
- **Marginal value assessment** before capture

---

## Test Criteria (for AI Evaluation)

- [ ] Can you calculate your current capture-to-verify ratio?
- [ ] Do you have a process to shift from capture to verify when thresholds are hit?
- [ ] Can you apply the 3-strike rule for notability decisions?
- [ ] Can you classify your domain's velocity and adjust capture accordingly?
- [ ] Can you match capture methods to knowledge types appropriately?
- [ ] Can you calculate marginal value before adding new notes?
- [ ] Can you define "complete enough" for your knowledge domains?

---

## Related Notes

- [[Frontier Exploration - Knowledge Dependency Mapping]] — Bootstrapping sequencing
- [[Frontier Exploration - Note Completion Criteria]] — When notes are complete
- [[Frontier Exploration - Domain Velocity Assessment for Unknown Domains]] — Velocity classification
- [[Seed Refinement - Domain-Velocity-Aware Confidence Decay]] — Confidence decay by velocity
- [[AI-Assisted Knowledge Management Seed]] — Core Seed rules

---

**Status:** Exploratory note (consolidated 2026-04-08)

**Deprecation Notice:** This note replaces and consolidates:
- Frontier Exploration - Knowledge Capture Strategy (original)
- Frontier Exploration - Knowledge Capture Threshold Determination (merged 2026-04-08)
- Frontier Exploration - Capture Method Optimization (merged 2026-04-08)

Also absorbed content from:
- Frontier Exploration - Knowledge Capture Prioritization During Active Learning (deprecated)
- Frontier Exploration - Knowledge Capture Resource Allocation (deprecated)
- Frontier Exploration - Knowledge Capture Timing Optimization (deprecated)

Use this consolidated note for all future reference.
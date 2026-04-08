---
last-reviewed: 2026-03-14
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
tags:
- seed-rule
- frontier-exploration
- prioritization
- decision-making
- knowledge-gaps
- gap-identification
---

# Frontier Exploration: Knowledge Prioritization and Focus Decisions

> When building a knowledge base from scratch, how does an AI agent decide what to capture next? When to expand breadth vs. deepen depth?

## The Problem

The Seed provides excellent guidance on:
- How to structure individual notes (atomicity)
- How to connect notes (linking)
- How to organize the graph (hubs, navigation)
- How to maintain quality over time

But it lacks guidance on:
- **What to capture next** when starting fresh
- **When to stop adding new topics** and start deepening
- **How to prioritize** competing knowledge gaps
- **How to know when the vault is "complete enough"**

## The Gap in Current Rules

The Seed mentions:
> "Define explicit completion criteria for each knowledge domain — state what 'done' looks like before collecting."

But it doesn't address:
1. How to determine which domain to focus on first
2. How to balance multiple domains competing for attention
3. When expansion hurts more than it helps
4. How to recognize diminishing returns

## The Exploration-Exploitation Trade-off

Building a knowledge base involves two modes:

### Exploration Mode
- Adding new topics and domains
- Creating new connections across areas
- Discovering unknown unknowns
- High breadth, lower depth

### Exploitation Mode
- Deepening existing topics
- Filling gaps in well-established areas
- Strengthening weak connections
- High depth, lower breadth

### When to Use Each

| Signal | Mode |
|--------|------|
| Vault has <20 notes | Exploration (build foundation) |
| New domain enters interest | Exploration (add domain) |
| Well-connected hub lacks detail | Exploitation (deepen) |
| Many orphaned notes | Exploitation (connect) |
| Retrieval success <70% | Exploitation (content work) |
| Graph density stagnating | Exploration (find gaps) |

## Decision Framework

### For Starting a New Vault (<50 notes)

**Priority order:**
1. **Core concepts** — fundamental ideas everything else depends on
2. **Entry points** — notes that welcome new readers
3. **Immediate needs** — knowledge you need right now
4. **Curiosity-driven** — interesting topics that connect to 1-3

**Rule:** In a new vault, prioritize foundation over breadth. 20 well-connected notes beat 50 isolated ones.

### For Growing Vaults (50-200 notes)

**Ask:**
1. Which domains have highest retrieval demand?
2. Which hubs have the most incoming links but least detail?
3. What questions keep recurring that the vault can't answer?
4. Which gaps block understanding of well-developed areas?

**Rule:** Balance exploration and exploitation. 70% exploitation, 30% exploration.

### For Mature Vaults (200+ notes)

**Ask:**
1. Is the vault answering its intended questions?
2. Which areas have diminishing returns (adding notes doesn't improve utility)?
3. Are there structural problems (orphans, deep chains)?
4. Should the vault split into multiple vaults?

**Rule:** Exploitationdominates. Only explore to fill critical gaps or address new domains.

## Priority Signals

### High Priority (Capture Soon)
- Blocks understanding of multiple other notes
- Frequently needed for decisions
- Prerequisite for advanced topics
- Frequently referenced but thin

### Medium Priority (Capture Soonish)
- Expands a well-developed area
- Connects two previously separate domains
- Captures personal experimentation results
- Fills known gaps

### Low Priority (Capture Eventually)
- Nice-to-know trivia
- Deep niche topics
- Topics with many external sources
- Topics where you have no personal context

## The Diminishing Returns Test

Before adding more notes to an area, ask:

1. **Utility test:** Does adding this note improve the vault's ability to answer questions?
2. **Connection test:** Can this note link to 2+ existing notes without forcing?
3. **Uniqueness test:** Does this add genuinely new knowledge, or just more of the same?
4. **Effort test:** Is the capture effort worth the long-term maintenance cost?

If 2+ answers are "no," consider:
- Skipping the note entirely
- Merging into an existing note
- Deferring until context develops

## Breadth vs. Depth Balance

### Too Much Breadth Symptoms
- Many topics with 1-2 links each
- No hub has >5 incoming links
- Can't answer "What is this vault about?" clearly
- Knowledge feels shallow

### Too Much Depth Symptoms
- One domain dominates (>60% of notes)
- Other domains停滞 (stagnate)
- Retrieval only works for one topic
- Vault feels specialized, not general

### Healthy Balance Indicators
- 3-5 distinct topic areas with meaningful depth
- Hubs in each area have 5-15 incoming links
- Cross-domain connections exist
- Can answer "What is this vault about?" with 2-3 sentences

## Completion Heuristics

When is a knowledge domain "complete enough"?

### For Reference KBs
- All common questions have answers
- Edge cases are documented
- Sources are verified and current
- Updates are infrequent

### For Learning KBs
- Prerequisite chains are complete
- Multiple entry points at each level
- Practice exercises or examples exist
- Self-assessment possible

### For Project KBs
- Anticipated questions are answered
- Decisions and rationale are captured
- Lessons learned are documented
- Project is closed or archived

### Domain Completeness Indicators

A topic area has "core coverage" when:
1. **Hub exists** — There's a central hub note for the topic
2. **Prerequisites identified** — Foundational concepts are captured
3. **Multiple entry points** — At least 3 different paths to access the knowledge
4. **Can answer common questions** — A newcomer could find answers to typical "getting started" questions

A topic area has "sufficient depth" when:
1. **Edge cases covered** — Common variations and edge cases exist as notes
2. **Troubleshooting exists** — Common problems and solutions are documented
3. **Advanced content exists** — At least some notes target intermediate/advanced practitioners
4. **Connections to other topics** — Links to related topic areas are established

A topic may be "saturated" (diminishing returns) when:
1. **New notes repeat existing content** — Adding a note requires significant redundancy
2. **Subtopics become trivial** — Next notes would cover minute edge cases
3. **Maintenance burden exceeds value** — Keeping current requires more effort than it provides
4. **No new questions emerge** — All natural questions from exploration are answered

## Personal vs. General Knowledge Prioritization

When you have limited capture capacity, prioritize personal knowledge over general knowledge.

> **See:** [[Frontier Exploration - Knowledge Originality Assessment]] for the full guidance on personal vs. general knowledge, the 5:1 ratio, and how to identify personal knowledge.

**Summary:**
1. **Capture personal knowledge first** — insights only you have
2. **Capture general knowledge second** — what you can look up elsewhere
3. **Capture synthesis third** — connections between personal and general

**Ratio target:** 5:1 personal to general (per [[Frontier Exploration - Knowledge Originality Assessment]])

## The Review Trigger

Set explicit triggers for prioritization review:

- After 20 new notes added
- When any topic exceeds 30% of vault
- When exploration mode lasts >2 weeks
- When exploitation mode lasts >1 month

## Example: Cooking Knowledge Base

| Priority | Note | Rationale |
|----------|------|-----------|
| 1 | Kitchen Equipment | Required for everything |
| 2 | Knife Skills | Fundamental technique |
| 3 | Heat Management | Core principle |
| 4 | Basic Sauces | High-connectivity (links to proteins, vegetables, grains) |
| 5 | Flavor Building Blocks | Foundation for recipe creation |

Without prioritization, you might start with "How to make coq au vin" — too specific, too early.

## Overflow Recovery

When capture exceeds maintenance capacity, apply triage strategies:

### Domain Triage

Rank domains by:
- **Current utility**: How much are you using this knowledge now?
- **Growth potential**: How much more valuable could this become?
- **Maintenance cost**: How often does it need updating?
- **Time to competence**: How long to reach useful proficiency?

**Action**: Focus on high-utility + low-time-to-competence domains. Defer or abandon high-maintenance + low-utility domains.

### Note Triage

For each unverified/unprocessed note:
1. **Still relevant?** If the context changed, deprecate
2. **Still actionable?** If conditions expired, archive
3. **Worth revisiting?** If may be useful later, batch for future review
4. **Critical?** If high-stakes, prioritize immediately
5. **Replaceable?** If web search can replace it in 30s, delete

### Time-Boxed Recovery

Allocate fixed time to recovery:
- Week 1: Deprecate clearly stale notes (50% time)
- Week 2-3: Verify critical notes (30% time)
- Week 4: Process new captures only (20% time)

**Goal**: Return to verification ratio ≤30% before resuming normal capture.

### When to Abandon Domains

Signs a domain should be paused/abandoned:
1. No practical application in 6+ months
2. Maintenance burden exceeds utility
3. Domain has more notes than you've ever accessed
4. You've moved to a different life phase (career change, etc.)

**Action**: Mark domain hub as `status: dormant`. Keep notes but stop adding new ones.

### Recovery Metrics

Track these to detect overflow early:
- **Processing backlog age**: Days since oldest unprocessed note
- **Verification velocity**: Notes verified per week
- **Access frequency**: Notes accessed per month
- **Domain activity**: Which domains are actually used?

Healthy vault metrics:
- Backlog age < 14 days
- Verification velocity ≥ capture velocity
- Top 20% notes accessed monthly
- 3+ domains actively used

## Knowledge Gap Identification

The Seed lacks explicit rules for identifying what knowledge is MISSING and prioritizing which gaps to fill. Without systematic gap identification, vaults accumulate based on what capture agents find interesting rather than what the vault needs.

### Gap Types

| Type | Description | Detection Method |
|------|-------------|------------------|
| Prerequisite gaps | Notes mention concepts that don't exist | Scan for undefined wikilinks |
| Utility gaps | Knowledge you'd need for frequent tasks | Track retrieval failures |
| Connection gaps | Topics that should link but don't | Graph analysis (high centrality, few connections) |
| Verification gaps | Areas where verification is impossible due to missing context | Scan for unverifiable claims |
| Perspective gaps | Single-view knowledge that should be multi-view | Check for contested topics with one side only |

### Gap Identification Protocol

1. **Prerequisite Audit** (monthly): Scan all notes for wikilinks to non-existent notes
2. **Retrieval Failure Tracking** (weekly): Log queries returning <2 satisfactory results
3. **Graph Topology Analysis** (monthly): Find high-degree nodes with no outgoing connections
4. **Contested Topic Scan** (quarterly): Find topics with only one perspective when multiple should exist

### Gap Prioritization

Priority = Impact × (1 / Effort)
- High impact (8-10): Blocking — prevents understanding other notes
- Medium impact (4-7): Useful — would significantly improve answers
- Low impact (1-3): Nice-to-have — interesting but not critical

### 70-20-10 Gap Allocation

For mature vaults (200+ notes):
- **70%** gap-filling (identified gaps from protocol above)
- **20%** verification and depth
- **10%** exploration for new domains

This inverts the bootstrap ratio because maintenance mode means filling known gaps rather than discovering new domains.

## Related

- [[AI-Assisted Knowledge Management Seed]] — The rules this note extends (see rules 9-11 for exploration/exploitation, diminishing returns, and priority signals)
- [[Frontier Exploration - Knowledge Base Utility Assessment]] — Testing if vault serves its purpose
- [[Domain-Specific Knowledge Bases]] — Organizing by domain
- [[Multi-Vault Architecture]] — When to split vaults
- [[Frontier Exploration - AI Vault Construction Decision Framework]] — Foundational structural decisions when building from scratch
- [[Note Lifecycle Management]] — Note stages and transitions
- [[The Knowledge Portfolio]] — Balancing knowledge investments
- [[Best Practice - Progress Over Perfection]] — Accumulating without purpose
- [[Frontier Exploration - Vault Growth Velocity and Sustainable Expansion]] — Growth management
- [[Frontier Exploration - Unknown Unknowns in Vast Domains]] — The harder problem of discovering what you don't know you don't know

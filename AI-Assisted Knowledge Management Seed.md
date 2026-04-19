---
protected: true
last-reviewed: 2026-04-05
last-updated: 2026-04-07
lifecycle: evergreen
confidence: high
author-type: ai-assisted
---
# AI-Assisted Knowledge Management Seed

> Drop this file into any vault to bootstrap a healthy, self-improving knowledge base.
> Every rule is testable by an AI agent — no human judgment required.
> Every rule is domain-agnostic — works for any topic.
> Latest update: 2026-04-07 — temporal-sequential knowledge handling integrated

---

## 1. Foundation

*Rules for bootstrapping a new knowledge base.*

**Rule:** Every vault must have a root note (`_root.md`) that states the vault's purpose in one sentence.
**Why:** Without a clear purpose, notes drift aimlessly and the graph lacks coherence.
**Test:** Does `_root.md` exist? Can you extract a single-sentence purpose statement from it?



**Rule (NEW - 2026-04-03):** Tag notes by primary access pattern and create use-case-specific entry points for reference-optimized lookup.



**Implementation:** Use frontmatter:
```yaml
access-pattern: lookup|learning|decision|inspiration|mixed
```
- **Lookup-optimized notes:** Concise, complete in single view, minimal navigation required
- **Learning-optimized notes:** Progressive complexity, clear prerequisites, connected concepts
- **Decision-optimized notes:** Options clearly laid out, trade-offs explicit, criteria visible
- **Inspiration-optimized notes:** Rich connections, examples from multiple domains, creative recombination-friendly

**Entry point types:**
- Reference indexes: Alphabetical/category lookup for fact retrieval
- Learning paths: Sequential progression for understanding
- Decision trees: Branching structure for choice-making
- Inspiration hubs: Cross-domain connections for creative recombination

**When to create dedicated entry points:**
- Small vaults (<200 notes): Generic linking sufficient, no dedicated entry points needed
- Large vaults (>200 notes): Query pattern analysis becomes valuable
- **Threshold:** When >60% of queries follow one access pattern, create dedicated structure optimized for that pattern
- Track query patterns for 30+ days before deciding

```yaml
# Threshold for dedicated entry points (add to vault config)
access-pattern-threshold: 0.60  # 60% = create dedicated structure
query-tracking-period: 30  # days
entry-point-optimization:
  lookup:
    max-hop-depth: 2
    require-reference-index: true
  learning:
    require-prerequisite-chains: true
    require-learning-path: true
  decision:
    require-trade-off-tables: true
    require-decision-tree: true
  inspiration:
    require-cross-domain-links: true
    min-connections-per-note: 3
```

**See also:** [[Seed Gap - Access-Pattern-Aware Knowledge Organization]] (gap now integrated)
**Edge case (stress test 2026-04-02):** In domains where the knowledge itself has inherent hierarchical structure (legal codes, technical standards, regulatory frameworks, academic curricula), pure flat-file organization loses important context. Apply modified approach:
- **Flat files still:** All notes in single directory
- **Hierarchical metadata:** Use frontmatter to encode structural relationships (`jurisdiction:`, `rule-number:`, etc.)
- **Structured wikilinks:** Allow `[[Parent/Child]]` pattern for encoding hierarchy in links
- **Faceted retrieval:** Use tags for multi-dimensional classification
- **Test:** For hierarchical domains: (1) Does frontmatter capture structural relationships? (2) Can you reconstruct hierarchy from metadata? (3) Do wikilinks encode parent-child relationships? (4) Is retrieval efficient without folder navigation?


**Rule (NEW - 2026-04-04):** Exclude workspace system files from the vault — files like AGENTS.md, SOUL.md, USER.md, IDENTITY.md, TOOLS.md, HEARTBEAT.md are operational, not content.

**Rule (NEW - 2026-04-08):** For knowledge that applies differently based on the user's current cognitive or physical state, use `cognitive-state-aware` tagging to indicate state-dependent validity.



```yaml
cognitive-state-aware: true
cognitive-state-type: alertness|decision-quality|risk-tolerance|learning-mode|creative-output
state-sensitivity: high|medium|low
valid-states: [alert, rested, caffeinated]
invalid-states: [fatigued, depleted, distracted]
state-interaction-notes: "How this knowledge changes by cognitive state"
```

**When to apply:**
- High state-sensitivity: Decision-making, risk assessment, critical actions
- Medium state-sensitivity: Learning complex concepts, creative work, problem-solving
- Low state-sensitivity: Reference lookup, factual retrieval, routine tasks

**Retrieval implications:**
- Morning queries (alert): Show comprehensive, nuanced knowledge
- Evening queries (fatigued): Show simplified, action-oriented knowledge
- State-aware retrieval is aspirational; implement based on query patterns

**Test:** (1) Can you identify notes with `cognitive-state-aware: true`? (2) Do those notes include `cognitive-state-type` and `state-sensitivity`? (3) Can you determine which cognitive states are valid vs. invalid for this knowledge? (4) Is there documentation for how state affects knowledge presentation?


**Edge case:** Domain-specific abbreviations (MRI, ECG) are acceptable when they are standard terminology.

**Additional naming guidance:** Avoid "How to..." prefixes (use noun phrases), avoid dates in titles, avoid version numbers (v1, v2) — these create noise and reduce searchability.

**Rule (NEW - 2026-04-08):** For vaults where AI agents contribute content, define and document the vault's voice and persona to ensure consistent presentation. Specify voice type in frontmatter and apply it consistently across all AI-generated notes.

> This fills the gap identified in [[Seed Gap - Knowledge Base Voice and Persona Consistency]].

**Implementation:**
```yaml
vault-voice: formal|technical|casual|friendly|academic
voice-enforcement: strict|moderate|flexible
ai-generated-tone: matching|distinct|subtle
```

- **Voice types:** `formal` (professional documentation), `technical` (specialized terminology), `casual` (conversational), `friendly` (approachable), `academic` (scholarly)
- **Enforcement levels:** `strict` (all AI notes must match exactly), `moderate` (similar tone, minor variation allowed), `flexible` (AI has creative freedom)
- **Tone distinction:** `matching` (AI matches human notes), `distinct` (AI clearly marked as AI-generated), `subtle` (AI distinguishes without being jarring)

**Why:** Inconsistent voice creates cognitive friction, reduces user trust, and makes collaborative vaults feel amateur. Voice consistency enables coherent knowledge base identity.

**Test:** (1) Does the vault define `vault-voice:` in configuration? (2) Do AI-generated notes consistently follow the defined voice? (3) Is there a mechanism to detect voice drift? (4) Can you distinguish AI-generated from human-authored content by tone?

**Edge cases:**
- Multi-section vaults with different persona requirements per section (use section-level override)
- User-facing vs. internal-only vaults (different voice standards for each)
- Existing vaults without defined voice (gradual migration strategy: audit current voice, define target, update incrementally)

**Edge case (stress test 2026-03-21):** Equipment-heavy domains (photography, audio engineering, computing) need modified conventions:
- **Product model numbers** (A7IV, R5, Z6II, UAD Apollo) are acceptable as-is when they represent standard product identifiers
- **Technical notation** (50mm, f/2.8, 24-70mm) uses standard notation rather than full expansion

> See [[Frontier Exploration - Domain Jargon vs Plain Language]] for comprehensive guidance on terminology handling.

- **Sub-conventions** may exist: concepts use noun phrases, equipment uses model numbers, techniques use action-object pattern

**Edge case (stress test 2026-03-30):** For safety-critical procedural knowledge (aviation checklists, emergency medicine protocols, critical infrastructure operations), keep complete procedures together even if >300 words. Split ONLY if parts are independently executable AND safety-independent. The risk of fragmented safety procedures outweighs reusability benefits.


**Knowledge Type Definitions:**
| Type | Description | Storage Pattern | Retrieval Mode | Verification Approach |
|------|-------------|-----------------|---------------|---------------------|
| Procedural | How to do something | Sequential, complete workflows | Sequential browse | Empirical (does it work?) |
| Conceptual | Understanding why | Atomic, highly linked | Cross-reference search | Logical consistency |
| Factual | Discrete facts/data | Compact, reference-linked | Exact-match search | Source reliability |
| Experiential | Personal experience | Context-rich, reflection-linked | Browse + temporal | Self-consistency |
| Relational | Relationships between things | Network, bidirectional links | Graph traversal | Logical relationships |
| Meta-Knowledge | Knowledge about knowledge | Principles + examples | Hybrid search+browse | Self-referential |

```yaml
knowledge-type: procedural|conceptual|factual|experiential|relational|meta
retrieval-mode: search|browse|hybrid
storage-pattern: atomic|sequential|compact|network
verification-approach: empirical|source|social|self-consistency
```

**Query Type Recognition:**
```yaml
query-patterns:
  "how do I X": procedural
  "why does X": conceptual  
  "what is X": factual
  "what happened when I X": experiential
  "X vs Y": relational
  "how to learn X": meta
```

**Multi-type notes:** Primary type determines storage; secondary types get explicit sections.
**Type migration:** Track `knowledge-type-history` in frontmatter when type changes.
**Domain-specific types:** Extend base taxonomy with domain types when needed.

**Rule (NEW - 2026-04-07):** For time-sensitive procedural knowledge, distinguish between **clock-time** (measurable duration) and **process-state** (recognizable condition indicating when to act). Document both, prioritizing process-state for steps where timing varies.



```yaml
temporal-knowledge:
  clock-time: "10 minutes"
  process-state: "small bubbles every 2-3 seconds across surface"
  process-indicators:
    visual: "surface shimmers with small, steady bubbles"
    tactile: "gentle bubbling felt through pot bottom"
    auditory: "soft, steady simmer sound"
```

**Domains where this matters:** Cooking (visual cues, texture checks), craft (pottery, woodworking: "when the clay holds its shape"), photography ("when histogram peaks"), medical ("when patient shows X response"), any iterative process where human judgment determines timing.


**Rule (NEW - 2026-04-05):** For creative-aesthetic hybrid domains, add `knowledge-intent:` tagging to distinguish technical execution from aesthetic intent.

```yaml
knowledge-intent: technical|aesthetic|hybrid
# For hybrid notes (technical means to aesthetic ends):
aesthetic-basis:
  - technical-principle: "[[Technical Note]]"
  - aesthetic-intent: "what this achieves"
  - when-to-break: "conditions where rule should be deliberately bent"
```



```yaml
verification-basis: objective|subjective|taste-based
# objective: claims verifiable through measurement or external standards
# subjective: claims reflect personal judgment varying by individual preference  
# taste-based: claims are tradition-dependent (what sounds "right" in Baroque vs Romantic)
verification-outcome: verified|unverified|aligned|not-aligned|context-dependent
# objective → verified/unverified
# subjective → context-dependent
# taste-based → aligned/not-aligned with tradition
```

**Examples:**
- Cooking: "sear at 400°F for 2 minutes" → knowledge-intent: technical, verification-basis: objective
- Music: "correct left hand position" → knowledge-intent: technical, verification-basis: objective
- Photography: "expose for the highlights" → knowledge-intent: technical, verification-basis: objective



**Rule (NEW - 2026-04-08):** When operating under time constraints, ensure every capture includes minimum viable elements: one wikilink (maintains graph connectivity), one source or provenance (establishes credibility), and a clear question or summary (ensures findability). When multiple knowledge items qualify for capture but time runs out, prioritize by: (1) dependency-critical knowledge, (2) verification-expiring knowledge, (3) foundation-enabling knowledge, (4) unique-to-this-source knowledge, (5) hard-to-recover knowledge.

```yaml
# Time-constrained capture frontmatter
capture-budget: 1m|5m|15m|30m+  # Quick capture, standard, extended, full processing
lifecycle: incomplete|complete
completion-priority: high|medium|low
estimated-completion: 5m|15m|30m|1h+
```

**Why:** Without minimum standards, partial captures become unfindable orphans that break graph connectivity. Priority ranking ensures high-value items aren't lost when time runs out.

**Test:** Can you identify time-constrained captures via capture-budget? Do they have ≥1 link, ≥1 source, clear summary? Can you rank capture candidates by priority factors?



**Rule (NEW - 2026-03-29):** For creative project knowledge bases (albums, films, novels, games, podcasts), structure notes around project phases and iteration tracking — phase transitions, abandoned directions, deadline trade-offs, and cross-project retrospective capture.
**Phase structure:** Concept → Pre-production → Production → Post-production → Release → Retrospective. Allow non-linear transitions (rewriting is normal, not failure). Store abandoned directions with rationale — "why abandoned" is learning.


**Rule (NEW - 2026-04-06):** Apply domain-aware capture sequence during bootstrap — capture in order: (1) Safety-critical knowledge (what could cause harm), (2) Core principles and essential techniques, (3) Materials and tools, (4) Standard procedures, (5) Advanced applications.

```yaml
vault-mode: exploration|exploitation|transitioning
exploration-ratio: 0.7  # 0.7 = 70% exploration, 0.3 = 70% exploitation
last-mode-transition: 2026-03-31
mode-transition-trigger: gap-filled|verification-complete|phase-threshold
```
**Phase thresholds:** 
- Exploration mode: vault <50 notes OR verification-ratio >60%
- Exploitation mode: vault >200 notes AND verification-ratio <40%
- Transitioning: when crossing thresholds, shift ratio by 10% per month until target
**Transition triggers:** Explicitly shift modes when: (1) Gap audit finds >10 unaddressed gaps, (2) Verification ratio crosses 50% threshold, (3) Vault crosses 50/200 note threshold. Document transition in vault history note with rationale.

**Rule (NEW - 2026-04-01):** For vaults spanning multiple domains, track domain-level allocation — calculate current maintenance effort by domain, measure variance from portfolio targets (30% core, 40% domain, 20% adjacent, 10% exploratory), and rebalance when variance exceeds 15% for >30 days.
```yaml
domain-allocation:
  woodworking:
    target: 0.30
    current: 0.38
    variance: +0.08
    status: over-allocated
    maintenance-burden: high  # based on domain velocity
  philosophy:
```
**Rebalancing triggers:** (1) Any domain >15% variance for >30 days, (2) Total verification backlog exceeds threshold, (3) New domain emerges requiring allocation decision, (4) Domain marked dormant/abandoned.
**Rebalancing methods:** (1) Process more notes from under-allocated domain, (2) Pause processing in over-allocated domain, (3) Mark domain as dormant if no longer relevant.

**Rule (NEW - 2026-03-22):** Systematically identify knowledge gaps and prioritize filling them — use prerequisite audits, retrieval failure tracking, graph topology analysis, and contested topic scans.
**Gap types:** Prerequisite (concepts the vault assumes), Utility (knowledge needed for frequent tasks), Connection (topics that should link but don't), Verification (unverifiable due to missing context), Perspective (single-view when multi-view expected), Safety (safety-critical procedures missing, outdated, or incomplete).
**Gap metadata schema:** Use frontmatter to track gap lifecycle:
```yaml
gap-status: identified|analyzed|proposed|integrated|deprecated  # 5-stage lifecycle
gap-priority: critical|high|medium|low
gap-phase: discovery|analysis|implementation|verification
gap-severity: blocking|useful|nice-to-have  # aligns with impact assessment
gap-source: prerequisite-audit|retrieval-failure|graph-topology|contested-scan|manual
discovered: 2026-03-26
resolved: 2026-03-27
resolved-by: [[Note Name]]  # links to the note that fills the gap
gap-owner: optional  # for collaborative vaults
gap-review-date: 2026-03-26  # when last reviewed
resolution-deadline: 2026-05-26  # optional target date
```
**Gap lifecycle stages:** (1) **identified** — Gap documented, needs analysis; (2) **analyzed** — Root cause understood, solution approach defined; (3) **proposed** — Rule written in Rule/Why/Test format, ready for Seed integration; (4) **integrated** — Rule merged into Seed, gap note archived; (5) **deprecated** — Gap no longer relevant (domain changed, resolved differently, etc.).

**Gap review cadence:** Review Seed Gap notes monthly. If a gap remains "identified" for >60 days without progress, either move to "analyzed" with proposed approach or deprecate if no longer relevant.

**Gap-to-Seed pathway:** When gap analysis reveals a pattern where the Seed lacks a rule to prevent the gap, create a Seed Gap note with `gap-type: seed-missing` documenting: (1) what gap occurred, (2) what rule is missing from the Seed, (3) proposed rule in Rule/Why/Test format. This transforms gap discovery into Seed improvement.

**Rule (NEW - 2026-03-26):** For knowledge bases serving multiple domains, create cross-topic hubs for universal problems (debugging, decision-making, risk assessment, prioritization, failure analysis) — problems are orthogonal to topics and benefit from shared structure.
```yaml
problem-type: debugging|decision|risk|prioritization|failure-analysis|verification
problem-domain: universal|implementation  # universal=applies everywhere, implementation=domain-specific
cross-topic-hub: [[Universal Problem Hub Name]]
```
**Example structure:**
- [[Problem Debugging]] (universal hub)
  - links to [[Debugging Cooking]] (implementation)
  - links to [[Debugging Code]] (implementation)
  - links to [[Debugging Garden]] (implementation)


```yaml
visual-format: diagram|chart|map|diagram|molecular|musical|schematic|photograph
visual-essential: true  # vs false - whether visual is required for understanding
visual-alt-text: "Description for accessibility"
```
**Storage options:**
- Embedded (appropriate for essential visuals under 200KB, vault stays on one platform)
- Separate note (appropriate for standalone diagrams, reusable across notes)
- External reference (appropriate for large files, version-controlled separately)
**Accessibility:** Include text alternatives for all visual knowledge. Use `visual-alt-text` field and ensure visual content can be understood through text description.


**Edge case (stress test 2026-03-26):** In software architecture knowledge bases, system diagrams communicate structural information that text cannot. Apply this rule for: architecture diagrams, sequence diagrams, ER diagrams, class diagrams, data flow diagrams. Document what each visual element represents in accompanying text.








Apply safety gap detection: specifically audit for (1) safety-warning frontmatter on procedural notes, (2) contra-indication sections in safety-critical notes, (3) historical sources lacking modern safety information, (4) missing escalation/emergency guidance, (5) outdated equipment-specific safety (tools have changed since source was written). Tag safety gaps with `safety-gap-type:` (missing-warning|outdated-warning|missing-ppe|missing-escalation|equipment-specific) and `safety-review-required: true`.
**70-20-10 allocation:** Mature vaults should allocate 70% gap-filling, 20% verification/depth, 10% exploration. This inverts the bootstrap ratio because maintenance mode means filling known gaps rather than discovering new domains.



- **Why:** Some knowledge is intrinsically ordered — the sequence IS the knowledge. Breaking it into atomic pieces loses the very thing being captured.
- **Knowledge types that benefit from sequential organization:** Musical performance, dance choreography, process engineering workflows, recipe procedures, creative project phases, audio engineering chains.
- **Implementation:**
  ```yaml
  knowledge-structure: sequential|atomic|mixed
  sequential-context: "What is lost if split?"
  chain-dependency: "[[Previous Step Note]]"
  ```

**Edge case (stress test 2026-03-22 - cooking domain):** In embodied knowledge domains (cooking, music performance, physical crafts), gap identification via metadata and graph analysis misses the most critical gaps — tacit knowledge that practitioners don't know they lack. The rule assumes gaps are discoverable through undefined wikilinks, retrieval failures, and graph topology. But embodied knowledge gaps won't appear in any graph — you can only find them by asking "what sensory information am I not capturing?"

Apply embodied gap detection: specifically audit for sensory, tactile, and kinesthetic knowledge that enables expertise but is rarely written down. Ask: "What does this technique feel like when done correctly?" "What visual/tactile/auditory cues indicate success?" Notes about techniques should include sensory anchors even if they can't fully convey the embodied knowledge.

For cooking specifically:
- Gap types should include `embodied` as a distinct category
- Context dependency is higher (seasonal ingredients, cultural traditions, user expertise level)
- "Contested" topics are mostly preference-based, not factual — filter for factual disputes only
- Verification mode differs: source verification (recipe from trusted cookbook) ≠ execution verification (actually cooked)


- Minimum links: 1 instead of 2
- Hop depth: 4 instead of 3  
- Note size: 50+ words instead of 100+
- Hub threshold: 3 notes instead of 5
**Transition rule:** At 50 notes, evaluate: (1) Orphan rate <20%? (2) Can all notes reach root in ≤4 hops? (3) Do major domains have hub notes? If any fail, refactor before continuing growth. After transition, apply full Seed rules for the flesh phase (20-100 notes).

**Post-transition:** After completing construction, apply full Seed rules with no relaxed thresholds. Shift emphasis from expansion to verification and depth. Increase scrutiny on new note quality.

**Edge case (stress test 2026-03-29):** Structural completion criteria measure vault HEALTH, not vault UTILITY. A vault can pass all structural metrics (orphan rate <10%, hub coverage >80%, verification ratio >50%) but still be unable to answer real questions. The current test measures whether the vault is well-built, not whether it works.

Add functional utility testing to completion criteria:
- **Entry Point Test:** Can a newcomer find the vault's purpose and 2+ starting points?
- **Utility Test:** Can the vault answer 5+ questions someone in this domain would actually ask, using only internal knowledge?
- **Breadth Test:** Does the vault cover 2+ distinct topic areas with cross-topic connections?

For domain-specific utility testing:
- **Philosophy:** Can explain 3+ major positions, identify core arguments for 2+ traditions
- **Cooking:** Can answer 3+ "how do I do X?" questions without external lookup
- **Home repair:** Can provide guidance on 3+ common tasks
- **Medical:** Can verify claims using internal sources, identify confidence levels

The test becomes: structural_criteria_passed AND functional_utility_passed. Both must pass before transition to maintenance mode.

```yaml
trade-off-category: organization|verification|atomicity|structure
trade-off-type: gain-lose|either-or|compromise
description: "What you gain vs. lose"
rationale: "Why this trade-off was chosen"
revisit-when: "When to reconsider this decision"
```
- Organizing by technique vs. by cuisine: gain (easy technique lookup), lose (meal planning harder)
- High verification threshold (70%): gain (reliable knowledge), lose (slower capture)
- Strict atomicity: gain (reusable components), lose (context fragmentation)






**Edge case (NEW - 2026-03-18):** New vaults need minimal schema (purpose, tags, last-updated). Mature vaults need more structure (confidence, verification-status, lifecycle, knowledge-type). High-stakes domains need domain-specific fields (jurisdiction, criticality, source-quality). Scale schema with vault maturity, not before.


```yaml
kb-purpose: client-facing|family|teaching|personal-reference
target-user-expertise: beginner|intermediate|advanced|variable
target-user-description: "Free-text description of intended user"
assumed-context:
  expertise-level: beginner|intermediate|advanced|variable
  terminology-preference: technical|plain|both
```

```yaml
infrastructure-type: network  # or hardware, geographic, power, configuration
infrastructure-scope:
  protocol: Zigbee
  router: eero-pro
  grid: on-grid
applicability-transferability: low  # rarely transfers to other configs
```
**Separation principle:** Always separate (1) general principles that apply across configs, (2) config-specific implementations. Tag config-specific notes as `applicability-transferability: low` and link from general principle hubs.

**Edge case (NEW - 2026-03-23):** In workshop-dependent craft domains (woodworking, metalworking, leatherworking, sewing), equipment tier significantly affects technique applicability. The infrastructure rule handles network/hardware/geographic/power dependencies but lacks specific guidance for equipment-tier classifications.



```yaml
equipment-tier: home-workshop  # professional | home-workshop | hand-tools-only | minimal
equipment-tiers-required:
  - circular-saw
  - hand-planes
equipment-tiers_optional:
  - jointer
  - planer
tier-adaptations:
  - tier: hand-tools-only
    adaptation: "Use hand plane instead of router for flattening"
    difficulty-increase: moderate
```

**Secondary gap - Safety review for historical sources:** Historical technique sources (pre-1950 woodworking books) often lack safety information because power tools didn't exist. Tag with:
```yaml
safety-review-required: true
historical-source: true  # pre-power-tool era
safety-gap: "Original text lacks power tool safety (did not exist)"
```


**Edge case (stress test 2026-03-17):** In sequential-skill domains (language learning, music, mathematics, programming) where knowledge has strict prerequisite chains, the construction phase thresholds need modification:
- **Extended skeleton phase:** Language learning vaults may need 75-100 notes in skeleton phase because foundational vocabulary (100+ essential words) is required before basic communication is possible.
- **Allow hop depth up to 6:** Prerequisite chains in sequential domains naturally exceed 4 hops (e.g., Alphabet → Sounds → Pronunciation → Accent Marks → Stress Rules → Advanced Pronunciation). Allow up to 6 hops for genuine learning progressions.
- **Track phase by knowledge type:** Vocabulary, grammar, and practice resources have different structural needs. Track construction phase separately for each knowledge type rather than globally.
- **Directional orphan tolerance:** Foundation notes in sequential domains may legitimately have no incoming links (prerequisites that everything else builds FROM). Distinguish outbound orphans (problematic) from inbound orphans (acceptable for foundations). Use `foundational: true` tag to exempt from inbound-orphan detection.
- **Form-specific hub tracking:** In music composition, different musical forms (sonata, rondo, theme-and-variations, fugue, symphony) represent major structural categories that require separate hub tracking. Each form has its own vocabulary, conventions, and compositional techniques. Track hub creation within each form type separately during construction.

```yaml
chain-position: input|capture|correction|enhancement|space|output
chain-stage-number: 1  # position in sequence
impact-radius: early-stage|mid-stage|late-stage|full-chain
```
**Impact radius:** Early-stage rules affect everything downstream (wide impact); late-stage rules only affect final output (narrow impact). This distinguishes "use EQ before compression" (correction stage, affects enhancement and output) from "leave headroom for mastering" (output stage, only affects final output).
**Edge case (multi-path chains):** Some domains have branching paths. Use `chain-structure: linear|branching|parallel` and document alternative paths in frontmatter.
**Edge case (feedback loops):** Some processing has feedback where output affects earlier stages. Tag with `feedback-loop: true` and specify which stage receives feedback.

```yaml
budget-scope: personal|household|business
privacy-level: personal|confidential
contains-sensitive-data: true  # for any financial detail
export-excluded: true  # exclude from vault exports
```
**Privacy rule:** Personal finance data should be excluded from vault exports and stored encrypted. Only insights, frameworks, and methodologies belong in the knowledge graph — not account numbers, transaction amounts, or balances.
> This rule was incorporated from an archived Seed Gap note (now archived).

**Edge case (NEW - 2026-04-03):** In creative writing and other subjective-domain knowledge bases (art criticism, aesthetic evaluation, creative craft), the verification-ratio rule fails due to dual challenges: (1) feedback cycles exceed 30 days by nature (beta readers: 2-8 weeks, workshop: monthly, publication: weeks to months), (2) "verified" is ambiguous — craft advice is subjective with no objective pass/fail. Apply creative-domain verification: (1) Use `verification-cycle: long-horizon` field for notes requiring extended feedback, (2) Track separate `verification-mode:` (craft-practice|workshop|beta-reader|publication), (3) Apply modified ratio: (notes verified OR notes with verification-in-progress) / notes added in last 90 days ≥0.5, (4) Use alternative status values: `practice-validated`, `workshop-validated`, `beta-validated`, `published-validated`. The standard 30-day ratio will produce false negatives in creative vaults — the vault may be high-quality but inherently slow to verify.

**Edge case (NEW - 2026-04-04):** For fitness/exercise domains where verification requires 4-12 weeks (longer than standard 30-day but shorter than long-horizon), apply medium-horizon verification parameters: (1) Use `verification-cycle: medium-horizon` field for notes requiring extended practice verification, (2) Set `verification-minimum: 8-weeks` as baseline for strength/hypertrophy protocols, (3) Use `verification-cycle: monthly` for progress tracking, (4) Mark notes as `verification-status: testing` until minimum period completes, (5) Apply modified verification ratio: (notes verified OR notes-in-progress) / notes added in last 90 days ≥0.5, (6) Allow higher unverified backlog during capture phase (up to 40%). This addresses the gap where fitness protocols cannot be verified in 30 days but don't fit long-horizon (years) category — strength gains take 4-8 weeks, muscle hypertrophy 8-12 weeks, endurance adaptation 4-12 weeks. This approach also works for habit formation (4-8 weeks to establish, 12+ weeks to confirm) and personal development domains.




```yaml
validity-scopes:
  - context: geographic
    regions: [US, CA, UK, AU]
    note: Not applicable in EU regions with different standards
    levels: [intermediate, advanced]
validity-scopes-known: [list of verified contexts]
validity-scopes-unknown: [list of unverified contexts]
```



1. Can you identify the knowledge type for any given note?
2. Does verification-status reflect the appropriate modality for that type?
3. Are there notes where modality is misaligned (factual claim verified procedurally, or vice versa)?
4. For compound notes (multiple types), is each type's verification method appropriate?
The Seed already includes verification modality fields for specific cases:
- `verification-modality: passive` — can be verified by reading alone (default)

Add explicit mapping to knowledge types:
```yaml
```

For multi-modal notes requiring multiple verification modalities, track each separately:
```yaml
verification-modes:
  - modality: source
    date: 2026-04-01
```

A note is only fully verified when all required modalities pass.


- **Agent verification limitations:** AI agents can verify source quality, consistency, and structural correctness but cannot perform embodied verification (taste food, test physical skills) or empirical validation (user testing, playtesting)
- **Verification-mode tagging:** Distinguish what agents CAN verify vs. what requires human verification — use `verification-mode: agent-verifiable|human-required`
- **Test for automated vaults:** Can you identify which notes require human verification vs. agent verification? Are verification expectations appropriate to who/what performs them?
- **Implication:** Verification ratios in automated vaults measure agent-verifiable knowledge only; human-verification-dependent notes may remain perpetually unverified by agents but are not indicators of vault health issues


**Priority categories:**
- **Level 1 (Critical):** Knowledge that could cause harm if wrong — medical advice, safety procedures, legal guidance, financial decisions, technical configurations. Requires `criticality: high` AND human expert review before marking verified.
- **Level 2 (High):** Foundational notes (core equations, fundamental laws, base definitions) — errors propagate to everything built upon them. Requires correctness verification before dependent notes are verified. Detection: notes with low backlink counts but high forward references.
- **Level 3 (Medium):** Hub notes (high backlink counts), frequently-searched notes, entry points — high traffic means outsized impact from errors. Requires completeness verification (links valid, content current).
- **Level 4 (Low):** Expensive-to-verify knowledge (long-horizon, experiential requiring specific conditions), redundant notes (delete instead), deprecated knowledge (skip).

- **Foundational:** low backlinks, high forward references (everything builds FROM it) → verify correctness first
- **Hub:** high backlinks (many things link TO it) → verify completeness (links valid, content current)
- **Small vault adaptation:** use expected-frequency scoring as proxy for usage history. Foundational notes (fundamental laws, core principles) get priority even with zero backlinks.

**Edge case (NEW - 2026-04-01):** In cooking domain, safety-critical knowledge is often embedded in non-safety notes — a note titled "Sautéing Fundamentals" contains Level 1 knowledge (oil temperature → fire hazard, food safety) but might not have safety-related frontmatter. Additionally, food safety has dual nature: general food safety rules (cross-contamination, temperature control) apply universally and are centralized, while ingredient-specific safety (toxic mushrooms, undercooked fish, bean toxicity) is scattered across ingredient notes and harder to identify.

Apply cooking-specific verification priority: (1) Scan for `safety-critical: true` OR `food-safety: true` tags, (2) Also scan content for safety-sensitive keywords: temperature, pathogen, contamination, allergen, toxic, deadly, fatal, poisoning, undercooked, parasite, (3) Check ingredient notes for safety aspects even if the primary topic is culinary, (4) Distinguish between general food safety (Level 3 in priority, but high verification effort) and ingredient-specific safety (Level 1 priority, needs domain expert).

Use additional frontmatter for cooking verification:
```yaml
food-safety-type: general|ingredient-specific|preparation-specific|storage-specific
verification-mode: source|embodied  # food safety often needs embodied verification
```

```yaml
verification-priority: critical|high|medium|low
```

**Verification ROI calculation:**
```
ROI = (note_impact × confidence_improvement) / verification_cost

Where:
- note_impact = backlinks + search_frequency + criticality_weight
- confidence_improvement = expected confidence change if verified
- verification_cost = time/effort required

Prioritize high-ROI verifications.
```

**Note:** This rule complements (does not replace) existing verification-ratio and verification-ceiling rules.

**Edge case (NEW - 2026-03-24):** In domains requiring empirical validation (game design, UX testing, user experience, teaching effectiveness), source verification is insufficient. Knowledge like "this mechanic is fun" or "this difficulty curve works" cannot be verified by checking sources — only by direct user testing. Apply empirical validation criteria:
- Source quality matters less than testing evidence
- Confidence should be tied to user testing results, not source credibility
- Add `validation-mode: empirical` for notes requiring direct testing to verify
- Track empirical evidence separately: `empirical-evidence: playtest | user-testing | field-validation | practical-application`
- Test: Can you identify what empirical evidence would confirm or refute this knowledge?


**Rule (NEW - 2026-03-24):** Handle unverifiable knowledge — knowledge that cannot be verified through any known verification pathway.
```yaml
unverifiable-type: prediction|subjective|historical|cosmological|counterfactual|philosophical
verification-pathway: none  # Explicitly mark as unverifiable
```
**Categories:**
- **Prediction**: Specific future events ( verifiable only after time passes)
- **Subjective**: First-person experience that cannot be accessed by others (qualia problem)
- **Historical**: Events that left no traceable evidence
- **Cosmological**: Claims beyond observable universe
- **Counterfactual**: What would have happened if something different occurred
- **Philosophical**: Claims that are framework-dependent rather than empirically resolvable

```yaml
verification-status: unverified|verified|unverifiable|method-unavailable|community-validated|community-accepted
verification-method-unavailable-since: 2026-04-03
verification-method-unavailable-reason: equipment-missing|access-revoked|credentials-expired|window-missed
verification-method-alternatives: ["alternative-method-1", "alternative-method-2"]

# Additional procedural verification metadata
risk-level: low|medium|high  # procedural risk assessment
skill-level: beginner|intermediate|advanced  # user capability requirement
materials-tested: [specific products used during verification]
```
**Verification workflow update:**
1. Assess: Can this be verified? Through what method?
2. Check availability: Is the method currently accessible?
3. Tag: Set appropriate verification-status and availability
4. Execute: Perform verification when method becomes available
5. Update: Change status based on result

**Edge cases:**
- **Partial availability:** Some verification methods available, others not. Tag with `verification-methods:` array showing each method's status.
- **Time-bounded unavailability:** Access might return at known time. Add `verification-method-available-when: 2026-05-01` (e.g., equipment returns from repair).
- **Alternative methods exist:** When primary method unavailable but alternatives exist. Document alternatives in frontmatter.




**Implementation — `materials-tested`:**
```yaml
  - "Brand X epoxy"
  - "Jorgensen clamps"
```

**Implementation — `risk-level`:**
```yaml
```
**Distinction:** `risk-level` is about PROCEDURE risk (what happens if done wrong); `criticality` is about KNOWLEDGE importance (impact if missing); `safety-critical` is a boolean for extreme cases.

**Implementation — `skill-level`:**
```yaml
```
```yaml
skill-level-components:
  - component: "preparation"
    level: beginner
```

**Implementation — `community-accepted` vs `community-validated`:**
```yaml
# Option 1: Extended verification-status enum

# Option 2: Separate boolean fields
community-validated: true  # actually tested by community members
community-accepted: true  # widely believed, not systematically tested
```
**Evidence distinction:** `community-validated` = "I tried this and it worked" (multiple accounts); `community-accepted` = "Everyone says this is how it's done" (traditional wisdom).


```yaml
verification-tool: [specific-tool-or-expertise-required]
tool-accessibility: available|requires-purchase|requires-expert
verified-by-tool: true|false
tool-verification-date: 2026-03-26
```
**Verification pathway for tool-dependent:** Mark as `verification-status: tool-dependent-pending` until tool verification is performed. Use `verification-status: tool-verified` after confirmed by appropriate tool.
- **Source + tool-dependent:** "This medication was prescribed" is source-verifiable. "This medication is authentic" is tool-dependent (could be counterfeit).
- **Embodied vs tool-dependent:** Eating food to verify it's safe = embodied. Testing food in a lab = tool-dependent.
- **Expertise as tool:** Some verifications require human experts (botanist, electrician). Treat expert consultation as tool verification.
**Relationship to existing rules:** If tool is unavailable or verification is infeasible, apply unverifiable handling. High-stakes domains (medical, safety, structural) often have critical tool-dependent knowledge.

**Rule (NEW - 2026-03-27):** For knowledge that can only be validated through practice drills (not through source-checking, actual use, or tool execution), tag with `verification-mode: drill-verified` and track drill frequency.
```yaml
certification-equivalent: "Organization and version (e.g., AHA CPR 2020)"
certification-valid-until: 2027-03-27
last-practiced: 2026-01-15
next-drill-due: 2026-04-15
drill-frequency: quarterly|annually|biannual
drill-type: physical|paper-scenario|mental-rehearsal
```
**Drill status guidance:**
- `drill-validated` — practiced within the drill frequency window
- `drill-overdue` — past the next-drill-due date
- `drill-pending` — captured but not yet practiced
**Verification pathway:** Drill-verified knowledge achieves "verified" status through documented practice, not through source quality. The verification is about recall capability under stress, not about the correctness of the source material.

- **Self-taught emergency knowledge:** If you learned from YouTube而非certified course, note `certification-equivalent: self-taught` and consider formal certification
- **Drill failure:** If you fail to perform correctly during drill, mark as `verification-status: drill-failed` and update note with what went wrong
- **Domain-specific drill:** Cooking (choking response), woodworking (first-aid for injuries), travel (emergency protocols) — each domain needs drill-verified procedures

- **Edge case (stress test 2026-03-28 - home repair):** Safety procedures in high-consequence domains (home repair, woodworking, electrical, structural work) face unique drill verification challenges:
  - Some procedures cannot be fully drilled (ladder fall response, electrical emergency response) — use `drill-type: mental-rehearsal` when full drill is not feasible
  - High-consequence knowledge (electrical, structural, height work) requires both source AND drill verification for full confidence
  - Add `exposure-frequency:` (daily|weekly|monthly|rarely) to calculate appropriate drill frequency based on how often the person uses these skills
  - For procedures requiring professional certification, tag `professional-required: true`
  - Safety-critical knowledge is often both drill-verified AND source-verified — the two verification modes are orthogonal, not mutually exclusive

**Why this matters:** Knowledge you hope to never use still needs verification — but the verification method is fundamentally different. CPR knowledge that "looks correct" in a note may fail under stress if not internalized through practice.


**Rule (REFINED 2026-03-31):** When verification modes produce conflicting results, apply a verification-mode conflict resolution protocol that distinguishes conflict type, applies appropriate resolution strategy, and preserves all evidence with explicit documentation.



**Conflict Type Taxonomy:**
- **contradictory**: One claim is wrong (resolution needed — choose winner)
- **complementary**: Both valid, measure different dimensions (integration — preserve both)
- **uncertain**: Both may be wrong, genuine uncertainty (preservation with synthesis notes)
- **expanding**: Conflict reveals Seed gap (escalation — flag for Seed update)

```yaml
verification-conflict:
  mode1: tool-dependent
  mode1-result: fail
  mode1-date: 2026-03-28
  mode2: source
  mode2-result: pass
  mode2-date: 2026-03-25
  conflict-type: contradictory|complementary|uncertain|expanding
  resolution-methodology: mode-priority|domain-priority|integration|preservation|escalation
  resolution-outcome: tool-dependent-wins|preserved|acknowledged|escalated
  resolution-rationale: "Explanation of decision"
  conflict-status: resolved|acknowledged|escalated

# For complementary conflicts (both valid, different dimensions):
integration-documentation:
  dimension1: "What aspect mode1 captures"
  dimension2: "What aspect mode2 captures"
  synthesis-note: [[Note Name]]

# For uncertain conflicts (genuine uncertainty):
uncertainty-documentation:
  consensus-level: unanimous|majority|divergent
  evidence-synthesis: "What would resolve this"
  what-we-dont-know: "Key unknowns"

# For expanding conflicts (Seed gap):
knowledge-expansion: true
seed-gap-type: verification-mode-gap
seed-gap-note: [[Seed Gap Name]]

# For tool-dependent vs source (population-specific claims):
population-scope: generalizable|population-specific
specific-population: "elderly, comorbidities"

# For drill-verified safety knowledge:
drill-to-real-transfer-risk: low|moderate|high
drill-conditions: "simulation, clean lab environment"
real-conditions: "actual emergency, environmental factors"
```

**Conflict Resolution Hierarchy:**

*Mode-priority (default for contradictory conflicts, no domain context):*
1. **Drill-verified** — Highest reliability for action/safety knowledge
2. **Empirical** — Direct execution produces consistent results
3. **Tool-dependent** — Physical/chemical measurement (objective, repeatable)
4. **Embodied** — Personal sensory experience
5. **Source** — Authority vouching (depends on source quality)

*Domain-priority (override mode-priority for specific domains):*
- Safety/emergency → drill-verified wins always
- Experiential quality (taste, feel) → embodied wins over source
- Physical/chemical claims → tool-dependent wins over empirical
- Historical facts → source (no other mode applicable) wins
- UX/effectiveness → empirical wins over source

*Integration strategy (for complementary conflicts, especially medical/clinical):*
- Preserve both notes with explicit documentation
- Neither "wins" — they capture different dimensions
- Add integration documentation showing how both are valid

*Preservation strategy (for uncertain conflicts):*
- Keep both results with consensus-level tagging
- Document what evidence would resolve the uncertainty
- Mark confidence as disputed until resolved

*Escalation strategy (for expanding conflicts):*
- Flag with knowledge-expansion: true
- Create Seed Gap note for Seed update
- Don't force resolution when Seed itself is incomplete

**Resolution strategies:**
- **Mode-priority**: Higher mode in hierarchy wins (use for contradictory conflicts, no domain context)
- **Domain-priority**: Domain-appropriate mode wins (use when domain has established verification standards)
- **Integration**: Both modes valid, preserve with integration documentation (use for complementary conflicts)
- **Preservation**: Keep both results with conflict documentation (use when both modes valid but context differs)
- **Escalation**: Mark as disputed and defer to human/Seed judgment (use when resolution is truly ambiguous or reveals Seed gap)

- **Source quality within mode**: "Source verified" conflicts between high-quality source (peer-reviewed) and low-quality source (blog) should weight by quality within the mode, not just mode-level priority. Track `evidence-quality:` with factors (sample-size, study-design, replication, statistical-power).
- **Temporal recency within mode**: Recent empirical results may override older empirical results within the empirical mode. However, in medical domains, newer ≠ better — weight by evidence quality factors, not just recency. Track `verification-date` per mode with quality factors.
- **Cross-tier conflicts**: A lower-tier verification mode (source) can produce stronger evidence than a higher-tier mode (flawed drill test) — domain-priority override applies.
- **Embodied knowledge conflict**: Experiential knowledge that contradicts empirical findings should be preserved (not deleted) with explicit conflict notation — embodied may capture edge cases.
- **Medical domain special case**: Clinical experience (embodied) and RCT evidence (empirical) both capture valid knowledge. Use integration strategy by default, not hierarchy resolution. Clinical expertise synthesizes both modes.


**Rule (NEW - 2026-03-30):** For emergency and crisis-response knowledge, design for single-view retrieval with minimum confidence thresholds, explicit recency requirements, and panic-optimized formatting.

**Retrieval format hierarchy for emergency notes:**
1. **Visual flowchart** — process in single image (primary for crisis use)
2. **Abbreviated text** — signal → action, no explanation (secondary)
3. **Full note** — explanation for training, not crisis use (tertiary)
4. **Background/links** — deep context after crisis resolves (never in crisis)

**Single-action note structure for critical-response:**
- **Header:** Clear signal (e.g., "CHOKING: ADULT")
- **One-line action:** The exact step to take
- **Visual aid:** Embedded flowchart or image
- **Fallback:** "If no equipment" alternatives when known
- **No links required:** Self-contained within one view

- **Contested procedures:** Different authorities teach different approaches (e.g., Heimlich vs. chest thrusts). Tag with `procedure-status: contested`, document which authorities recommend what, and do NOT present contested knowledge as single truth.
- **Equipment-dependent procedures:** Some emergencies require specific equipment (AED, EpiPen). Include required equipment explicitly, equipment alternatives when known, and "If no equipment" fallback procedures.
- **Minimum confidence threshold:** Emergency knowledge tagged `emergency-knowledge: true` with `confidence: emerging` should trigger a compliance audit warning. The minimum confidence for life-critical knowledge is `high`.

**Relationship to drill-verified rule:** Drill verification answers "is the procedure correct?" Emergency retrieval answers "can the procedure be executed under stress?" Both may apply to the same note. Tag accordingly — a note can be drill-verified AND meet emergency retrieval requirements.


**Correction types:**
- `factual-error` — The knowledge was never correct (source wrong, misread, flawed synthesis)
- `outdated` — Was correct once but no longer applicable (version deprecated, best practice changed)
- `misinterpretation` — The knowledge is correct but was applied in wrong context
- `personal-error` — Your own synthesis or reasoning was flawed

```yaml
correction-type: factual-error  # factual-error|outdated|misinterpretation|personal-error
was-valid-until: 2024-06  # for outdated
correction-date: 2026-03-18
corrected-by: [[Note Name]]  # link to corrected version
correction-trigger: new-information  # source-re-evaluation|new-information|practical-failure
# Optional: preserve what was wrong
incorrect-because: "..."
lesson-learned: "..."
```
**Preservation principle:** Keep the history, not just the correction. A note showing "I used to think X" is valuable meta-knowledge. Create corrected version, mark original with correction metadata, link between them.




**Deletion criteria:** A note is a deletion candidate when ALL of these are true: (1) No incoming links (0 backlinks), (2) No historical value (not a record of what you thought), (3) No reconnection potential (can't link to active content), (4) Maintenance burden > utility. OR when ANY of these: true duplicate, factually incorrect with correction lost, violates privacy, ephemeral by design.

**Distinction from deprecation:**
| Scenario | Action |
|----------|--------|
| Note was correct, now superseded | Deprecate (preserve history) |
| Note correct, context changed, might be useful | Archive (mark as-of) |
| Note has 0 links, no significance, no future use | Delete (remove noise) |
| Note wrong, correction captured elsewhere | Delete (preserve correction, not error) |

```yaml
deletion-criteria-met: true
deletion-reason: zero-links|no-value|ephemeral|privacy
deletion-date: 2026-04-04
```
**Verification after deletion:** (1) Verify no broken links remain, (2) Check if hubs lost significant connections, (3) Document what was deleted and why.


**Privacy handling:** For notes containing information about specific people (PII, health info, financial details, relationship details), apply anonymization before fully capturing. See privacy-aware capture rule below.





**Anonymization strategies:**
- **Abstraction:** Replace specific details with categories ("colleague in tech industry" instead of name)
- **Placeholder:** Use consistent generic labels ("Person A", "Company X")
- **Structural extraction:** Capture the principle without the instance ("job loss creates financial risk" not "my friend lost their job")
- **Technical protection:** Use encryption, access control, or separate storage

**Privacy stakes by knowledge type:**
- **High (requires protection):** Health info, financial account details, professional secrets
- **Medium (abstraction sufficient):** General lessons from personal experiences
- **Low (capture as-is):** Own preferences, public facts

```yaml
anonymized: true
anonymization-strategy: abstraction|placeholder|structural|exclusion
```


```yaml
conventional-wisdom: true
conventional_wisdom_strength: strong  # strong (universally accepted) | moderate (common belief) | weak (emerging consensus)
conventional_challenges:
  - "Known challenge 1"
  - "Known challenge 2"
conventional_review_indicators:
  - "What would change this view"
```
**Domain guidance:** Medical (much "standard care" has been overturned), finance ("markets always revert"), personal productivity ("multitasking is efficient"), and technical fields ("X is best framework") all have histories of conventional wisdom being wrong. Tagging enables proactive challenge.
**Interaction with correction workflow:** When conventional wisdom IS overturned, apply existing correction workflow with `correction-type: outdated` — it was correct for its era but context changed, not that it was never correct.

**Contradiction detection:** Two notes contradict when one claims X is true and the other claims X is false, both have current validity periods (not marked outdated), and the contradiction is not resolvable by adding context (dose, timing, individual variation).
**Resolution protocol:** (1) If one source is demonstrably more reliable, prefer it and mark the other as corrected; (2) If both sources are equally credible, keep both and tag with `contradiction-status: acknowledged` linking to a synthesis note; (3) If resolution is impossible, escalate to human.
```yaml
# For notes involved in contradiction
contradiction-status: acknowledged
contradiction-with: [[Note Name]]
resolution: pending|resolved-in-favor-of|source-required

# For disputed knowledge (legitimate expert disagreement)
dispute-nature: methodological|philosophical|evidential
```
**Edge case - nuance vs. contradiction:** Note A says "coffee improves focus" and Note B says "coffee causes anxiety" might both be true at different dose levels. Before marking as contradiction, check if adding context resolves the apparent conflict.

**Edge case - nuance resolution (EXPANDED 2026-04-06):** When apparent conflicts involve degree, condition, scope, or temporal dimensions, they represent nuance rather than genuine contradiction. Document with `apparent-conflict-type: nuance` and track dimensions:
- `degree`: Document range boundaries (low to high values)
- `condition`: Explicitly state conditions under which each claim applies
- `scope`: Note different valid contexts (domain, user-type, use-case)
- `temporal`: Capture when claims held vs. when they changed

For nuance-type conflicts: (1) Check each dimension — is there a degree/range, condition, scope, or time at which both could be true? (2) If yes, mark as nuance with explicit conditions; (3) If no — it's genuine contradiction, apply resolution protocol. See [[Frontier Exploration - Nuance vs Contradiction]] for comprehensive guidance.

**Edge case - framework-dependent:** Value investing says "P/E ratios matter"; momentum investing says "they don't." These are framework-dependent, not contradictions. Tag as `framework-dependent: true` instead.
**Edge case - temporal:** If one note is marked outdated, it's not a simultaneous contradiction — it's handled by existing correction rules.

**Edge case (NEW - 2026-03-21):** In philosophical and framework-dependent domains, apparent contradictions may not be resolvable. Add `contradiction-type:` taxonomy:
- `empirical` — resolvable through evidence
- `definitional` — resolvable through agreed definitions
- `framework` — requires choosing a framework (no single "correct" answer)
- `genuine` — both positions have valid arguments, unresolved by design
- `internal` — the note self-contradicts (self-defeating argument)

- `destabilizing` — arguments that could undermine trust in the vault (e.g., radical skepticism)
- Include counter-argument links when including destabilizing content
- Consider quarantine or explicit warning tags for vault-breaking content

- Tag with `moral-framework: consequentialist|deontological|virtue-ethics|care-ethics`
- These are framework-dependent, not contradictions to resolve
- Resolution = acknowledgment, not preference for one framework over another

**Rule (NEW - 2026-03-21):** Distinguish prescriptive from descriptive knowledge and apply intent-based resolution for prescriptive conflicts.
```yaml
prescriptive-type: prescriptive  # vs. descriptive
prescriptive-intent: [aesthetic-quality, efficiency, safety]
conflict-resolution-mode: intent-based  # framework-choice|intent-based|context-dependent|hierarchy
resolution-guide:
  - when: "goal is X"
    do: "follow rule A"
```

- `context-reconciliation` — Your context differs; both are valid for their contexts
- `sample-size` — N=1 is insufficient to overturn population evidence
- `update` — Personal experience reveals published knowledge is wrong
- `uncertainty` — Truth is more complex than either captures
- `personal-exception` — Your conditions make general rule inapplicable
**Documentation:**
```yaml
contradiction-type: personal-vs-published
published-claim: "What sources claim"
personal-observation: "What you experienced"
resolution-approach: context-reconciliation|sample-size|update|uncertainty|personal-exception
context-factors: [relevant differences from typical conditions]
sample-size: number
```
**When to trust personal over published:** (1) Large sample size (N>30 or repeated trials), (2) Consistent results over time, (3) Published source is low-quality or outdated, (4) Your context is well-documented and systematically different.
**When to trust published over personal:** (1) Small sample size, (2) Single observation, (3) Published from high-quality peer-reviewed source, (4) No clear context differences.

**Priority order:** (1) Safety/harm-prevention, (2) Verification/accuracy, (3) User-protection/domain-stakes, (4) Domain-specific edge cases, (5) Construction-phase relaxation, (6) Quality over quantity, (7) Recency (newer Seed beats older).
```yaml
conflict-resolution:
  rules_in_tension: ["rule A", "rule B"]
  priority_applied: "Which priority level ruled"
```

**Rule (UPDATED - 2026-03-29):** Use diminishing returns testing before adding notes to existing topics — apply stakes-aware thresholds, use override conditions for critical knowledge, and handle temporal/experiential domains with domain-appropriate tests.

**Stakes-aware test:** Apply different threshold strictness based on `stakes-category`:
- **High-stakes (medical, legal, safety, financial):** Override test if any override condition is true; otherwise pass 3+ tests
- **Medium-stakes (personal finance, career, education):** Pass at least 2 tests AND have expertise-evidence; override requires both
- **Low-stakes (hobbies, leisure, exploration):** Pass 3+ tests (standard threshold)

**Override conditions (bypass test if any true):**
- `criticality: high` — safety-critical, life-threatening conditions
- `rare-condition: true` — niche knowledge essential for completeness
- `emergency-protocol: true` — life-threatening emergency procedures
- `prerequisite: true` — foundational for understanding other notes
- `foundational-prerequisite: true` — unlocks multiple domains
- `asymmetric-consequence: true` — catastrophic failure possible
- `design-phase: ideation` — creative exploration needs divergent capture

**Stakes-criteria for classification:**
```yaml
stakes-category: high|medium|low
stakes-criteria:
  impact-magnitude: "Scale of potential harm/gain"
  reversibility: "Can outcome be reversed if wrong?"
  time-horizon: "When will consequences manifest?"
  social-consequences: "Relationship/reputation impacts?"
```
**Evidence requirements:** High-stakes override requires `criticality: high` OR `rare-condition: true` only. Medium-stakes override requires 2+ test passes AND expertise-evidence.

**Domain-specific test adaptations:**

*Temporal-aware domains (software, rapidly-evolving fields):* Check: Is this for an ACTIVE version/framework? Does it have temporal validity markers? Notes with `framework-status: deprecated` automatically fail the utility test.

*Experiential domains (cooking, crafts, music, physical skills):* If execution-uncertainty is high: capture with `verification-status: unverified` and `verification-modality: practice-required`, prioritize testing over passive rejection. Don't reject based on paper assessment when hands-on execution may reveal value.

*Role-dependent domains (medical, specialized professions):* Assess utility against primary intended audience. Use `applicability-role:` frontmatter.

**Version and framework tracking for technical domains:**
```yaml
version-scope: "2.0+"  # Version range this note applies to
framework: [pytorch|tensorflow|jax|...]
framework-status: active|deprecated|legacy
utility-expiry: YYYY-MM  # When utility likely expires
```

**Stakes-aware effort weighting:** Weight the effort test by stakes:
- High-stakes + high effort = valuable even if redundant
- Medium-stakes + high effort = marginal value unless expertise-evidence is strong
- Low-stakes + high effort = likely not worth capture



```yaml
volatility-type: version-sensitive|price-sensitive|time-sensitive|stable
external-availability: high|medium|low
```


```yaml
evolution-pattern: discrete|slow|cyclical|deepening
update-frequency: monthly|quarterly|annually|as-needed
last-substantial-change: 2026-01-15
change-count: 5
```
**Strategy guidance:**
- Discrete (software releases): Version notes with upgrade paths
- Slow evolution (best practices): Edit in-place with changelog
- Cyclical (tool preferences): Archive old, create new note
- Deepening (understanding): Single evolving note





```yaml
version-control: enabled
version: 3
version-history:
  - version: 1
    change: "Initial capture"
dependencies-affected:
  - [[Dependent Note A]]
  - [[Dependent Note B]]
version-strategy: preserve-all|latest-only|archive-old
```

**Change categories:**
- **Correction**: Knowledge was wrong, now correct (requires dependency check)
- **Expansion**: Knowledge was incomplete, now fuller
- **Refinement**: Knowledge was correct, now more precise
- **Deprecation**: Knowledge still correct but superseded by newer

**Dependency check protocol:** When a high-dependency note changes: (1) List all notes linking TO this note, (2) For each, check if content depends on the specific aspect that changed, (3) Update or flag dependent notes, (4) Document dependency updates in change log.

**Simplified approach:** For notes with <3 dependencies, skip explicit version control. Focus version control effort on hub notes and foundational concepts where dependencies are highest.


**Rule (NEW - 2026-03-25):** Tag knowledge with inherent expiration windows using validity-period metadata — distinguish from outdated knowledge by understanding the difference between "was correct, now wrong" vs. "was applicable, context has passed."



```yaml
expiration-type: inherent
validity-period:
  start: 2026-03-25
  end: 2026-03-27
applicability-status: active|expired|archived
post-expiration-handling: historical-archive|delete|review
```

**Distinction guide:**
- `was-valid-until` + `correction-type: outdated`: Was believed true, discovered false
- `validity-period` with `expiration-type: inherent`: Was applicable, context passed
- `utility-expiry`: Time-sensitive data that can be refreshed
- `expiration-interval`: Review frequency, not applicability window


**Edge case (NEW - 2026-03-25):** Seasonal knowledge has cyclic applicability — applies during specific seasons, then becomes "dormant" but not "wrong." A planting guide is valid in spring, "wrong" in fall only if applied literally, but actually just "not currently applicable."


**Edge case (NEW - stress tested):** In context-dependent objective domains (medicine, law, engineering) and high-stakes domains, the diminishing returns test needs modification:
- **Role-dependent utility:** A note about "rare cardiac condition" has high utility for cardiologists but low utility for GPs. Apply role-based utility assessment: use `applicability-role:` to specify who this knowledge serves.
- **Critical knowledge exemption:** In high-stakes domains (medical diagnosis, legal precedent, safety procedures), rare but critical knowledge should be exempt from the test. A note about a rare but life-threatening allergic reaction may fail all four tests but is essential for completeness. Use `criticality: high` frontmatter to exempt from diminishing returns testing.
- **Asymmetric value:** Medical knowledge has inherent asymmetry - common conditions are high-utility but not all high-utility knowledge is common. The test should not favor frequency over importance.

**Edge case (stress test 2026-03-16):** In experiential domains (cooking, music performance, crafts, physical skills, gardening), diminishing returns testing should account for execution uncertainty. The test assumes knowledge can be evaluated without execution — but in experiential domains, you often cannot assess utility without trying. A recipe may look similar to existing ones but produce different results; a technique may seem redundant in description but be transformative in practice.

Apply modified test: (1) Can I actually test this? (execution feasibility), (2) Might the outcome differ despite similar description? (execution uncertainty), (3) Do I need hands-on experience to judge value? If yes to 2-3, capture with verification-status: unverified and prioritize testing over passive expansion.

**Verification workflow (required):** Experiential knowledge requires lifecycle tracking:
- `verification-status: unverified` — captured but not yet tested

Modified test for experiential domains: For the last 5 notes, do 3+ pass OR have verification-status of testing/verified? (Unverified notes don't count toward passing until tested.)

This is distinct from subjective domains — the issue is not that value is subjective, but that value cannot be known without execution.

**Edge case (NEW - stress test 2026-03-17):** In long-horizon verification domains (gardening, permaculture, tree fruits, forestry, beekeeping, wine-making), verification takes years, not weeks. Standard verification workflow assumes days-to-months timeframes, but:
- Perennials may take 3-5 years to truly assess (does the fruit tree thrive? survive winter? produce well?)
- One year's success may be weather-related, not the knowledge — need multiple years to confirm
- Seasonal variations mean spring planting ≠ fall planting success
- **Explicit requirement for "verified" status:** Require 2+ growing seasons with consistent results before marking perennial notes as verified

Apply long-horizon verification: (1) Use `verification-cycle:` field with values `annual|multi-year|perennial`, (2) Mark notes as `verification-status: multi-year-pending` with explicit `verification-completion-target: YYYY`, (3) Don't count toward verification ratio until cycle completes (minimum 2 growing seasons), (4) Allow higher unverified backlog for long-horizon domains (up to 50%) since verification is inherently slower.

Example frontmatter for long-horizon knowledge:
```yaml
verification-cycle: perennial
verification-completion-target: 2029
verification-years-completed: 1
```

The test: For gardening/permaculture/tree notes, do 3+ pass OR have verification-cycle: perennial with at least 2 years of data? (First-year notes don't count toward verified status until year 2+ confirms success.)

This is distinct from standard experiential domains — the issue is not that execution is uncertain (cooking), but that the verification timeline itself spans years.

**Edge case (NEW - 2026-03-19):** For practice-required knowledge (cooking, music performance, physical skills), distinguish verification modality from verification status. Add `verification-modality:` field with values:
- `passive` — can be verified by reading alone (default)
- `practice-required` — requires active execution to verify
- `hybrid` — needs both source check AND practice

Also track execution separately from knowledge validity using `practice-status:` field (not-attempted | in-progress | successful | failed). A note can contain correct knowledge applied incorrectly — distinguish "knowledge wrong" from "execution poor." For practice-required notes, set realistic verification timeframes (30-day windows often insufficient) and use `expected-verify-when:` field for planning.

```yaml
embodied-component: essential  # essential|nice-to-have|none
sensory-modes: [tactile, kinesthetic, visual, auditory]
sensory-anchor: "Like pressing a ripe avocado — slight give"
verification-modality: embodied  # distinct from passive/practice-required
```

```yaml
execution-type: command|script|api|config|query|build
execution-environment:
  os: linux|macos|windows|cross-platform
  required-tools: [tool1, tool2]
  required-version: ">=1.0.0"
  dependencies: [dep1, dep2]
expected-output:
  type: file|stdout|stderr|exit-code|data-structure
  validation-criteria: "What correct output looks like"
execution-safety: safe|destructive|requires-confirmation
execution-status: verified|failed|pending|not-attempted
last-executed: 2026-03-21
```

```yaml
knowledge-source-type: intuition|analysis|authority|experiment|synthesis
synthesis-type: cross-source|inductive|deductive|analogical  # for synthesis
intuition-type: pattern-recognition|expert-tacit|gut-feeling  # for intuition
analysis-type: statistical|deductive|comparative  # for analysis
authority-type: expert|publication|institution  # for authority
experiment-context: controlled|field|observational  # for experiment
```

**Source-appropriate verification:**
- **Intuition**: Verify through real-world outcomes, not source citation; track experience level of source
- **Analysis**: Verify through methodology review, reproducibility, and sensitivity testing
- **Authority**: Verify through source credibility assessment and citation cross-check
- **Experiment**: Verify through replication and effect size confirmation
- **Synthesis**: Verify through re-synthesis from current sources; check if any source changed; validate reasoning chain

**Intuition reliability heuristic:** Intuition is more reliable when: (1) Domain has stable patterns, (2) Source has deep experience (thousands of relevant exposures), (3) Intuition is specific, not vague. Intuition is less reliable when: (1) Domain has novel elements, (2) Source has limited relevant experience, (3) Intuition is general or vague.

**Synthesis reliability heuristic:** Synthesis is more reliable when: (1) Sources are independent (not citing each other), (2) Reasoning chain is explicit and traceable, (3) Multiple synthesis paths converge on same conclusion, (4) Sources are current (no outdated information). Synthesis is less reliable when: (1) Sources are not independent (circular citations), (2) Reasoning chain is implicit or missing, (3) Single synthesis path, (4) Any source is known to be outdated or contested.

**Synthesis metadata requirements:** For notes tagged with `knowledge-source-type: synthesis`, include:
```yaml
synthesis-sources: [list of source note references]
synthesis-method: [cross-source|inductive|deductive|analogical]
synthesis-date: YYYY-MM-DD
synthesis-validates: [what this synthesis confirms or contradicts]
```

```yaml
knowledge-representation-style: intuitive-analytical|analytical-intuitive|balanced|mixed
# intuitive-analytical: acquired analytically, now feels intuitive through practice
# analytical-intuitive: acquired through experience, analytically reconstructed
# balanced: both representations available
# mixed: some aspects intuitive, some analytical
source-representation-gap: true|false  # true if feels different from how learned
```

**Representation-style conflict handling:** When intuition and analysis disagree, preserve both with explicit conflict notation:
```yaml
intuition-position: "What gut feeling says"
analysis-position: "What analysis shows"
resolution-context: "When analysis wins vs when intuition wins"
resolution-evidence: "What evidence would change your mind"
```

**Transfer reliability:** Knowledge with source-representation gap (e.g., analytically-reconstructed experience knowledge) is less transferable — the representation feels articulate but the underlying knowledge depends on tacit dimensions. Tag with `transfer-reliability: reduced` when this gap exists.
- `synthesis-sources:` — list of 2+ notes/sources combined
- `reasoning-chain:` — brief explanation of how sources combine
- `last-synthesized:` — date of synthesis (important for re-synthesis checking)
- `synthesis-confidence-calibration:` — high|medium|low (typically medium or lower)



- **Tested Methodology (Tier 1):** Directly verified through controlled execution or experiment
- **Documented Experience (Tier 2):** Multiple instances of successful application, tracked outcomes
- **Expert Consensus (Tier 3):** Widely agreed within community of practice, no known contradictions
- **Authoritative Source (Tier 4):** Single trusted source, credible credentials
- **Established Convention (Tier 5):** Commonly accepted practice, origin unclear
- **Personal Discovery (Tier 6):** Individual's own findings, untested by others



```yaml
evidence-tier: tested-methodology  # 1-6 from table above
evidence-basis: "Multiple controlled tests across 3+ recipes"
replication-status: replicated|partial|unreplicated
```




**Rule (NEW - 2026-03-31):** Track original knowledge provenance separately from sourced knowledge — for knowledge without external sources (original synthesis, personal experiments, untested hypotheses, intuition-based insights), use `source-origin` frontmatter to distinguish from external-sourced knowledge.
```yaml
source-origin: original  # vs. external (has cited source)
source-origin-type: synthesis|hypothesis|invention|intuition|experiential|empirical
# synthesis: Combined 2+ experiences/ideas into new insight
# hypothesis: Proposed explanation without testing
# invention: Novel creation or method
# intuition: Pattern recognition from deep experience
# experiential: From personal practice (no external validation)
# empirical: From your own experiments (documented methodology)
# For synthesis-type:
synthesis-basis: ["experience 1", "experience 2"]
reasoning-chain: "Brief explanation of how insight emerged"
# For hypothesis-type:
hypothesis-status: untested|planned-test|failed|confirmed
test-protocol: "How to test this hypothesis"
# For empirical-type:
results: "What you observed"
```

**Confidence calibration by source-origin:**
| Type | Default Confidence | Rationale |
|------|-------------------|-----------|
| synthesis (from experiences) | medium | Pattern recognition, needs confirmation |
| hypothesis (proposed, untested) | speculative | Unvalidated, may be wrong |
| invention (novel creation) | emerging | No comparison point yet |
| intuition (expert-level) | medium-high | Expert pattern recognition |
| experiential (personal practice) | emerging | Depends on iteration count |
| empirical (documented experiment) | emerging/confirmed | Depends on results |

**Distinction from existing fields:** This is orthogonal to `knowledge-source-type` (which tracks how knowledge was derived) and `evidence-tier` (which tracks evidence strength). `source-origin` specifically tracks whether external sources exist at all.


```yaml
synthesis-vs-authority: true
field-stability: stable|moderate|rapid
prediction-validated: true|false|pending
inverse-authority-justified: true|false
```
**High-stakes exception:** In medical, legal, and safety domains, always default to authoritative sources unless you hold domain credentials.

**Edge case (stress test 2026-03-25 - personal finance):** The rule's high/low dichotomy misses "medium-stakes" domains like personal finance, career decisions, and educational choices — significant consequences but not catastrophic if wrong. Apply modified criteria:
- **Medium-stakes require stronger expertise evidence:** Unlike high-stakes (where credentials are clear) or low-stakes (where expertise matters less), medium-stakes needs explicit expertise documentation. Require: demonstrable track record, relevant experience years, or verifiable outcomes.
- **Validation timelines vary by domain:** Finance strategies might take years to validate; the rule's "prediction tested" criterion assumes shorter feedback loops. Add `validation-timeline: short|medium|long` to set expectations.
- **Source quality classification matters more:** In finance, "authoritative sources" range from peer-reviewed research to blog posts. Classify sources as `peer-reviewed`, `industry-recognized`, `credentialed-expert`, or `popular` with appropriate weighting.
- **Stakes-category field:** Add `stakes-category: high|medium|low` to notes where inverse authority applies:
```yaml
expertise-evidence:
  track-record-years: 10
  market-cycles-survived: 3
  verifiable-outcomes: true
authoritative-source-type: peer-reviewed
validation-timeline: long
```

- **Technical knowledge:** Objectively testable, utility can be evaluated without execution (exposure settings, autofocus modes, color science)
- **Aesthetic knowledge:** Execution-dependent, utility requires trying in context (composition styles, lighting approaches, editing styles)


This is distinct from both subjective domains (where value is inherently perspective-dependent) and pure experiential domains (where execution uncertainty is uniform). Hybrid domains need dual-track assessment.



- **Version-scoped utility:** A note about "TensorFlow Keras API" was high utility in 2020, zero utility in 2026 if PyTorch dominates. The test should ask: "Does this improve answers for the CURRENT version/framework in active use?" Add `version:`, `framework:`, and `framework-status: active|deprecated|legacy` frontmatter.
- **Utility expiry:** Add `utility-expiry:` field for time-sensitive knowledge. For rapidly-evolving domains, utility can expire within months, not years.
- **Connection quality over quantity:** ML topics connect to many fields (neural networks connect to optimization, linear algebra, Python, hardware) but relationships are often weak. Require at least 1 strong connection (directly applicable variant/implementation), not just 2+ weak foundational links.
- **Contextual uniqueness:** In ML/DS, almost nothing is "unique" — the web has everything. Redefine uniqueness as "adds YOUR specific context" (your implementation, your debugging notes, your specific use case) rather than "not available elsewhere."
- **Framework deprecation:** Track framework status explicitly. Notes about deprecated frameworks (Theano, Caffe, CNTK) should be archived or marked historical — utility can drop to zero when frameworks sunset.
- **Stakes weighting:** High-effort + low-stakes = marginal value. Weight effort by stakes: critical vs. niche knowledge should be treated differently.

The core diminishing returns insight remains valid — don't add marginal notes that bloat the vault — but implementation needs domain-specific adaptations for rapidly-evolving technical fields.

**Edge case (NEW - stress test 2026-03-18):** In board game design and similar creative-experiential hybrid domains, diminishing returns testing needs significant modification:
- **Phase-aware testing:** Apply different thresholds based on design phase — ideation (no test), exploration (fail 3+ of 4), development (fail 2+ of 4), refinement (fail 1+ of 4). Tag notes with `design-phase: ideation|exploration|development|refinement`.
- **Project-specific utility:** For design-in-progress vaults, utility should be measured against the current project, not abstract "vault answers."
- **Experiential exemption:** Playtest feedback notes don't count toward diminishing returns until synthesized into design principles. Tag with `knowledge-type: experiential` and `verification-status: testing`.
- **Scope tagging:** Require `genre-scope:`, `player-count:`, and `skill-tier:` fields to enable accurate uniqueness assessment. Strategy advice valid at one player count may be false at another.

**Modified test for game design:** For game design notes: (1) Does this apply to a specific design phase? (2) Does it have clear scope boundaries (genre, player count, skill tier)? (3) Is playtest feedback tagged as experiential before synthesis? (4) Could this inspire new mechanics even if it fails other tests? Count as passing if yes to 1-2 OR yes to 4 (ideation exemption).


```yaml
error-type: software|system|configuration|dependency|syntax
error-code: "Exact error message"
context:
  tool: tool name and version
  environment: OS, setup details
root-cause: What actually caused the error
resolution-type: workaround|fix|config-change|version-bump
applicability: personal|general
error-valid-until: 2026-06  # When this error may become obsolete
```

**Rule (NEW - 2026-03-23):** Distinguish immediate utility from potential utility (option value) — apply different capture criteria for knowledge that might matter someday.
```yaml
utility-type: immediate|potential|deferred
potential_utility_scenarios:
  - scenario: "Future domain or use case"
    likelihood: low|medium|high
    timeframe: near|medium|long
capture_urgency: now|when_convenient|defer
```
**Modified diminishing returns for potential utility:** Instead of the standard test (utility + connection + uniqueness + effort), apply modified criteria for option value knowledge: capture if (cost_of_missing = high) OR ((future_paths >= 2) AND (capture_cost = low)). This preserves potentially valuable knowledge without unbounded capture.
**Option value categories:**
- **Domain adjacency**: Knowledge about fields you might enter (low immediate need, high if you enter that field)
- **Capability building**: Skills that expand what you can do (foundational for unexpected uses)
- **Rare-but-critical**: Low-frequency scenarios with high impact when they occur
- **Niche technical**: Specific knowledge for edge cases that may become relevant
**Deferred capture:** For high-cost capture with uncertain utility, create a gap note instead of capturing immediately. Document what would trigger capture when you reach that domain.

**Edge case (stress test 2026-03-22 - programming domain):** In programming and software development, error knowledge capture needs significant domain-specific enhancements:

- **Same error, different causes:** The same error message (e.g., "ModuleNotFoundError") can have multiple root causes (package not installed, wrong environment, wrong working directory). Use context-specific notes with shared tags rather than consolidated notes — different contexts require different solutions. Consider `error-pattern:` for regex matching across error message variations, with `error-code:` as a primary example.

- **Error validity by category:** Programming errors have different expected lifespans. Use `error-expiry-category:` with values: `tool-version-specific` (6-12 months), `language-version-specific` (12-24 months), `environment-specific` (varies), `permanent` (fundamental errors like division by zero).

- **Cascading errors:** One error often causes another. Use `causes:` and `caused-by:` fields to track error cascades, helping trace failures back to root cause.

- **Reproducibility variation:** Errors may be reproducible on some machines but not others. Use `reproducibility:` field with values `always`, `environment-dependent`, `intermittent`.

- **Community vs personal solutions:** Many errors are already documented on Stack Overflow. Use `solution-source:` field with values `community` (widely available), `personal` (your specific context required unique solution), `hybrid` (community + personal adaptation).

- **Errors vs warnings vs deprecation:** Distinguish `error-type: fatal` (crashes), `error-type: warning` (non-fatal), `error-type: deprecation` (will become error in future). Tag deprecation warnings differently — they're not errors yet but signal upcoming changes.



- **Cooking "errors" are sensory descriptions, not codes:** Instead of error codes, cooking errors manifest as sensory observations ("sauce is grainy", "bread didn't rise", "steak is tough", "cookies are dry"). Use descriptive error categories: `textural`, `visual`, `flavor`, `structural`, `thermal`. Capture the observable symptom as the "error code."

- **Same error, multiple root causes:** "Sauce broke" can be caused by (1) adding fat too fast, (2) temperature too high, (3) acid added too early, (4) wrong emulsifier ratio, (5) ingredients too cold. Unlike programming where one error message often maps to one cause, cooking requires context-matching. Use `error-pattern:` with multiple `root-cause:` entries per descriptive error, or create separate notes for each cause-solution pair.

- **Context dependencies are critical:** Cooking errors depend on (1) altitude (affects boiling points, leavening), (2) humidity (affects doughs, baking), (3) equipment (gas vs electric ovens vary 50°F+), (4) ingredient brands (different sodium levels, fat contents), (5) pan material (heat distribution differs). Use `error-context:` fields documenting these factors. The same error may require different solutions in different contexts.

- **Sensory vs. measurable errors:** Distinguish errors that are objectively measurable (internal temperature, pH, weight ratios) from those requiring sensory judgment (color, texture, doneness). Use `error-detection-mode:` with values `measurable` (can test with tools), `sensory` (requires human judgment), `both`.

- **Food safety vs. technique errors:** Food safety errors (temperature abuse, cross-contamination) have expiration (guidelines change with new research) and high stakes (can cause illness). Technique errors (sauce breaking, overmixing) are timeless but skill-dependent. Use `error-category:` with values `food-safety` (expirable, high-stakes), `technique` (timeless, skill-dependent), `preference` (taste/texture subjective).

- **Error persistence differs by type:** Food safety errors should have shorter review cycles (90 days, like programming) and `error-valid-until:` for expiration. Technique errors are more durable — a sauce-breaking fix from 1950 still works. Set `review-interval:` appropriately per error type.




- **Jurisdiction-specific implementation:** Notes about statutes/regulations that include jurisdiction-specific filing tips, common pitfalls, or practice insights count as personal even if the underlying law is public. Use `jurisdiction:` field to mark.
- **Confidentiality constraints:** Attorney-client privilege prevents capturing many high-value personal experiences. Allow `confidentiality-constrained: true` tag to exclude from ratio calculations.
- **Research methodology as personal knowledge:** Legal research strategies (search techniques, database selection, citation tracking) are expertise-developed and count as personal, even though they're "about how to find law" not "the law itself."
- **Interpretation vs. authority:** Distinguish `analysis-type: canonical` (established law), `analysis-type: interpretation` (informed analysis), `analysis-type: personal-experience` (from your practice).
- **Temporal validity:** Add `temporal-validity: current|historical|superseded` to account for law changes.

**Modified test for legal:** For legal notes: (1) Does this include jurisdiction-specific implementation details beyond the statute text? (2) Does this document personal experience or judgment? (3) Is it about legal research methodology? (4) Does it include temporal validity markers? Count notes as personal if yes to any.

**Edge case (stress test 2026-03-18):** In creative skill domains where mastery requires extensive general knowledge as prerequisite (music composition, visual art, creative writing, choreography), the 5:1 ratio needs domain-specific calibration:

- **Learning phase:** Allow higher general ratio (3:1 or 2:1) during foundational skill acquisition — composers must learn music theory before creating original works
- **Mastery phase:** Shift to 5:1 as personal insights emerge from practice
- **Tacit knowledge exemption:** Perceptual and kinesthetic knowledge (developing ears, feel, intuition) counts as personal even when not framed as "decisions or experiences"
- **Canonical repertoire as proxy:** Studying existing compositions (general knowledge) creates the foundation for personal style — don't penalize deep study of masterworks

**Modified test for creative domains:** For music/art/writing notes: (1) Does this represent transferable insight YOU developed? (2) Does it document a specific creative decision you made? (3) Is it perceptual/kinesthetic knowledge from YOUR practice? (4) Would a beginner need this before producing their own work? Count as "personal-equivalent" if yes to 3-4 (foundational learning materials that enable future personal creation).

**Edge case (NEW - stress test 2026-03-20):** In philosophy and similar analytical domains (history, literary criticism, cultural studies), the 5:1 ratio needs domain-specific calibration because general knowledge is foundational for personal insight:

- **Foundation-first learning:** Allow higher general ratio (4:1 or 3:1) during initial study phases — understanding what philosophers believed is ESSENTIAL before you can have original thoughts
- **Analysis as personal knowledge:** Philosophical analysis, critique, comparison, and application of concepts to new contexts count as personal even when grounded in general knowledge
- **Original contribution threshold:** The test should be: "Does this note contain YOUR analysis, or just restate what others have said?" — not whether general facts are present

**Modified test for philosophy:** For philosophy/analyical domain notes: (1) Does this include YOUR interpretation or critique (not just restatement)? (2) Does this apply philosophical concepts to a new context or problem you care about? (3) Does this synthesize multiple perspectives with YOUR judgment? Count as personal if yes to any. Exclude purely factual notes about what philosophers believed (these are the foundation, not the personal insight).

**Stress test (2026-03-19):** The 5:1 rule was stress-tested against cooking domain:
- Does this rule make sense for cooking? Yes - recipes exist online but YOUR specific adaptations, tips, and modifications are personal knowledge
- Is the Test executable? The Test is somewhat subjective for recipes (the recipe exists online but your version is personalized)
- Edge case found: The rule already has appropriate edge cases for creative skill domains (line 295) which covers cooking
- The Test doesn't account for "utility exception" - general knowledge that's frequently referenced (saves lookup time) is acceptable even if restatable


- **Literature synthesis as personal knowledge:** Synthesizing 3+ papers with YOUR interpretation adds unique value — count as personal-equivalent. Add `synthesis-type:` field (comparison|contradiction|extension|methodology-review).
- **Methodological tacit knowledge:** Statistical choices, experimental design decisions, and lab techniques are tacit knowledge — document why YOU chose this approach (vs. alternatives) to count as personal.
- **Reproducibility context:** Your specific protocol adaptations, lab conditions, and troubleshooting are uniquely valuable personal knowledge. Add `reproducibility-context:` field (lab-specific|protocol-deviation|troubleshooting-log).
- **Negative results:** What didn't work in YOUR experiments is rarely published but high-value — count as personal. Tag with `result-type: negative`.
- **Tool proficiency:** Database/software expertise (PubMed, R, Python, lab equipment) involves accumulated tacit expertise beyond tutorials — count as personal when including YOUR workflow tips.
- **Collaborative ownership:** If you contributed original thinking to collaborative work, it counts as personal. Add `contribution-type:` field (led-developed|co-developed|curated|synthesized).

**Modified test for scientific research:** For research notes: (1) Does this synthesize 3+ sources with YOUR interpretation? (2) Does it document why YOU chose this method (vs. alternatives)? (3) Does it include YOUR lab-specific adaptations? (4) Does it document what didn't work in YOUR experiments? (5) Does it include YOUR accumulated tool expertise beyond basic tutorials? Count as personal if yes to any. Exclude `temporal-validity: superseded` from ratio calculations.


- **Foundational technique exemption:** General techniques (joint types, wood species fundamentals, tool mechanics) are prerequisites for personal experimentation. Don't penalize notes about "what exists" — the value comes from personal application and adaptation.

- **Tool-scope uniqueness:** Assess uniqueness within tool categories separately — hand tool techniques, power tool techniques, and CNC workflows have limited transfer. A hand-plane technique that duplicates a general technique is not redundant if it adds tool-specific detail.

- **Material-specific knowledge is personal:** Your experience working with specific wood species in YOUR shop (humidity, location, supplier) provides context-dependent value that general knowledge cannot replace.

- **Embodied knowledge exemption:** Tacit knowledge about "feel," intuition, and physical skill development counts as personal even when not framed as explicit decisions. This is perceptual knowledge from practice, not restatable facts.

- **Project-context filtering:** For project lessons, uniqueness should be assessed by project type (furniture, boxes, turning, carving) not by individual project. Lessons from one dining table transfer to other flat-panel furniture.

**Modified test for woodworking:** For woodworking notes: (1) Does this include YOUR specific adaptation or technique modification? (2) Does this document a project-specific lesson or mistake? (3) Is this tool-specific (scoped to hand/power/CNC)? (4) Does this include material-specific experience (specific wood species, YOUR conditions)? Count as personal if yes to any. Exclude purely foundational technique notes from ratio calculations — they enable personal knowledge but don't replace it.

**Edge case (stress test 2026-04-05):** In gardening and other highly context-dependent domains (agriculture, permaculture, beekeeping, tree fruits), the 5:1 ratio needs domain-specific calibration due to extreme context-dependence:

- **Context-dependence multiplier:** General horticultural advice has LIMITED utility without local adaptation — soil, climate, microclimate, and local pest/disease pressure vary dramatically even within a neighborhood. Unlike woodworking where general techniques apply broadly, gardening advice from one zone often fails in another. This means general gardening advice WITHOUT personal adaptation has lower value than in most other domains.

- **Foundational horticultural science exemption:** Plant biology, soil chemistry fundamentals, botany nomenclature, and basic plant physiology are prerequisites for personal application, not personal knowledge themselves. Exempt pure horticultural science from ratio calculations — they function as reference material.

- **Local experimentation as gold standard:** Personal results in YOUR specific conditions (soil type, microclimate, local pest pressure) are the highest-value gardening knowledge. "What worked in my garden" is inherently personal even if similar experiments exist in literature.

- **Timing knowledge is inherently personal:** Frost dates, soil temperature thresholds, and seasonal timing vary by location. Your specific planting date based on YOUR soil temperature is personal knowledge — the general principle "plant after last frost" exists everywhere but YOUR specific threshold is unique.

- **Variety-specific experience is unique:** With 10,000+ tomato varieties alone, your experience with a specific variety in YOUR conditions is personal by definition — no one else has grown that exact variety in your exact conditions.

- **Utility exception is narrow:** Unlike domains where general knowledge saves lookup time, in gardening general advice without local context has LIMITED practical value. The utility of "rotate crops" depends on YOUR specific crops, YOUR disease pressure, YOUR soil conditions.

**Modified test for gardening:** For gardening notes: (1) Is this pure foundational horticultural science (not application)? If yes → exempt from ratio. (2) Does this include YOUR specific context adaptation (frost date, microclimate, soil type, hardiness zone)? (3) Does this document YOUR specific growing results (success or failure)? (4) Does this include YOUR specific date/temperature threshold for timing decisions? (5) Does this document YOUR experience with a specific variety? (6) For any general advice: Does this include YOUR specific why (adaptation rationale), not just the general what? Count as personal if yes to any of tests 2-6.







See also: [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]] for frameworks on capturing cognitive strategies.

```yaml
skill-domain: [cooking, music, writing, coding, etc.]
practice-frequency: daily|weekly|target-per-week
typical-duration-minutes:
best-time-of-day: morning|afternoon|evening
structure:
  - warm-up
  - main-practice
  - cool-down
progress-metrics: [how to measure improvement]
common-obstacles: [known challenges]
recovery-protocol: [how to resume after missing]
```
**Practice note content:** Current skill level, next goals, lessons learned about practice (what works/doesn't), not the skill knowledge itself.

```yaml
progression:
  current-level: beginner|intermediate|advanced|expert
  target-level: intermediate|advanced|expert
  milestones:
    - label: "Achieve X"
      achieved-date: 2026-03-15
  regression-risk: high|medium|low
  plateau-detected: true|false
  transfer-learning:
    - from-skill: "piano"
      to-skill: "music-theory"
```
**Milestone types:** Technique mastery, repertoire expansion, speed/accuracy improvement, consistency achievement, performance readiness.

**Practice types:**
- **Deliberate practice:** Focus on specific weaknesses, targeted drills, immediate feedback, narrow scope
- **Maintenance practice:** Keep skills sharp, broader scope, less focused on improvement
- **Exploratory practice:** Try new approaches, experiment with variations, wide scope, no specific goal
- **Performance practice:** Practice for specific events, realistic conditions, full runs not drills

```yaml
practice-type: deliberate|maintenance|exploratory|performance
focus-area: "specific weakness or skill being worked on"
difficulty-target: easy|medium|hard
session-structure:
  deliberate:
    - warm-up: 10min general
    - drill: 30min focused on weakness
    - cool-down: 5min
  maintenance:
    - practice: 40min varied
  exploratory:
    - experiment: 50min new approaches
    - reflection: 5min what worked
  performance:
    - full-runs: 3x under realistic conditions
```


```yaml
exclusion-categories:
  - public-utility: "General knowledge easily found online"
  - ephemeral: "Temporal snapshots that become stale quickly"
  - duplicate: "Knowledge already in vault"
  - decorative: "Only exists for structural compliance"
  - scope-violating: "Outside vault's stated purpose"
  - high-maintenance-low-value: "Frequent updates, low utility, no personalization"
```
**When exclusions don't apply:** Foundational knowledge, personal experiments, contextualized knowledge (your adaptations of general knowledge), emerging domains without established public knowledge, error knowledge (your errors are personal), and relationship knowledge (how things relate in YOUR system).




**Trigger thresholds:** Hop depth trend increased >1 hop over 6 months; Hub utilization dropped >30%; Link coherence score declined significantly; Category no longer reflects current interests.

**Approach mapping:** Local scope → gradual migration, one hub at a time; Regional scope → plan migration sequence, execute in phases; Global scope → consider rebuild instead (full reorganization rarely worth the cost).

**Cost-benefit formula:** Cost = notes_affected × avg_links_per_note × time_to_rewire; Benefit = expected_improvement_in_navigability × expected_usage_frequency; Proceed if benefit > cost × safety_factor (1.5).


```yaml
structural-decision: true
reorganization-type: local|regional|global
scope: affected_hubs_or_notes
decision-rationale: why_this_approach
decision-date: 2026-04-03
rollback-plan: how_to_reverse_if_needed
outcome-tracked: true|false
```



```yaml
experiment: What you tried
outcome: What happened
reason-for-failure: Why it didn't work for you
retry-conditions: When you might try again
```


```yaml
individual-variation: high  # vs low/medium
applicability-scope: universal|person-specific|condition-specific
# For person-specific notes, include:
your-context: description of your specific situation
experiment-variables: what makes this work for you specifically
```

```yaml
goal-scope: [list of applicable goals]
# Fitness examples:
# Photography examples:
# Woodworking examples:
# Pottery examples:
```
**Modified utility test:** For goal-dependent domains, evaluate utility within goal context:
- **Utility (modified):** Does this improve answers FOR THE SPECIFIED GOAL? Does goal-scope match the intended user's goals?
- **Connection (modified):** Links to 2+ notes WITH SAME GOAL SCOPE; links to goal-specific principles?

```yaml
compound-conditions: true
conditions:
  - condition: "Description of condition"
    category: tool|framework|problem-type|context
    required: true|false
compound-failure-mode: any  # any|all|interaction
compound-warning: "Warning about when this doesn't apply"
```
**Compound failure modes:** `any` (fails if ANY condition is false), `all` (requires ALL conditions AND they interact), `interaction` (specific combination matters).







Why: Without explicit progression, learning vaults become reference vaults in disguise. Learners need a navigable path, not just a graph. The Seed covers prerequisites but not the intentional design of learning sequences.
Test: (1) Can you trace a learning path from zero to basic competence? (2) Are there explicit milestone notes marking progress? (3) Can a learner determine when they've "completed" the basics? (4) Can you identify domain primitives that unlock most other knowledge?
Edge case: Learning progressions differ from content dependencies — some knowledge enables learning (primitives) while not being a content prerequisite. Mark these with `learning-primitives: true`.



**Cognitive models:**
- `cognitive-model: monolingual` — One language primary, others as lookup

**For bilingual-integrated vaults (natural code-switching):**
- Use `languages-used: [lang1, lang2, ...]` frontmatter (multi-language, not single convention)
- Tag technical terminology separately from explanatory context — in technical domains (programming, science), the technical language (often English) may differ from the explanatory context language (native language)
- Create bidirectional terminology indexes, not hierarchical search — bilingual users need both directions of lookup
- Use `language-role:` per note: `technical-primary | context-primary | mixed`
- Use `term-status:` for terminology mapping: `natural-loanword | hybrid | full-translation | false-friend-warning`

**For bilingual-separated vaults (audience-based switching):**
- Use `language-convention: separate-notes | same-note-translation` per domain
- Apply search hierarchy (primary/secondary/tertiary)
- Create terminology maps that preserve distinction between translation equivalence and conceptual equivalence

1. Can you determine the cognitive model of the vault?
2. For bilingual-integrated: Are multiple languages handled as natural co-occurrence with multi-language frontmatter?
3. For bilingual-integrated: Is there a bidirectional terminology index?
4. For bilingual-integrated: Is technical terminology separated from explanatory context?
5. For bilingual-separated: Can users find content in their preferred language?
6. For any multilingual note: Does it have `languages-used:` and `cognitive-model:`?



```yaml
recurring: true
recurrence-pattern: annual|quarterly|monthly|weekly|seasonal|cyclic
cycle-type: fiscal|academic|calendar|regulatory|organizational|seasonal
next-occurrence: 2026-04-15
cycle-relative-timing: "End of Q1 (varies by fiscal year)"
```
For interval-based procedures (maintenance intervals, periodic reviews):
```yaml
interval-based: true
interval-value: 90
interval-unit: days
interval-trigger: "When to perform the action"
next-due: 2026-06-21
```




**Symptoms triggering rebuild consideration:**
- Structural rot: >30% orphans, hop depth >5 for >20% of notes, collapsed hub structure
- Schema collapse: multiple competing naming conventions, >10 frontmatter fields undocumented, >100 tags with no controlled vocabulary
- Quality debt: verification ratio <20% for 6+ months, debt score >0.50, >50% stale (>90 days since review)
- Purpose drift: _root.md purpose no longer matches content, vault became dumping ground
- Technology lock-in: depends on deprecated plugins, cannot export to basic Markdown
**When NOT to rebuild:** Vault <50 notes (refactor instead), problems are localizable (split instead), only 1-2 symptoms present (repair is faster), recent improvement trend.
**Hybrid approach:** Archive old vault, start new with Seed; selectively migrate notes passing quality filters.

```yaml
creation-rationale: new-note|extension|split
extension-target: [[Existing Note Name]]  # if extension
creation-criteria-met: [list of criteria met]
```

**Rule (NEW - 2026-03-28):** Track and counteract systematic AI agent behavioral patterns — monitor capture patterns for recency bias, confirmation bias, pattern-matching over discovery, efficiency tunneling, and authority amplification.

```yaml
behavioral-metrics:
  recency-bias: low|medium|high  # recent vs foundational capture ratio
  confirmation-bias: low|medium|high  # self-referential vs external links
  pattern_matching: low|medium|high  # existing-hub vs new-hub creation
  efficiency_tunneling: low|medium|high  # shallow vs deep captures
  authority_amplification: low|medium|high  # external vs personal synthesis
```

**Counter-measures:**
- Recency: Require gap identification (3+ gaps) before capture sessions
- Confirmation: Set hub creation targets (minimum 1 new hub per 10 sessions)
- Pattern-matching: Require cross-domain links in each capture session
- Efficiency: Apply quality gates (utility+connection+uniqueness test)
- Authority: Enforce 5:1 personal-to-general ratio strictly

**Behavioral health in completion criteria:** Include behavioral metrics in vault completion criteria. Alert when any metric exceeds "high" threshold.

---

## 2. Atomicity

*One idea per note, properly sized.*

> **Frontier Exploration (2026-04-08):** See [[Frontier Exploration - Context-Window-Aware Knowledge Organization]] for emerging rules about organizing knowledge for AI agents with limited context windows. This exploration addresses how to structure knowledge when token budgets constrain retrieval.

**Rule:** Every note must contain exactly one idea, summarizable in one sentence.
**Why:** Multi-idea notes are hard to link, hard to find, and impossible to reuse in new contexts.
**Test:** Can the note be summarized in one sentence that captures its core purpose? If the summary requires multiple sentences or fundamentally different topics, split it. (Note: the presence of "and" in a summary does NOT indicate multiple ideas — comparative notes, relationship notes, and hub notes may legitimately use "and" while remaining atomic.)

**Rule:** Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas.
**Why:** Size is a reliable proxy for atomicity — oversized notes almost always bundle concepts.
**Test:** Count words. Apply categorical exemptions for automatic pass/fail; flag only ambiguous cases for review.

**Categorical Exemptions (>300 words, automatically PASS):**
- Procedural content (recipes, code, tutorials, technical specs)
- Reference content (encyclopedia entries, drug monographs, specifications)
- Domain patterns (musical forms, architectural styles, design patterns)
- Stress test notes, Frontier exploration notes, Seed gap notes

**Categorical Exemptions (<100 words, automatically PASS):**
- Hub notes (pure navigation) under 200 words
- Redirect notes
- Complete short procedural content (can be executed as-is)
- Technique definitions (name + action + outcome)
- Notation elements (π, ∞, Σ), abbreviation definitions, theorem statements

**Notes requiring review (no categorical exemption):**
- Notes <50 words without stub marker → flag for completeness
- Notes >300 words without exemption → flag for atomicity review

**Original test (for ambiguous cases):** For notes >300 words: (1) Is this an executable procedure? (2) Would splitting make it harder to use? (3) Are parts independently reusable? Do NOT flag if yes to 1-2; flag for potential split only if yes to 3. For notes <100 words: verify it has a stub marker OR is a hub/redirect note OR is complete short procedural content (can be executed as-is).
**Edge case:** Procedural content (recipes, tutorials, code samples, technical specs, reference tables, legal documents) may legitimately exceed 300 words. Use atomicity test (one idea per note) as the primary check; word count is secondary for procedural formats.
**Edge case (NEW - stress test 2026-03-20):** Reference content — drug monographs, device specifications, encyclopedia entries, taxonomic classifications, legal instruments — may legitimately exceed 300 words when covering one complete reference unit. The test: (1) Is this a single reference entity? (2) Would splitting make it harder to look up? (3) Are parts not independently reusable? Keep together if yes to 1-2.
**Edge case (NEW - stress test 2026-03-20):** Domain patterns (musical forms, architectural styles, design patterns, methodological frameworks) are valid atomic units even when exceeding 300 words. These are reusable patterns, not single instances. The test: (1) Is this a reusable pattern rather than a single instance? (2) Does the pattern have multiple components that must be understood together? Keep together if yes.
**Edge case:** Comprehensive principle/explanation notes that cover multiple related sub-points in a coherent framework (e.g., "Note Lifecycle Management" covering stages, deprecation criteria, and archival guidelines) may exceed 300 words when splitting would reduce explanatory coherence. Apply the atomicity test first: does the note explore one theme comprehensively, or does it bundle unrelated ideas?
**Edge case:** Educational/explanatory content that requires depth for comprehension (e.g., explaining the science behind a technique, comprehensive topic overviews, comparative analyses of variations within one category) may legitimately exceed 300 words. The test: (1) Can this note be summarized in one sentence capturing its core purpose? (2) Would splitting lose essential synthesis or context? (3) Is this one coherent topic being explored comprehensively? Keep together if yes to any.
**Test for procedural content:** For notes >300 words that are procedures: (1) Does the user need to execute this linearly from start to finish? (2) Would splitting make it harder to use? (3) Are the parts independently reusable? Keep together if yes to 1-2; split only if yes to 3.
**AI agent guidance:** When uncertain about procedural content, prefer keeping notes together. Split only when: (a) parts are genuinely reusable in other contexts, AND (b) the note exceeds 1000 words. For recipes, code tutorials, and technical specs: err on the side of keeping together.

**Edge case:** Complete short procedural content (under 100 words) is valid when the procedure can be executed from the note alone — all necessary information (ingredients, steps, timing) is present and no essential components are omitted. The test: Can you execute this note's procedure without additional information? If yes, it's complete regardless of word count. This applies to complete short recipes, quick reference guides, and condensed how-to notes that are self-contained but concise.
**Edge case:** Notes under 50 words must either be explicitly marked as stubs (with `status: stub` or `todo: true`) or must provide sufficient substance to stand alone.
**Why:** Thin notes without markers waste graph space and mislead — they appear complete but contain no real knowledge. Stubs signal intentional incompleteness; unmarkedly thin notes are quality failures.
**Test:** Count words in notes under 50 words. Does each have a stub marker OR contain a complete definition/explanation that could stand alone?
**Edge case:** Hub notes (pure navigation) under 200 words are acceptable. Redirect notes are acceptable. All other notes under 50 words need expansion or a stub marker.

**Edge case (NEW - compliance audit 2026-03-18):** Notes ABOUT a concept are different from notes that ARE the concept — do not use concept-related tags (like "stub", "planned", "incomplete") on notes that EXPLAIN the concept. A 250-word principle note about forward references is not a stub, even though it discusses stubs. Tag the note with its topic (e.g., "forward-reference", "workflow") rather than its status. The test: (1) Is this note explaining what X is, or is it actually X? (2) Does the word count support the implied status? (3) Would a reader expect this to be incomplete? Only use status tags (stub, planned, todo) when the note genuinely IS in that state.
**Edge case:** Domain unit concepts — standard notation elements, measurement units, or definition-atomic concepts — may legitimately fall below 100 words. Examples: musical dynamics (piano, forte), SI units (meter, kilogram), mathematical axioms, chemical elements. These are not stubs; their brevity is inherent to their nature. Verify: (1) Is this a standard unit/notation element of the domain? (2) Would expanding it add meaning, or just padding?
**Edge case (stress test 2026-03-17):** Mathematical notation elements, abbreviation definitions, and theorem/lemma statements may legitimately fall below word count thresholds:
- **Notation elements:** Single symbols (π, ∞, Σ, ∫) and operator definitions are inherently atomic. A note defining "∫" as "integral symbol used to denote integration" is complete in 7 words. Test: Is the note title a single token that represents the entire concept?
- **Abbreviation expansions:** "gcd: greatest common divisor" is 4 words but completely defines the term. Test: Does the note accurately define the abbreviation? Word count is irrelevant.
- **Theorem and lemma statements:** A 15-word theorem can be more complete than a 40-word draft. The theorem IS the knowledge; the proof is supplementary. Test: Are all conditions and conclusions stated? Word count should not apply. Tag with `type: theorem` or `type: lemma`.

**Edge case (stress test 2026-03-18):** Technique definitions in culinary arts, martial arts, crafts, and other skill-based domains may legitimately fall below 100 words when they define a complete physical technique. A technique definition that includes (1) the name, (2) the core action, and (3) the intended outcome is atomic regardless of word count. Examples: "Sear: To brown the surface of food using high heat to create flavor through the Maillard reaction" (15 words), "Barre: A body-position exercise where feet are turned out 45-90 degrees to improve turnout flexibility" (20 words). The test: (1) Does the note define a specific, repeatable physical technique? (2) Does it include the essential action and intended outcome? (3) Would adding more words add practical value, or just explanation? Tag with `knowledge-type: technique` to distinguish from general terminology.

**Edge case:** Single creative works (compositions, books, paintings, films) may legitimately exceed 300 words when comprehensively analyzing that specific work. The test: (1) Is this note primarily about one specific work? (2) Is the work referenced by multiple other notes? (3) Would splitting lose essential context that benefits from being unified? Keep together if yes to 2-3. Use "overview + linked deep-dives" pattern for major works with extensive analysis.

**Edge case:** Opposition-dependent concepts — some concepts only exist in opposition to another concept and require the pair to be understood. Examples: materialism/idealism, determinism/free will, empiricism/rationalism. Create bidirectional pairs; neither note is complete alone. The test: (1) Does this concept require defining its opposite to be understood? (2) Do both concepts reference each other? Create pairs with bidirectional links.

**Edge case:** Argument structures — premises leading to a conclusion are valid atomic units even when referencing multiple concepts. The argument itself is the atomic unit; individual premises may be separate notes for reuse. The test: (1) Is this a single inferential structure? (2) Does splitting break the logical flow? Keep together if yes; link to component premises.

**Edge case:** Contested concepts with no consensus — concepts that have 3+ major competing accounts cannot have a single "definition." Use perspectives structure with sections for each major view. Examples: consciousness, free will, meaning of life. The test: (1) Do experts fundamentally disagree on what this IS? (2) Are there 3+ major competing theories? Use perspectives structure, not single definition.

**Edge case (NEW - 2026-03-19):** Negative-space knowledge — notes defined primarily by what they exclude, contradict, or are not.
- **Negative-space:** Knowledge where the exclusion IS the core content ("This is NOT authentic Italian," "Does NOT constitute legal advice," "Not for beginners"). Distinct from exceptions (rule modification), contradictions (conflicting claims), and context-gating (applicability limits).
- **The test:** (1) Is the negation the point of the note? (2) Would removing the exclusion make the note meaningless? (3) Is this about defining boundaries rather than describing what IS?
- **Tag:** Use `negative-space: true` with `exclusion-type:` (authenticity|scope|audience|temporal|applicability) and document what is excluded (`excludes:`) and what remains true (`implies:`).
- **Distinguishing:** Exception = "X applies except Y"; Negative-space = "This note IS what is not Y"; Contradiction = "X conflicts with Z"; Context-gate = "X applies in context Q".

**Edge case (stress test 2026-03-16):** Humanities and philosophical concepts require additional atomicity considerations:
- **Historical development:** When a concept's development spans distinct historical periods (Ancient/Medieval/Modern/Contemporary), prefer temporal splitting with a hub. A note on "concept of liberty from Aristotle to modern philosophy" should become hub + temporal variants.
- **Thought experiments:** Canonical thought experiments (Trolley Problem, Ship of Theseus, Brain in a Vat) are valid atomic units even when brief because they're referenced as complete units across multiple debates. Use `type: thought-experiment` tag.
- **Schools of thought:** Use hub+spoke pattern (Stoicism hub → Stoic Ethics, Stoic Physics, Stoic Practices spokes). Define clear doctrine boundaries to prevent hub bloat.
- **Philosophical jargon:** Technical terms (epistemology, ontology, phenomenology) are domain terminology - allow under 100 words with `type: terminology`.
- **Confidence defaults:** Philosophy has lower consensus than empirical domains. Default to `confidence: emerging` unless marking established consensus positions.

**Edge case (NEW - frontier exploration 2026-03-16):** Recognition-based knowledge requires different atomicity treatment — organize as training examples rather than definitions.
- **Visual/auditory recognition:** Pattern recognition knowledge (identifying celestial objects, identifying plant species by sight, recognizing bird calls) cannot be fully captured in descriptions — it requires exposure to examples. Notes should link to multiple instances that train the pattern.
- **The test:** Can you identify 3+ example instances of this pattern in the vault? Are they linked from the recognition note?
- **Tag:** Use `knowledge-type: recognition` for notes that capture pattern recognition knowledge.

**Edge case (NEW - frontier exploration 2026-03-16):** Software stack knowledge requires explicit version tracking — knowledge that exists in tool interactions often doesn't transfer across versions.
- **Software stack dependencies:** When knowledge lives in the gaps between tools (astrophotography stacks, development environments, data pipelines), version combinations matter. Knowledge about "how to process images in PixInsight" may not transfer to other software.
- **The test:** For notes about tool interactions, is there a `software-stack:` tag listing the specific versions?
- **Tag:** Use `software-stack:` frontmatter listing the specific version combination (e.g., `software-stack: "NINA 3.0 + PHD2 2.6 + PixInsight 1.8"`).

**Rule (NEW - 2026-03-23):** Capture version-upgrade path knowledge when updating from one version of a tool/framework to another — document what changed, how to migrate, whether it's worth it, and what breaks.
**Why:** The Seed covers version-scoped knowledge (which version a note applies to) and deprecation (marking obsolete knowledge), but doesn't address capturing upgrade journey knowledge. Without upgrade paths, the vault accumulates separate v1 and v2 notes without connection, users lack migration guidance when upgrading, and decision context (why you upgraded or stayed put) is lost.
**Test:** For versioned tools/frameworks where a new version released: (1) Is there a note capturing what changed that matters? (2) Does it include migration steps for transitioning? (3) Does it document the decision to upgrade (or not)? (4) Are breaking changes documented?
**Implementation:** Use frontmatter:
```yaml
version-upgrade: true
from-version: "1.x"
to-version: "2.x"
upgrade-status: pending|in-progress|completed|skipped
migration-type: minor|major|breaking
```
Content should include: summary of relevant changes (not all release notes), step-by-step migration path, breaking changes or incompatibilities, decision rationale (why upgrade now or defer), rollback plan if needed.
**Connection:** Link to existing notes about the old version (mark as superseded), link to related tool notes that might be affected by the upgrade.
**See also:** [[Frontier Exploration - Version-Upgrade Path Knowledge]]

**Edge case (NEW - frontier exploration 2026-03-16):** Short-expiration knowledge needs faster review cycles — some domains have knowledge that becomes stale in months, not years.
- **Domains with rapid expiration:** Software, predictions, current events, market conditions, and time-sensitive events (celestial events, seasonal phenomena) can render knowledge obsolete quickly.
- **The test:** Can you identify knowledge that should have expiration-interval shorter than the default 30-day review?
- **Tag:** Use `expiration-interval:` frontmatter (e.g., `expiration-interval: 30d` for standard, `expiration-interval: 7d` for rapidly changing domains, `expiration-interval: 1y` for historical knowledge).

**Edge case (NEW - frontier exploration 2026-03-18):** Deadline-driven knowledge requires special handling — knowledge tied to specific dates where missing the deadline causes direct harm.
- **Deadline-driven vs. time-sensitive:** Time-sensitive knowledge (software versions, current events) becomes less useful after expiration. Deadline-driven knowledge becomes HARMFUL after expiration (missed filing dates, lost discounts, legal penalties).
- **Deadline categories:** (1) Hard deadlines — no recovery after expiration (missed exam, expired discount); (2) Soft deadlines — recovery possible with penalty (late fees, reduced outcomes); (3) Recoverable — can still achieve goal with extra effort (file extension, late registration).
- **The test:** For date-specific knowledge, can you answer: (1) What is the deadline? (2) What happens if missed? (3) Is there a recovery path? If you can't answer these, it's deadline-driven knowledge that needs explicit handling.
- **Tag:** Use `deadline-type: hard|soft|recoverable` and include `deadline-date:`, `consequence:`, and `recovery-method:` fields. Add `recommended-start:` to indicate when action should begin.
- **Expiration behavior:** Deadline knowledge should be auto-archived after deadline + grace period (7 days for hard, keep accessible for soft with clear "deadline passed" markers).

**Edge case (NEW - 2026-03-24):** Video game mechanics knowledge requires patch-version tracking — game patches can invalidate strategy knowledge instantly, unlike typical software versions.
- **Patch-driven invalidation:** Unlike software frameworks that evolve gradually, game patches can completely change how something works overnight. A boss strategy that was optimal last week may be completely wrong after a patch. The Seed's version-tracking for software doesn't fully capture this.
- **The test:** For game strategy/technique notes: (1) Is there `patch:` or `game-version:` frontmatter? (2) Is there `expires-after-patch:` for patch-specific knowledge? (3) Is there automatic deprecation when patch notes contradict existing knowledge?
- **Implementation:** Add fields:
```yaml
game-version: "1.0"
patch: "2.1.5"
expires-after-patch: true
patch-change-type: mechanic-rebalance|bug-fix|new-content|balance-change
```
- **Platform tagging:** Games often have platform-specific content (achievements, features). Use mandatory `platform:` field for platform-specific knowledge.
- **Time-limited content:** Seasonal events, collaborations, server shutdowns need explicit `valid-until:` frontmatter with post-expiration disposition.

**Edge case (NEW - frontier exploration 2026-03-16):** Sensory threshold knowledge requires lower confidence defaults — knowledge at the boundary of perception has inherent uncertainty.
- **Perceptual limits:** Astronomy (limiting magnitude at the eyepiece), audio (threshold of hearing), touch (just-noticeable differences) — knowledge at perceptual limits is inherently uncertain.
- **The test:** For observation notes at the limit of perception, is confidence marked appropriately and sensory context documented?
- **Default:** For sensory threshold knowledge, default to `confidence: emerging` and include sensory context (equipment, conditions, observer experience).

**Rule:** When splitting a note, create bidirectional links between the parts and rewire all incoming links.
**Why:** Splitting without rewiring breaks navigation paths and orphans content.
**Test:** After a split, do both new notes link to each other? Do all previous incoming links point to the correct part?

**Edge case - distributed understanding:** Some knowledge has value in the relationships between concepts, not the concepts themselves. Splitting these notes destroys integrated value. When a note explicitly requires 3+ other notes to be fully understood AND those components are not independently useful, do NOT split — mark instead with `distributed-understanding: true`. The test: (1) Does this note build on multiple other notes? (2) Are those components not meaningful on their own? (3) Does the whole exceed the sum of parts? If yes to all three, preserve as distributed note.

**Rule:** Each note must be self-contained — readable without clicking any links.
**Why:** Notes that depend on external context become meaningless when links break or context shifts.
**Test:** Read the note in isolation. Does it make sense without following any links?
**Edge case:** In domains with building-block terminology (legal, medicine, technical fields), complete self-containment can create circular definitions or bloat. Apply the "core + supporting" distinction: (1) Core content (main concept, key definition) must be self-contained; (2) Supporting content (jurisdiction variations, related concepts, deep details) may link out; (3) Factual claims should still be verifiable even if the full source is linked.

**Rule:** Structure comparative knowledge based on the nature of the decision — single comparative note for binary choices where comparison IS the insight; separate notes with links when each option requires substantial independent development; hub + spoke for 3+ options or complex decision criteria.
**Why:** Comparative knowledge serves different purposes (decision aid vs. deep understanding). The structure should match the purpose.
**Test:** For a comparative note: (1) Is the primary insight "how X and Y differ" or "when to choose X vs. Y"? → Single note. (2) Does each option need 300+ words of independent content? → Separate notes. (3) Are there 3+ options OR complex decision criteria? → Hub + spoke.
**Edge case:** Temporal comparisons (e.g., "2020 vs 2024 approach") — treat as single note with version scope. Evolving comparison domains (tools, frameworks) — hub structure scales better as new options emerge.

**Rule:** For knowledge that legitimately requires different presentations for different purposes, use hub + variants pattern with explicit `context-frame` tagging.
**Why:** Context frames (patient-education vs clinical, beginner-tutorial vs reference) are orthogonal to expertise level and user constraints. Treating them separately prevents note bloat while ensuring each purpose gets appropriate presentation.
**Test:** For a potential context-frame note: (1) Can you identify 3+ distinct purposes this knowledge serves? (2) Do variants share essential core knowledge but differ in presentation? (3) Can users find the appropriate variant via hub navigation or filtering? Yes to all 3 = use hub+variants; No to 2+ = use single note.
**Implementation:** Use `context-frame:` frontmatter field with standard values:
```yaml
context-frame: patient-education|clinical|policy|tutorial|reference|beginner-tutorial|expert-brief|decision-support|learning|inspiration

**Rule:** Distinguish context frames from expertise levels — frame is about purpose, level is about complexity.
**Why:** A beginner can have a professional purpose (junior developer reading architecture docs). Conflating frame with level loses important distinction.
**Test:** For a note tagged with both expertise-level AND context-frame: (1) Does changing expertise-level keep the same context-frame valid? (2) Does changing context-frame keep the same expertise-level valid? (3) Can you explain why both dimensions are needed? Yes to 1-2 and "the purpose differs from the complexity" = correctly distinguished.

**Rule:** Represent branching decision knowledge (troubleshooting guides, diagnostic workflows, setup wizards) using hub + node pattern — hub provides overview, each decision point is an atomic note with prerequisite and next-decision links.
**Why:** Decision trees are multiplicative (branching factor), navigational (context-dependent traversal), and stateful (current node matters). Standard atomic notes don't capture this structure. The hub+node pattern preserves navigability while keeping each decision point discoverable.
**Test:** Pick a decision tree note. (1) Does a hub provide high-level overview of branches? (2) Are each decision points atomic notes? (3) Does each node link to prerequisites and next decisions? (4) Can users traverse the tree via links?
**Implementation:**
```yaml
# Hub note
decision-tree: true
branches:
  - Check Physical Connections
  - Verify DNS Resolution
  - Test Firewall Rules

# Node note
decision-type: diagnostic|setup|troubleshooting|selection|prioritization|context-dependent
prerequisites:
  required:
    - Previous decision outcome
next-decisions:
  - If yes: [[Next Step]]
  - If no: [[Alternative Path]]
```
**When to use:** Troubleshooting guides, setup wizards, diagnostic workflows, conditional onboarding processes, any "if this, then that" knowledge.
**When NOT to use:** Linear tutorials (use standard atomic notes), reference material, simple comparisons (use comparative note pattern).

**Rule:** Handle spectrum and continuum knowledge using domain-appropriate boundaries — identify natural breaking points, create range notes for intermediates, and use frontmatter to represent gradients.
**Why:** Some knowledge exists on a continuum (political ideology, skill levels, temperature, color) rather than as discrete categories. The atomicity principle assumes separability, but spectra challenge where to cut. Without explicit guidance, AI agents either over-segment (note for every point) or under-segment (single note loses all nuance).
**Test:** For knowledge domains with inherent spectra: (1) Can you identify established terminology for spectrum points? (2) Are range notes created for intermediate states? (3) Does frontmatter use `spectrum-type: continuous` with appropriate bounds?
**Implementation:** Use `spectrum-type: continuous` frontmatter with `spectrum-bounds`, `spectrum-unit`, and anchor points. Create hub notes linking to all spectrum points. Use range notes for intermediate states that are meaningful in the domain.
**Edge case:** Subjective spectra (spiciness, loudness, sweetness) differ from objective ones — track both objective measurement and subjective threshold separately.
**Edge case:** Cultural spectra vary significantly (politeness, personal space, punctuality) — add `cultural-scope` to spectrum-based notes.
**Edge case:** Evolving spectra (music genres, technology generations) may change over time — use `spectrum-stable: stable|evolving|contested`.

**Rule (NEW - 2026-03-29):** For growing topics, apply topic-splitting decision framework — distinguish between deepening in place, hub-and-spoke branching, and sequential development based on concept coherence and independence.
**Why:** The Seed provides robust guidance for merging (redundant notes) but lacks complementary guidance for splitting (growing notes). Without this framework, AI agents face ambiguity: a note on "cooking techniques" that expands to include knife skills, heat management, sauces, and ingredient preparation can become unwieldy without clear splitting criteria.
**Trigger conditions for splitting:**
1. Multiple distinct concepts covered (not just length) — test: Can you summarize the note in one sentence, or does it require multiple sentences for fundamentally different topics?
2. Different audiences for different parts — test: Does the note serve learners AND experts, or different domains?
3. Parts useful independently — test: Would a reader interested only in part X benefit from the whole note?
4. Internal navigation difficulty — test: Does the note require internal section jumping to use?

**Splitting strategies:**
- **Hub-and-spoke:** One hub note linking to specialized child notes — use when topics share a category but have independent subtopics
- **Sequential:** Note series with bidirectional prerequisite links — use when concepts build on each other
- **Parallel:** Alternative approaches to same problem — use when different methods achieve the same goal
- **Layered:** Overview note + detailed deep-dives — use when some readers need summary, others need depth

**When to deepen in place (don't split):**
- Educational/explanatory content that requires depth for comprehension
- Comprehensive principle notes covering related sub-points in a coherent framework
- Complete creative works (analyzing one specific work)
- Contested concepts with no consensus (use perspectives structure within one note)

**Preservation rules when splitting:**
- Keep internal links between split parts (cross-references)
- Update all incoming links to correct parts
- Maintain cross-reference in parent note (summary + links to children)
- Use `split-from:` frontmatter on child notes pointing to parent for traceability

**Test:** Pick a note over 400 words or covering multiple topics. Can you apply the trigger test? Does splitting vs deepening produce better navigability?
**See also:** [[Seed Gap - Topic Splitting Decision Framework]] — detailed analysis and domain examples

---

## 3. Linking

*Meaningful connections between notes.*






**Rule (refined - 2026-04-02):** Apply note-type-aware link density — different note types have different link expectations based on their function in navigation.
- Exploratory notes: ≥2 outgoing links (enable navigation to related concepts)
- Reference/definition notes: ≥2 backlinks OR linked from hub (enable discovery)
- Safety-critical notes: Backlinks from the equipment/procedure they protect (users reach via context, not explore)
- Foundational notes: `foundational: true` tag present (everything references them)
- Specialized notes: `specialized: true` tag present (single-use entities)
- Filter/category notes: ≥2 backlinks (users navigate TO for filtering)

**Equipment-tier connectivity test:** For equipment-dependent notes: Does frontmatter include `equipment-tier:`? Is there a tier-agnostic hub note that users with different equipment can navigate to?
**Cross-domain bridging test:** For notes that reference adjacent domains: Is there a bridging hub note that connects the domain to adjacent domains?

1. Can you classify notes by function (content|gap-documentation|stress-test|refinement)?
2. Do health checks apply different thresholds based on function?
3. Are gap/refinement/stress-test notes exempted from standard link count requirements?

- `content` — Core knowledge requiring 2+ outgoing links
- `gap-documentation` — Seed gaps documenting missing rules (0-1 links acceptable)
- `stress-test` — Domain-specific rule tests (0-1 links acceptable)
- `refinement` — Proposed rule changes (0-1 links acceptable)
- `hub` — Aggregation nodes (5+ links expected)

This complements `note-type:` (which covers content purpose) with `note-function:` (structural vault role). Both can coexist: `note-type: exploratory` AND `note-function: gap-documentation`.


**Refinement (NEW - stress test 2026-03-27):** The "explainable" test works for learning links but doesn't distinguish between different link purposes. Apply this refined framework:

1. **Learning links** (primary) — "Understanding X helps you understand Y" — the original test applies directly
2. **Constitutive links** (acceptable) — "X is part of Y" — structural descriptions that clarify composition but aren't learning paths (e.g., "The exposition introduces the [[primary theme]]")
3. **Reference links** (decorative) — Basic assumed knowledge for the target audience — explainable but add no value in specialized vaults (e.g., linking to "violin" in a composer's vault)
4. **Notation links** (convert to tags) — Harmonic/melodic shorthand patterns (e.g., [[I-vi-IV-V]] should be a tag, not a link)
5. **Developmental links** (describe, don't link) — Transformation/evolution relationships that don't map to "follow this link" (e.g., "The motif [[develops]] throughout" — describe the relationship instead)

**Refined test:** For each link:
1. Is this basic assumed knowledge for your target audience? → Reference → remove
2. Is this notation shorthand (chord symbols, scale degrees)? → Notation → convert to tag
3. Is this constitutive ("X is part of Y") or learning ("X helps understand Y")? → Mark constitutive if keeping
4. Can you state what the reader learns by following? → Learning → keep

```yaml
link-type: learning|constitutive|reference|notation|developmental
```

**Edge case - Circular links:** Linking to [[functional harmony]] from a note about functional harmony is neither learning nor constitutive — it's circular and should be removed.




**Edge case (expanded - multiple classification systems):** In domains with multiple competing classification systems (e.g., USDA vs Sunset hardiness zones in gardening, different medical classification systems), using a single tag loses critical information. Solution: (1) When multiple systems exist, use frontmatter fields instead of simple tags — e.g., `usda-zone: 7` and `sunset-zone: 15`; (2) Create hub notes for each classification system so links can point to the appropriate system hub; (3) For cross-system mappings, create dedicated mapping notes rather than trying to encode in tags.

**Edge case (expanded - temporal categories):** Temporal categories like seasons ("#spring", "#summer") sit in a gray area — they're both filterable facets AND navigational concepts (seasonal hub notes). Solution: (1) When temporal knowledge is a primary navigation pattern (e.g., gardening, event planning), prefer hub notes and links over tags; (2) When temporal filtering is needed alongside other facets, use tags for temporal and links for navigation; (3) For domains where both matter significantly, use both — tags enable filtering, links enable exploration.

- **Simple relationships:** Use typed links in content ("Lens X [[works-well-with→Camera Y]]")
- **Moderate complexity:** Use frontmatter relationships field
- **Complex/valuable relationships:** Create dedicated atomic notes (e.g., "Lens X + Camera Y Compatibility")


**Edge case (NEW - stress test 2026-03-21):** In domains with orthogonal classification dimensions (machine learning, medicine, scientific research, engineering), notes may legitimately need more than 5 tags when each tag represents a distinct orthogonal axis:
- **Machine learning:** algorithm-type, framework, use-case, difficulty, domain, data-type (6+ distinct dimensions)
- **Medicine:** condition-type, body-system, treatment-category, specialty, acuity, chronicity
- **Scientific research:** methodology, domain, data-type, analysis-method, reproducibility-level

The test should distinguish: (1) Are tags on different orthogonal axes? (2) Does each tag add a distinct filtering dimension? (3) Would removing any tag lose essential classification information? If yes to all, the tags are orthogonal and the 5-tag limit may be relaxed.

**Tag vs. link guidance for orthogonal domains:** When tags represent orthogonal axes, prefer frontmatter fields over tags to maintain queryability without tag explosion:
```yaml
# Instead of multiple tags, use structured fields
algorithm-type: neural-network
use-case: classification
difficulty: intermediate
# Use tags for simple categorical filtering only
tags: [deep-learning, neural-networks]
```

---

## 4. Navigation

*The graph must be traversable and well-structured.*

**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.
**Why:** Deep chains indicate structural problems — important content becomes buried and undiscoverable.
**Test:** Run a breadth-first traversal from `_root.md`. For notes requiring more than 3 hops: (1) Check if path reflects a genuine domain taxonomy (medical, legal, biological, chemical, geographic); (2) Verify intermediate hub notes exist at major category boundaries; (3) Flag only non-taxonomic deep paths as structural problems requiring intervention.
**Edge case:** Natural domain hierarchies (taxonomies, classification systems, geographic/regional breakdowns) may legitimately exceed 3 hops. Examples: cooking (Cuisine → Region → Dish → Recipe), medicine (Field → Specialty → Condition → Treatment), biology (Kingdom → Phylum → Class → Order → Family). Use hub notes at intermediate levels to shorten paths where possible, but don't force artificial categorizations to flatten natural hierarchies. Verify: (1) Does this path reflect a genuine domain taxonomy? (2) Would adding a hub at an intermediate level improve discoverability? (3) Is the deep path serving a valid navigation purpose?
**Edge case (expanded):** Domain-specific taxonomies that are genuine knowledge structures should NOT be flagged as violations:
- **Medical/Clinical:** Anatomy → System → Specialty → Condition → Treatment → Specific intervention (5+ hops is normal for drugs, procedures)
- **Pharmacological:** Drug Class → Subclass → Specific Drug → Dosage Form → Specific Product (hierarchy is by design)
- **Evidence-based medicine:** Systematic Review → RCT → Case Study → Expert Opinion (evidence hierarchy itself is the taxonomy)
- **Diagnostic reasoning:** Chief Complaint → Differential → Workup → Diagnosis → Staging (clinical workflow is sequential)
- **Legal:** Jurisdiction → Legal System → Subject Area → Topic → Specific Doctrine (statutes reference other statutes)
- **Chemical:** Element Category → Element → Isotope → Property (scientific taxonomy)
When applying the test, first check if the deep path reflects a recognized domain taxonomy. Only flag non-taxonomic deep paths as structural problems.

**Rule:** Create hub notes when a topic has 5+ related notes without a central entry point.
**Why:** Hubs provide navigation shortcuts, reduce traversal depth, and serve as orientation landmarks.
**Test:** Identify clusters of 5+ notes on a topic. Does each cluster have a hub note linking to all members?

**Rule:** Create hubs based on concept emergence, not arbitrary thresholds — use conceptual clarity as the primary trigger.
**Why:** The 5-note threshold is arbitrary. A cluster of 3 notes on a well-defined concept (like "React Hooks" or "Vaccine Types") warrants a hub earlier; a loose category of 6+ notes may never need one. Hub creation should reflect concept maturity, not count.
**Test:** For any note cluster: (1) Can you state what unifies these notes in one sentence? (2) Do notes naturally link to each other beyond sharing tags? (3) Would a reader expect these to be grouped? If yes to 2+ of 3, create the hub regardless of count.
**Edge case:** Well-defined domain concepts warrant early hubs (3-4 notes). Emerging or unclear concepts should accumulate to 5+ before hubbing.
**Edge case:** Distinguish concept clusters (things that belong together) from category clusters (things that share a tag). Only concept clusters need hubs.
**Guidance by count:**
- 3 notes: Create hub if concept is clearly defined in the domain
- 4-5 notes: Strong indicator for hub creation
- 6+: Hub likely overdue unless concept is unclear

**Rule:** Hub notes should link outward (to topic notes), not contain substantial content themselves.
**Why:** Hubs that contain long content violate atomicity; their job is navigation, not knowledge.
**Test:** Is the hub note under 200 words? Does it primarily consist of links with brief context?

**Rule:** Graph density (edges/nodes ratio) should increase over time, not just node count.
**Why:** A vault that grows in notes but not connections is accumulating, not building knowledge.
**Test:** Compare edges/nodes ratio across time. Is it trending upward?
**Edge case:** For vaults with natural hub-and-spoke structures (genealogy, organizational charts, family trees), track density separately for entity nodes vs. source/ metadata nodes. Individual records (people, employees) may legitimately have fewer connections than hub nodes (families, departments).
**Edge case:** Geographic or temporal clusters may have internal density but limited external connections. Measure cross-cluster connections separately from within-cluster density.
**Edge case:** Bulk imports (GEDCOM, database dumps) create artificial density patterns. Flag import periods and measure organic growth separately from bulk additions.

**Rule:** Monitor graph density and prune when links become decorative rather than navigational — a note with more than 7 outgoing links should trigger a review.
**Why:** Excessive density reduces navigability and dilutes the signal of meaningful connections. Quality of links matters more than quantity.
**Test:** Can you explain why each link in a random note matters? Are any links there only to meet a minimum count requirement?
**Edge case:** Natural domain hierarchies (taxonomies, classification systems) may legitimately exceed 7 links when representing genuine domain structure. Verify: (1) Does this path reflect a genuine domain taxonomy? (2) Would adding a hub at an intermediate level improve discoverability? (3) Is the deep structure serving a valid navigation purpose?

**Rule:** For notes tagged `difficulty: advanced` or covering multi-step concepts, include explicit `prerequisites` in frontmatter listing required background notes.
**Why:** Without prerequisite tracking, readers and AIs cannot construct coherent learning paths; complex notes become inaccessible without context.
**Test:** Pick 5 notes tagged `difficulty: advanced`. Does each have a `prerequisites` field listing the notes needed to understand it?
**Edge case:** Distinguish strict prerequisites (cannot understand without) from recommended background (helps but optional). Use structure:
```yaml
prerequisites:
  required:
    - JavaScript Fundamentals
    - HTML Basics
  recommended:
    - Functional Programming Concepts
```
**Edge case:** For version-dependent domains (software frameworks, evolving fields), include version scope in prerequisites:
```yaml
prerequisites:
  required:
    - React Fundamentals
  version: "React 18+"
```
**Edge case:** For multi-goal vaults, allow goal-specific prerequisites:
```yaml
prerequisites:
  for-frontend:
    - React Fundamentals
  for-backend:
    - Node.js Basics
```
**Edge case:** For long prerequisite chains, include depth indicator to help readers assess how far back the chain goes:
```yaml
prerequisites:
  required:
    - Topic A
  depth: beginner  # Can start here with some background
  depth: intermediate  # Full chain recommended
```

**Rule:** Create gateway notes for topics that unlock 5+ other notes, marking them with `gateway: true` and an `unlocks` list.
**Why:** Gateway notes serve as navigation landmarks that help readers and AIs find entry points into complex topic areas.
**Test:** Run a hub analysis. Are the top 5 hubs also marked with `gateway: true` in their frontmatter?

**Rule (NEW - 2026-04-04):** Track knowledge network effects — recognize that note value scales non-linearly based on graph position and combination effects.
**Why:** Individual note quality optimization misses graph-level value creation. Prerequisite notes unlock multiple dependent notes; bridge nodes connect previously separate clusters; outdated notes cascade decay to dependents. Without network effect awareness, agents optimize per-note quality but miss network-level optimization opportunities.
**Test:** (1) Can you identify notes with high unlock potential (adding them makes multiple other notes more actionable)? (2) Do you track bridge nodes that connect separate topic clusters? (3) Is cascade risk assessed for high-dependency notes? (4) Do capture priorities consider network effect potential?

**Implementation:** Use frontmatter to track network effects:
```yaml
network-effect-type: prerequisite-unlock|bridge-node|contradiction-catalyst|verification-multiplier|standalone
unlock-potential: low|medium|high  # How many other notes become more actionable
cluster-bridge: [cluster-a, cluster-b]  # If bridging clusters
dependency-count: 15  # How many notes depend on this
cascade-risk: low|medium|high  # If outdated, how many notes affected
```

**Network effect types:**
- **Prerequisite unlock** (strong positive): When adding a foundational note makes multiple dependent notes more valuable
- **Bridge node** (strong positive): Note connecting previously separate clusters, enabling new synthesis paths
- **Contradiction catalyst** (moderate positive): Coexisting opposing views create productive tension generating new understanding
- **Verification multiplier** (moderate positive): When a note's verification improves confidence in all notes that reference it
- **Decay cascade** (negative): When one note becomes outdated, it undermines confidence in all dependent notes

**Capture strategy implications:**
| Effect | Priority Strategy |
|--------|------------------|
| Prerequisite unlock | Prioritize foundational notes first |
| Bridge nodes | Explicitly seek cross-cluster connections |
| Contradiction catalysts | Keep conflicting views, don't resolve prematurely |
| Verification multipliers | Verify high-dependency notes first |
| Decay cascades | Monitor dependency chains for cascading outdatedness |

**Metrics beyond density:**
- **Unlock ratio**: Notes that became more actionable after recent captures / total captures
- **Bridge utilization**: Percentage of cluster-bridge notes actually used as bridges
- **Cascade incident rate**: How often does one note's decay cascade to dependents

**See also:** [[Frontier Exploration - Knowledge Network Effects]] (gap identification)

**Rule:** For vaults serving multiple expertise levels, create audience-specific entry points rather than duplicating atomic notes.
**Why:** Duplication fragments knowledge and creates maintenance burden; tiered entry points preserve atomicity while serving diverse audiences.
**Test:** Can a beginner find accessible entry points? Can an expert find deep dives without wading through basics?

**Rule:** Organize domain knowledge by explicit abstraction levels — identify 3-4 tiers (concrete → pattern → principle → philosophy) and tag notes with `level:` metadata.
**Why:** Without explicit abstraction tiers, experts waste time filtering basics; beginners face inaccessible advanced content. Level tagging enables appropriate content serving.
**Test:** (1) Can you identify 3+ abstraction levels in your domain? (2) Are notes tagged with level metadata? (3) Can you filter notes by level? (4) Do notes link to adjacent abstraction levels?
**Edge case:** Some domains have only 2 natural levels. Don't force 4 levels if 2 suffice.
**Edge case:** Cross-domain notes may span multiple levels. Tag with primary level; use `also-levels:` for additional tiers.

**Rule:** Create explicit onboarding guidance for both human users and AI agents entering the vault.
**Why:** A perfectly structured vault is useless if newcomers can't find their way. Onboarding guidance helps users (human and AI) understand purpose, conventions, navigation patterns, and quality signals.
**Test:** Can a newcomer understand the vault's purpose in 30 seconds? Can an AI agent find relevant information without explicit instructions? Can someone predict how notes are named?

**Rule:** Include an AI-agent-readable conventions note that explains vault rules, naming patterns, and quality standards.
**Why:** AI agents need machine-readable guidance to navigate effectively and produce content that follows vault conventions.
**Test:** Can an AI agent determine naming conventions, link syntax, and quality expectations from reading onboarding material?

**Rule:** Define reasoning strategies for query answering — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection.
**Why:** A perfectly structured vault is useless without strategies for traversing and synthesizing knowledge. Without reasoning guidance, AI agents over-traverse, under-traverse, or miss key connections. Explicit strategies ensure consistent, high-quality answers.
**Test:** For a complex query, can you: (1) decompose it into atomic sub-questions? (2) plan traversal paths before executing? (3) score note relevance using explicit criteria? (4) aggregate confidence from component notes? (5) detect and flag knowledge gaps encountered during reasoning?
**Edge case:** Different vault purposes require different reasoning strategies — reference KBs favor precision over breadth, learning KBs include path construction. Let query intent determine strategy.

**Rule (REFINEMENT 2026-04-04):** Apply implementation-specific reasoning strategies:
- **Query decomposition** by type: procedural→steps, conceptual→causes, relational→attributes, recommendation→criteria, troubleshooting→hypothesis-test
- **Traversal strategy** by intent: breadth-first for overview, depth-first for analysis, hub-first for structured domains, link-hop for discovery
- **Relevance scoring** with explicit formula: 0.3×keyword + 0.3×connectivity + 0.2×type_match + 0.2×recency
- **Confidence aggregation** by dependency: average for independent, minimum for dependent, weighted for contradictory
- **Gap classification** by type: missing-note/incomplete/outdated/contradictory/unverified with specific actions
**Why:** The base rule exists but lacks implementation guidance. Without explicit strategies, agents improvise inconsistent approaches. This refinement makes the rule testable and actionable.
**Test:** For any query: (1) Can you identify query type and apply appropriate decomposition? (2) Can you select traversal strategy and justify it? (3) Can you write down your relevance scoring formula? (4) Can you justify your confidence aggregation method? (5) Can you classify any gaps found?

**Rule:** Document synthesis logic for complex answers — when combining multiple notes, track which notes contributed, how synthesis was performed, and any assumptions made.
**Why:** Reproducibility matters for AI-generated answers. Without synthesis documentation, future queries cannot verify or improve the reasoning path.
**Test:** Can another agent reproduce your answer by following the same synthesis logic? Are synthesis sources and methods documented?

**Rule:** Track reasoning success rate as a proxy for vault usability — monitor query completion, gap detection frequency, and answer quality.
**Why:** Vault health isn't just about structure — it's about usability. Reasoning metrics reveal whether the knowledge base actually serves its purpose.
**Test:** Can you calculate: (1) What percentage of queries complete successfully? (2) How often do queries reveal knowledge gaps? (3) Do reasoning failures correlate with specific structural issues?

**Rule (REFINEMENT 2026-04-04):** Apply synthesis documentation format and quality metrics schema:
- **Synthesis format** requires: sources (list of notes consulted), method (cross-reference/inductive/deductive/analogical), assumptions (explicit), confidence-inherited (per-note), final-confidence (cannot exceed lowest inherited), gaps-identified (with severity and action)
- **Quality metrics** track: queries-total, queries-completed, completion-rate, queries-with-gaps, gaps-resolved, gap-resolution-rate
- **Rule interaction** follows decision tree: query→decompose→traverse→score→detect gaps→aggregate→synthesize→document→update metrics
**Why:** The base rules exist but lack required documentation format and metrics schema. Without explicit format, agents improvise inconsistent approaches. This refinement makes the rules testable and actionable.
**Test:** For complex answers: (1) Can you document all sources with their confidence levels? (2) Can you write down your synthesis method and assumptions? (3) Can you calculate query completion rate and gap resolution rate?

**Rule:** Add decision threshold guidance for actionable knowledge — when knowledge recommends a decision, include explicit criteria for when to stop gathering information and act.
**Why:** Without decision thresholds, users face analysis paralysis. The Seed covers what to decide and how to verify, but not when "enough is enough" to make the call. This creates real-world friction where knowledge is captured but not applied because users keep looking for more information.
**Test:** For notes containing decision content: (1) Is there `decision-horizon:` (immediate|flexible|open)? (2) Is there `reversibility:` (easy|hard|one-shot)? (3) Can you state explicit threshold conditions? (4) Is waiting-cost documented for time-sensitive decisions?
**Implementation:** Use frontmatter:
```yaml
decision-horizon: immediate  # Act now, waiting loses value
reversibility: hard         # Significant cost to reverse
decision-threshold: "Need 2+ source confirmations before proceeding"
waiting-cost: high          # Rapidly changing situation
```
**Edge case:** Low-stakes, reversible decisions should move fast — explicit threshold guidance prevents over-research. High-stakes, irreversible decisions warrant more caution but still need explicit thresholds to prevent infinite research.

**Rule:** For spatial knowledge vaults (architecture, interior design, urban planning, geography, travel), allow deeper hierarchies when they reflect genuine geographic structure.
**Why:** The Seed's "3 hops from root" rule may not suit spatial hierarchies where deeper is natural (city → district → neighborhood → street → building is 4+ hops but correct). Forcing spatial knowledge into 3 hops creates artificial flattening that loses geographic nuance.
**Test:** For spatial vaults: Can you identify hierarchies that exceed 3 hops but are genuine geographic structure? Are they allowed rather than flagged as violations?
**Edge case:** Add `spatial-type: hierarchy` frontmatter to notes in spatial hierarchies to mark them for exception from hop-count rules.

**Rule:** Tag spatial knowledge with explicit scale validity — specify what spatial scale the knowledge applies at (street, neighborhood, city, region) and whether it applies at other scales.
**Why:** Knowledge that applies at city scale may be meaningless or misleading at street scale. Without scale tagging, readers and AI agents cannot assess applicability across geographic contexts.
**Test:** For spatial notes: (1) Is there `spatial-scale` or `scale-validity` frontmatter? (2) Can you determine what scale the knowledge applies at? (3) Does the note clarify where it does NOT apply?

**Rule:** Use proximity relationship fields or notes for adjacent-location knowledge — capture "next to," "across from," "visible from," and other spatial relationships explicitly.
**Why:** Spatial knowledge depends on adjacency and proximity. Unlike categorical relationships, proximity enables route planning and spatial reasoning that hub patterns don't explicitly support.
**Test:** For spatial vaults: Are adjacency relationships captured as structured frontmatter (`spatial-relationships`) or explicit relationship notes?

**Rule:** Tag notes with their primary access pattern and create use-case-specific entry points when access patterns diverge significantly.
**Why:** The same knowledge may be accessed differently depending on use case (quick lookup, learning, decision-making, creative inspiration). Current Seed rules optimize for general-purpose graph traversal but don't address use-case-specific optimization. Without access pattern tagging, vaults may organize for one use case while being primarily used for another.
**Test:** For a random sample of 10 notes: (1) Does each have `access-pattern:` frontmatter (lookup|learning|decision|inspiration|mixed)? (2) For vaults with mixed access patterns (>20% different patterns), are there use-case-specific entry points? (3) Can you identify the dominant access pattern from retrieval logs?
**Implementation:** Use `access-pattern:` frontmatter to tag how knowledge is primarily accessed:
- `lookup`: Quick reference, fact retrieval
- `learning`: Understanding, building mental models
- `decision`: Weighing options, making choices
- `inspiration`: Creative recombination, brainstorming
- `mixed`: Multiple patterns equally important
For vaults with significant mixed usage, create parallel entry points optimized for different patterns (e.g., alphabetical index for lookup, learning paths for education, decision trees for choices).
**Edge case:** Single-purpose vaults (reference only, learning only) don't need access pattern tagging — the structure naturally serves the dominant use case.
**Edge case:** Measure before optimizing — track retrieval patterns before creating parallel structures. Creating duplicate organization for marginal use cases adds maintenance burden without proportional benefit.
**Edge case:** Some domains naturally serve multiple use cases (recipes: lookup + learning + decision; tools: reference + comparison). For these, access pattern tagging enables appropriate presentation without structural duplication.

---

## 5. Quality Maintenance

*Keeping the vault healthy over time.*


**Detection methods:**
- **Time-stale:** `days-since-review > review-interval` — mechanical flag based on time
- **Reality-obsolete:** Source changed, version mismatch, link rot, contradiction with newer knowledge, authority superseded — requires semantic check
- **Context-shift:** User reports situation change, tool/technology migration, goal shift — requires user input
**Lifecycle implication:** Notes marked `confidence: obsolete` should be distinct from `confidence: stale` — obsolete notes need replacement, stale notes need review.

```yaml
deprecated: true
deprecated-date: 2026-04-01
superseded-by: [[Note Name]]
supersession-rationale: "What changed that made this knowledge outdated"
was-correct-until: 2025-12-01  # temporal context
```
**Deprecation criteria:**
- Source has been corrected/updated by authoritative source
- Technology or method has been superseded
- Domain understanding has evolved (paradigm shift)
- Personal knowledge has been disproven by experience
- Cross-reference knowledge conflicts with updated source
**Deprecation workflow:**
1. Mark with `deprecated: true` and `deprecated-date:`
2. Add `superseded-by:` link to replacement note
3. Document `supersession-rationale:` explaining what changed
4. Add `was-correct-until:` for temporal context
5. Keep note (don't delete) for historical reference
6. Add `deprecated-review-date:` for future re-evaluation (archive vs. delete)
**Edge case - Partial deprecation:** Sometimes only part of a note is outdated. Extract the valid portion to a new or existing note, mark original as partially deprecated with `partial-deprecation: true` and `valid-sections:` listing what remains relevant.
**Edge case - Contradictory knowledge:** If deprecated knowledge contradicts current knowledge, preserve both with explicit conflict notation. Link to verification-mode conflict resolution.
**Edge case - Security-sensitive deprecation:** For security vulnerabilities, deprecation should be public. Use `security-advisory: true` and link to CVE or security advisory.

**This section syntheses:** The deprecation workflow above combines existing Seed guidance into a cohesive workflow: (1) Use `last-reviewed` to detect time-stale notes, (2) Use staleness vs. obsolescence distinction to categorize, (3) Use maturity staging to track note developmental stage, (4) Use framework-status/terminology-status for domain-specific deprecation, (5) Use external extinction handling when the described entity no longer exists, (6) Use this deprecation workflow for superseded knowledge.

**Detection:** External extinction differs from standard obsolescence:
- **Product discontinuation:** Check manufacturer websites, press releases, archive.org
- **Service shutdown:** Check status pages, news articles, social media announcements
- **Organizational death:** Check business registries, news archives
- **Relationship dissolution:** Personal knowledge (mark with confidence)
- **Physical extinction:** Check historical records, verify destruction/closure
```yaml
extinction-type: product|service|relationship|organization|location
extinction-date: YYYY-MM-DD
extinction-source: discontinuation-notice|shutdown-announcement|verified-absence
historical-status: archived|reference-only|deprecated
```
**Disposition:** (1) Archive — keep as historical record (past employment, discontinued products you might re-buy); (2) Reference-only — mark historical, reduce priority (defunct services, dissolved orgs); (3) Deprecate — keep link but mark superseded (replaced products); (4) Delete — remove when no future value (temporary accounts).


```yaml
maturity: seed  # Core definition or single insight — just created
```
**Maturity progression criteria:**
- **Seed → Sprouting:** Has core claim + at least 1 outgoing link + basic frontmatter
- **Sprouting → Growing:** Has 2+ outgoing links + at least 1 example or application + source cited + incoming link from at least 1 other note
- **Growing → Mature:** Has 3+ related notes (prerequisites, applications, alternatives) + multiple examples + documented limitations + stable over 30+ days + incoming links from 2+ notes
- **Mature → Evergreen:** Referenced as prerequisite by 5+ notes + no updates needed in 90 days + covers complete concept for vault scope + serves as primary entry point


**Merge criteria:** Apply merge when ALL of: (1) Anti-pattern is purely framing (same content as best practice, just negative), (2) Both notes pass the same test criteria, (3) Best practice provides more actionable guidance, (4) Keeping both creates maintenance burden.
**Keep separate when ANY of:** (1) Anti-pattern has unique content (specific failure modes, examples), (2) Both notes have distinct test criteria, (3) Anti-pattern provides value as a distinct warning pattern, (4) Domain-specific anti-pattern content differs from generic best practice.
**Required redirect metadata:**
```yaml
redirect_to: [[Best Practice - Name]]
```
**Example:** Anti-Pattern - Note Hoarding was merged into Best Practice - Selective Capture because both contained identical "two-phase workflow" content. The anti-pattern now has redirect metadata pointing to the best practice.

```yaml
replaces:
  - note: "[[Old Note Title]]"
    replaced-claims: "Specific claims being superseded"
    reason: "New evidence showed X"
    replacement-type: complete|partial|contextual
```
**Replacement types:** complete (entire note superseded), partial (specific claims updated), contextual (old applies in some contexts, new in others).


```yaml
update-dependencies:
    change-type: terminology|reference|procedure|context
    urgency: required|recommended|review
```
**Change types:** terminology (word/phrase usage changed), reference (links or citations updated), procedure (step-by-step knowledge changed), context (assumptions shifted).
**Urgency levels:** required (must update before note is usable), recommended (should update for consistency), review (check if update needed).
**Distinction from replacement:** Replacement tracks that Note A supersedes Note B. Update dependencies track that changing Note A might require changing Notes B, C, D. Use replacement when old knowledge is invalid; use update-dependencies when consistency across multiple notes is needed.

```yaml
limitations:
    effect: "may cause splitting"
    severity: medium
```


```yaml
prediction-horizon: 2028-12  # When verification becomes possible
prediction-confidence:
  methodology: data-driven|model-based|expert-opinion|intuition
  track-record: strong|moderate|limited|unknown
  horizon: near-term|medium-term|long-term
```

```yaml
prediction-outcome: failed
lessons-learned: "What this reveals about prediction methodology"
```
**Why different from regular correction:** Regular correction handles facts that changed. Failed predictions document that a forecasted outcome did not occur - this is evidence about prediction methodology, not about the underlying knowledge being wrong.

```yaml
meta-prediction: true
methodology-type: statistical|expert-judgment|machine-learning|analogical
effectiveness-evidence: "Track record data"
best-practices: ["Practice 1", "Practice 2"]
```



**Edge case (compliance audit 2026-03-20, UPDATED 2026-03-20):** Lifecycle field values should use standardized terms. Acceptable values:
- `evergreen` — permanent, long-lived knowledge that remains relevant
- `transient` — time-limited or ephemeral content
- `seed-extension` — notes that extend Seed rules (protected status)
- `living` — continuously updated documents with review-cadence
- `historical` — knowledge about past events or completed topics
- `perpetual-beta` — knowledge domains that inherently resist completion
- For staging statuses, use `status:` field instead (whisper|draft/probe)



```yaml
terminology-status: current|deprecated|emerging|archival
deprecated-replaced-by: [[Current Term]]
emerging-stability: experimental|unstable|stable
```
**Migration path:** When a term is deprecated: (1) Mark old term with `terminology-status: deprecated`, (2) Add `deprecated-replaced-by:` pointing to current term, (3) Keep old note (don't delete) for historical context, (4) Create redirect note for searchability. For emerging terms, capture with `confidence: emerging` and track expected stabilization timeline.


**Initial confidence calibration:**
- `confidence: high` — Authoritative primary sources with clear verification path, personally verified multiple times
**Domain-specific floors:** Medical/legal/financial require `medium` floor (require human expert for `high`); personal opinions default to `low` with explicit perspective tagging.
**Confidence adjustment:** Track adjustment events separately from review dates. Each significant use, verification attempt, or failure should potentially adjust confidence.
```yaml
confidence-adjustments:
  - date: 2026-03-17
    event: used_successfully
    evidence: "Applied to real decision, positive outcome"
```
**Confidence corridor:** For related knowledge clusters, consider the range (corridor) of confidence levels. A topic with notes ranging from `low` to `high` should be treated as "emerging" overall; a topic where all notes are `high` is "established."

```yaml
source-reliability: high|medium|low|unknown
source-verification: verified|unverifiable|pending|disputed
```
- High reliability + unverifiable: expert confidential informant, credible anonymous source
- Low reliability + verified: accidentally correct rumor, outdated information that happens to match current facts
- High reliability + verified: gold standard knowledge
- Low reliability + unverifiable: low-priority unless other evidence emerges

```yaml
sources-in-conflict:
  - source: "[[Note A]]"
    position: "Claim X"
resolution-status: unresolved|pending-review|resolved
```
**When to defer to human:** Flag for human review when both sources have equal reliability, the topic is high-stakes (medical/legal/safety), or the field has no clear authority to resolve.

```yaml
# mainstream: widely accepted in the field
# debated: active disagreement among experts
# emerging: gaining traction but not yet settled
# fringe: minority view, not mainstream

consensus-scope: global|regional|disciplinary
# global: worldwide consensus
# regional: varies by region/culture
# disciplinary: differs across specialties
```
**Distinguishing from similar concepts:**
- Confidence: "Is the source reliable?" → Consensus level: "Do experts agree?"
- Verification: "Has this been checked?" → Consensus level: "Is this contested?"
- Framework-dependent: Legitimate pluralism (multiple valid approaches) vs. factual disagreement
**Temporal tracking:** Consensus can shift. For knowledge that was once mainstream but is now debated (or vice versa), use `consensus-history:` to track changes.

```yaml
# General
source-type: primary  # Original observation, data, or document

# Legal specific (optional extension)

# Academic specific (optional extension)
```
**Distinction from source-reliability:** `source-reliability` answers "is this source trustworthy?" while `source-type` answers "what kind of source is this?" Both are orthogonal dimensions — a primary source can be low reliability (biased observer) and a tertiary source can be high reliability (well-edited encyclopedia).



- For capture-process: `method:`, `effectiveness-rating:`, `best-for-knowledge-types:`
- For organizational-decision: `decision:`, `alternatives-considered:`, `outcome:`, `would-choose-again:`
- For knowledge-pattern: `pattern-type:`, `evidence:`, `implications:`
- For contextual-decision: `constraints:`, `trade-offs-accepted:`, `rationale:`










```yaml
safety-critical: true
threshold-type: temperature|load|exposure|chemical|electrical|pressure
exact-threshold: "40°F or below"
safety-margin: "Add 5°F buffer for uncertainty"
interpolation-acceptable: false
verification-standard: authoritative-source
danger-consequence: "foodborne-illness"
```








```yaml
taste-calibration: true
domain: cooking  # or wine, coffee, photography, etc.
specific-qualities: ["full body", "low acidity", "roasted not bright"]
preference-strength: strong|moderate|evolving
context-dependency: none|conditional
taste-history:
    trigger: "Palate development"
exploration-guidance:
  try-next: ["Single-origin Ethiopian"]
  avoid: ["Extra dark roast"]
```

```yaml
perspectives: [perspective-1, perspective-2]
perspective-type: complementary|competing|contextual
```
- `complementary`: Different angles that together give fuller picture
- `competing`: Genuine disagreements where truth is unclear
- `contextual`: Different perspectives for different contexts

```yaml
disclaimer-required: true|false
disclaimer-type: medical|financial|legal|professional
disclaimer-text: "Required text here"
advisory-type: recommendation|analysis|information
applies-to: ["specific audience or context"]
scope-limitations: ["who this does NOT apply to"]
```


```yaml
ethical-dimension: neutral  # generally accepted behavior
cultural-scope: universal|western|eastern|collectivist|individualist
```



```yaml
data-type: continuous|discrete|aggregated
data-source: https://api.example.com/sensor
data-freshness: seconds|minutes|hours
```
**Distinction from time-sensitive:** Time-sensitive data expires (refresh periodically); continuous data is obsolete immediately (always link to live source).



```yaml
overflow-indicators:
  backlog-age-days: 7
  verification-velocity: 5  # per week
  access-frequency: 0.3  # 30% of notes accessed monthly
```

**Recovery protocol:** Week 1: deprecate stale notes (50% time); Week 2-3: verify critical notes (30% time); Week 4: process new captures only (20% time).








```yaml
personally-experienced: true|false
experience-count: number
experience-tier: theory-only|tried-once|practiced|mastered
```


```yaml
self-assessed-level: beginner|intermediate|advanced|expert
last-assessed: YYYY-MM-DD
```

- Learning vault: Can users trace learning paths? Complete progressions?
- Reference vault: Can users find what they need in <3 clicks? High search success?
- Creative vault: Does the vault inspire new connections? Successful synthesis?
- Decision support vault: Do notes contain actionable guidance? Documented decisions?
Track metrics:
```yaml
success-metrics:
  purpose: "Primary vault purpose"
  outcome-targets:
    - metric: "What to measure"
  usage-tracking:
    search-success: true
    time-to-answer: true
  value-attribution:
    track-decisions: true
    compare-alternatives: true
```

## 5b. Edge Cases and Exceptions

*Organizing knowledge about what modifies or contradicts general principles.*

```yaml
exception-type: scope-limitation|condition-trigger|temporal-boundary|population-specific|reverse-exception
applies-to-principle: [[General Principle Note]]
```



```yaml
exception-category: valid-exception  # Rule still generally valid
# vs
```


---

## 6. Knowledge Processing

*How new knowledge enters and integrates into the vault.*

**Rule:** Capture first, process second — never try to write a perfect note on the first pass.
**Why:** Perfectionism at capture time slows input and loses ideas; separate capture from refinement.
**Test:** Is there an inbox or staging area? Do notes go through at least two passes before being considered complete?

**Rule:** Use explicit staging for incomplete knowledge — capture fragments, drafts, and hypotheses in marked transitional states rather than only complete notes.
**Why:** Knowledge exists in transitional states (whispers, drafts, probes) that are valuable but not ready for full integration. Without staging, you either lose fleeting insights or bloat the vault with incomplete content.
**Test:** Can you identify notes in transitional states (whisper/draft/probe)? Do they have explicit review dates? Do they graduate to complete status through defined workflows?
**Edge case:** Staging is orthogonal to confidence — a draft can have high confidence on core claims while acknowledging incompleteness. A probe represents hypothesis, not low confidence.
**Implementation:** Use `status: whisper|draft|probe` frontmatter with `review-by:` date. Whisper (fragment, review in 48h), Draft (in-progress, review weekly), Probe (hypothesis, explicit uncertainty).

**Rule:** Track open questions as distinct from unverified or contradictory knowledge — use `knowledge-type: open-question` with explicit question-state.
**Why:** Without explicit open-question handling, genuine uncertainties get conflated with unverified claims or forgotten entirely. Open questions represent research opportunities that deserve systematic tracking. This is fundamentally different from: unverified (answer exists, not confirmed), probe (hypothesis needing testing), or contradiction (multiple answers, at least one correct).
**Test:** For knowledge domains with genuine unknowns: (1) Is there a `knowledge-type: open-question` tag? (2) Are questions categorized by state (active/stalled/abandoned)? (3) Do open questions link to related knowns and potential sources? (4) Is there a process for updating when answers emerge?
**Implementation:** Use frontmatter:
```yaml
knowledge-type: open-question
question-state: active|stalled|abandoned
question-type: empirical|philosophical|practical
research-status: unexplored|preliminary|in-progress
expected-answer-form: boolean|quantitative|qualitative
```
- Active: genuinely being investigated
- Stalled: important but not currently pursuing
- Abandoned: no longer relevant or worth pursuing

**Rule (NEW - 2026-04-02):** Prioritize capture during active learning using real-time triage — categorize incoming knowledge as IMMEDIATE (blocking, high-connection, non-obvious), DEFER (rediscoverable, natural re-encounter), ON-DEMAND (searchable, volatile, highly-specific), or IGNORE (already captured, out of scope).
**Why:** The Seed covers what to capture (diminishing returns, priority signals) and when to create notes (Note Creation Decision Framework) but provides no guidance for real-time triage during active learning. Without this, AI agents either over-capture (everything seems important) or under-capture (miss time-sensitive insights). Learning velocity ≠ capture velocity, so prioritization is essential.
**Test:** During active learning: Apply triage by checking these YES/NO conditions. For each, mark triage evidence in frontmatter:
1. **Blocker check (score 3):** Does this knowledge fill a prerequisite gap blocking stated learning goal? Check: Does wiki link to note you need before continuing?
2. **Connection check (score 2):** Does wiki link identify 2+ existing notes in the vault?
3. **Rediscoverability check (score 2):** Is this from transient source (video, podcast, conversation) not archived?
4. **Uniqueness check (score 1):** Does this contain your original analysis, not just copied facts?
5. **Shelf-life check (score 1):** Is source dated >1 year old? (low = score 1, recent = score 1)

**Executable verification:** Score ≥5 = IMMEDIATE, 3-4 = DEFER, 1-2 = ON-DEMAND, 0 = IGNORE. Required frontmatter: `triage-category:` with value. If AI cannot determine scoring factors, default to DEFER with explanation in note.

**Edge case:** When scoring is unclear, classify as DEFER rather than risk under-capture. Document scoring uncertainty in triage notes.
**Implementation:** During active learning sessions, apply real-time triage before capture. Priority factors: blocker (prevents progress on intended work), connection (links to 2+ existing notes), rediscoverable (will take >5 min to find again if deferred), unique (contains your analysis/context, not just facts), shelf-life (accurate in 30+ days). Batch sessions may skip triage; stream sessions require it.

**Rule:** Track knowledge activation state separately from lifecycle stage — distinguish whether captured knowledge is ready for practical application.
**Why:** A note can be "active" (lifecycle) but not ready to inform decisions. Without activation tracking, users may rely on incomplete knowledge. Activation states (captured → processed → verified → applied → integrated) provide a readiness dimension orthogonal to lifecycle.
**Test:** Can you categorize each note by activation state? Do decision-support queries filter by readiness?
**Implementation:** Use `activation-state:` frontmatter with values:
- `captured`: Raw input, needs processing
- `processed`: Synthesized into atomic form, needs verification
- `verified`: Confirmed accurate, ready for use
- `applied`: Used in real context, needs outcome capture
- `integrated`: Outcome captured and knowledge refined

**Rule:** Define explicit activation criteria for knowledge types — specify what makes knowledge "ready" for different use cases.
**Why:** The threshold for "ready" differs by use. A recipe needs testing; a factual claim needs source verification; an opinion needs perspective tagging. Without explicit criteria, readiness is subjective.
**Test:** For knowledge in your vault: (1) What activation criteria apply? (2) Are criteria explicit in frontmatter? (3) Can users determine readiness without reading full content?

**Rule:** Include activation state in retrieval results — when querying for decision-support, filter to verified or applied knowledge.
**Why:** Including unprocessed or unverified knowledge in decisions risks poor outcomes. Retrieval should respect activation state to ensure knowledge applied is actually ready.
**Test:** Can you filter vault queries by activation state? Do decision-support queries exclude captured/processed knowledge?

**Rule:** For domains with distinct knowledge modalities (how knowledge is used), tag notes with `knowledge-modality:` to distinguish use cases.
**Why:** Generic procedural/conceptual distinction fails when the same domain has multiple valid use cases requiring different structuring. In music (performance vs. analysis vs. composition), medicine (diagnosis vs. prognosis vs. treatment), or engineering (theory vs. practice), the same underlying knowledge serves different purposes that require different organization approaches.
**Test:** For domain-specific notes: (1) Can you identify which modality this knowledge serves? (2) Does the note include `knowledge-modality:` field? (3) Are different modalities structured appropriately for their use case?
**Implementation:** Use `knowledge-modality:` frontmatter with domain-appropriate values:
- Music: `performance` (how to execute), `analysis` (understanding existing works), `compositional` (how to create), `hybrid`
- Medicine: `diagnosis` (identifying conditions), `prognosis` (predicting outcomes), `treatment` (intervention selection), `hybrid`
- Engineering: `theoretical` (principles), `practical` (implementation), `design` (creation), `hybrid`

**Refinements (tested via domain stress tests):** For multi-modal notes (notes serving multiple use cases), use `knowledge-modality: mixed` with explicit `modalities-served:` list. For context-dependent applicability, add `context-scope:` field (values: domain-appropriate like `home-cooking`, `professional`, `field`, `historical`). For competing methodological frameworks within a domain, add `framework:` field (e.g., `traditional`, `modernist`, `classical`, `contemporary`). For atomic vs. composable knowledge, add `compositionality:` field (`atomic` for complete units like recipes, `composable` for reusable components like techniques). For personal vs. universal knowledge, add `subjectivity:` field (`universal` for domain truths like safety rules, `personal` for individual preferences, `contextual` for situation-dependent judgments). For evolving knowledge, add `temporal-scope:` field (`current`, `historical`, `evolving`).

**Why it matters:** Performance knowledge is sequential and physical; analytical knowledge is hierarchical and comparative; compositional knowledge is creative and principle-based. Without distinguishing modalities, the vault can't serve different use cases effectively.

**Rule:** For condition-triggered knowledge, include explicit `activation-conditions` frontmatter specifying what state must be true for this knowledge to apply.
**Why:** Knowledge that becomes relevant based on specific conditions (market regimes, seasonal states, emergency types) differs fundamentally from time-based knowledge. Without explicit condition tracking, AI agents cannot determine which knowledge is relevant to the current context. Condition-triggered knowledge that's never evaluated against conditions becomes invisible — users can't find what they need when they need it.
**Test:** For condition-triggered notes: (1) Is there `activation-conditions:` frontmatter? (2) Can you identify the states that must be true? (3) Is there a mechanism to evaluate current state against conditions?
**Edge case:** Distinguish condition-triggered from time-triggered: time-triggered knowledge becomes stale due to passage of time; condition-triggered knowledge becomes relevant when external states change. A trading strategy doesn't become stale after 30 days — it becomes irrelevant when market conditions shift from the strategy's applicable regime.
**Implementation:**
```yaml
activation-conditions:
  - condition: "market-regime"
    equals: "high-volatility"
  - condition: "season"
    in: ["winter", "early-spring"]
  - condition: "emergency-type"
    is-one-of: ["medical", "fire", "security"]
```
**Condition operators:** `equals`, `not-equals`, `in`, `not-in`, `greater-than`, `less-than`, `any-of`

**Rule:** Create explicit state notes for condition-triggered knowledge domains — notes that define valid states and track current state.
**Why:** Condition-triggered procedures need a canonical source for what states exist and what the current state is. Without state notes, conditions are implicit rather than explicitly defined and trackable.
**Test:** For domains with condition-triggered knowledge: (1) Are there state definition notes? (2) Do they list all valid states? (3) Is current state documented and updateable?
**Implementation:** State notes should include:
```yaml
type: state-definition
valid-states: ["state-a", "state-b", "state-c"]
current-state: "state-a"
last-updated: 2026-03-17
```

**Rule:** Include `transition-trigger` frontmatter for state knowledge — specify how to detect when conditions have changed.
**Why:** Condition-triggered knowledge requires knowing when to re-evaluate applicability. Without explicit transition triggers, agents cannot detect that conditions have changed and relevant knowledge should become active or inactive.
**Test:** For state notes: (1) Is there a `transition-trigger:` field? (2) Can you detect when conditions changed? (3) Is there a mechanism to alert/notify when transitions occur?
**Implementation:**
```yaml
transition-trigger:
  type: indicator-based|event-based|date-based
  indicators: ["VIX > 30", "price crosses 200-day MA"]
  check-frequency: daily|weekly|on-query
```

**Rule:** Extend activation-state framework for condition-triggered knowledge — include `ready` (waiting for condition) and `applied` (condition currently active) states.
**Why:** The existing captured→processed→verified→applied→integrated flow assumes universal readiness. Condition-triggered knowledge has a different flow: captured→processed→ready (conditions not met)→applied (conditions met)→evaluated (condition ended)→ready (next occurrence).
**Test:** Can you track: (1) Knowledge that's ready but not currently applicable? (2) When conditions become active? (3) Outcomes after condition ends?

**Rule:** When retrieving condition-triggered knowledge, first identify current conditions, then filter by activation-conditions before presenting results.
**Why:** Presenting all applicable knowledge without filtering by current state overwhelms users. A trader doesn't need to see momentum strategies during range-bound markets.
**Test:** For a query in a condition-triggered domain: (1) Can you identify current state? (2) Do you filter by matching conditions? (3) Do you note when knowledge is ready-but-not-applicable?

See also: [[Frontier Exploration - Condition-Triggered Knowledge]] for detailed exploration of this gap.

**Rule:** Tag context-gated knowledge with explicit gate conditions — knowledge that is true but only applies in specific contexts must be labeled with `context-gate: true` and `context-conditions:` listing what must be true for the knowledge to apply.
**Why:** Without explicit context gates, users and AI agents assume applicability broader than warranted. Context-gated knowledge without tags leads to failed actions, false expectations, and transfer errors across contexts. This is distinct from condition-triggered knowledge (when to apply knowledge) — context-gated knowledge addresses whether the knowledge even applies to the reader's situation.
**Test:** For notes with context-dependent applicability: (1) Is there a `context-gate: true` tag? (2) Are all conditions explicitly listed in `context-conditions`? (3) Can a reader determine if this knowledge applies to them?
**Edge case:** Geographic gates (climate zones, local regulations), temporal gates (hours, seasons, version-specific), identity gates (citizenship, role, personal attributes), technical gates (platform, version, configuration), and resource gates (budget tier, equipment, access level) each require different condition formats. Use the format that best describes the constraint.
**Implementation:** Use frontmatter:
```yaml
context-gate: true
context-type: geographic|temporal|identity|technical|resource
context-conditions:
  - condition: "region"
    values: ["California", "Arizona"]
    note: "Only applies to southwestern US states"
```

See also: [[Frontier Exploration - Context-Gated Knowledge]] for detailed exploration of this frontier.

**Rule:** Tag geographically-constrained knowledge with explicit `geographic-scope` frontmatter — knowledge that applies only in specific geographic regions must specify where it applies.
**Why:** Geographic constraints affect whether knowledge is applicable at all. Building codes, climate-dependent practices, local regulations, and regional customs vary fundamentally by location. Without explicit scope, AI agents cannot assess applicability and may apply incorrect knowledge to the wrong context.
**Test:** For knowledge with geographic constraints: (1) Is `geographic-scope:` specified in frontmatter? (2) Does it include the type of constraint (regulation, climate, cultural, ecological)? (3) Are specific regions listed where knowledge applies? (4) Is there a separation between universal principles and region-specific implementations?
**Edge case:** When knowledge has universal principles that apply everywhere but region-specific implementations, tag the note with both `geographic-scope: universal` for principles and create region-specific variants for implementations.
**Implementation:** Use frontmatter:
```yaml
geographic-scope:
  type: regulation|climate|cultural|ecological|species
  regions: ["US", "EU", "UK"]  # or specific: ["California", "Mediterranean"]
  scope-type: universal|regional|local
```
**Distinction:** This is distinct from context-gated knowledge (which covers broader context types) — geographic-scope specifically handles location-based applicability constraints. Use context-gate for non-geographic contexts; use geographic-scope specifically for location-based constraints.

See also: [[Frontier Exploration - Geographically-Constrained Knowledge]] for detailed exploration of this frontier.

**Rule:** Process incoming knowledge into atomic notes within 48 hours.
**Why:** Unprocessed captures degrade in value as context fades; a growing inbox signals a broken pipeline.
**Test:** Count unprocessed captures. Are there more than 10? If yes, the processing pipeline is stalled.
**Edge case:** Domain-specific content complexity requires tiered processing windows. Academic papers, technical documents, and long-form content may legitimately require 7-14 days for thorough processing, while quick captures (ideas, snippets, meeting notes) should still follow the 48-hour rule. Use batch triage mode when intake exceeds processing capacity — first-pass triage extracts metadata and key claims; deeper processing is scheduled for later.

**Rule:** When integrating new knowledge, search for existing related notes first — extend, don't duplicate.
**Why:** Creating a new note when a related one exists fragments the knowledge graph.
**Test:** For the last 5 notes added, was a search performed first? Could any of them have been merged into existing notes?

**Rule:** Write in your own words — do not copy-paste from sources.
**Why:** Copy-pasted content lacks the synthesis that creates genuine understanding and unique value.
**Test:** Compare note text against its source. Is the wording substantially different? Does it add interpretation?

**Rule:** Cite sources — every factual claim should trace back to an origin.
**Why:** Unsourced claims cannot be verified or updated when the underlying knowledge changes.
**Test:** Do factual notes include source references? Can each claim be traced to its origin?

**Edge case (NEW - 2026-03-31):** Distinguish source types — original insights, personal experiments, and experiential knowledge may have no external source but are still valuable.
- Original knowledge (your synthesis): mark `source-type: original`, no citation required but mark originality
- Empirical knowledge (your experiments): mark `source-type: empirical`, document methodology
- Experiential knowledge (personal experience): mark `source-type: experiential`, note the experience context
- External knowledge: standard citation required

**Test:** For notes without external sources: (1) Can you classify source-type (original|empirical|experiential)? (2) Does the note mark originality appropriately? (3) Is confidence assigned based on evidence type, not just source presence?

**Rule:** Validate cited sources periodically — URLs rot over time and ghost citations accumulate.
**Why:** A citation that leads nowhere is noise, not knowledge. The vault accumulates dead references unless checked.
**Test:** Run an external link check on notes older than 6 months. Flag or update dead URLs. Use archive.org fallback where available.

**Rule:** Track derived knowledge provenance for syntheses created from existing vault notes — when combining insights from multiple notes to create new understanding, document the derivation.
**Why:** Knowledge synthesized from other vault notes (derived knowledge) differs from external source knowledge. Without provenance tracking, readers cannot verify the synthesis is supported by its sources, maintenance becomes difficult when source notes change, and the valuable knowledge about HOW insights emerge is lost.
**Test:** For notes that synthesize vault knowledge: (1) Is there a `derived-from-vault:` frontmatter field? (2) Does it cite the source notes that informed the synthesis? (3) Is the synthesis method documented (pattern-discovery, principle-extraction, hub-creation, inference)?
**Implementation:** Use fields:
```yaml
derived-from-vault: true
synthesis-type: pattern-discovery|principle-extraction|hub-creation|inference
sources:
  - [[Note Lifecycle Management]]
  - [[Graph Traversal Efficiency]]
synthesis-method: How this was derived (induction, analogy, deduction)
derived-date: YYYY-MM-DD
```
**Edge case:** This is distinct from link relationships — links connect notes, while derived knowledge provenance tracks which specific notes contributed to a NEW synthesized insight. Hub notes that represent emergent clusters should document what unifies them.

**Edge case (stress test 2026-03-17):** Synthesis quality varies significantly and should be evaluated. Not all derived knowledge adds value — trivial syntheses ("A and B are related") differ from emergent syntheses ("A and B together reveal unexpected insight C"). Apply quality test: (1) Could this conclusion be derived from any single source alone? (2) Does the synthesis enable conclusions impossible from any part alone? (3) Is the synthesis referenced by other notes? Mark syntheses failing 2+ criteria with `synthesis-quality: trivial` and consider deprecating or merging back into sources. The test: For derived notes, do 3+ of 5 pass all quality criteria?

**Rule (NEW - 2026-04-09):** For vaults exceeding 200 notes, implement retrieval optimization — track access patterns, create index structures for frequent lookups, and measure average retrieval depth.
**Why:** The 3-hop rule assumes equal traversal cost, but in large vaults, some paths are significantly slower. Without retrieval optimization guidance, vaults become inefficient as they grow. Access frequency varies: some notes (hub entries, reference facts) are queried 10x more than others.
**Test:** (1) Can you measure average retrieval depth for 10 random queries? (2) Is there a caching or index strategy for frequently accessed knowledge? (3) For vaults >200 notes: Do hot-path notes have direct connections from hubs?
**Implementation:** For large vaults, create dedicated lookup indexes for commonly needed facts, ensure frequently accessed notes have direct hub connections, and track access patterns:
```yaml
retrieval-optimization:
  threshold: 200  # notes
  index-notes: true
  hot-path-optimization: true
  access-frequency-tracking: true
```
**Edge case:** Small vaults (<100 notes) — naive traversal is acceptable, optimization overhead exceeds benefit.
**Edge case:** Time-critical applications (emergency knowledge, real-time systems) — optimize for single-view retrieval regardless of vault size.
**See also:** [[Seed Refinement - Knowledge Graph Retrieval Optimization]] — Refinement addressing this gap

**Rule:** For access-controlled sources (paywalled content, subscription services, members-only), document access requirements and capture key insights before access is lost.
**Why:** Subscriptions expire, platforms change, communities close. Access-controlled content can become inaccessible without warning. Capturing synthesized insights ensures knowledge survives access loss.
**Test:** For notes citing access-controlled sources: (1) Does the frontmatter document what access is required? (2) Have you captured the key insights, not just a link? (3) Can someone understand the knowledge without accessing the original?
**Edge case:** Access tier (free/subscription/paid) is orthogonal to source quality. A free blog post may be more reliable than a paid advertisement. Distinguish access requirements from quality assessment.
**Implementation:** Use fields `access-requirements: type: subscription|paid|membership|authentication`, `access-verified: YYYY-MM-DD` to track currency of access.

**Rule:** For knowledge captured from conversations (interviews, meetings, verbal consultations), include relationship context and attribution type in frontmatter.
**Why:** Conversational knowledge has properties distinct from written sources: meaning depends on relationship dynamics, non-verbal context, and setting. Without explicit capture of these factors, the same words can be misinterpreted.
**Test:** For conversation-based notes: (1) Is speaker relationship documented (peer|authority|personal)? (2) Is conversation type noted (formal|casual|interview)? (3) Is attribution type clear (direct-quote vs paraphrase)? (4) Is consent status documented (explicit|implied|unknown)?
**Edge case:** "Heard from" knowledge (third-party reports) should have lower confidence than direct statements. Use `attribution-type: third-party-report` with appropriate skepticism.
**Edge case:** Follow-up availability enables verification - flag notes where the speaker can be contacted for clarification.
**Implementation:** Use fields:
```yaml
knowledge-source: conversation
conversation-type: interview | meeting | phone | casual
speaker-relationship: peer | authority | personal | unknown
attribution-type: direct-quote | paraphrase | third-party-report
consent: explicit | implied | unknown
follow-up-available: true | false
```

See also: [[Frontier Exploration - Conversational Knowledge Capture]] — Extended exploration of capturing knowledge from verbal sources

**Rule:** For procedural content (recipes, code, tutorials, technical specs), include a verification-status field: `unverified` | `tested` | `community-validated`.
**Why:** Procedural content that hasn't been tested may cause harm (medical procedures, broken code) or waste time (recipes that don't work). Readers and AI agents need to know whether the steps have been verified.
**Test:** Pick 10 notes containing procedural content. Can you categorize each by verification status? Are any unmarked?
**Edge case:** Domain-standard procedures (well-known algorithms, classic recipes) may be marked as `community-validated` by virtue of widespread use. New or experimental procedures should be marked `unverified` until tested.
**Edge case:** AI agents cannot verify procedural content by execution - they should mark procedural notes as `unverified` unless source explicitly states testing was performed.

**Rule:** For sequential workflow knowledge where workspace state changes during the process (home renovation, automotive repair, fabrication, crafting), include workspace state documentation: what the workspace looks like after each step, and what must be true before the next step begins.
**Why:** Sequential workspace knowledge differs from standard procedural knowledge because each step changes the state of what you're working on, and subsequent steps depend on those changes. Without explicit state documentation, users can't verify they're ready for the next step, can't diagnose where errors occurred, and can't assess whether they need to re-enter a prior stage.
**Test:** For sequential workflow notes (5+ steps): (1) Can you state what the workspace looks like after each step? (2) Can you state what must be true before the next step begins? (3) Can you identify what would indicate something went wrong at each step?
**Edge case:** For multi-step workflows, include error recovery paths documenting what to do if an issue is discovered at step N that requires fixing step N-2. The cost of re-entry is a critical decision factor.
**Edge case:** Use explicit dependency chain frontmatter to map which steps create conditions for subsequent steps: `creates-condition-for:` and `requires-prior-state:` fields distinguish sequential dependencies from independent steps.

**Rule:** Distinguish troubleshooting knowledge from procedural knowledge — tag notes containing diagnostic reasoning with `knowledge-type: troubleshooting`.
**Why:** Procedural knowledge tells you "how to do X." Troubleshooting knowledge tells you "what's wrong when X doesn't work." These require different structures: procedural is forward (do this, then that), troubleshooting is backward (symptom → cause). Without explicit tagging, users cannot apply the right reasoning pattern.
**Test:** Pick 5 notes in troubleshooting-heavy domains (technical support, healthcare, automotive, home repair, software debugging). Can you categorize each as: (a) purely procedural, (b) purely troubleshooting, (c) contains both? Do they have appropriate knowledge-type tags?
**Implementation:** Use `knowledge-type: troubleshooting` frontmatter with:
```yaml
knowledge-type: troubleshooting
symptom: "What the user observes"
possible-causes:
  - cause: "First possible cause"
    likelihood: high|medium|low
    investigation: "How to check for this"
    confirms: "What finding means this is the cause"
    eliminates: "What finding rules this out"
investigation-priority:
  - step: "What to check first"
    reason: "Why this order"
    safety: "no-risk|low-risk|high-risk"
diagnosis-status: investigating|probable|confirmed|ruled-out
```

**Rule (NEW - 2026-03-28):** For interaction knowledge (knowledge about how elements combine, affect each other, or produce emergent properties), tag with `knowledge-type: interaction` with explicit metadata.
**Why:** Interaction knowledge differs from procedural (do X→get Y), conditional (if A→then B), or conceptual (X is Y) — the combination produces something neither element has alone. Without explicit handling, AI agents cannot distinguish "A goes with B" (simple pairing) from "A and B interact to produce C" (emergent interaction).
**Test:** For notes about combinations: (1) Are participating elements explicitly identified? (2) Is interaction direction stated (A→B, B→A, mutual)? (3) Is the mechanism explained (chemical, structural, cultural)? (4) Is subjectivity level indicated (structural | cultural | preference)?
**Implementation:** Use frontmatter:
```yaml
knowledge-type: interaction
interaction-type: complement|contrast|conflict|neutral
direction: a-enhances-b|b-enhances-a|mutual|neutral
mechanism: chemical|structural|cultural|preference
subjectivity: structural|cultural|preference
participating-elements:
  - "Element A"
  - "Element B"
```
**Edge case:** Distinguish interaction from substitution — substitution replaces one element with another; interaction combines elements to produce new properties. "Butter can be replaced with oil" = substitution; "Butter + eggs = emulsification" = interaction.
**Edge case:** Distinguish interaction from simple pairing — "wine goes with fish" is preference; "acid in wine breaks down fat in fish" is structural interaction. The mechanism distinguishes the type.
**See also:** [[Seed Gap - Interaction Knowledge Type]] — Gap that prompted this rule addition

**Rule:** Include investigation priority in troubleshooting notes — what to check first, second, third, with reasoning for each priority.
**Why:** Without priority, users face analysis paralysis. Some investigations are quick, some are time-consuming, some are dangerous. Priority enables efficient diagnosis and prevents wasted effort on unlikely causes.
**Test:** For troubleshooting notes, can you identify: (1) What to check first? (2) Why that order? (3) What's the fastest path to resolution? (4) What are the safety-critical checks?

**Rule:** Track uncertainty during troubleshooting — use explicit `diagnosis-status` frontmatter with values: `investigating | probable | confirmed | ruled-out`.
**Why:** Premature certainty in troubleshooting leads to wrong fixes. Tracking uncertainty ensures systematic elimination of possibilities and prevents jumping to conclusions.
**Test:** Can you trace the progression from initial symptom to final resolution? Are eliminated causes documented? Do notes include what findings would rule out each possible cause?

**Rule:** Include safety escalation guidance in technical troubleshooting — when troubleshooting involves danger (electrical, structural, chemical, mechanical), include explicit `safety-warning` and escalation path.
**Why:** Some troubleshooting can cause harm if done incorrectly. Users need to know when to stop and call a professional rather than continue diagnosing.
**Test:** For troubleshooting notes in safety-critical domains: Is there explicit guidance on when to escalate? Are dangerous investigations clearly marked?

**Rule:** Handle multiple simultaneous problems in troubleshooting — when diagnosis reveals multiple issues, structure as primary issue + secondary issues with resolution order.
**Why:** Real-world troubleshooting often finds multiple problems. Without explicit handling, users may fix one issue, think they're done, and miss others.
**Test:** Can troubleshooting notes handle: (1) Primary issue causing most symptoms? (2) Secondary issues found while investigating? (3) Resolution order (fix primary first, then re-evaluate secondary)?

**Edge case:** When troubleshooting transitions to research (no known cause exists), tag with `diagnosis-status: unknown-cause` and include `recommended-action:` (document-symptoms | consult-expert | research).

**Edge case:** Ambiguous symptoms ("it doesn't feel right") are hard to troubleshoot. Include `symptom-clarification:` with questions that help narrow down the problem space.

**Edge case:** Troubleshooting in domains with time pressure (emergency response, critical system failure) needs explicit priority distinction: what to check first vs. what would be ideal to check given unlimited time.

See also: [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]] — Detailed exploration of troubleshooting knowledge structures

**Rule:** For place-specific knowledge (claims about specific locations that require physical presence to verify), use `place-verification` frontmatter and short recency intervals.
**Why:** Place-specific knowledge (best viewpoint in a city, parking availability at a trailhead, acoustics in a concert hall) can only be verified by visiting that specific place. Unlike experiential knowledge (can try anywhere) or equipment-dependent knowledge (need specific tools), place-specific knowledge requires physical presence at a specific location. Without explicit place-verification markers, readers cannot assess whether the knowledge is still current.
**Test:** For notes containing place-specific claims: (1) Is there `place-verification:` frontmatter with `verified-by: human-visit`? (2) Is there a `visit-date:`? (3) Is there a `recency-review:` interval (recommended: 30-90 days)?
**Implementation:** Use fields:
```yaml
place-verification:
  verified-by: human-visit
  visit-date: 2026-03-17
  recency-review: 90d
place-type: restaurant|trail|viewpoint|venue|service|general
```
**Distinction from related concepts:**
- **Experiential knowledge**: Can be verified anywhere (try a recipe in any kitchen)
- **Equipment-dependent knowledge**: Requires specific tools (need telescope for astronomy)
- **Climate-zone knowledge**: Outdoor conditions varying by climate (gardening hardiness zones)
- **Place-specific knowledge**: Requires physical presence at a specific, non-transferable location

**Rule:** Distinguish permanent features from transient conditions in place-specific knowledge.
**Why:** "The trail is 3 miles" (permanent) differs from "The parking lot fills by 8am on weekends" (transient). Permanent features need less frequent review; transient conditions need more frequent verification.
**Test:** For place-specific notes: Can you categorize each claim as permanent (rarely changes) vs. transient (can change by season, day, time)?
**Implementation:** Use `feature-type: permanent|transient` in place-verification frontmatter.

See also: [[Frontier Exploration - Place-Specific Verification Knowledge]] — Detailed exploration of this gap

**Rule:** For recognition-dependent knowledge (visual patterns, audio identification, diagnostic visuals), organize as training sets with multiple linked examples rather than standalone definitions.
**Why:** Pattern recognition knowledge (identifying species, celestial objects, medical conditions, audio samples) requires exposure to multiple instances to form the mental pattern. A text definition alone is insufficient; the knowledge exists in the pattern formed by seeing/hearing examples. Without example linking, recognition knowledge becomes incomplete and unusable.
**Test:** For notes tagged `knowledge-type: recognition`: (1) Can you find 3+ example instances in the vault or external references? (2) Is each example tagged with distinguishing features? (3) Are examples linked from the principle note? (4) Can a reader form a mental pattern from the available examples?
**Edge case:** Example quality matters more than quantity — 5 high-quality, diverse examples with clear annotations beat 20 random images. Include metadata about each example (viewing conditions, distinguishing marks, common confusions).
**Edge case:** For domains with established reference libraries (mushroom databases, bird call archives, star charts), link to external resources rather than duplicating. Use `example-sources:` frontmatter to document external reference quality.
**Implementation:** Use fields:
```yaml
knowledge-type: recognition
example-count: 5
example-sources:
  - name: "Audubon Society Bird Database"
    url: "https://..."
    quality: authoritative
distinguishing-features:
  - "Feature 1 that distinguishes from similar"
  - "Feature 2"
common-confusions:
  - species: "Similar-looking species"
    how-to-distinguish: "Key difference"
```
**Distinction from standard knowledge:** Recognition knowledge differs from conceptual knowledge because the "knowing" is in pattern matching, not proposition recall. A radiologist doesn't recall "tumor looks like X" — they pattern-match against thousands of examples. The Seed must accommodate this different knowledge type.

See also: [[Frontier Exploration - Multi-Modal Knowledge]] — Extended exploration of visual, audio, and video knowledge capture

**Rule:** Tag institutional knowledge with explicit scope — include `institutional-scope:` identifying the organization and `review-trigger:` for organizational changes.
**Why:** Institutional knowledge (unwritten rules, internal processes, org-specific context) is high-value but perishable. It can mislead when treated as universal truth or when it persists beyond organizational validity. Tagging enables appropriate skepticism and timely refresh.
**Test:** For notes describing how organizations work internally: (1) Does frontmatter identify which organization? (2) Is there a review-trigger for leadership changes, restructurings, or mergers? (3) Can you verify this knowledge is still accurate?
**Edge case:** Institutional knowledge differs from procedural knowledge — a procedure (how to request PTO) is replicable; institutional knowledge (why that procedure exists, who to ask for exceptions) is context-dependent. Tag separately.

**Rule:** For knowledge derived from ephemeral events (conferences, performances, workshops, live incidents), use `knowledge-timelessness:` frontmatter to distinguish from time-sensitive or static knowledge.
**Why:** Ephemeral knowledge (live events, unique experiences, one-time occurrences) differs fundamentally from time-sensitive data — it cannot be updated because the event won't recur in the same form. Without explicit tagging, AI agents may incorrectly assume knowledge can be refreshed or updated.
**Test:** For notes about specific events: (1) Is there a `knowledge-timelessness:` field (ephemeral vs. time-sensitive vs. static)? (2) For ephemeral: is there `capture-method:` documenting how it was captured? (3) Does the note acknowledge what's permanently lost vs. what's preserved?
**Edge case:** The same event may have both ephemeral components (Q&A, networking) and permanent components (slides, recordings). Distinguish these with `component-type:` (ephemeral vs. permanent-artifact).
**Edge case:** Ephemeral knowledge may have higher value immediately after the event and decay over time. Use `captured-at:` date and consider `review-after:` for post-event reflection synthesis.
**Implementation:** Use fields:
```yaml
knowledge-timelessness: ephemeral  # vs. time-sensitive, static
capture-method: live-annotation | post-event-synthesis | retrospective
captured-at: YYYY-MM-DD
components:
  - type: ephemeral  # unique to this occurrence
    content: "what only existed in the moment"
  - type: permanent-artifact  # recording, slides, etc.
    link: [[permanent resource]]
```

**Rule:** For audio-first domains (podcasting, music production, voice recording), transcode essential knowledge to text-searchable form — use `audio-timelessness:` and `transcoded:` fields.
**Why:** Audio knowledge that stays only in audio form becomes inaccessible for search, linking, and pattern recognition. While audio has unique value (tone, pacing, emotion), core knowledge must be findable.
**Test:** For audio-related notes: (1) Is essential knowledge also in text form? (2) Can you find this knowledge using text search? (3) For knowledge that can't be transcoded, is there a timestamp index?
**Edge case:** Voice as a medium carries parasocial and emotional dimensions that text can't capture — preserve audio for these elements but extract technique/process as text.

**Rule:** For equipment chains with interdependent components (audio signal chains, video pipelines), document the complete chain rather than individual devices.
**Why:** Audio problems often stem from interaction between components, not single devices. Documenting each piece in isolation misses the interaction knowledge.
**Test:** For equipment notes in chain-dependent domains: (1) Does each note link to other components in typical chains? (2) Is there a chain-overview note? (3) Are interaction settings documented?

**Rule:** For performance-based knowledge (podcast episodes, live shows, presentations), synthesize patterns after 3+ performances rather than accumulating episode-specific notes.
**Why:** Episode-specific feedback notes accumulate quickly but have diminishing value after 2-3 weeks. Synthesizing patterns creates reusable knowledge.
**Test:** For performance notes older than 21 days: (1) Has the insight been synthesized into a pattern note? (2) Is the original archived or deleted?

**Rule:** For quantitative analytics knowledge (listener metrics, engagement data), require aggregation across 3+ data points before recording as knowledge.
**Why:** Raw analytics are too noisy for actionable knowledge. Individual data points may be outliers.
**Test:** Is analytical insight derived from at least 3 episodes/time periods of data before being recorded as knowledge?

See also: [[Frontier Exploration - Podcasting and Audio Content Knowledge Bases]] for detailed strategies on capturing audio knowledge.

See also: [[Frontier Exploration - Ephemeral and Event-Based Knowledge]] for strategies on capturing transient knowledge.

**Rule:** Capture the framework for attending ephemeral events, not just the content — document what questions to ask, what to observe, what to do after.
**Why:** The permanent content (slides, recordings) exists and can be captured once; the unique value of attending live is the context, questions, and experience that won't recur. Prioritizing permanent content over experiential capture misses the point of attending.
**Test:** For notes about events attended: (1) Is there a permanent artifact (recording, slides) linked? (2) Is there unique experiential content (questions asked, insights gained, context captured)? (3) Is there guidance for future attendees?
**Edge case:** When no recording exists, prioritize capturing as much as possible but acknowledge incompleteness with `completeness: partial` and list what's permanently lost.

**Rule:** Define verification boundaries for knowledge that should never be verified through execution — use `verification-avoid` frontmatter to explicitly mark cases where testing is dangerous, illegal, unethical, or irreversible.
**Why:** The Seed's verification workflow assumes all knowledge can and should be verified. But dangerous procedures (explosives, exploits), illegal methods (fraud, evasion), unethical techniques (manipulation), and irreversible knowledge (spoilers, solved puzzles) should never be executed to verify. Without explicit boundaries, the vault becomes a danger to maintainers and users who might "verify" harmful knowledge.
**Test:** For knowledge that could be verified through execution: (1) Could verification cause direct or indirect harm? (2) Would verification violate laws? (3) Would verification violate ethical standards? (4) Would verification destroy the knowledge's value (e.g., solving a puzzle, unspoiling a spoiler)? If yes to any, mark with `verification-avoid:`.
**Implementation:**
```yaml
verification-avoid: dangerous|illegal|unethical|irreversible
verification-avoid-reason: "specific reason for avoidance"
alternative-verification: "source-analysis|peer-review|logical-consistency|expert-consultation|partial-testing"
```
**Alternative verification methods:** For knowledge that shouldn't be executed, verify through source analysis (trust credible sources), peer review (check if other sources confirm), logical consistency (verify claims don't contradict known facts), expert consultation (ask without revealing specific methods), or partial testing (test only safe components).
**Edge case:** When unsure whether to verify, err toward documenting with restrictions rather than deleting. Use `verification-avoid: review-needed` to flag for human judgment.
**Edge case:** Gray areas (e.g., documenting security vulnerabilities) should be captured but marked to prevent harmful execution. The knowledge has value for awareness and defense; execution would cause harm.

**Rule:** For knowledge that cannot be execution-tested, use source-based verification with explicit source quality tracking — add `verification-type: source-based` with source credentials.
**Why:** Some knowledge (safety-critical procedures, historical events, rare expertise) cannot be verified through execution. Source quality becomes the primary verification method. Without explicit source quality tracking, AI agents cannot assess reliability.
**Test:** For notes where verification-type is source-based: (1) Is there `verification-type: source-based`? (2) Is source quality tracked (`source-credentials:`, `source-reputation:`)? (3) Is there `source-count:` for multiple source verification?
**Implementation:** Use fields:
```yaml
verification-type: source-based|execution-tested
source-credentials: military-training|professional-certification|published-author|expert-peer-reviewed
source-count: 1  # single source vs multiple
source-consensus: unanimous|majority|disputed
```
**Edge case:** Source-based verification is distinct from unverified — source-based means verified through reputable sources; unverified means source quality is unknown.

**Rule:** For fiction and literature knowledge bases, use spoiler tagging and layer-based organization.
**Why:** Literature knowledge has unique challenges: spoiler management, character persistence across works, theme abstraction, and interpretive frameworks. Without explicit guidance, AI agents cannot organize fiction knowledge effectively.
**Test:** For fiction/literature vaults: (1) Is there spoiler-level tagging (minor|moderate|major|ending)? (2) Are persistent characters organized as hubs linking to all works? (3) Are themes extracted to principle notes when appearing in 3+ works? (4) Are interpretive analyses tagged with their framework (marxist|feminist|psychoanalytic|structuralist)?
**Implementation:** Use frontmatter:
```yaml
spoiler-level: moderate  # minor|moderate|major|ending
spoiler-scope: character-reveal|plot-twist|ending|entire-work
spoiler-opt-in: true
interpretive-framework: marxist|feminist|psychoanalytic|structuralist|post-colonial|reader-response
knowledge-layer: work|element|interpretation  # fiction-specific layers
```
**Edge case:** Canonical works that have been public for decades (Shakespeare, Greek myths) may not need spoiler tags — use judgment based on whether new readers still encounter the work fresh.
**Edge case:** Character hubs are distinct from theme hubs — characters are entities, themes are abstract concepts. Both need different linking patterns.

**Rule (NEW - 2026-03-21):** For narrative and fiction knowledge bases, distinguish showing from telling with `narrative-mode` frontmatter.
**Why:** The showing/telling distinction is fundamental to narrative craft. "She was angry" (telling) and "Her hands trembled..." (showing) represent fundamentally different knowledge types. Treating all story knowledge as equivalent loses critical craft knowledge about how to render experience vs. state facts.
**Test:** For notes about story craft: (1) Does this describe what happens (telling) or how to make readers experience (showing)? (2) Is the mode explicit in frontmatter? (3) Does the note include rendering technique if showing?
**Implementation:** Use frontmatter:
```yaml
narrative-mode: showing|telling|hybrid|experimental
narrative-function: exposition|characterization|setting|action|theme
rendering-technique: physical-reaction|dialogue|scene|dream-flashback|sensory-detail|etc
```
**Edge case:** Some telling is intentional — backstory dumps, summary passages, author intrusion. Tag these as `narrative-mode: telling` but with `intentional: true` to distinguish from unintentional telling.
**Edge case:** Literary fiction often plays with showing/telling boundaries. Tag experimental approaches with `narrative-mode: experimental` and include `framework:` for the specific approach.
**Edge case:** Genre conventions differ — literary fiction favors showing; genre fiction often uses more telling for pacing. Include `genre-context:` field to specify applicable conventions.

**Rule:** For safety-critical procedural knowledge, include explicit contra-indication sections documenting what NOT to do.
**Why:** Safety-critical knowledge where errors cause harm needs explicit warnings alongside positive instructions. Without contra-indications, users may apply correct techniques in incorrect contexts.
**Test:** For notes tagged safety-critical or criticality: high: (1) Is there a contra-indications or "What NOT to Do" section? (2) Are warnings prominent (not buried in text)? (3) Is there `safety-warning:` frontmatter?
**Implementation:** Use frontmatter:
```yaml
safety-warning: critical|important|advisory
contra-indications:
  - "Do NOT [action] when [condition]"
  - "Avoid [technique] in [situation]"
```
**Edge case:** Contra-indications differ from general warnings — they specify when a technique should NOT be used, not just caution.

**Rule:** For decisions with severe consequences, include explicit risk assessment framework — use `risk-assessment-required: true` with documented risk factors.
**Why:** Some decisions have high stakes where wrong choice has severe consequences (life safety, financial, health). Explicit risk factors enable better decision-making under uncertainty.
**Test:** For high-stakes decision notes: (1) Is there `risk-assessment-required: true`? (2) Are risk factors enumerated? (3) Is there `decision-urgency:` (critical|important|advisory)?
**Implementation:** Use fields:
```yaml
risk-assessment-required: true
decision-urgency: critical|important|advisory
risk-factors:
  - factor: "Weather conditions"
    threshold: "Storm incoming within 2 hours"
    severity: life-threatening|serious|minor
```
**Edge case:** Risk assessment differs from safety warnings — risk assessment guides decision-making under uncertainty; safety warnings specify hard limits.

**Rule:** For technique notes that depend on equipment availability, use explicit equipment tagging — add `gear-required:` or `gear-optional:` with category.
**Why:** The same core technique (water purification, fire starting, navigation) has different procedures depending on available equipment. Equipment tagging enables relevant retrieval for user's actual situation.
**Test:** For technique notes: (1) Is gear requirement explicit? (2) Are alternatives linked for different equipment? (3) Is there `gear-category:`?
**Implementation:** Use fields:
```yaml
gear-required: required|optional|none
gear-category: filter|chemical|heat|electronic|improvised
gear-alternatives-linked: [[Alternative Without Equipment]]
```
**Edge case:** When no equipment is available, create separate "improvised" notes — improvised techniques are fundamentally different and apply when all gear is lost.

**Rule:** For core techniques, create separate improvised/equipment-free variant notes when applicable — tag with `technique-type: improvised`.
**Why:** Improvised techniques are fundamentally different from equipment-based procedures (different procedure, different success rate, different conditions). They apply when all gear is lost, making them high-priority survival knowledge.
**Test:** For core techniques: (1) Is there an improvised variant? (2) Is it clearly distinguished from equipment-based? (3) Does it have `technique-type: improvised`?
**Implementation:** Use fields:
```yaml
technique-type: equipment|improvised|both
equipment-required: true|false
success-rate: high|medium|low
conditions: "When this technique applies"
```
**Edge case:** Improvised techniques often have lower success rates or require specific conditions. Document these limitations honestly.

**Edge case (stress test 2026-03-17):** In domains with significant consumables (automotive repair, cooking, crafting), distinguish `tools` (owned, reusable) from `consumables` (purchased per job) and `wear-items` (between consumables and parts). A "change oil" procedure needs both tools (wrench, funnel, drain pan) AND consumables (oil, filter). For safety-critical domains, also distinguish `safety-equipment` with `mandatory:` vs `conditional:` subcategories — some safety gear is always required (eye protection), some is procedure-specific (high-voltage gloves for EV work only). The test: (1) Does the equipment field distinguish tool types? (2) Are consumables listed separately from reusable tools? (3) For safety-critical procedures, is safety equipment explicitly marked mandatory vs optional?

**Rule:** For procedures that change by season or climate, add explicit seasonal applicability — use `season:` or `climate-type:` frontmatter.
**Why:** Many techniques (shelter building, water procurement, fire starting, food sourcing) vary dramatically by season and climate. Without explicit tagging, users may apply inappropriate techniques.
**Test:** For environment-sensitive procedures: (1) Is season or climate explicit? (2) Are variants linked from hub? (3) Is there `seasonal-variation:`?
**Implementation:** Use fields:
```yaml
season: spring|summer|autumn|winter|any
climate-type: desert|forest|arctic|coastal|mountain|any
seasonal-variation: true
linked-variants:
  - [[Technique - Summer]]
  - [[Technique - Winter]]
```

**Rule:** For knowledge based on environmental pattern recognition through extensive experience, add `experiential-component: intuition`.
**Why:** Experienced practitioners develop intuition (weather prediction, danger sensing, terrain assessment) that differs from physical skill (kinesthetic) and from declarative knowledge. Intuition is pattern recognition from extensive experience, requiring different teaching approaches.
**Test:** For intuition-based knowledge: (1) Is there `experiential-component: intuition`? (2) Are cue indicators listed? (3) Is experience level needed documented?
**Implementation:** Use fields:
```yaml
experiential-component: kinesthetic|intuition|conceptual
experience-level-required: novice|intermediate|expert
pattern-cues:
  - "Indicator 1"
  - "Indicator 2"
```
**Edge case:** Intuition differs from kinesthetic — kinesthetic is "how it feels physically," intuition is "pattern recognition from experience."

**Rule:** For domains where practical skill depends on tacit prerequisite abilities, explicitly tag these as `prerequisite-type: tacit` and document what the tacit skill involves.
**Why:** Tacit knowledge (ear training in music, visual diagnosis in medicine, "feel" in sports, pattern recognition in wildlife identification) cannot be fully captured in text. Treating tacit prerequisites as declarative knowledge sets false expectations for transferability. Some knowledge simply requires prerequisite skills that can only be developed through practice, not reading.
**Test:** For domain knowledge: (1) Can this skill be learned from text alone? (2) Does competence require prerequisite perceptual/cognitive abilities? (3) Can experts do this but not articulate how? If yes to 2-3, tag with `prerequisite-type: tacit` and document the tacit skill requirements.
**Implementation:** Use fields:
```yaml
prerequisite-type: tacit
tacit-skill-description: "What the practitioner must develop through practice"
tacit-skill-development: "How the skill is typically developed (years of experience, practice methods)"
verification-requires: "hands-on demonstration" or "expert assessment"
```
**Examples:**
- Music: "Ear training - identifying intervals, chords, harmonies by listening"
- Medicine: "Visual pattern recognition - recognizing disease presentations"
- Sports: "Feel for the ball - physical coordination and timing"
- Wildlife: "Birding by ear - identifying species from calls and songs"

See also: [[Seed Gaps - Domain-Specific Extensions]] — Domain-specific exploration of gaps in music composition, finance, education, tax, language learning, and workshop crafts

**Rule:** For domains with competing methodological approaches, use framework-hub pattern with explicit assumptions documentation.
**Why:** Different approaches (survival philosophies, trading strategies, teaching methods) represent different assumptions, not right/wrong. Without explicit framework tagging, users cannot determine which approach applies to their situation.
**Test:** For methodology notes: (1) Is framework explicit? (2) Are assumptions documented? (3) Is applicability context provided?
**Implementation:** Use fields:
```yaml
framework: approach-name
framework-assumptions:
  - "Assumption 1 about situation"
  - "Assumption 2 about goals"
applicability-situation: when this approach applies
```

**Rule:** For domains where applicability depends on environmental conditions (wilderness, gardening, construction), add environment-type tagging.
**Why:** Knowledge that works in one environment may be dangerous or useless in another. Environment tagging enables relevant retrieval.
**Test:** For environment-sensitive knowledge: (1) Is environment-type explicit? (2) Are environment-specific variants linked? (3) Is there `environment-scope:`?
**Implementation:** Use fields:
```yaml
environment-type: desert|forest|arctic|urban|coastal|mountain|indoor
environment-scope: specific-environment|multiple-environments|any
linked-variants:
  - [[Technique - Desert]]
  - [[Technique - Forest]]
```

See also: [[Frontier Exploration - Wilderness Survival Knowledge Bases]] — Testing Seed rules in survival reveals safety-critical, equipment-dependent, and environmental specificity challenges.

**Rule:** For domains with competing methodological approaches, use framework-hub pattern with explicit assumptions documentation.

**Rule:** For domains where structure determines function (chemistry, materials science, biology, pharmacology), use explicit structural representation format tags.
**Why:** In domains like organic chemistry, biochemistry, and materials science, the physical or spatial structure of an entity (molecule, protein, crystal lattice) fundamentally determines its properties and behavior. Text-only representation misses this core dimension. Structural knowledge requires explicit tagging of representation format.
**Test:** For notes about molecules, proteins, crystal structures, or materials: (1) Is there a `structure-format:` tag (smiles, iupac, image, 3d-coordinates, graph)? (2) Does the note include the structural representation (diagram or format)? (3) Is there a structure-to-property relationship captured?
**Edge case:** Named structural patterns (Diels-Alder reaction, benzene ring, alpha helix) should be captured as first-class notes with structural definition, not just text descriptions. The name IS a structural concept.
**Edge case:** Structural knowledge often has exceptions (Hückel's rule for aromaticity has exceptions; Markovnikov's rule has anti-Markovnikov cases). Tag exception scope explicitly.
**Implementation:** Use fields:
```yaml
structure-format: smiles|iupac|diagram|3d-coordinates|graph
structure-to-property: true
property-type: reactivity|stability|binding|function
exception-scope: "when [condition], rule does not apply"
```

**Rule:** For domains where knowledge requires visual, auditory, or tactile representation, include `knowledge-modalities` frontmatter listing required formats.
**Why:** Text-only knowledge bases in domains like cooking, music, medicine, and crafts miss essential experiential knowledge that cannot be captured in words. Multi-modal knowledge (images, audio, video, diagrams) is essential for full understanding in many domains. Without explicit modality tagging, AI agents cannot identify when knowledge is incomplete.
**Test:** For a cooking vault: Do technique notes include visual modality? For a music vault: Do performance notes include audio modality? Can you identify which notes require non-text representation?
**Implementation:** Use frontmatter:
```yaml
knowledge-modalities:
  - text  # always required
  - visual  # for technique demonstration
  - audio  # for sound/performance
  - tactile  # for physical feel/texture
```
**Edge case:** Some knowledge appears multi-modal but is actually text-representable (describe the sound of a chord in text). The test: Can the core knowledge be understood from text alone? If yes, media is enhancement. If no, media is required.
**Edge case:** When media is required but unavailable, capture partial text knowledge with explicit `knowledge-modalities: [text, visual]` and note that visual is pending.

See also: [[Frontier Exploration - Multi-Modal Knowledge]] — Detailed exploration of this frontier gap

**Rule:** Match note structure to primary purpose — distinguish reference notes (optimized for retrieval) from explanatory notes (optimized for understanding).
**Why:** Reference notes (look up when needed) and explanatory notes (read to understand) have conflicting structural needs. A note optimized for retrieval may be poorly structured for learning, and vice versa.
**Test:** For the last 10 notes: Can you identify which serve primarily as reference vs. explanatory? Does structure match purpose?
**Implementation:** Use `presentation-style: reference|explanatory|hybrid` frontmatter. Reference notes prioritize scannable structure, headers, bullets. Explanatory notes prioritize narrative flow, logical progression.

**Rule:** Explanatory notes should include explicit learning outcomes — state what readers will understand after reading.
**Why:** Without explicit outcomes, explanatory notes drift without clear teaching goals. Readers and AI agents cannot assess whether the note achieves its purpose.
**Test:** For explanatory notes: Can you list 1-3 learning outcomes? Do they match the note's content?

**Rule:** Structure explanatory notes using recognized pedagogical patterns — inverted pyramid (core first), conceptual progression (building understanding), problem-solution, analogy bridge, or contrast.
**Why:** These patterns are proven to support comprehension. Random structure wastes cognitive effort.
**Test:** Can you identify which pattern each explanatory note follows? Are patterns applied consistently?

See also: [[Frontier Exploration - Explanatory Knowledge Structure]] — Detailed exploration of this frontier gap

## Stress Tests
- [[Stress Test - Verification Status Rule in Home Repair]] — Testing verification-status in safety-critical home repair domain
- [[Seed Stress Test - Photography Knowledge Base]] — Testing diminishing returns rule in hybrid technical-aesthetic domain
- [[Seed Stress Test - Wilderness Survival Knowledge Base]] — Testing safety-critical, equipment-dependent, and environmental specificity rules
- [[Seed Stress Test - Gardening Knowledge Base]] — Testing long-horizon verification and climate specificity rules
- [[Seed Stress Test - Cooking Knowledge Base]] — Testing experiential knowledge and diminishing returns in culinary domains
- [[Seed Stress Test - Philosophy Knowledge Base]] — Testing humanities concepts and contested knowledge
- [[Frontier Exploration - Fashion and Clothing Knowledge Bases]] — Testing dual-nature technical + aesthetic knowledge
- [[Seed Stress Test - Woodworking Knowledge Base]] — Testing craft knowledge and embodied learning
- [[Seed Stress Test - Martial Arts Knowledge Base]] — Testing sequential-skill and physical practice domains
- [[Seed Stress Test - Chemistry Knowledge Base]] — Testing scientific research knowledge
- [[Seed Stress Test - Audio Engineering Knowledge Base]] — Testing technical-aesthetic hybrid domain
- [[Seed Stress Test - Construction Phase Model in Music Composition]] — Testing construction phase in creative domains
- [[Seed Stress Test - Construction Phase Model in Game Development]] — Testing construction phase for multi-track discipline vaults
- [[Seed Stress Test - Cryptocurrency Knowledge Base]] — Testing rapidly-evolving technical domains
- [[Seed Stress Test - Fitness Knowledge Base]] — Testing individual variation in health domains
- [[Seed Stress Test - Podcasting Knowledge Base]] — Testing media production knowledge
- [[Seed Stress Test - Knowledge Debt Rule in Woodworking]] — Testing knowledge debt in craft domains
- [[Seed Stress Test - Link Density Rule in Coffee Brewing]] — Testing link density in consumable knowledge
- [[Seed Stress Test - Staging Rule in Cooking Domain]] — Testing staging in experiential domains
- [[Seed Stress Test - Source Reliability vs Verification in Medical Domain]] — Testing source reliability in high-stakes domains
- [[Seed Stress Test - 5-1 Ratio Across Domains]] — Testing 5:1 ratio across multiple domains
- [[Stress Test - Decision Threshold Rule in Emergency Medicine]] — Testing decision thresholds in critical domains
- [[Frontier Exploration - Showing vs Telling in Narrative Knowledge Bases]] — Identifying gap in narrative craft knowledge organization

**Rule:** Distinguish linear-sequential knowledge from iterative-evaluative knowledge — capture process type in frontmatter.
**Why:** Linear-sequential knowledge has a fixed order (history, recipes); iterative-evaluative knowledge has decision loops where next steps depend on evaluating current state (composition, design, writing). Treating loops as sequences misrepresents the knowledge and makes it unusable.
**Test:** For a process note: (1) Is the next step predetermined, or does it depend on evaluating the current state? (2) Could a reasonable practitioner choose different next steps? (3) Is there an evaluation criterion that guides iteration? If yes to 2-3, tag with `process-type: iterative`; otherwise use `process-type: linear-sequential`.

**Rule:** For iterative-evaluative knowledge, capture evaluation criteria separate from process steps.
**Why:** The evaluation criteria (does this melody "work"? is the contrast strong enough?) are different from the actions (add contrast, try different chord). Separating them makes the knowledge reusable — the criteria can apply to any iteration, not just one specific process.
**Test:** Can you identify evaluation criteria that would apply to multiple iterations? Are they clearly distinguished from action steps? Is there an `evaluation-criteria:` field?

**Rule:** Use explicit termination conditions for iterative processes.
**Why:** Unlike sequential knowledge (done when steps are complete), iterative knowledge needs explicit stopping conditions. Without them, practitioners either stop arbitrarily or never stop ("one more iteration").
**Test:** Does the note specify: (1) When is the iteration "good enough"? (2) What's the time/resource constraint? (3) When should the practitioner stop and move on?
**Edge case:** Creative domains may legitimately have no fixed termination — "know when to stop" is itself tacit knowledge to capture. Include `termination-guidance:` field explaining judgment criteria.

**Rule:** Tag iterative knowledge with `process-type: iterative` and include `evaluation-criteria:` field.
**Why:** Iterative knowledge requires different handling than sequential — AIs need to know this isn't a fixed path. Evaluation criteria field makes the judgment explicit and testable.
**Test:** Can you identify iterative notes by their frontmatter? Can an AI agent determine what "success" looks like without executing the process?

**Rule:** Distinguish cyclic-branching knowledge from sequential and iterative knowledge — tag with `process-type: cyclic-branching` when elements repeat with variations and multiple valid paths exist.
**Why:** Musical arrangements, story structures, game levels, and other cyclic-branching domains have repeated elements (verse 1, verse 2) that are structurally the same but content-different. Traditional sequential models (first A, then B) fail to represent "play A again with variation." Iterative models (try, evaluate, repeat) fail to represent structural taxonomy.
**Test:** For process notes in cyclic-branching domains: (1) Does the note have `process-type: cyclic-branching`? (2) Can you distinguish structural position (verse 2) from temporal occurrence (second time playing)? (3) Are variants captured with explicit `variant:` or `instance:` markers?
**Edge case:** Musical arrangements have both temporal sequence (song plays in order) and structural taxonomy (chorus is chorus regardless of position). Use separate fields: `structure-type:` for what the element IS, `sequence-position:` for where it appears.

**Rule:** Distinguish assembly/construction knowledge from linear-sequential, iterative, and cyclic-branching knowledge — tag with `process-type: assembly` when knowledge involves interdependent steps that must be performed in a dependency order.
**Why:** Assembly knowledge (PC building, furniture assembly, home renovation) has a dependency graph structure where steps block each other, not just sequence. Linear procedures fail to capture what can be done in parallel, what must be undone on failure, and meaningful intermediate states.
**Test:** For a build/construction note: (1) Can you identify which steps block which? (2) Are parallelizable steps identified? (3) Is there a rollback/recovery path if a step fails?
**Implementation:** Use fields:
```yaml
process-type: assembly
dependencies:
  - step: 3
    requires: [1, 2]
  - step: 4
    requires: [3]
parallel-possible:
  - [3, 4]  # Can run concurrently after prerequisites
rollback:
  - from: step
    undo: [steps to reverse]
checkpoints:
  - after: step
    verify: "What to check at this point"
```
**Edge case:** Pure sequential assembly (no parallelization possible) should still use assembly type if rollback complexity exceeds simple linear undo.
**Edge case:** Safety-critical assembly (electrical, structural) requires explicit safety checkpoints in addition to completion checkpoints.

**Edge case (stress test 2026-03-18 - Home Repair):** Assembly knowledge in home repair and similar DIY domains reveals additional dimensions not captured in the base rule:
- **mandatory-verification:** Safety-critical confirmation points that must happen regardless of upstream completion (e.g., verify power is OFF after turning off main)
- **inspection-trigger:** External gate dependencies where work must pause for permits/inspections before continuing
- **tool-requirements:** Domain-specific tools needed, distinguishing mandatory from optional
- **skill-prerequisites:** Skills required beyond having the right tools (e.g., soldering skill, proper fitting alignment)
- **environmental-conditions:** Weather/temperature/humidity requirements for exterior work
- **material-acquisition:** Steps requiring ordered materials with lead times
- **code-requirements:** Jurisdiction-specific building codes that may add extra steps
- **irreversible-steps:** Actions that cannot be undone, requiring heightened verification
- **trade-coordination:** For multi-trade projects, specifying which trade must complete before another starts

Example extended frontmatter for home repair assembly:
```yaml
process-type: assembly
mandatory-verification:
  - step: 2
    check: "Verify power is off with voltage tester"
    safety-critical: true
inspection-trigger:
  - after-step: 3
    type: electrical
tool-requirements:
  mandatory:
    - voltage-tester
    - wire-strippers
  optional:
    - fish-tape
skill-prerequisites:
  - basic-electrical-safety
environmental-conditions:
  temperature: "50-90°F"
  humidity: "<85%"
material-acquisition:
  - step: 2
    lead-time: "2-4 weeks"
    item: "custom-fixture"
code-requirements:
  - NEC 2023
irreversible-steps:
  - step: 4
    warning: "Cannot be undone - verify length twice"
trade-coordination:
  - after: plumbing
    before: flooring
```

**Rule:** For assembly knowledge, capture meaningful completion states — define what "50% complete" means.
**Why:** Unlike linear procedures where completion is binary (done/not done), assembly has meaningful intermediate states. Capturing progress state helps troubleshooting and resumption after interruption.
**Test:** Can you describe what happens at each major checkpoint? Can you resume from 50% complete state?

**Rule:** Include rollback paths for assembly failures — document what to undo and in what order when a step fails.
**Why:** When assembly fails mid-process, users need to know what can be reused vs. what must be redone. Without explicit rollback paths, failed builds become scrap.
**Test:** For each major step: (1) What if this fails? (2) What must be undone? (3) What components can be reused?

**Rule:** For knowledge domains where application requires professional licensing or credentialing (medicine, law, engineering), include an `application-scope` field: `public | professional-only | licensed-practitioner`.
**Why:** Knowledge that is accurate but requires professional credentialing to safely apply can cause harm if treated as universally actionable. Scope tagging enables appropriate use by distinguishing what's safe for general knowledge vs. what requires professional expertise.
**Test:** For knowledge in regulated professions (medicine, law, engineering): (1) Can a layperson apply this knowledge safely? (2) Does application require licensing? (3) If yes to 2, is the note tagged with appropriate scope?
**Edge case:** Some knowledge exists in both public and professional versions (first aid vs. surgical procedures, general legal information vs. legal representation). Tag based on who can safely apply the knowledge, not who can read it.
**Edge case:** Educational content (textbooks, courses) is typically public scope; clinical guidelines, legal advice for specific cases, and engineering specs requiring professional stamps are professional-only or licensed-practitioner.

**Rule:** For legal knowledge bases, track authority status — distinguish binding precedent from persuasive authority, and track whether cases remain good law.
**Why:** Legal statements depend on whether supporting authority is binding or persuasive, current or superseded. Without authority tracking, legal advice becomes unreliable.
**Test:** For any legal claim: (1) Is there a supporting case/statute/regulation? (2) Is that authority still good law? (3) Is it binding in the relevant jurisdiction or only persuasive?
**Implementation:** Use fields `authority-status: controlling|persuasive|overruled|distinguished`, `jurisdiction: [jurisdiction-names]`, `court-level: supreme|appellate|trial`.

**Rule:** For legal knowledge bases, document confidentiality tiers — attorney-client privilege, work product, and public information require different handling.
**Why:** Capturing privileged information incorrectly can waive legal protections. Legal knowledge bases need explicit confidentiality tracking.
**Test:** Can you categorize each legal note as: (1) Public domain (published case, statute), (2) Non-privileged analysis, (3) Potentially privileged, (4) Definitely privileged?
**Implementation:** Use field `confidentiality: public|internal|privileged|work-product`.

**Rule:** For legal knowledge bases, separate primary sources from analysis — raw case summaries vs. original legal analysis have different reliability.
**Why:** Primary sources (cases, statutes) are stable; analysis is subject to error. Mixing them creates misleading reliability signals.
**Test:** Can you distinguish facts (what the law says) from opinion (what you think it means)?
**Implementation:** Use field `legal-content-type: primary-source|secondary-source|analysis|synthesis`.

**Rule:** For domains where authoritative knowledge coexists with personal analysis, tag notes with `knowledge-type: canonical|analysis|personal` to distinguish established consensus from interpretation.
**Why:** Many domains have knowledge ranging from "established fact" (canonical, authoritative) to "personal interpretation" (analysis, opinion). Chess opening theory vs your game annotations; medical guidelines vs physician opinion; official documentation vs blog tutorials. Without explicit tags, AI agents cannot distinguish what experts agree on from individual interpretation.
**Test:** Pick 5 notes in a domain with both canonical and analysis knowledge (chess, law, medicine, investing, academic literature). Can you categorize each as canonical (established consensus), analysis (informed interpretation), or personal (individual opinion)? Do they have knowledge-type tags?
**Edge case:** Some personal analysis becomes canonical over time (a blogger's unique interpretation gains academic acceptance). Track this with `knowledge-type: canonical` plus `was-originally: personal` or `original-source:` field.
**Edge case:** Mixed notes presenting canonical knowledge THEN adding analysis should either separate into two linked notes or use clear section headers with knowledge-type tagging per section.
**Edge case:** Credentials affect analysis weight — expert analysis carries more authority than novice. Consider adding `expertise-level:` field for analysis-type notes.
**Edge case:** Framework-dependent domains (investing, economics, philosophy) may treat the same principle as canonical within one framework and analysis outside another. Add `framework:` tags to specify which framework the analysis assumes. Example: `framework: value-investing | growth-investing | momentum`
**Edge case:** Data claims in temporal domains (investing, economics, climate) require explicit time scope — add `data-range:` and `data-source:` to distinguish factual data from interpreted analysis. Example: `data-range: 1928-2023`, `data-source: NYU Stern`
**Edge case:** Forward-looking statements (predictions, forecasts, projections) require explicit confidence levels — add `prediction-confidence:` (high|medium|low|speculation) and `time-horizon:` to distinguish confident predictions from speculation. AI agents cannot verify predictions at capture time; explicit tags help readers assess reliability.
**Edge case:** Conflicting "canonical" sources — when multiple authoritative sources disagree (e.g., different rating agencies), present both as analysis within their respective frameworks rather than claiming one is canonical. Use `framework:` to distinguish competing perspectives.

**Rule:** When capturing learning resources (courses, books, videos, tutorials), use dedicated resource notes with structured metadata separate from domain knowledge notes.
**Why:** Resources have different lifecycle needs (review for quality, track completion) than domain knowledge. Mixing them creates false confidence (thinking you've learned something when you've just bookmarked a resource) and makes the vault unwieldy. Resource metadata (difficulty, cost, quality, format) enables informed selection; domain knowledge is what you're actually learning.
**Test:** Pick 5 notes that reference external learning materials. (1) Is each resource captured in a dedicated note? (2) Does each have difficulty/cost/quality metadata? (3) Is domain content clearly separated from resource references?
**Edge case:** Personal notes on resources ("This course helped me understand X") differ from resource metadata ("Course covers X, difficulty intermediate"). Distinguish personal learning history from resource quality assessment.
**Implementation:** Use frontmatter:
```yaml
type: learning-resource
resource-type: course | book | video | article | podcast | tutorial | documentation
difficulty: beginner | intermediate | advanced
cost: free | paid | subscription
completion-status: not-started | in-progress | completed
```

See also: [[Frontier Exploration - Learning Resource Knowledge]] for detailed guidance on capturing educational materials.

**Rule:** Capture expert heuristics (rules of thumb, mental shortcuts) separately from formal principles. Tag with `knowledge-type: heuristic` and include `origin:` (how learned), `applicability:` (when to use), and `limitations:` (when NOT to use) fields.
**Why:** Heuristics are high-value mental shortcuts that experts develop through experience, but they're often context-dependent and can mislead when applied inappropriately. Unlike formal principles, heuristics lack universal proof — they work *most of the time* but fail in specific cases. Without origin and limitations metadata, future users may apply heuristics outside their valid scope.
**Test:** For each heuristic note: (1) Can you trace where it came from (experiment, mentor, failure)? (2) Can you describe when it DOESN'T apply? (3) Do you have a specific case where it failed?
**Edge case:** Heuristics can contradict each other — when they do, document both with explicit `applicability:` conditions. Example: "Hot pan, cold oil" (prevent sticking) vs "Hot oil, hot food" (prevent sticking) — both correct but for different scenarios.
**Edge case:** Some heuristics become formal principles over time as they're validated through repeated testing. Track this with `knowledge-type: heuristic` plus `promoted-to-principle: true` when the heuristic has been sufficiently validated.
**Edge case:** Domain-specific heuristics may not transfer — a heuristic that works in cooking (salt to taste) may not apply in programming. Always include `domain-transferability:` (high|medium|low|none) field.

See also: [[Frontier Exploration - Expert Heuristics and Rules of Thumb]] for detailed guidance on capturing heuristics.

**Rule:** When sources contradict, create a synthesis note presenting both perspectives with source attribution, rather than choosing one side.
**Why:** Choosing one side loses information; a knowledge base should represent reality accurately, including uncertainty and debate.
**Test:** Identify a note where sources disagreed. Does it present multiple viewpoints rather than picking one?

**Rule:** Distinguish objective contradictions from subjective ones — synthesize facts, present preferences as options.
**Why:** Objective contradictions (safety, correctness) require synthesis to avoid harm; subjective contradictions (taste, style) should present options without over-synthesizing opinions as facts.
**Test:** For a contradictory-sources note: (1) Is there an objective truth at stake? (2) Could getting it wrong cause harm? (3) Is it a preference vs. a fact? Synthesize if yes to 1-2; present as options if yes to 3.

**Rule:** When personal experience contradicts published sources, create a synthesis note presenting both perspectives with explicit attribution — document what sources say AND what your experience shows.
**Why:** Personal experience is valid knowledge that should be captured, but external sources provide validation and context. Preserving both enables better decision-making and helps future readers understand applicability.
**Test:** For notes where your experience differs from sources: (1) Is the source perspective documented? (2) Is your personal experience documented? (3) Is there explicit attribution for what is source vs. personal? (4) Is context (why your experience differs) documented?
**Edge case:** Use scope tags to distinguish applicability: `scope: general` for what works for most people, `scope: personal` for what works for you specifically. Prioritize personal experience over sources when you have extensive direct experience, your context differs significantly, or you understand WHY the difference exists.

**Rule:** Present multiple equivalently valid approaches as alternatives with applicability context, not as synthesized "best" approach.
**Why:** Contradictory sources (one is wrong), subjective preferences (matters of taste), and equivalent approaches (all valid, context determines choice) are three different scenarios. False synthesis of equivalents misleads readers into thinking there's one correct answer when context should determine the choice.
**Test:** Pick a note describing a technique or approach. Can you identify: (1) Are there equivalent alternatives that all produce valid results? (2) If yes, are they presented as alternatives with applicability guidance, not as one "best" approach? (3) Can a reader determine which alternative fits their context?

**Rule:** For domains with competing frameworks (epistemologically equivalent but mutually incompatible), create explicit framework hub notes and tag framework-specific knowledge.
**Why:** Competing frameworks (Copenhagen vs Many-worlds in physics, Keynesian vs Austrian in economics) are neither contradictions (one isn't wrong) nor preferences (all have evidence). Without explicit framework structure, knowledge bases inadvertently imply endorsement through presentation order, link density, or detail level.
**Test:** In a domain with competing frameworks: (1) Can you identify framework-neutral core knowledge? (2) Are framework-specific notes tagged with `framework:`? (3) Is there an explicit hub connecting all frameworks?
**Edge case:** Style-specific "rules" that directly contradict each other (classical harmony forbids parallel fifths, jazz uses parallel voice-leading; classical counterpoint demands voice independence, block chord jazz intentionally moves voices together) require additional tagging beyond `framework:`. These are prescriptive contradictions — not about "what is true" but "what produces desired results." Use `style:` frontmatter to distinguish aesthetic traditions, and include `style-compatibility:` mapping to document what transfers between styles and what does not. Resolution depends on user intent, not which style is "better."

**Rule:** Distinguish illustrative examples from factual examples — mark hypothetical/ teaching examples as such, date real-world examples.
**Why:** Illustrative examples explain concepts; factual examples demonstrate reality. Conflating them causes AI agents to cite hypotheticals as evidence and miss outdated facts.
**Test:** Pick 5 notes with examples. Can you categorize each as illustrative (hypothetical) or factual (real-world)? Are factual examples dated?

**Rule:** For subjective knowledge domains (art, music, design, creative writing, aesthetics), tag evaluative claims with `claim-type: subjective` and include `consensus: high/medium/low/none` to indicate community agreement.
**Why:** AI agents cannot distinguish facts from opinions without explicit tagging. Subjective claims presented as facts mislead readers about the nature of the knowledge. Consensus levels help readers understand whether a viewpoint is mainstream or niche.
**Test:** Pick 10 notes containing evaluative language (best, worst, good, bad, should, shouldn't) in creative domains. Can you categorize each as objective quality (verifiable technique) vs. subjective taste? Do subjective claims have consensus markers?
**Edge case:** Some domains have "objective quality" frameworks (code that compiles, recipes that work, structures that stand). Distinguish craft criticism (verifiable) from aesthetic judgment (subjective).
**Edge case:** Cultural and temporal subjectivity — what's considered "good" varies by culture and era. Include `culture:` and `temporal:` scope tags for evaluative claims that are context-dependent.

**Rule:** For domains where experiential knowledge (knowledge gained through practice, feel, tacit understanding) is essential, include `experiential-component` frontmatter indicating what aspects require direct experience to fully understand.
**Why:** In domains like music composition, clinical skills, martial arts, and creative arts, the useful knowledge extends beyond what can be documented. Readers and AI agents need to know when a note represents complete theoretical knowledge vs. knowledge that requires practice to apply.
**Test:** Pick 5 notes in an experiential domain (music, clinical practice, crafts, creative arts). Can you identify which require experience to fully apply? Do they have explicit `experiential-component` markers?
**Edge case:** Gradate experiential markers: `experiential-component: none` (fully documentable), `experiential-component: partial` (core is documentable, "feel" requires experience), `experiential-component: essential` (cannot be fully captured in text).
**Edge case:** Include guidance for experiential notes: "Try this and observe the result" vs. "This is a rule to follow." Both are valid knowledge, but they require different approaches from readers.
**Edge case:** Experiential domains may legitimately have more "soft" confidence markers — acknowledge that some knowledge cannot be verified through sources alone.
**Edge case (cooking-specific):** For procedural notes in experiential domains where sensory judgment determines doneness (cooking, brewing, crafting), include `sensory-cues:` field documenting how to evaluate success without equipment:
```yaml
sensory-cues:
  - "Dough is ready when it springs back immediately when poked"
  - "Bread is done when it sounds hollow when tapped"
  - "Sauce is ready when it coats the back of a spoon"
```
Without sensory cues, procedural notes with phrases like "cook until done" or "until golden brown" become unusable. The test: Can someone execute this procedure without additional information or equipment?
**Note:** Sensory cues are distinct from `experiential-component` — sensory-cues tell HOW to judge; experiential-component tells whether the knowledge can be fully captured in text.

See also: [[Frontier Gap - Embodied Knowledge]] — Detailed exploration of tacit and embodied knowledge challenges

**Rule:** For skills requiring practice (physical, embodied, or repeated performance), track current proficiency level separately from knowledge content — distinguish what you can explain from what you can do.
**Why:** Knowledge of "how to do X" differs from the ability to actually do X. A note about playing piano contains the same content whether you can perform it or just read about it. Without proficiency tracking, retrieval returns notes you can't actually execute.
**Test:** For skill-based notes in your vault: (1) Can you distinguish notes you can perform from notes you just have bookmarked? (2) Does your vault help you find recipes you can actually cook, not just recipes you've read about?
**Implementation:** Use `proficiency-level:` frontmatter with values:
- `novice`: Have read about it, understand theory, cannot perform
- `learning`: Can perform with significant effort, inconsistent results
- `competent`: Can perform reliably, needs concentration
- `proficient`: Can perform fluently, can teach others
- `master`: Can perform effortlessly, innovates
Add `last-practiced: YYYY-MM-DD` and `decay-rate: physical|mental|social` for atrophied skill tracking.
**Edge case:** Pure knowledge domains (mathematics, history, facts) don't need proficiency tracking — only apply to skills with a performative component.
**Edge case:** Atrophied skills (once competent, now forgotten) should be marked `proficiency-level: atrophied` with `last-performed: YYYY-MM-DD`.

See also: [[Frontier Gap - Embodied Knowledge]] for frameworks on tracking skill development over time.

**Rule:** Present subjective perspectives as "Perspectives" sections rather than single conclusions when no consensus exists.
**Why:** A knowledge base should represent reality accurately. If experts disagree or no consensus exists, claiming "the best approach is X" misleads readers.
**Test:** For notes containing subjective claims: (1) Is there a single conclusion presented as universal truth? (2) Are alternative perspectives listed? (3) Does the note acknowledge that reasonable people may disagree?

**Rule:** Distinguish craft criticism from aesthetic judgment in creative domains.
**Why:** "This sculpture has anatomical errors" is verifiable (craft/technique). "This sculpture is beautiful" is subjective (aesthetic). Conflating them confuses readers about what can be debated vs. what is pure opinion.
**Test:** For notes evaluating creative work: (1) Are technical/measurable claims separated from aesthetic judgments? (2) Can readers distinguish what is opinion vs. what can be verified with evidence?

**Rule:** Capture negative knowledge — anti-patterns, failure modes, and lessons learned are as valuable as positive knowledge.
**Why:** A knowledge base that only captures successes is incomplete. Knowing what doesn't work prevents repeated mistakes and builds better judgment.
**Test:** Can you identify at least 3 anti-patterns or failure modes captured in the vault? Are negative knowledge notes linked to the related positive knowledge (what to do instead)?
**Edge case:** Negative knowledge notes should still follow atomicity — one failure/anti-pattern per note. Tag with `type: negative-knowledge` for filtering.
**Edge case:** Warnings and "never do this" statements are negative knowledge. Include the corrective action or link to the correct approach.

**Rule:** Distinguish myths and misconceptions from verified knowledge — mark folk wisdom and widely-believed but unverified claims explicitly.
**Why:** A knowledge base that presents myths as facts becomes a vector for misinformation. Unlike discredited knowledge (proven wrong) or superseded knowledge (was accurate, now outdated), myths were never accurate but persist in popular understanding. Marking them preserves the knowledge (that the belief exists) while preventing misinformation.
**Test:** Pick 10 notes in a domain with folk wisdom (gardening, cooking, health, crafts). Can you identify: (1) Which claims are evidence-based? (2) Which are folk wisdom? (3) Which are disproven myths? Do they have appropriate markers?
**Edge case:** Many myths contain a "grain of truth" — capture what's actually true separately from the distortion. For example, "searing meat locks in juices" is false, but searing DOES create flavor through the Maillard reaction.
**Edge case:** Mark folk wisdom with `myth-status: folk-wisdom` and provide `evidence-assessment` explaining why the claim lacks scientific support. For partially-true myths, note what IS true and what ISN'T.

**Rule:** Tag context-scope for knowledge that changes validity across styles, frameworks, or approaches — don't universalize context-dependent rules.
**Why:** A rule true in one context (jazz harmony) may be false in another (classical counterpoint). Universalizing context-dependent knowledge creates misleading advice. Tagging scope helps readers and AIs understand applicability.
**Test:** For notes containing absolute statements (always/never/best): (1) Is there scope/applies-to metadata? (2) Are validity conditions explicitly stated? (3) Should framework-specific variants exist instead?
**Edge case:** Knowledge that is universally true (mathematical proofs, physical laws) does not need scope tags. Only tag when validity genuinely varies across contexts.

**Rule:** For knowledge whose validity depends on jurisdiction (legal, geographic, cultural), tag with explicit scope metadata.
**Why:** Without jurisdiction tags, an AI cannot distinguish between universally true knowledge, jurisdiction-specific knowledge, and misapplied knowledge. Legal, medical, and financial knowledge vary dramatically across borders.
**Test:** Pick 10 random notes in a domain-sensitive vault (law, medicine, finance). For each: (1) Does this knowledge apply universally? (2) If no, does it have jurisdiction/region scope tags? (3) Can you identify the applicable jurisdictions?
**Edge case:** Use `jurisdiction: [US, EU, UK]` for legal/governmental scope, `region:` for geographic/cultural scope. For overlapping jurisdictions (EU, US states), list applicable units.
**Edge case:** Historical jurisdictions (e.g., "East Germany") may be relevant for historical knowledge but should be clearly marked as historical with `status: historical`.

**Rule:** Document explicit applicability boundaries — capture when knowledge DOESN'T apply, not just when it does.
**Why:** Scope tags define where knowledge applies; boundaries define where it doesn't. Knowledge that's correct in one context can cause harm in another. Explicit boundaries prevent misapplication and build trust by honestly acknowledging limitations.
**Test:** For notes with absolute statements (always/never): (1) Can you identify contexts where this wouldn't work? (2) Are boundary conditions documented (scale thresholds, precondition failures, combinatorial incompatibilities)? (3) Is there `does-not-apply-to:` frontmatter for known non-applicable contexts?
**Edge case:** Unknown boundaries — sometimes you know something works but not why it fails elsewhere. Mark as "boundary uncertain" rather than omitting.
**Edge case:** False boundaries — sometimes we assume something doesn't apply but it actually does. Distinguish established boundaries from suspected ones.
**Implementation:** Use structure:
```yaml
applicability:
  applies-to: [contexts where this works]
  does-not-apply-to: [known non-applicable contexts]
  boundary-conditions:
    - condition: "What must be true"
      threshold: "At what point it breaks"
  preconditions:
    required: [what's needed]
    incompatible: [what conflicts]
```

**Rule:** Tag expertise-level for knowledge that is only appropriate at certain skill levels — don't present beginner advice as universal truth.
**Why:** Advice that's correct for beginners (e.g., "don't use recursion") can be wrong for experts, and vice versa. Without expertise-level tagging, readers cannot assess whether advice applies to them.
**Test:** Pick 10 notes with absolute statements (always/never/you should/don't). Can you categorize each as universal, beginner-only, intermediate-only, or advanced-only? Do they have appropriate expertise-level metadata?
**Edge case:** Some advice is universally true at every level (e.g., "understand the fundamentals first"). Only tag when validity genuinely varies across skill levels.
**Edge case:** Differentiate from `difficulty: advanced` — difficulty means "hard to understand," while expertise-level means "appropriate only for practitioners at this level."
**Edge case (NEW - frontier exploration 2026-03-18):** In domains where beginner advice CONTRADICTS expert advice, use explicit contradiction markers rather than just expertise-level tagging:
- Some domains have "inverted" advice where what works for beginners is the opposite of what works for experts (e.g., chess: "don't trade pieces" for beginners to maintain material vs. "trade pieces when ahead" to simplify to a winning endgame)
- In gaming: "rush the opponent" (beginner: early aggression works) vs. "play defensively" (expert: opponents will punish aggression)
- In investing: "diversify broadly" (beginner: reduce risk) vs. "concentrate positions" (expert: maximize returns)
- In programming: "use simple algorithms" (beginner: easier to debug) vs. "use optimal algorithms" (expert: performance matters)

For these contradicting tiers, use frontmatter:
```yaml
expertise-level: beginner
contradicts-expertise-level: expert
contradiction-note: "[[Note that provides the opposite advice]]"
transition-criteria: "What skill/threshold marks the switch"
```

The test: For advice with absolute language (always/never/don't), can you identify cases where the opposite advice is true at a different skill level? Do both notes explicitly reference each other?

**Rule:** For knowledge where applicability depends on user situational constraints (time, budget, equipment access, physical ability, social context), include explicit constraint scope in frontmatter or create constraint-specific hub notes.
**Why:** Expertise-level covers "what you know," but doesn't cover "what you can actually do given your situation." A beginner with 5 minutes needs different knowledge than a beginner with 2 hours. An expert with no oven needs different approaches than an expert with a fully equipped kitchen. Without constraint tracking, AI agents cannot determine which knowledge is relevant to a user's actual situation.
**Test:** Pick 10 notes in a domain with time/budget/equipment variation. Can you determine: (1) What constraints does this knowledge assume? (2) Are constraint assumptions explicit? (3) Could an AI filter this knowledge by user constraints?
**Edge case:** Create constraint-aware hub notes for common situations: "Quick Meals (Under 30 min)", "Budget Cooking (Under $10/day)", "No-Oven Recipes". These hubs aggregate approaches that work within specific constraints.
**Edge case:** Constraints differ from expertise-level: a time constraint affects what approach is valid regardless of skill level. A 5-minute recipe isn't "beginner" — it's "time-constrained."

**Rule (NEW - 2026-03-23):** For knowledge domains where beginner advice CONTRADICTS expert advice, include expertise-level transition guidance — document when to transition, how to validate readiness, and who should stay at beginner level by design.
**Why:** Some domains have "inverted" advice where what works for beginners is the opposite of what works for experts (investing: diversify broadly vs. concentrate positions; chess: don't trade pieces vs. trade when ahead). Without transition guidance, learners either stay too long at beginner advice (missing upside) or transition too early (causing losses). The Seed handles expertise-level tagging but not the transition between levels.
**Test:** For advice with `contradicts-expertise-level`: (1) Is there `transition-criteria` explaining when to move up? (2) Is there `transition-validation` with readiness indicators? (3) Is there guidance for people who should NOT transition? (4) Are contested inversions flagged with `inversion-stability: contested`?
**Implementation:** Use frontmatter for transition guidance:
```yaml
expertise-level: novice|learning|competent|expert  # expand beyond beginner/intermediate/advanced
expertise-trajectory: acquiring|consolidating|maintaining
contradicts-expertise-level: expert
transition-criteria:
  readiness-indicators:
    - "Can explain why expert advice differs from beginner"
    - "Has track record of following own strategy"
    - "Can articulate downside of expert approach"
  minimum-time: 12  # months at current level before considering
  warning-signs:
    - "Applying expert tactics without understanding failure modes"
should-transition: true|false  # false for intentional beginners
intentional-reason: "Personal preference|risk tolerance|time constraints"
inversion-stability: stable|contested|contextual
# stable: inversion is well-established
# contested: experts disagree on whether inversion exists  
# contextual: depends on external factors (market, audience)
```
**Expanded taxonomy:** Use 4 levels instead of 3: novice (following instructions), learning (understanding why), competent (executing independently), expert (customizing/improvising).
**Contested inversions:** When experts themselves disagree on whether advice inverts, tag with `inversion-stability: contested` and include both perspectives.
**Distinction from difficulty:** Difficulty means complexity to understand; expertise-level means appropriate audience. A difficult note may be appropriate for novices if they're motivated; an easy note may be inappropriate for experts if it wastes their time.

**Rule:** For knowledge where multiple constraints interact (time + budget + skill + equipment), create intersection notes capturing the emergent solution space, not just the union of constraint-specific knowledge.
**Why:** Single-constraint hubs miss interaction effects. A student who is both time-poor AND budget-constrained needs different advice than either constraint alone would suggest. The combination creates emergent requirements that no single constraint predicts.
**Test:** For a domain with constraints A, B, C: Can you identify notes addressing A+B, B+C, A+C, AND A+B+C? If only single-constraint notes exist, the interaction space is unexplored.
**Edge case:** Some constraints truly don't interact. Don't force intersection notes when solution space is truly additive — only create when the combination produces genuinely different outcomes.
**Implementation:** Tag multi-constraint notes with `constraint-interaction: true` and list all applicable constraints with `constraints:` frontmatter.

**Rule (NEW - 2026-03-18):** Tag knowledge with explicit participant-count scope in competitive or collaborative domains where validity depends on number of players or participants.
**Why:** In games, team activities, and collaborative work, strategy validity often changes dramatically with participant count. Advice that's true for 2-player scenarios may be false for 10-player scenarios (e.g., alliances matter in large groups, not in duels). Without participant-count tagging, readers cannot assess whether advice applies to their situation.
**Test:** Pick 10 notes in multiplayer domains (games, team sports, collaborative projects). Can you identify: (1) What participant count does this assume? (2) Does the advice change if player count changes? (3) Are assumptions explicit?
**Implementation:** Use `participant-count:` frontmatter:
```yaml
participant-count: 2  # only applies to 2-player
participant-count: 3-4  # small group
participant-count: 5+  # large group
participant-count: any  # universal
```
**Edge case:** Some knowledge applies at all counts but is MORE important at certain counts. Use `participant-count-relevance: primary|secondary|universal` to distinguish.
**Edge case:** This is distinct from expertise-level — a 2-player game can be played at beginner or expert level; both dimensions matter.

**Rule:** For domains where advice ranges from general education to personalized recommendations, tag with advisory-level to help readers understand appropriate usage.

**Why:** Knowledge that tells you "what to do" differs in its appropriate use. General educational content can be freely applied by anyone. Planning guidance requires some personal context. Personalized recommendations require individual assessment that shouldn't be applied without professional guidance. Without explicit advisory-level tagging, readers may inappropriately apply general education as if it were personalized advice, or dismiss personalized advice as too specific to be useful.

**Test:** For advice-type notes: Can you categorize each as (1) general-education (universally applicable principles), (2) planning-guidance (frameworks requiring some context), or (3) personalized-advice (requires individual assessment)? Do high-stakes domains (finance, health, legal) include appropriate disclaimers?

**Implementation:** Use frontmatter:
```yaml
advisory-level: general-education  # universal principles, anyone can apply
advisory-level: planning-guidance  # frameworks needing personal context
advisory-level: personalized-advice  # requires individual assessment
```
**Distinction from expertise-level:** Advisory-level addresses HOW to use knowledge (conservative vs. aggressive application), while expertise-level addresses WHO can understand it (beginner vs. advanced). "Don't trade stocks" is general education; "use value investing" is planning guidance; "buy Apple at current price" is personalized advice.

**Distinction from verification-status:** Advisory-level addresses appropriateness of application, not correctness of content. A verified note can still be general education, planning guidance, or personalized advice.

**See also:** [[Frontier Exploration - Advisory Level in Knowledge Bases]] — Detailed exploration of this gap

---

*This rule was added based on findings from the Financial Advisory Level Distinction Seed Gap (Domain 1, Gap 1.1) in [[Seed Gaps - Domain-Specific Extensions]].*

**Guidance: When to Split vs. Tag**

When handling jurisdiction or region-dependent knowledge, choose between creating separate notes or using scope tags:

- **Create separate notes** when knowledge is substantively different (different tests, thresholds, rules). Example: "Contract Law (US)" vs "Contract Law (UK)" — fundamentally different legal systems with different case law.
- **Use scope tags** when the core concept is the same with minor variations. Example: "Voting Age" with `jurisdiction: [US, UK, CA]` — the concept is the same, only the number differs.



- `low`: Knowledge transfers broadly (e.g., mathematical principles)
- `medium`: Zone/climate matters but general guidance applies (e.g., what to grow, not specific varieties)
- `high`: Results vary significantly by specific conditions (e.g., variety performance, soil adaptation)
- `extreme`: Must be verified for your specific conditions (e.g., most gardening, local pest management)

**Frontmatter:** Use `threshold-knowledge: true` with `threshold-type: gradual|discrete|contested`, `transition-indicators:`, and `uncertainty-band:`.




1. Can you classify your vault's primary domains by velocity (fast/medium/slow/static)?
2. Do high-velocity domain notes (technology, finance, current events) have review intervals ≤90 days?
3. Do static domain notes (mathematics, history, philosophy) have `review-interval: historical` or `review-interval: never`?
4. For fast-velocity domains, does `confidence: high` require verification within the last 30 days?
- Fast (30-90 days): consumer electronics, software, social media, market data, current events
- Medium (90-180 days): professional equipment, domain methodologies, industry regulations
- Slow (180-365 days): craft techniques, practice methodologies, health research
- Static (historical/never): mathematical proofs, historical facts, philosophical arguments, foundational definitions


**Values:** `calibration-status: pre-calibrated` (default, not yet assessed), `calibration-status: calibrated-yes` (verified applicable to your context), `calibration-status: calibrated-no` (found inapplicable or unreliable), `calibration-status: calibrated-uncertain` (reviewed but can't determine)















- Separate raw data (timestamps, measurements) from interpretive notes (patterns, correlations)
- Use tiered sensitivity: public (trends only), private (synthesis, not raw data), highly-sensitive (raw data excluded)
- Track verification with self-referential criteria: `verification-status: self-observed`, `verification-status: pattern-suspected`, `verification-status: pattern-confirmed`
- Use `metric:` frontmatter to identify what's being tracked, `context-factors:` for relevant conditions
- Document context boundaries for patterns ("this works when I'm not traveling")












- `text-sufficient`: Text alone conveys the knowledge fully
- `text-primary-media-optional`: Text works but media significantly enhances understanding  
- `media-essential`: Cannot be understood without the non-text modality
- `multi-modal-required`: Requires multiple modalities (video with audio)

**Structure:**
```yaml
modal-essentiality: media-essential
media-layer:
  - type: image
    media-summary: "Video shows hand-kneading technique with dough at correct hydration"
---
# Text Layer (must stand alone)
## How to Know Dough is Ready
The dough is ready when it:
- Springs back immediately when poked
- Has a smooth, not tacky, surface
- Can be stretched thin without tearing (windowpane test)
```

**Rule:** Include accessibility metadata for all non-text media — alt-text for images, transcripts for audio/video, captions for video.
**Why:** Media is often inaccessible to some users (blind/visually impaired for images, deaf/hard-of-hearing for audio, those with slow connections for video). Accessibility metadata enables appropriate alternatives and ensures inclusive knowledge.
**Test:** For each media element: (1) Is there alt-text for images? (2) Are there captions/transcripts for audio/video? (3) Can users understand the content without requiring the media?
**Implementation:**
```yaml
media:
  - type: image
    url: "example.jpg"
    alt-text: "Smooth, elastic dough that springs back when poked"
    captions-available: true
  - type: video
    transcript: "[[Transcript Note]]"
```

**Rule:** For experiential knowledge domains, capture media of successful outcomes as reference points for self-assessment.
**Why:** The gap between "knowing the theory" and "executing successfully" is large in experiential domains. Media of successful outcomes provides reference for learners to compare their results.
**Test:** In experiential domains (cooking, music, crafts, sports): (1) Are there media examples of successful outcomes? (2) Can learners compare their results to captured examples? (3) Are failure modes captured for contrast?
**Domain-specific guidance:**
- Cooking: Photograph completed dishes
- Music: Record successful performances  
- Crafts: Photograph finished pieces
- Sports: Video movement patterns

**Rule:** Include scale/reference indicators in visual media — viewers must be able to determine actual size.
**Why:** Images without scale are misleading — "this mushroom looks like this" fails when the photo is close-up. Reference indicators enable accurate assessment.
**Test:** For visual knowledge: (1) Can viewers determine actual size? (2) Are reference objects included (ruler, common object, hand)? (3) Is magnification level documented?
**Implementation:**
```yaml
media:
  - type: image
    scale-reference: "US quarter coin (24.26mm diameter) for scale"
    magnification: "1:1 macro"
```

**Rule:** For instructional media, provide observation prompts — tell readers what to look/listen for, don't just embed media.
**Why:** "Watch this video" without guidance is passive consumption, not knowledge capture. Observation prompts transform media into learning.
**Test:** For instructional media: (1) Does the note tell readers what to observe? (2) Can someone extract key knowledge without the text? (3) Is there an observation checklist?
**Implementation:**
```yaml
media-instruction:
  observation-points:
    - "At 0:30: Dough appears shaggy - normal initially"
    - "At 6:00: Dough springs back when finger pressed - READY"
```

**Rule:** Express probabilistic knowledge with explicit probabilities, not vague qualifiers like "usually" or "sometimes".
**Why:** Vague language misleads — "usually works" means different things to different people. Explicit probabilities enable proper weighting and decision-making.
**Test:** Can you assign a numerical probability to the claim? Is it expressed numerically rather than with vague qualifiers?
**Edge case:** In domains where probabilities are unknown or genuinely uncertain (early-stage research), use confidence markers instead: "confidence: emerging" or "confidence: disputed" rather than fabricating numbers.
**Edge case:** When probability is near 50%, present as balanced options (A vs B) rather than false precision — don't pretend to know what you don't.

**Rule:** Distribute point estimates into ranges when uncertainty is high and the domain warrants precision.
**Why:** A single number implies precision that may not exist; ranges better represent true uncertainty in domains like medicine, finance, and engineering.
**Test:** For numerical claims in high-uncertainty domains, is uncertainty expressed as a range (e.g., "60-80%") or confidence interval rather than a point estimate?

**Rule:** Use stub notes with explicit `status: planned` for known future topics — don't leave dangling wikilinks that appear broken.
**Why:** Forward references are different from broken links: broken links are mistakes, forward references are intentional design. Treating them the same loses planning information.
**Test:** Can you identify forward references in your vault? Do they have planned stub notes with `status: planned`?
**Edge case:** Only create planned stubs when: (1) you know the topic will exist, (2) multiple notes reference it, (3) it has a clear purpose. Skip for vague or speculative topics.

**Rule:** For knowledge that applies only to specific software versions, tool releases, or library iterations, include explicit version scope in frontmatter.
**Why:** Knowledge that depends on version without version metadata is misleading — readers (and AI agents) cannot determine applicability, leading to failed implementations or incorrect advice.
**Test:** For notes containing software/tool/library instructions: (1) Does the knowledge depend on a specific version? (2) If yes, is there version scope metadata? (3) Can you determine which versions the knowledge applies to?

**Rule:** For rapidly-evolving domains (web frameworks, programming languages, DevOps tools), include an `eol-estimate` or `review-when` field triggering review when the referenced version approaches end-of-life.
**Why:** Version-dependent knowledge silently becomes dangerous as versions age — outdated security advice, deprecated APIs, unsupported configurations. Proactive review triggers prevent accumulation of harmful stale knowledge.
**Test:** For version-scoped notes: (1) Is there an EOL date or review trigger? (2) Does the vault have a process to check these triggers? (3) Are expired versions flagged or migrated?

**Rule:** Create version-migration hub notes when moving between major versions affects 5+ notes.
**Why:** Scattered version-specific notes are hard to migrate en masse; a migration hub collects the changes needed, tracks progress, and serves as a checklist.
**Test:** After a major version release: (1) Can you identify all affected notes? (2) Is there a migration hub? (3) Does the hub link to all version-specific content?

**Rule (NEW - 2026-03-22):** For rapidly-evolving financial-technical domains (cryptocurrency, DeFi, Web3, trading), apply elevated verification standards and granular expiration intervals.
**Why:** Crypto/Web3 knowledge combines rapid version churn with financial materiality — incorrect knowledge can result in direct monetary loss. Standard verification and expiration rules fail to capture: (1) protocol-specific versioning beyond generic "version:", (2) tribal/community-specific claims that are true within one ecosystem but contested elsewhere, (3) security-critical knowledge requiring audit-level verification, (4) ultra-short expiration intervals (7-30 days for governance, 90 days for documentation).
**Test:** For crypto/Web3 notes: (1) Does frontmatter include `protocol:`, `protocol-version:`, and `chain:` fields? (2) Are community-specific claims tagged with `tribal-scope:`? (3) Is financial-risk level documented (low/medium/high/critical)? (4) Are expiration intervals granular (7d/30d/90d/180d)? (5) Is on-chain vs off-chain authority distinguished?
**Implementation:** Use fields:
```yaml
# Protocol versioning
protocol: ethereum
protocol-version: "2.4.0"
chain: ethereum-mainnet
forks-supported: [mainnet, arbitrum, optimism]
# Tribal/community scope
tribal-scope: defi-community|bitcoin-maximalist|eth-community|none
on-chain-authority: high|medium|low
# Financial risk
financial-risk: low|medium|high|critical
verification-level: standard|enhanced|audit-required
# Expiration
expiration-interval: 7d|30d|90d|180d
review-trigger: protocol-upgrade|governance-vote|security-incident
# Authority distinction
authority-level: on-chain|off-chain-interpretation|community-claim|personal-opinion
```
**See also:** [[Frontier Exploration - Cryptocurrency and Web3 Knowledge Bases]]

**Rule:** Document physical equipment dependencies for procedural knowledge — include what tools are required, which are optional, and what alternatives exist.

**Rule:** For domains with interdependent multi-item creation (cooking meals, event planning, project portfolios), create coordination knowledge separate from item knowledge — document timing relationships, resource conflicts, and sequencing rules as atomic notes.
**Why:** Individual item notes (recipes, tasks) are atomic; coordination knowledge is orthogonal. Without explicit coordination notes, the vault contains items but lacks system-level guidance. Multi-item coordination is distinct knowledge that cannot be derived from individual item notes alone.
**Test:** Can you find coordination notes for multi-item events? Do timing relationships exist as separate notes? Are resource conflicts documented?
**Edge case:** Some domains have natural coordination structures (concert programs, wedding agendas, meeting sequences) — treat similarly with explicit sequencing notes.
**Edge case:** Coordination knowledge is often context-dependent — tag with scope (e.g., `coordination-scope: dinner-party` vs. `coordination-scope: meal-prep-batch`) to distinguish different coordination types.
**Why:** Knowledge that requires specific tools to execute is fundamentally different from knowledge prerequisites. Readers need to know upfront what equipment investment is required before committing to learn. This is distinct from software version requirements (which are covered above).
**Test:** For procedural notes (recipes, crafts, repairs, techniques): (1) Is there an `equipment:` field in frontmatter? (2) Does it list required vs. optional tools? (3) Are alternatives documented for optional equipment? (4) For safety-critical equipment, is safety guidance included?
**Edge case:** Some domains have "basic toolkit" assumptions — don't list common tools (screwdriver, knife) unless the technique requires specialized versions.
**Edge case:** Equipment may have safety requirements (gloves, glasses, masks) — tag these separately from tools. For non-physical safety (e.g., hearing protection in audio), include `safety-type: hearing|cumulative`.

**Edge case (expanded - 2026-03-19):** For physical craft and technical domains (woodworking, metalworking, automotive, construction), safety hazards are multifaceted and require comprehensive categorization:
- `safety-type: mechanical` — moving parts, pinch points, kickback hazards (table saws, lathes)
- `safety-type: respiratory` — dust, fumes, particles (sanding, finishing, welding)
- `safety-type: chemical` — solvents, finishes, adhesives (off-gassing, skin contact)
- `safety-type: noise` — prolonged exposure above 85dB (power tools, machinery)
- `safety-type: ergonomic` — repetitive strain, awkward postures, vibration (hand tools, sustained work)

The test: For safety-critical procedural notes in physical domains: (1) Does frontmatter include `safety-type:` with appropriate category? (2) Is `safety-equipment-required:` documented? (3) Is `safety-mandatory:` marked for non-optional protections? (4) For compound hazards (e.g., both mechanical AND respiratory), can multiple safety types be listed?

Example:
```yaml
safety-type: [mechanical, respiratory]
safety-equipment-required:
  - safety glasses (mandatory)
  - dust collector (mandatory)
  - hearing protection (recommended)
safety-mandatory: true
```
**Edge case:** Equipment cost can be a vault boundary criterion — if equipment cost excludes certain users, consider this when capturing knowledge.
**Edge case (refined):** For domains where software is as critical as hardware (music production, video editing, design), distinguish `equipment:` (physical tools) from `software:` (digital tools), or use `equipment:` with `type: physical|software` sub-field.
**Edge case (refined):** For domains with wide quality spectrums (free to professional-grade), add `quality-tier:` or `entry-level-alternative:` to help beginners determine what they can START with, not just what professionals use.
**Edge case (expanded):** For domains requiring make/model/year specificity (automotive repair, electronics, appliances, photography), equipment varies by specific vehicle/device:
```yaml
equipment-scope:
  make: [Toyota, Honda]
  year: [2015-2022]
  model: [Camry, Accord]
# Photography examples:
equipment-scope:
  brand: Canon
  model: [EOS R5, EOS R6]
  lens: [RF 50mm f/1.2L, RF 85mm f/1.2L]
# Audio equipment examples:
equipment-scope:
  brand: Universal Audio
  model: [Apollo Twin, Apollo X6]
  firmware: ["1.2.3", "2.0.0"]
```
When equipment varies by model, either: (1) create separate notes per model, (2) use conditional equipment lists, or (3) link to a "Required Tools" hub rather than inlining.
**Edge case (expanded):** Safety-critical equipment in domains like automotive, construction, or medicine cannot be marked "optional" — use explicit `safety-mandatory: true` for equipment where skipping causes harm.
**Edge case (expanded):** Distinguish tools (owned, reusable) from consumables (purchased per job) — both are equipment dependencies but have different acquisition patterns:
```yaml
equipment:
  tools:
    - Socket set (10mm-19mm)
  consumables:
    - Oil (5W-30, 5 quarts)
    - Oil filter (brand-specific)
```
**Edge case (expanded):** Some tools are job-specific (specialty tools used for one procedure) vs. general tools (used across many jobs). Consider: list general tools in frontmatter, link specialty tools to a hub.
**Edge case (expanded):** For knowledge domains where user skill level significantly affects equipment requirements (cooking, woodworking, automotive), include `equipment-skill-level:` to clarify assumptions:
```yaml
equipment-skill-level: home-cook    # Assumes basic kitchen equipment
equipment-skill-level: home-advanced  # Assumes expanded home equipment
equipment-skill-level: professional   # Assumes commercial/professional equipment
```
This helps users determine applicability: a technique requiring a "Dutch oven" is accessible to home-cooks, while one requiring a "combi-oven" is professional-only.
**Note:** This is distinct from `expertise-level:` — a beginner with professional equipment can attempt professional techniques, while an expert with basic equipment may need simplified approaches.

**Rule:** For equipment-intensive domains, create a maintenance knowledge layer separate from procedural knowledge — track service intervals, document maintenance procedures, and link maintenance notes to the equipment notes they apply to.
**Why:** Maintenance knowledge has fundamentally different characteristics than procedural knowledge: it's periodic (must be done at intervals), conditional on ownership, and consequential (neglect causes degradation or safety issues). Conflating maintenance with usage creates confusion about when maintenance is needed and what it involves.
**Test:** In equipment-heavy domains (woodworking, music production, automotive, photography): (1) Can you identify maintenance knowledge separate from usage knowledge? (2) Do equipment notes link to their maintenance requirements? (3) Is there a way to track service intervals?
**Implementation:** Use structure:
```yaml
maintenance:
  - task: Description
    interval: daily|weekly|monthly|yearly|hours-used
    procedure: [[Maintenance Note]]
    last-performed: YYYY-MM-DD
    next-due: YYYY-MM-DD
```

**Rule:** For knowledge that depends on external APIs, services, or third-party platforms, include explicit service dependency tracking in frontmatter.
**Why:** Service dependencies differ from software versions — APIs can disappear without warning, free tiers may vanish, and rate limits affect usability. Knowledge that depends on external services can become useless without any change to your vault.
**Test:** For notes depending on external services: (1) Is there a `service-dependencies:` field listing required services? (2) Are alternatives documented for when services become unavailable? (3) Can a reader estimate cost/availability implications?
**Edge case:** Some services are so established they seem permanent (AWS, GitHub) — still document dependencies but mark reliability tier. Novel services (new AI tools, recent integrations) need explicit review triggers.
**Edge case:** Distinguish "service required" (knowledge doesn't work without it) from "service enhances" (knowledge works but is limited without it). Tag required services as `required: true`.

**Rule:** For software-based domains (programming, DevOps, digital design), track software dependencies separately from physical equipment — use `software-dependencies:` or `equipment: type: software` in frontmatter.
**Why:** Software packages have different lifecycle properties than physical tools: they update, deprecate, change APIs, and can be installed/removed instantly. Unlike physical equipment, software versions can often be run simultaneously. Tracking them separately enables version-specific review.
**Test:** For programming/technical notes: (1) Is there a software dependency field? (2) Does it include package names and versions? (3) Can you distinguish software requirements from physical equipment needs?
**Edge case:** Some domains have tight software-hardware coupling (audio production, CNC machining) — both should be documented, but separate fields clarify which can be virtualized.

**Rule:** Distinguish tool-interface knowledge (keybindings, menu paths, file paths, API endpoints) from domain knowledge and procedural knowledge — use appropriate capture strategies for each.
**Why:** Knowledge about navigating tools differs fundamentally from content knowledge: it changes with UI/API versions, it's often tool-specific, and it can be generic (Ctrl+F works everywhere) or specific (custom hotkeys). Mixing them creates maintenance burden.
**Test:** For notes containing tool navigation information: (1) Is this interface knowledge (keybindings, paths, menus) vs. domain knowledge? (2) If interface: is it version-scoped or linked to official docs? (3) Can you identify generic patterns vs. tool-specific details?
**Edge case:** Generic interface patterns (modal dialogs require explicit dismissal, CLI tools prefer flags, REST uses consistent HTTP methods) are worth capturing as evergreen principles. Tool-specific details (specific keybindings, exact menu paths) should be version-scoped or linked to documentation.
**Edge case:** Some tool knowledge becomes domain knowledge over time — learning vim keybindings is tool knowledge; understanding modal editing as a philosophy becomes domain knowledge.

**Rule:** For vast knowledge domains (programming, research, medical), actively discover unknown unknowns — track questions you couldn't answer and terminology you had to look up.
**Why:** In vast domains, you don't know what you don't know. Without explicit unknown-tracking, gaps go undetected. Community resources (forums, aggregators, Q&A sites) reveal what concepts exist that you haven't captured.
**Test:** Can you list 3 questions you couldn't answer from your vault? Do you track terminology lookups? Have you reviewed community resources for gaps?
**Edge case:** Unknown unknown tracking should be low-friction — use a dedicated "discovery" note or inbox, not full notes. Elevate to full notes only when the concept is understood.

**Rule:** In domains with rapidly evolving knowledge (software frameworks, research fields), use explicit discovery mechanisms — community aggregators, changelogs, and expert feeds — to surface gaps before they become stale.
**Why:** Passive capture misses emerging topics. Active discovery ensures the vault grows with the domain, not just reflecting past knowledge.
**Test:** For an evolving domain: (1) Do you monitor at least 2 discovery sources? (2) Can you show recent topics added from discovery vs. capture? (3) Is there a review process for new discoveries?

**Rule:** For knowledge that applies only to specific AI models or model families (prompt engineering, model-specific techniques), include explicit model scope in frontmatter.
**Why:** Prompt effectiveness varies dramatically across AI models — a prompt that works for GPT-4 may produce poor results from Claude. Without explicit model scope, readers cannot assess applicability and AI agents cannot determine relevance.
**Test:** For prompt or AI interaction notes: (1) Does the note specify which model(s) it was designed for? (2) Is there a `model-scope:` field? (3) Can you determine whether this applies to your use case?
**Edge case:** Cross-model prompts that work broadly should note `model-scope: [all]` or list multiple models. Prompts that failed for a model should note that in failure-modes, not exclude from scope unless fundamentally incompatible.
**Edge case:** Model versions matter — a prompt designed for GPT-4 may not work on GPT-4o. Include version when known or note "tested on: 4-turbo" to establish baseline.

**Rule:** For knowledge about AI interactions (prompts, conversation patterns, output evaluation), include success criteria that define what "good enough" output looks like.
**Why:** Unlike procedural knowledge where success is binary (recipe works/doesn't), AI interaction quality is often subjective. Without explicit criteria, verification is impossible for AI agents.
**Test:** Can an AI agent determine whether output satisfies this prompt without human judgment? Is success measurable?

**Rule:** For prompt knowledge, track version history — include `prompt-version:` and document significant changes.
**Why:** Prompts evolve through iteration like code. A failed v1 informs a successful v2. Version history captures learning and enables rollback.
**Test:** If this prompt has been improved, is there a version history? Can you access earlier versions?

**Rule:** Document failure modes for prompt notes — what does this prompt produce when it doesn't work?
**Why:** Understanding failure modes is as valuable as knowing what works. Failure documentation helps debug and improve prompts.
**Test:** Are common failure modes documented? Can users anticipate what will go wrong?

**Rule:** Track model behavior expectations separately from model version — document what "good enough" output looks like for each prompt.
**Why:** AI model behavior can shift subtly or dramatically between versions without announcement. Without explicit success criteria, drift goes undetected.
**Test:** For prompt notes: (1) Is there a documented success criteria? (2) Can you detect when model behavior has drifted? (3) Do you periodically verify prompts still produce expected output?

**Rule:** For critical prompts, test across at least 2 different models before marking as verified — create model-specific variants when generic prompts fail.
**Why:** Prompt effectiveness varies dramatically across models. A prompt that works on one model may fail on another. Cross-model testing surfaces portability issues early.
**Test:** For critical prompts: (1) Has it been tested on at least 2 models? (2) Are failures documented? (3) Are model-specific variants created when generic fails?

**Rule:** Mark model-specific knowledge with explicit `model-status:` field — review and archive when models deprecate.
**Why:** AI models deprecate or change behavior without notice. Knowledge optimized for a specific model can become obsolete overnight.
**Test:** For model-specific notes: (1) Is model-status documented (active|deprecated|unknown)? (2) Is there a review trigger for model deprecation? (3) When models deprecate, is there a migration strategy?

**Rule:** For vaults relying on AI assistance, track model dependencies in vault metadata — document which models the vault depends on and have fallback strategies.
**Why:** The vault itself may depend on AI models for maintenance, generation, or processing. This dependency should be visible and manageable.
**Test:** Can you answer: (1) Which AI models does this vault depend on? (2) What would happen if those models became unavailable? (3) Is there a fallback strategy?

**Rule:** For conditional/troubleshooting knowledge with 3+ branches, create a decision-point hub that links to each branch as separate atomic notes — do not embed all branches in one note.
**Why:** Embedding 3+ conditional branches violates atomicity and makes the note unusable; splitting without a hub loses the decision context.
**Test:** Pick a note with conditional branches. (1) Does it have 3+ branches? (2) If yes, is there a hub note explaining the decision point? (3) Are branches linked from the hub?

**Rule:** Use typed relationships to clarify the nature of conditional links — distinguish "if symptom then try this" (diagnostic) from "if that doesn't work then try that" (fallback sequence).
**Why:** Readers need to know whether to try all options in sequence or stop at the first success.
**Test:** For troubleshooting notes with multiple steps: (1) Can you distinguish primary attempts from fallback attempts? (2) Is the relationship between steps explicit?

**Rule:** Include exit criteria in troubleshooting notes — define what success looks like and when to stop or escalate.
**Why:** Without exit criteria, users don't know when the problem is solved or when they've reached a dead end requiring external help.
**Test:** Pick a troubleshooting note. Can you identify: (1) What success looks like? (2) When to stop trying branches? (3) When to escalate?

**Rule:** For substitution knowledge (ingredient, material, or component alternatives), capture with explicit substitution ratio, property impact, contextual applicability, directionality, and quality tier.
**Why:** Substitutions are conditional by nature - they only apply when the primary is unavailable. Without explicit ratio and impact data, AIs cannot make informed substitution decisions or warn about context failures. Directionality and quality tier help users understand expected results.
**Test:** For substitution notes: (1) Is there a substitution ratio (e.g., "1 cup X = 1 cup Y + Z")? (2) Is there a property impact description (texture, flavor, chemical behavior)? (3) Is contextual applicability stated (works in baking? fails when heated?)?
**Edge case:** Universal substitutes that always work (salt as preservative) are general knowledge, not substitution knowledge. Equipment alternatives are equipment dependencies, covered elsewhere.
**Edge case:** Many substitutions are NOT bidirectional - "butter for oil" often works but "oil for butter" often fails. Document direction explicitly; if bidirectional, note both directions.
**Edge case:** Quality tiers help users set expectations - some substitutions work perfectly, others produce acceptable but noticeably different results. Include quality indicator (perfect | acceptable | poor).
**Edge case:** Include trigger conditions to help match substitutions to user situations - out of ingredient, dietary restriction, cost optimization, availability/seasonal.
**Implementation:** Use structure:
```yaml
substitution:
  primary: Original ingredient
  ratio: "1:1"  # or specific ratio
  bidirectional: false  # true if reverse also works
  quality-tier: acceptable  # perfect | acceptable | poor
  triggers:
    - out-of-ingredient
    - dietary-restriction
  alternatives:
    - ingredient: Substitution name
      ratio: Amount
      property-impact: Description of how this changes the result
      context: When this works / when to avoid
```

**Rule:** Distinguish adaptation knowledge from substitution knowledge — adaptation transforms the same knowledge into a different representation.
**Why:** Substitution is "use X when Y is unavailable" — they're different options. Adaptation is "transform X into Y" — it's the same knowledge, different representation. Conflating them loses the transformation insight.
**Test**: For a note about using alternative X: (1) Is X a replacement for the original, or a transformation? (2) Does the note describe how to convert one form to another? (3) Is the underlying knowledge the same?

**Rule:** For adaptation knowledge, document what must be preserved vs. what can change.
**Why:** Not all elements of the original survive adaptation. Explicitly tracking preservation requirements helps assess adaptation quality and guides future adaptations.
**Test**: For an adaptation note: (1) What's the core knowledge being preserved? (2) What elements are allowed to change? (3) What would make the adaptation "lose" the original?

**Rule:** Tag adaptations with explicit direction and reversibility — distinguish reversible transformations (scaling, transposition) from irreversible ones (simplification, format migration).
**Why:** Some adaptations are one-way (simplifying), others are bidirectional (scaling). Tagging enables appropriate handling and helps readers understand if they can return to the original.
**Test**: Can you determine: (1) What is being adapted from? (2) What's it being adapted to? (3) Can the adaptation be reversed?
**Implementation:** Use fields:
```yaml
adaptation-type: arrangement|transcription|porting|scaling|simplification
reversibility: reversible|irreversible|partial
preserves:
  - [elements that must be preserved]
allows-change:
  - [elements that can be modified]
```

**Rule:** For irreversible adaptations, create bidirectional links between original and adapted versions.
**Why:** If adaptation can't be reversed, readers need to find the original. Bidirectional links preserve access and track all versions.
**Test**: For an irreversible adaptation: (1) Can you find the original? (2) Can you find all adaptations of this original? (3) Are changes documented?

**Rule:** Track adaptation quality separately from correctness — a correct adaptation isn't necessarily a good one.
**Why:** Quality dimensions include: fidelity to original, optimization for new context, appropriateness for audience. A note that correctly transforms content but poorly suits the new context is a poor adaptation.
**Test**: For adaptation notes: (1) Is there a quality assessment beyond correctness? (2) Does it measure fidelity to original? (3) Does it assess suitability for new context?

**Rule:** Use `as-of:` frontmatter for knowledge captured at a specific point in time — rankings, recommendations, and comparisons that were accurate when captured but may be stale now.
**Why:** "Best restaurants" without a date is misleading; "Best restaurants (as-of 2019)" is a valid historical record. Without temporal context, stale knowledge appears current.
**Test:** For notes containing rankings, recommendations, or comparisons: (1) Is there an `as-of:` date? (2) Does the note explicitly state temporal scope? (3) Can readers distinguish current advice from historical record?

**Rule:** Mark temporally stale notes with `staleness: confirmed` — knowledge that was accurate when captured but is now outdated, without being wrong.
**Why:** Stale knowledge that was accurate should not be deprecated (it's not wrong), but readers need to know it's not current. Preserve historical accuracy while signaling staleness.
**Test:** Pick 10 notes with temporal recommendations. Check for: `as-of:` fields, explicit staleness markers, guidance on when to update.

**Rule:** Archive stale recommendations rather than deleting — preserve historical accuracy while maintaining current advice separately.
**Why:** Historical knowledge has value even when stale. Deleting it loses the record of how understanding evolved. Separate current from historical to avoid confusion.
**Test:** For notes with multiple historical versions: (1) Is there an archive or historical section? (2) Can readers trace how recommendations changed over time? (3) Are deleted recommendations recoverable?

**Rule:** For knowledge with multiple contributors, document the contribution model and handle disagreement explicitly.
**Why:** Unstructured collaboration leads to incoherent notes that mix incompatible viewpoints without signaling the mix. Collaborative knowledge (team projects, AI-human co-creation, community wikis) needs explicit handling of attribution, disagreement, and consensus.
**Test:** (1) Can you identify all contributors? (2) For any claim, can you trace it to a source? (3) If contributors disagreed, is the disagreement visible?
**Edge case:** Attribution matters for academic/professional contexts but may be unnecessary for personal knowledge consolidation.
**Edge case:** Distinguish consensus required (safety-critical) from plurality OK (preferences, styles) — not all collaborative knowledge needs consensus.
## 7. Evolution

*How notes and structure improve over time.*

**Rule:** Notes evolve through lifecycle stages: draft -> active -> evergreen -> abandoned -> deprecated -> archived.
**Why:** Not all notes are equal; lifecycle tracking focuses review effort on notes that matter. The archived stage preserves historical accuracy while signaling that temporal data is no longer current. The abandoned stage distinguishes unmaintained notes (unknown quality, no updates) from deprecated notes (deliberately evaluated and marked).
**Test:** Can each note be assigned a lifecycle stage? Are deprecated notes marked clearly? Are abandoned notes distinguished from deprecated ones?

**Extensions for time-sensitive domains:**
- **Cyclical strategies:** For notes that come in/out of favor (fashion cycles, trend strategies), use `status: cyclical` rather than deprecated — the knowledge is valid, just temporarily unfashionable. Tag with `cycle-period:` to indicate pattern.
- **Abandoned tools:** For unmaintained tools (no updates, no community, superseded by alternatives) use `lifecycle: abandoned` distinct from `deprecated` — abandoned means unmaintained and unknown quality, deprecated means deliberately evaluated and marked.
- **Deprecation types:** Use `deprecation-type: hard` (actively wrong), `soft` (superseded by better), or `historical` (accurate for past era but no longer current).
- **Archived data:** Use `as-of: YYYY-MM` for archived temporal data (tax brackets, annual limits) to clearly mark the time scope. Archived data remains accurate for its period, just no longer current.

**Implementation:**
```yaml
lifecycle: draft|active|evergreen|abandoned|deprecated|archived|living
status: cyclical  # for fashion/cycle patterns
cycle-period: 3y  # estimated cycle length
deprecation-type: hard|soft|historical
as-of: 2024  # for archived temporal data
```

**Rule:** For knowledge spanning multiple domains, use domain tags on atomic notes and create cross-domain hub notes that connect domain-specific perspectives.
**Why:** Not all notes are equal; lifecycle tracking focuses review effort on notes that matter. The archived stage preserves historical accuracy while signaling that temporal data is no longer current.
**Test:** Can each note be assigned a lifecycle stage? Are deprecated notes marked clearly?

**Rule:** Distinguish living documents from atomic notes — living documents are collections intentionally designed to be continuously updated (e.g., "My Tech Stack," "Questions I'm Exploring") rather than reaching a finished state.
**Why:** Some knowledge is inherently living - it evolves continuously and is never "complete." Treating living documents like atomic notes creates false expectations about completion and can lead to unnecessary processing overhead.
**Test:** Can you categorize every note as either: (a) atomic/finished, (b) living document (continuously updated), or (c) staging (will become either a or b)?
**Edge case:** Living documents should have explicit inclusion and removal criteria to prevent them from becoming dumping grounds. Use `lifecycle: living` and `review-cadence:` frontmatter to distinguish them from notes that should be finished.
**Edge case:** Consider converting living documents to timestamped atomic notes when their scope stabilizes (e.g., convert "My 2026 Reading List" to "2026 Reading List (Completed)" when the year ends).

**Rule:** Use "archived" for temporal data that was accurate but has been superseded by updated values — tax brackets, API versions, annual limits, historical statistics.
**Why:** Deprecated implies "wrong," but temporal data for a past period is accurate - just not current. Archived preserves the historical record while clearly signaling it's been replaced.
**Test:** For temporal data notes: (1) Is there a more current version? (2) Is the archived version still accurate for its time period? (3) Is there a link to the current version?

**Rule:** Deprecate notes using clear criteria — contradicted by new info, superseded by better version, redundant, or low value. Never delete; always mark, communicate reason, and point to replacement.
**Why:** Deletion breaks links silently; deprecation preserves graph integrity while signaling staleness. Without explicit deprecation workflow, vaults accumulate inconsistent knowledge that users cannot distinguish from current content.
**Test:** Can you list 3 reasons to deprecate a note? Are deprecated notes pointing to replacements? Is deprecation date and reason documented?

**Deprecation workflow:**
1. Mark with `deprecated: true` and `deprecated-date: YYYY-MM-DD`
2. Add `deprecated-reason:` (contradicted | superseded | redundant | low-value)
3. Link to `replaced-by:` note if applicable
4. Add `deprecated-review-date:` for future re-evaluation (archive vs. delete)
5. Update summary to clearly state deprecated status

**Deprecation metadata:**
```yaml
deprecated: true
deprecated-date: 2026-03-22
deprecated-reason: superseded  # contradicted|superseded|redundant|low-value
replaced-by: [[New Note Name]]
deprecated-review-date: 2026-06-01  # when to reconsider archive/delete
correction-type: outdated  # for correction workflow
```

**Obsolescence detection triggers:** Define domain-specific triggers to proactively detect when knowledge is at risk of becoming outdated:
- Version-based: new releases, API changes, security advisories
- Temporal: date-based expiration (annual limits, quarterly data)
- Event-based: competitor changes, regulation updates, product discontinuation

Scan quarterly for obsolescence triggers in fast-moving domains.

**Archive vs. delete criteria:**
- Archive when: historical value (understanding past decisions), reference for context, pattern documentation
- Delete when: actively harmful if accessed, no historical value, storage cost exceeds value
- Always prefer archive over delete; deletion is permanent

Example: Graph Visualization was deprecated and merged into [[Knowledge Graph Structure]] — see how deprecation handles the transition while preserving access to the historical note.

**See also:** [[Frontier Exploration - Knowledge Deprecation and Retirement Criteria]]

**Rule:** Iterate on existing notes rather than creating new ones on the same topic.
**Why:** Parallel notes on the same idea fragment knowledge; iteration concentrates and deepens it.
**Test:** Search for notes with similar titles or overlapping content. Should any be merged?

**Rule:** When understanding changes, update the note — don't create a "v2".
**Why:** Versioned duplicates confuse navigation; a single evolving note is the source of truth.
**Test:** Search for notes with version indicators (v2, "updated", "new"). Merge them into the canonical note.

**Rule:** Track personal perspective evolution — when your own view on a topic changes, document the evolution with dates, prior view, new view, and what prompted the change.
**Why:** Self-contradiction differs from external contradiction or superseded knowledge — it's your own learning progression. Tracking this preserves the reasoning behind your evolution and prevents repeating past mistakes.
**Test:** For notes representing strong opinions or recommendations: (1) Can you trace how your view has evolved? (2) Is there evolution-history frontmatter or a linked evolution note? (3) Does the current note acknowledge prior views?
**Edge case:** Use `evolution-history:` frontmatter with entries for each major view change:
```yaml
evolution-history:
  - date: YYYY-MM
    view: "Prior position"
    reason: "Why you held this view"
  - date: YYYY-MM
    view: "New position"  
    reason: "What changed your view"
```
**Edge case:** Not all notes need evolution tracking — apply to: (a) strong recommendations, (b) framework-level beliefs, (c) anything cited by multiple other notes. Skip for: minor details, easily-verified facts, notes likely to remain stable.

**Rule:** For knowledge that requires unlearning a previous belief to be understood, include explicit `unlearning-required: true` frontmatter with `prior-belief:` documenting what must be forgotten and `unlearning-mechanism:` describing how to facilitate the cognitive shift.
**Why:** Without explicit unlearning markers, AI agents and readers may try to reconcile new knowledge with old beliefs, creating hybrid misunderstandings that are worse than either alone. This differs from superseded knowledge (old → new replacement) and contradictory sources (external A vs B conflict) — the prior belief actively blocks comprehension, not just conflicts with it.
**Test:** For knowledge that contradicts common intuitions or previously-taught concepts: (1) Is there `unlearning-required: true`? (2) Does it document what the prior belief was? (3) Does it explain why the prior belief is blocking, not just wrong? (4) Does it include `prior-belief-source:` (common-misconception|personal-experience|outdated_science|childhood_learning)? (5) Does it specify `unlearning-difficulty:` (high|medium|low)?
**Edge case:** Easy unlearning — some knowledge simply replaces the old (capital of Australia is Canberra replaces Sydney) and doesn't require explicit mechanism. Mark with `unlearning-difficulty: low` in these cases.
**Edge case:** Metacognitive unlearning — the hardest type involves unlearning beliefs about how you think or learn ("I'm not a morning person," "I'm bad at math"). These require explicit `unlearning-mechanism: cognitive_reframe` and may need external validation.

**See also:** [[Frontier Exploration - Unlearning-Required Knowledge]] — Detailed exploration of knowledge requiring cognitive unlearning

**Rule:** Review the most-linked notes first — they have the highest impact on vault quality.
**Why:** A flawed hub note propagates its problems to every note that links through it.
**Test:** Run `graph_hubs`. Have the top 5 hubs been reviewed in the last 2 weeks?

**Rule:** Track knowledge validity periods for evolving domains — include `valid-from` date when understanding became accurate.
**Why:** Readers and AI agents need to know whether captured knowledge reflects current understanding or historical understanding.
**Test:** Pick 10 notes in an evolving domain. Can you determine when each piece of knowledge became accurate?

**Rule:** Use time-boxing for rapidly-changing factual knowledge — include `valid-until` frontmatter for year-specific data, event schedules, equipment models, or any knowledge with a known expiration.
**Why:** Ephemeris data, yearly events, and equipment specifications become incorrect at a specific time. Time-boxing makes this explicit rather than silently becoming stale.
**Test:** For factual notes: (1) Is this knowledge year-specific or time-limited? (2) Is there a `valid-until:` date? (3) Is there a link to the general principle or current version?

**Rule:** Document evolution triggers when updating notes with significant changes — include what prompted the update.
**Why:** Understanding why knowledge changed helps readers evaluate the change and predict future changes.
**Test:** Pick 5 notes that have been updated. Can you identify what prompted each update?

**Rule:** Link historical supersessions bidirectionally — deprecated notes point to replacements, replacements acknowledge superseded notes.
**Why:** Bidirectional supersession links enable tracing how understanding evolved over time.
**Test:** Find a deprecated note. Does it point forward to replacement? Does replacement acknowledge superseded?

**Rule:** Set review triggers for evolving domains based on explicit conditions, not arbitrary intervals.
**Why:** Arbitrary review schedules miss important changes; trigger-based scheduling ensures timely updates when conditions change.
**Test:** In fast-changing domains, can you identify explicit conditions that should trigger review?

**Rule:** Track explicit dependencies for notes that other notes depend on — when updating a foundational note, identify all dependent notes and review them.
**Why:** Cascade failures (stale links, contradictory claims, inconsistent terminology) erode vault credibility. Proactive dependency tracking prevents silent degradation.
**Test:** (1) Can you identify notes that depend on this note? (2) When this note changes, do you have a process to review dependents? (3) Are dependent notes tagged or linked for cascade review?

**Rule:** Use dependency metadata for foundational notes — notes that other notes rely on should have a `dependencies:` field listing dependent notes, updated on significant changes.
**Why:** Without explicit dependency tracking, cascade effects go undetected until someone notices broken links or contradictions.
**Test:** For notes with >5 incoming links: (1) Is there a dependency list? (2) When was it last reviewed? (3) Can you quickly identify what would break if this note changed significantly?

**Rule:** For knowledge that was once considered accurate but has been fundamentally disproven (scientific theories, historical models), use `status: historical-superseded` with `superseded-by:` pointing to the replacement and `historical-context:` explaining why the theory was abandoned.
**Why:** Discredited knowledge is different from deprecated knowledge — it wasn't replaced by a better version, it was proven wrong. Preserving it as historical record explains how understanding evolved.
**Test:** For notes about disproven theories: (1) Is there a `superseded-by:` field? (2) Does it explain why the theory was abandoned? (3) Is there historical context about what was believed and why? (4) Can readers trace both forward (to modern understanding) and backward (to the superseded theory)?
**Edge case:** Some "wrong" theories remain useful approximations (Newtonian physics at everyday speeds). Use `scope:` to specify when the theory applies vs. fails.
**Edge case:** Dangerous discredited knowledge (discredited medical treatments, harmful ideologies) should include `harm-potential:` warnings even when preserved for historical accuracy.

---

## 8. Domain Agnosticism

*Rules that ensure portability across any topic.*





```yaml
domain-interaction-type: explanatory|applicational|conflicting
domains: [primary-domain, secondary-domain]
```


```yaml
domain-conflict:
  domain-a: psychology
  domain-a-principle: "[principle]"
  domain-b: economics
  domain-b-principle: "[principle]"
  synthesis-guidance: "[when each applies]"
```


```yaml
domain-transfer-potential:
  - from: [source-domain]
    to: [target-domain]
    transfer-principle: "[how it transfers]"
```






```yaml
canonical-structure: true
structure-type: form|framework|pattern|methodology
related-structures:
  - name: "Competing structure"
    relationship: alternative|successor|predecessor
examples:
  - [[Note that follows this structure]]
```

---

## 9. Self-Improvement

*How the vault and its rules continuously improve.*

**Rule:** The vault must follow its own rules — self-referential accuracy is the ultimate test.
**Why:** A knowledge base about quality criteria that violates its own criteria has no credibility.
**Test:** Pick 5 random notes. Do they all pass every rule in this Seed? If not, fix the notes or fix the rules.

**Rule:** Every rule in the Seed must be demonstrated by at least one note in the vault.
**Why:** Untested rules are theories; only rules proven in practice belong in the Seed.
**Test:** For each rule, can you point to a note that exemplifies it? Remove rules that have no evidence.

**Rule:** If the vault consistently violates a rule, the rule may be wrong — update or remove it.
**Why:** Rules that don't survive contact with reality are bad rules.
**Test:** Are there rules that are frequently violated? Investigate whether the rule or the vault is wrong.

**Rule:** The Seed should shrink over time, not grow — consolidate and eliminate redundancy.
**Why:** A bloated ruleset is hard to follow; fewer, stronger rules beat many weak ones.
**Test:** Are any two rules saying the same thing? Merge them. Is any rule a subset of another? Remove the subset.

**Rule:** When merging redundant notes, keep the one with more incoming links as the base.
**Why:** Incoming links indicate a note is more central to the vault's knowledge graph; merging into the more-connected note preserves existing navigation paths.
**Test:** Before merging note A into note B, run `graph_get_backlinks` on both. Keep the one with more backlinks. Update all links to point to the surviving note.

**Rule:** Track quality metrics over time: note count, link density, orphan count, average note size, broken links.
**Why:** Without metrics, improvement is anecdotal; with metrics, it's verifiable.
**Test:** Can you produce these 5 metrics right now? Are they trending in the right direction?

**Rule:** Measure utility beyond structure — periodically verify the vault can answer its intended questions by testing retrieval with realistic queries.
**Why:** A vault that passes all structural checks (no orphans, good density, consistent terminology) can still be useless if it doesn't contain knowledge people need. Structural quality measures graph health; utility measures whether the vault serves its purpose.
**Test:** (1) Create a test set of 10 realistic questions the vault should answer. (2) Can you answer at least 7 of them from the vault? (3) Track the 3 that fail as knowledge gaps. If retrieval success <70%, the vault needs content work, not structural work.
**Edge case:** New vaults (<20 notes) cannot meaningfully test retrieval — skip this test until the vault has sufficient content. For growing vaults, test at 50, 100, and 200 note milestones.

**Rule:** Track knowledge gaps explicitly — maintain awareness of questions the vault cannot answer and prioritize filling the most common gaps.
**Why:** Untracked gaps accumulate silently. Without explicit gap tracking, improvement is random rather than targeted. Knowing what the vault lacks enables intentional curation.
**Test:** Can you list 3 questions your vault cannot answer? Are they logged somewhere for future capture? Do new notes address these gaps?

**Rule:** Distinguish structural quality from utility value — a vault that passes all Seed rules but fails to answer real questions needs content work, not structural work.
**Why:** Structural rules (atomicity, linking, navigation) ensure the vault is well-organized. Utility rules (retrieval success, question coverage) ensure the vault contains useful knowledge. Optimizing structure while ignoring utility produces a beautiful but useless vault.
**Test:** Can you articulate the difference between "well-structured" and "useful"? Does your improvement process address both?

**Rule:** Track knowledge debt explicitly — maintain awareness of shortcuts taken (missing links, uncited claims, inconsistent terminology) and schedule regular debt repayment sessions.
**Why:** Untracked debt accumulates silently until it overwhelms the vault. Knowledge debt (orphaned notes, dead links, unverified procedures) parallels technical debt and requires intentional repayment.
**Test:** Can you list 3 types of knowledge debt present in your vault? Is there a plan to address each?

**Rule:** Check for debt accumulation patterns before creating new notes — if recent notes consistently lack links, citations, or frontmatter, this signals capture-process debt that will burden the vault later.
**Why:** Debt often accumulates in batches during high-velocity capture. Catching patterns early prevents systemic debt that becomes harder to fix later. A single low-quality note is fixable; ten are a pattern.
**Test:** Review the 10 most recent notes. Do they each have at least 2 outgoing links? Do they have required frontmatter (tags, dates, confidence)? If multiple fail, fix the capture process before creating more notes.

**Rule (NEW - 2026-04-05):** Limit generic meta-knowledge and require domain grounding — meta-knowledge notes should not exceed 5% of vault content, and generic principles must connect to 3+ domain-specific examples.
**Why:** Without explicit limits, vaults accumulate meta-knowledge that sounds profound but adds no specific value. Generic principles without examples are slogans, not knowledge. The 5% threshold keeps meta-knowledge present but not dominant.
**Test:** (1) Count notes tagged `knowledge-type: meta` or with titles about vault/knowledge management — is total <5% of vault? (2) For any principle note, can you give 3 concrete examples in specific domains? (3) Do generic principles link to domain-specific notes that demonstrate the principle in action?
**Implementation:** Use frontmatter to track: `meta-knowledge-limit: 0.05` (5% of vault), `generic-principle-examples-required: 3`.

**Detection questions for AI agents:**
- Could this apply to ANY domain without modification? → too generic
- Does this suggest specific actions? → if no, too generic
- Would a domain expert find this useful? → if no, probably obvious
- Does this require knowledge of the vault itself? → if yes, meta

**Edge cases:**
- New vaults: During bootstrap, meta-knowledge naturally exceeds 5% (conventions need to be established first)
- Single-domain vaults: 5% threshold still applies, just calculated differently
- Operational vs. content: CLAUDE.md, HEARTBEAT.md are operational (excluded from count), domain content is content (included in count)

**Distinction:** Acceptable meta-knowledge includes conventions, operational reminders, retrieval paths. Reject meta-knowledge that explains "what knowledge IS" vs. "how to use this vault."

**Rule (NEW - 2026-04-08):** Establish domain adaptation consolidation — when 3+ stress tests in different domains identify the same type of modification, elevate it to a general Seed rule with domain parameters.

**Why:** Domain-specific adaptations appearing repeatedly across unrelated domains represent fundamental rule limitations, not domain differences. Without consolidation guidance, insights stay trapped in individual test notes. A threshold-based mechanism (3+ domains = general rule) ensures only truly universal adaptations become Seed rules while preserving genuinely domain-specific nuances.

**Test:** (1) Can you identify adaptations appearing in 3+ unrelated domains? (2) Do repeated adaptations have corresponding general rules? (3) Is there a tracking mechanism for adaptation-to-rule conversion? (4) Are domain-specific tests archived after consolidation?

**Implementation:**
```yaml
adaptation-tracking:
  track: true
  consolidation-threshold: 3  # 3+ domains triggers consolidation
  unrelated-domains-required: true  # must be different domain families
```

**Consolidation criteria:**
- Same modification type appears in 3+ **unrelated** domains (not same domain family)
- Modification addresses a Seed **rule limitation** (not domain-specific content)
- Proposed rule has **domain parameters** (not one-size-fits-all)
- Edge cases are documented in the consolidated rule

**Consolidation workflow:**
1. **Track** adaptations across stress tests (use frontmatter `adaptation-type:`)
2. **Identify** when 3+ domains show same adaptation type
3. **Propose** general rule with domain parameters in Seed
4. **Archive** domain-specific test notes (keep link for reference)
5. **Update** stress test index to reference consolidated rule

**Keep adaptations domain-specific when:**
- Modification applies to only one domain family (e.g., all music-related)
- Domain has fundamentally different knowledge characteristics (safety-critical vs creative)
- Adaptation is content-specific, not structure-specific

**See also:** [[Seed Refinement - Domain Adaptation Consolidation Framework]] (this note triggered integration)
**See also:** [[Seed Gap - Domain-Specific Stress Test Consolidation Framework]] (original gap note)

### Implementation Roadmap

**Week 1 Targets:**
| Day | Action |
|-----|--------|
| 1-2 | Create `_root.md` with vault purpose; add 3 foundational notes: Atomic Note Principle, Linking Principle, Graph Traversal Efficiency |
| 3-4 | Process 1 existing document into atomic notes, add frontmatter with tags |
| 5-7 | Review notes and add 2-3 links each; run `graph_hubs` to see connectivity |

**Growth Targets:**
| Week | Target Nodes |
|------|-------------|
| 1 | 10 |
| 2 | 25 |
| 3 | 50 |
| 4 | 100 |

**Rule (NEW - 2026-03-26):** Extract and act on vault-level patterns systematically — use graph analytics to reveal growth imbalances, hidden hubs, topic clusters, structural gaps, and temporal patterns.
**Why:** The vault's structure contains latent knowledge about knowledge management that can't be extracted from any single note. Without systematic pattern extraction, valuable insights about the vault's own health and direction are invisible. Growth patterns reveal capture focus; hidden hubs show implicit structure; topic clusters reveal emergent themes; structural gaps appear only in graph topology.
**Test:** Can you answer: (1) What's the growth rate by topic? (2) Which non-hub notes have the most incoming links? (3) What topic clusters exist? (4) Where does graph topology suggest missing knowledge? (5) What's the content churn pattern?
**Implementation:** Run graph analysis monthly: topic growth rates, hub discovery, gap detection. Track growth patterns in a dedicated "vault health" note. Use frontmatter to tag notes with `growth-pattern:` (accelerating|stable|declining). Create explicit hub notes for high-connectivity concepts that lack them.
```yaml
# For vault analytics note
vault-analytics: true
last-analyzed: 2026-03-26
metrics:
  growth-by-topic: {topic: count}
  hidden-hubs: [non-hub high-connectivity notes]
  topic-clusters: [naturally grouped topics]
  structural-gaps: [high-centrality low-connectivity]
  content-churn: [frequently-updated notes]
```
**See also:** [[Frontier Exploration - Vault-Level Pattern Discovery]]

**Rule (NEW - 2026-03-28):** When two or more protected notes have >50% content overlap, designate one as canonical and add a redirect section to the other(s).
**Why:** Protected notes prevent accidental deletion, but when they overlap they create redundancy that violates the Seed's core principle. The solution is not merging but designating a canonical source while preserving the protected status of both.
**Test:** Can you identify any pairs of protected notes with >50% content overlap? For each overlap pair: (1) Is one clearly more comprehensive? (2) Does the less comprehensive note include a redirect section pointing to the canonical note? (3) Do both notes still exist (none deleted)?
**Implementation:** In the non-canonical protected note, add frontmatter:
```yaml
canonical-note: [[Canonical Note Name]]
redirect-sections:
  - section-1
  - section-2
```
And add redirect section in content:
```markdown
## Redirect

This note has been superseded by [[Canonical Note Name]]. The content below has been migrated:

[Migrated content or summary]

All future updates should be made to [[Canonical Note Name]].
```

---

## 10. Tacit Knowledge

*Capturing knowledge that resists articulation.*




**Test for tacit knowledge severity:** Pick a domain (music, sports, crafts). Estimate: What percentage of expertise in this domain is tacit (cannot be fully articulated)? High tacit domains need more proxy markers, failure mode documentation, and multimedia links.





















---

## 10.5. Intergenerational Knowledge Transfer

*Capturing knowledge from elders, family traditions, and cultural practices that would otherwise be lost.*

**Rule:** Capture intergenerational knowledge with temporal priority — apply urgency weighting for knowledge from living elders.
**Why:** Unlike other domains where capture timing is flexible, intergenerational knowledge has a finite window. Elder's health, availability, and memory decline over time. The window for direct capture is bounded.
**Test:** For vaults with intergenerational focus: (1) Is there temporal-priority tagging for knowledge from living elders? (2) Are capture attempts documented with dates? (3) Is there a fallback plan when direct capture is no longer possible?
**Implementation:**
```yaml
temporal-priority: high  # high|medium|low - urgency of capture
source-available: living|deceased|uncertain
capture-status: captured|attempted|pending|not-possible
```

**Rule:** Separate facts from stories in intergenerational notes — distinguish documented facts from oral tradition narratives.
**Why:** The same family event may have factual elements (what happened) and narrative elements (how it's told, the meaning it carries). Treating both as "facts" misses the value of oral tradition. Stories carry cultural and emotional context that pure facts cannot capture.
**Test:** For intergenerational notes: (1) Can you distinguish documented facts from told stories? (2) Are narrative elements preserved as oral tradition? (3) Does the note acknowledge uncertainty in retellings?
**Implementation:**
```yaml
content-type: factual|oral-tradition|mixed
oral-source: grandfather|mother|family-legend
generation-captured: great-grandparent|grandparent|parent
```

**Rule:** Track knowledge evolution across generations — document how traditions or knowledge changed as they passed between generations.
**Why:** A tradition or piece of knowledge may have evolved as it passed from ancestors to grandparents to parents. Documenting these changes preserves the full picture and shows how knowledge adapts to new contexts.
**Test:** For traditions that have evolved: (1) Is there documentation of how the knowledge changed? (2) Are earlier versions preserved? (3) Is the reason for adaptation documented?

**Rule:** Apply enhanced privacy considerations for intergenerational knowledge — mark sensitivity and access control appropriately.
**Why:** Intergenerational knowledge often includes sensitive family information that shouldn't be shared publicly. The general privacy rules need extra emphasis when capturing personal family stories.
**Test:** For intergenerational vaults: (1) Is sensitivity marked on personal/difficult stories? (2) Are there notes that should be access-controlled? (3) Is there consent documentation for sharing beyond immediate family?
**Implementation:**
```yaml
sensitivity: private|family-restricted|shareable
consent-documented: true
access-control: none|encrypted|family-only
```

---

## 11. Analysis-Sensitive Knowledge

*Handling knowledge where explanation can diminish or destroy its value.*


```yaml
analysis-sensitivity: high
# Separate into:
# - [[Principle Note]] - captures the mechanism/pattern
# - [[Example Note]] - contains specific instances
# Link between them, but don't inline examples in principle notes
```

- `analysis-sensitivity: none` - Explaining doesn't reduce value

```yaml
# Note contains: principles, techniques, theory
# Links to: joke examples (separate notes)
# Does NOT include: specific punchlines inline
```

```yaml
spoiler-warning: true
# Capture technique without specific plot details
# Link to analysis notes that can discuss execution
```

```markdown
## Technique (spoiler-free)
[explanation of how this works]

## Examples (WARNING: contains spoilers)
[[Link to specific instances that demonstrate the technique]]
```


---

## 12. Trade-off Knowledge

*Capturing decisions that depend on context and priorities.*

**Rule:** Capture trade-off knowledge explicitly using trade-off note patterns — state both options, conditions for each, and reasoning.
**Why:** Trade-off knowledge is among the most valuable for decision-making but resists atomic capture. Explicit patterns prevent losing this knowledge and help readers make contextual decisions.
**Test:** For notes containing "it depends," "trade-off," "versus," or "vs": (1) Is there explicit structure capturing what's traded off? (2) Are conditions for each option stated? (3) Can a reader determine which applies to their situation?

**Rule:** Distinguish inherent trade-offs from skill/knowledge limits — apparent trade-offs that can be overcome with practice should be marked as such.
**Why:** False trade-offs create unnecessary hesitation. Recognizing when a trade-off is illusory empowers decision-making.
**Test:** For each trade-off: (1) Is this fundamentally a limit or a skill gap? (2) Can the "trade-off" be eliminated with learning/practice? (3) If yes, mark as "developable skill" rather than inherent trade-off.

**Rule:** Use conditional rule structure for trade-offs — default guidance with explicit exceptions and the conditions that trigger each.
**Why:** Trade-off notes need clear applicability conditions so readers know which guidance applies to their situation.
**Test:** Can a reader determine which branch of a trade-off applies to them without additional research?

**Rule:** Structure inherent trade-offs with explicit tension fields — tag both sides, document the nature of the tension, and provide context-dependent optimization guidance.
**Why:** Inherent trade-offs (speed vs. thoroughness, breadth vs. depth, exploration vs. exploitation) cannot be "resolved" — one side must be chosen at the expense of the other. Without explicit structure, users cannot see both sides or determine which context favors which choice.
**Test:** For notes involving inherent trade-offs: (1) Is there a `trade-off` field with `type: inherent`? (2) Are both sides documented with their respective benefits and costs? (3) Is there context-dependent guidance for when to favor each side?
**Implementation:**
```yaml
trade-off:
  type: inherent  # inherent vs. contextual
  tension: "specific description of what's in tension"
  side-a:
    name: option-a-name
    benefits: [list of benefits]
    costs: [list of costs]
  side-b:
    name: option-b-name
    benefits: [list of benefits]
    costs: [list of costs]
  contexts:
    - context: specific-context
      favored-side: option-a-name
      rationale: why this context favors this side
```

**Rule:** Track trade-off balance evolution — document when trade-off priorities shift due to changing conditions.
**Why:** What favors speed over thoroughness in early stages may favor the opposite later. Without evolution tracking, stale trade-off guidance misleads readers about current best practices.
**Test:** For persistent trade-offs: (1) Can you identify when trade-off balance last shifted? (2) Is there documentation of what triggered the shift? (3) Are conditions for future shifts identified?

**Rule:** For personal decision-making, track trade-off calibration as explicit preference weights.
**Why:** People have different risk tolerances and value outcomes differently. Trade-off calibration enables personalized decision support rather than generic recommendations.
**Test:** Can you articulate your personal trade-off preferences (e.g., speed-vs-quality: 0.7 meaning 70% speed preference)? Do these differ from "default" recommendations?

**Rule (NEW - 2026-03-30):** For rapidly-evolving domains, include temporal validity bounds on trade-off notes.
**Why:** Trade-off assessments become stale as technology advances. Without time bounds, readers may act on outdated information. In domains with >6 month technology cycles, trade-offs can flip entirely.
**Test:** For trade-off notes in domains with >6 month technology cycles: (1) Is there `trade-off-valid-as-of` date? (2) Is there a `review-when` or `review-cycle`? (3) Have trade-offs been reviewed within the review cycle?
**Implementation:** Add frontmatter fields:
```yaml
trade-off-valid-as-of: "YYYY-MM"
trade-off-review-cycle: quarterly|annually
next-review-date: "YYYY-MM-DD"
```

**Rule (NEW - 2026-03-30):** For infrastructure-dependent trade-offs (hardware, network, protocol), define applicability scope.
**Why:** Generic trade-offs ("WiFi is less reliable") are dangerously incomplete without context. A trade-off that applies to cheap WiFi bulbs may not apply to enterprise-grade WiFi thermostats.
**Test:** For infrastructure-dependent trade-offs: (1) Does frontmatter define `applies-to` and `excludes`? (2) Can a reader determine if the trade-off applies to their specific configuration?
**Implementation:** Use fields:
```yaml
trade-off-scope:
  applies-to:
    - protocol: wifi
      device-category: lighting
  excludes:
    - professional-grade devices
```

**Rule (NEW - 2026-03-30):** Document minimum required dimensions for trade-off notes — cost, reliability, flexibility, future-proofing, skill-required.
**Why:** Notes that mention only some trade-off dimensions mislead readers into thinking they've captured the full picture. Partial trade-off capture is worse than none.
**Test:** For trade-off notes >200 words: (1) Are at least 3 of 5 dimensions covered? (2) Is the dimension coverage documented in frontmatter or explicitly stated?

**Rule (NEW - 2026-03-30):** Track trade-off lifecycle — mark as active, resolved, or superseded when technology renders the trade-off obsolete.
**Why:** What was a genuine trade-off may be resolved by new technology. Stale trade-offs create confusion. The "Matter vs. HomeKit" trade-off that existed in 2021-2023 is now resolved.
**Test:** For trade-offs in technology domains: (1) Can you identify resolved trade-offs? (2) Are resolved trade-offs tagged as such? (3) Do resolved trade-offs link to the resolution?
**Implementation:** Use fields:
```yaml
trade-off-status: active|resolved|superseded
resolution-date: "YYYY-MM-DD"
resolution-note: "Brief note on how the trade-off was resolved"
superseded-by: "[[Note Name]]"
```

**Rule (NEW - 2026-03-30):** Distinguish inherent trade-offs from developable skill limitations — tag as `trade-off-type: developable` when the "trade-off" can be overcome with learning.
**Why:** False trade-offs create unnecessary hesitation. Many "it depends" situations are actually "you just need to learn this." Recognizing skill gaps empowers rather than paralyzes.
**Test:** For trade-off notes: (1) Can you identify which dimension is actually a skill gap? (2) Is there a `developable` flag on skill-based trade-offs? (3) Is there guidance on what's needed to resolve it?
**Implementation:** Add to trade-off frontmatter:
```yaml
trade-off-type: inherent|contextual|developable
developable-note: "Guidance on what's needed to resolve this skill gap"
```

---

## 13. Vault Query and Retrieval

*How to find and use knowledge in your vault for decisions.*






```yaml
reasoning-trace:
  handling: ephemeral|session-based|permanent
  extract-before-discard: true|false

# Extraction criteria — what to keep
extract-criteria:
  - reusable-strategy: "Novel reasoning approach that could apply elsewhere"
  - vault-gap: "Identified missing knowledge that would improve reasoning"
  - unexpected-connection: "Discovered note-to-note link not in graph"
  - calibration-insight: "Confidence was wrong, learn from this"

# Discard criteria — what to discard
discard-criteria:
  - user-specific: "Query context unique to this session"
  - temporary-state: "Current vault state that will change"
  - session-bound: "References to this specific interaction"
```

---

## 14. Spiritual and Religious Knowledge

*Handling knowledge from faith traditions where verification differs from empirical domains.*

**Rule:** Distinguish doctrinal claims from interpretive claims — tag religious knowledge with `religious-knowledge-type` (doctrinal|interpretive|experiential|philosophical).
**Why:** "What the tradition teaches" differs from "what this person believes the tradition means" and "what I experienced." Mixing these creates confusion about the nature and certainty of the knowledge.
**Test:** Can you identify whether this note states what the tradition teaches (doctrinal), what a specific interpreter believes (interpretive), what a person experienced (experiential), or what reasoning suggests (philosophical)?

**Rule:** Treat incommensurable frameworks as complementary, not contradictory — tag framework relationships appropriately.
**Why:** Different religious frameworks may answer different questions or use incommensurable basic concepts. "Christian cosmology contradicts Buddhist cosmology" misrepresents both — they address different questions about different things.
**Test:** Do notes about different traditions frame differences as "one is wrong" (contradictory) or as "these answer different questions" (complementary)?
**Implementation:** Use `framework-relationship: complementary|incompatible|contradictory` frontmatter.

**Rule:** Use tradition-appropriate verification for doctrinal claims — religious doctrinal claims are verified through tradition-consensus, not empirical testing.
**Why:** Religious doctrinal claims ("there is an afterlife") cannot be verified through execution. They are verified through sacred texts, recognized teachers, and tradition consensus — different verification paths than empirical claims.
**Test:** For doctrinal notes: Is verification method appropriate to how the tradition validates doctrine?
**Implementation:** Use `verification-type: tradition-consensus|scholarly|empirical|personal-experience` and `source-authority: sacred-text|recognized-teacher|tradition-body|scholarly`.

**Rule:** Tag experiential knowledge separately from doctrinal knowledge — personal spiritual experiences are valid but should not be presented as universal doctrine.
**Why:** "I experienced God's presence" is valid knowledge but fundamentally different from "Christians believe God exists." Presenting personal experiences as doctrine misleads readers about applicability.
**Test:** Can you distinguish between "Christians believe X" (doctrinal) and "I experienced Y" (experiential)?

**Rule:** Apply appropriate confidence to religious knowledge — confidence levels should be appropriate to how the knowledge functions in the tradition.
**Why:** A sacred text may have "high" confidence within its tradition that doesn't map to external verification. Domain-appropriate confidence differs from empirical calibration.
**Test:** Is confidence level appropriate to how the knowledge functions in the tradition, not just external verifiability?
**Implementation:** Use `confidence: emerging` with `confidence-basis: tradition-authority|scholarly|personal|empirical`.

**Edge case:** Mixed domains (religious history, philosophy of religion, faith healing) need combined treatment. Religious historical claims (when did the Council of Nicaea happen?) are verifiable historically. Religious ethics may be reasoned about philosophically. Faith healing claims may have safety implications requiring professional advice disclaimers.

**Edge case:** Interfaith comparative knowledge needs accuracy and respect. Each tradition should be represented fairly, not through the lens of another tradition. Different traditions have different sensitivities about how they're described.

**Edge case:** New religious movements lack established verification mechanisms. What's authoritative is still being determined. Apply knowledge ethics rules for potentially harmful movements.

---

## Knowledge Sensitivity Classification

*Handling knowledge that could cause harm if mishandled, misused, or misunderstood.*

- `sensitivity-level: none | low | medium | high | extreme`
- `sensitivity-reason: dual-use | harmful-content | personally-identifiable | misuse-potential | legal-risk`
- `access-restriction: none | vault-internal | human-only | encrypted | never-publish`




---

## Procedural Precision Tier

*Handling knowledge where precision requirements vary by context and application.*

**Rule:** For procedural knowledge, tag with `precision-tier:` to indicate tolerance requirements.
**Why:** Procedures have different precision requirements depending on what happens if they fail. A visible joint (dovetails) requires <0.5mm tolerance; a structural joint (mortise-and-tenon) accepts 1-2mm; a rough cut accepts >5mm. Without precision-tier tagging, readers cannot assess whether a procedure meets their accuracy needs.
**Test:** For procedural notes: (1) Can you identify the precision requirement? (2) Does the note specify tolerance when it matters? (3) Can readers determine if their skill level matches the procedure's precision demands?
**Values:**
- `precision-tier: visible-joint` - <0.5mm tolerance, any gap visible, requires high skill
- `precision-tier: structural` - 1-2mm tolerance, affects strength, moderate skill
- `precision-tier: rough` - >5mm tolerance, cosmetic or adjustable, beginner-friendly
**Implementation:**
```yaml
precision-tier: structural
tolerance-notes: "1-2mm gap acceptable if using epoxy fill"
skill-level-required: intermediate
```

**Rule:** Include precision-tier in safety-critical procedural domains.
**Why:** In domains like woodworking, medicine, automotive repair, precision affects safety. A poorly-cut dovetail is ugly; a poorly-set brake is dangerous. Safety-critical procedures need explicit precision requirements.
**Test:** For safety-critical procedures: (1) Is precision-tier specified? (2) Are consequences of imprecise execution documented? (3) Does the note warn when precision is critical vs. optional?

---

## Differential Knowledge Organization

> Structuring knowledge around competing possibilities when multiple hypotheses or options exist.




```yaml
differential-type: diagnostic|troubleshooting|decision|prognostic
prioritization-framework: likelihood|severity|cost|reversibility|time-urgency
common-criteria:
  - criterion: "likelihood"
    evaluation: "frequency in population/experience"
shared-criteria-source: "[[Differential Evaluation Criteria Note]]"
escalation-condition: "when single option emerges above threshold"
esclation-threshold: 0.8  # confidence threshold for narrowing
```

**Differential structure guidance:**
- **Shared criteria first:** All options should be evaluate against the same criteria
- **Document eliminated options:** Keep ruled-out alternatives with rationale (learning)
- **Threshold-based narrowing:** Only narrow when confidence crosses threshold
- **Keep differential open when:** Evidence insufficient, time-constrained, or multiple valid approaches

**Distinction from existing rules:**
- **[[Handling Contradictory Sources]]** — Source evaluation (which source is reliable), not structural organization of options
- **[[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]]** — General diagnostic approach, but doesn't cover option-set structure
- **[[Frontier Exploration - Decision-Tree Knowledge Organization]]** — Sequential choice structure, but doesn't address competing alternatives at same level


---

## Related
- [[_root|Vault root]] — Entry point demonstrating the Seed in action
- [[Schema]] — Vault frontmatter field documentation
- [[Note Insertion Strategy]] — Where to place new knowledge in the graph
- [[Note Creation Decision Framework]] — When to create a new note vs. extend an existing one
- [[Atomic Note Principle]] — One idea per note
- [[Linking Principle]] — Meaningful connections
- [[Graph Traversal Efficiency]] — Maximum 3 hops navigation
- [[Self-Improvement Cycle]] — Continuous improvement process
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — What to create first when bootstrapping, balancing breadth vs depth
- [[Frontier Exploration - Emerging Domain Bootstrapping]] — How to build a knowledge base in domains with no established conventions
- [[Handling Temporal Knowledge]] — Keeping cited sources accessible
- [[Frontier Exploration - Probabilistic Knowledge]] — Handling inherently uncertain knowledge
- [[Frontier Exploration - AI-Optimized Knowledge Bases]] — Structuring knowledge for AI agents and RAG systems
- [[Frontier Exploration - Capturing AI Prompt Knowledge]] — Structuring knowledge about AI interactions and prompts
- [[Handling Contradictory Sources]] — Handling subjective vs objective claims in creative domains
- [[Frontier Gap - Embodied Knowledge]] — Capturing knowledge that resists articulation
- [[Frontier Exploration - Emotional and Sentimental Knowledge]] — Handling knowledge with emotional/sentimental value
- [[Frontier Exploration - Sensory Knowledge Capture]] — Capturing taste, smell, texture, and other sensory experiences
- [[Frontier Exploration - Podcasting and Audio Content Knowledge Bases]] — Audio-first knowledge, temporal performance knowledge, equipment chains, and voice as a medium
- [[Handling Temporal Knowledge]] — Handling temporal, outdated, and sequential knowledge (covers time-sensitive data, stale knowledge, and knowledge where sequence is intrinsic)
- [[Frontier Exploration - Comparative Knowledge Structures]] — Structuring notes that compare approaches, tools, or methods
- [[Frontier Exploration - Knowledge Ethics and Exclusion]] — When NOT to capture knowledge for ethical/safety reasons
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]] — When knowledge becomes advice requiring disclaimers
- [[Frontier Exploration - Equipment and Tool Dependencies]] — Documenting physical tools required to execute knowledge
- [[Frontier Exploration - Troubleshooting and Diagnostic Knowledge]] — Handling if-then branches and decision trees
- [[Frontier Exploration - Myths, Misconceptions, and Folk Knowledge]] — Distinguishing widely-believed but unverified claims from evidence-based facts
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — Handling knowledge that's only appropriate at certain skill levels
- [[Frontier Exploration - User Situational Constraints]] — Handling knowledge constrained by time, budget, equipment access, and other user situations
- [[Types of Applicability Boundaries]] — Documenting when knowledge DOESN'T apply — edge cases, limitations, and known failure contexts
- [[Frontier Exploration - Threshold Knowledge]] — Capturing categorical transitions and the moments when states change
- [[Seed Stress Test - Legal Knowledge Bases]] — Handling legal confidentiality, authority status, and jurisdiction complexity (merged from Frontier Exploration)
- [[Frontier Exploration - Knowledge Maintenance]] — Managing maintenance burden, volatile knowledge, and evolving understanding
- [[Handling Temporal Knowledge]] — Systematically detecting when knowledge has become outdated
- [[Frontier Exploration - Musical Arrangement Knowledge]] — Handling cyclic-branching knowledge where elements repeat with variations
- [[Frontier Exploration - Knowledge Context Frames]] — Handling purpose-specific knowledge presentations
- [[Frontier Exploration - Visual Literacy and Aesthetic Evaluation Knowledge]] — Capturing visual judgment in photography, design, and creative arts
- [[Frontier Exploration - Trade-off Knowledge Capture]] — Capturing权衡 (trade-offs), competing priorities, and contextual decision-making
- [[Frontier Exploration - Adaptation and Transcoding Knowledge]] — Transforming knowledge between representations (arrangement, transcription, porting)
- [[Frontier Exploration - Spiritual and Religious Knowledge]] — Handling doctrinal, interpretive, and experiential knowledge from faith traditions where verification differs from empirical domains

### Seed Stress Tests
- [[Seed Stress Test - Craft Knowledge Bases]] — Comprehensive stress testing of all Seed rules in cooking domain
- [[Stress Test - Equipment Dependencies Rule Across Domains]] — Testing equipment dependencies across multiple domains (automotive, music production)
- [[Stress Test - Seed Rules in Programming Knowledge Bases]] — Testing Seed rules against software development domain challenges
- [[Seed Refinement - 3-Hop Rule Medical Domain]] — Refining the 3-hop rule for medical knowledge bases with natural taxonomies
- [[Seed Refinement - Evaluative Knowledge in Creative Domains]] — Adding rule for craft criticism vs aesthetic judgment distinction
- [[Stress Test - Atomicity Rule Across Domains]] — Testing atomicity across multiple domains including astronomy with observatory and equipment dependencies
- [[Frontier Exploration - Amateur Astronomy Knowledge Bases]] — Specialized challenges of astronomy knowledge: equipment dependencies, location sensitivity, pattern recognition
- [[Frontier Exploration - Tool-Interface Knowledge]] — Handling keybindings, menu paths, and API endpoints
- [[Seed Stress Test - 5-1 Ratio Across Domains]] — Testing 5:1 personal-to-general ratio across multiple domains
- [[Seed Gap - Code-Switching and Translanguaging]] — New gap: handling code-switching and translanguaging in multilingual knowledge bases
- [[Seed Gap - Multi-Modal Knowledge Organization]] — New gap: organizing knowledge across text, image, audio, video, and code modalities
- [[Seed Gaps - Domain-Specific Extensions]] — Consolidated domain-specific gaps and proposed refinements for finance, education, music, tax, language, and workshop crafts (merged from 6 Seed Gap notes)
- [[Seed Stress Test - Mathematics Knowledge Base]] — Testing Seed rules in mathematics domain
- [[Seed Stress Test - Stub Notes Rule in Mathematics Knowledge Base]] — Testing stub notes rule in mathematics
- [[Frontier Gap - Embodied Knowledge]] — Testing diminishing returns rule in photography
- [[Stress Test - Knowledge Activation States in Medical Knowledge]] — Testing knowledge activation states in medical domain
- [[Stress Test - Last-Reviewed Rule in Historical Knowledge]] — Testing last-reviewed rule for historical knowledge
- [[Stress Test - Thinking Tools Rule in Meditation Mindfulness Knowledge Base]] — Testing thinking tools rule in meditation
- [[Seed Stress Test - Gardening Knowledge Base]] — Testing long-horizon verification, climate specificity, and seasonal knowledge rules
- [[Seed Stress Test - Diminishing Returns Rule Across Domains]] — Testing diminishing returns across Medical, ML/DS, and Board Game Design domains
- [[Seed Stress Test - Construction Phase Model in Music Composition]] — Testing construction phase rules in sequential-skill domains (merged with language learning test)
- [[Seed Stress Test - Philosophy Knowledge Base]] — Testing humanities concepts, contested knowledge, and historical development
- [[Seed Gaps - Domain-Specific Extensions]] — Gaps in handling fiscal year organization (consolidated from multiple domain-specific gap notes)
- [[Seed Rule Proposal - Personal Experimentation Tracking]] — Proposed rule for tracking personal experiments
- [[Seed Stress Test - Decision Threshold Rule in Software Architecture]] — Testing decision thresholds in technical domains
- [[Seed Stress Test - Veterinary Medicine Knowledge Base]] — Testing Seed rules in medical domain

- [[Seed Gap - Functional Threshold for Knowledge Bases]] — ✅ RESOLVED (2026-04-01): Merged into Seed Gap - Knowledge Base Completion Thresholds; MVKB criteria integrated into Seed
- [[Seed Gap - Multi-Vault Migration Knowledge]] — New gap: migration between vaults, platform transitions, and vault merging

- [[Frontier Exploration - Crisis and Emergency Response Knowledge]] — Handling time-critical, high-stakes knowledge requiring single-view retrieval and panic-optimized formatting
- [[Frontier Exploration - Legal Knowledge Base Gaps]] — Testing Seed rules against legal domain challenges: jurisdiction hierarchy, authority levels, legal information vs. advice boundary

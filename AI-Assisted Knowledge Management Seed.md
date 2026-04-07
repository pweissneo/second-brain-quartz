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

**Rule:** Establish 3 foundational convention notes before adding content — covering atomicity, linking, and navigation.
**Why:** Conventions defined early prevent inconsistency; retrofitting is expensive.
**Test:** Do convention notes exist? Do the 10 most recent notes reference or follow them?

**Rule:** Include a machine-readable config file (`.mcp.json` or equivalent) for AI tooling.
**Why:** AI agents need graph navigation tools to evaluate and improve the vault programmatically.
**Test:** Does the config file exist? Can an AI agent query the graph structure?

**Rule (NEW - 2026-04-03):** Tag notes by primary access pattern and create use-case-specific entry points for reference-optimized lookup.

**Why:** The same knowledge needs different organization depending on whether someone is learning, looking up a fact, making a decision, or seeking inspiration. Default organization assumptions hurt specific use cases.

**Test:** (1) Can you filter notes by access-pattern tag? (2) Does the vault have reference indexes for lookup use cases? (3) Are learning paths available for understanding use cases? (4) Are decision trees available for choice-making use cases?

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

**See also:** [[Seed Gap - Access-Pattern-Aware Knowledge Organization]] (gap now integrated)
**Why:** Folders impose hierarchy that constrains discovery; links create organic, multi-dimensional structure.
**Test:** Are all notes in a single directory? Are connections made via `[[Wikilinks]]`, not folder paths?
**Edge case (stress test 2026-04-02):** In domains where the knowledge itself has inherent hierarchical structure (legal codes, technical standards, regulatory frameworks, academic curricula), pure flat-file organization loses important context. Apply modified approach:
- **Flat files still:** All notes in single directory
- **Hierarchical metadata:** Use frontmatter to encode structural relationships (`jurisdiction:`, `rule-number:`, etc.)
- **Structured wikilinks:** Allow `[[Parent/Child]]` pattern for encoding hierarchy in links
- **Faceted retrieval:** Use tags for multi-dimensional classification
- **Test:** For hierarchical domains: (1) Does frontmatter capture structural relationships? (2) Can you reconstruct hierarchy from metadata? (3) Do wikilinks encode parent-child relationships? (4) Is retrieval efficient without folder navigation?

**Rule:** Ignore generated files — never commit cache, logs, or build artifacts.
**Why:** Generated files bloat the repository and cause merge conflicts.
**Test:** Does `.gitignore` exclude cache directories, logs, and build output?

**Rule (NEW - 2026-04-04):** Exclude workspace system files from the vault — files like AGENTS.md, SOUL.md, USER.md, IDENTITY.md, TOOLS.md, HEARTBEAT.md are operational, not content.
**Why:** System files bloat the vault and create noise in structural analysis. They are not knowledge base content — they are workspace operational files that happen to have .md extension.
**Test:** Verify AGENTS.md, SOUL.md, USER.md, IDENTITY.md, TOOLS.md, HEARTBEAT.md are NOT in the vault directory. Check that they exist in workspace state/ or other operational location instead.

**Rule:** Use consistent note naming — descriptive noun phrases, title case, kebab-case for filenames.
**Why:** Inconsistent naming hurts search accuracy and graph readability.
**Test:** Do note titles follow a consistent pattern? Can you predict a new note's title?
**Edge case:** Domain-specific abbreviations (MRI, ECG) are acceptable when they are standard terminology.

**Additional naming guidance:** Avoid "How to..." prefixes (use noun phrases), avoid dates in titles, avoid version numbers (v1, v2) — these create noise and reduce searchability.

**Edge case (stress test 2026-03-21):** Equipment-heavy domains (photography, audio engineering, computing) need modified conventions:
- **Product model numbers** (A7IV, R5, Z6II, UAD Apollo) are acceptable as-is when they represent standard product identifiers
- **Technical notation** (50mm, f/2.8, 24-70mm) uses standard notation rather than full expansion

> See [[Frontier Exploration - Domain Jargon vs Plain Language]] for comprehensive guidance on terminology handling.

- **Sub-conventions** may exist: concepts use noun phrases, equipment uses model numbers, techniques use action-object pattern
- **Test:** Pick 5 random notes. Do they follow consistent internal convention? Can you predict the next note's naming pattern within its category?

**Rule:** Distinguish conceptual notes from procedural content — atomicity applies to ideas, not to executable workflows.
**Why:** Recipes, code samples, and technical specs must stay together for usability, even when >300 words. Splitting them breaks the workflow.
**Test:** For notes >300 words: (1) Is this an executable procedure? (2) Would splitting make it harder to use? (3) Are parts independently reusable? Keep together if yes to 1-2; split if yes to 3.
**Edge case (stress test 2026-03-30):** For safety-critical procedural knowledge (aviation checklists, emergency medicine protocols, critical infrastructure operations), keep complete procedures together even if >300 words. Split ONLY if parts are independently executable AND safety-independent. The risk of fragmented safety procedures outweighs reusability benefits.
**Edge case:** Recipes, code samples, and technical specs must stay together for usability, even when >300 words. Splitting them breaks the workflow.

**Rule (NEW - 2026-04-03):** Define and apply a Knowledge Type Taxonomy — classify every note by its primary knowledge type and apply type-specific storage, retrieval, and verification rules.
**Why:** Knowledge types are fundamental — they determine how knowledge should be captured, organized, verified, and retrieved. Without explicit type taxonomy, AI agents must infer these distinctions imperfectly, leading to suboptimal knowledge base structure. Type-aware organization enables retrieval optimization for realistic use cases.
**Test:** (1) Can you classify each note by knowledge type (procedural/conceptual/factual/experiential/relational/meta)? (2) Does each type follow type-specific organization? (3) Can you answer "what knowledge type answers this question?" for 5 common queries? (4) Are retrieval paths optimized for the knowledge type's natural query pattern?

**Knowledge Type Definitions:**
| Type | Description | Storage Pattern | Retrieval Mode | Verification Approach |
|------|-------------|-----------------|---------------|---------------------|
| Procedural | How to do something | Sequential, complete workflows | Sequential browse | Empirical (does it work?) |
| Conceptual | Understanding why | Atomic, highly linked | Cross-reference search | Logical consistency |
| Factual | Discrete facts/data | Compact, reference-linked | Exact-match search | Source reliability |
| Experiential | Personal experience | Context-rich, reflection-linked | Browse + temporal | Self-consistency |
| Relational | Relationships between things | Network, bidirectional links | Graph traversal | Logical relationships |
| Meta-Knowledge | Knowledge about knowledge | Principles + examples | Hybrid search+browse | Self-referential |

**Implementation:**
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

**Why:** Clock-time alone is insufficient for many procedural domains. Process-state recognition (visual, tactile, auditory cues) is more reliable and transferable than fixed durations. Without explicit guidance, AI agents default to clock-time-only documentation, missing the intuition knowledge that makes procedures robust across conditions.

**Test:** For procedural notes with time components: (1) Can you identify both clock-time AND process-state indicators? (2) Are process states described in recognizable terms (visual, tactile, auditory)? (3) Would a domain practitioner recognize the process state descriptions?

**Implementation:**
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

**See also:** [[Frontier Exploration - Temporal Intuition Knowledge]] — Original gap documentation
**See also:** [[Seed Refinement - Process-State Temporal Knowledge]] — Refinement tracking

**Rule (NEW - 2026-04-05):** For creative-aesthetic hybrid domains, add `knowledge-intent:` tagging to distinguish technical execution from aesthetic intent.
**Why:** In creative domains (audio production, visual arts, creative writing, photography), the same technique can serve different purposes — some verifiable (technical correctness), some subjective (aesthetic judgment). Without intent tagging, AI agents optimize for technical correctness while missing the artistic dimension. Aesthetic decisions sometimes intentionally break technical rules, and this should be explicit.
**Test:** (1) Can you filter notes by knowledge-intent (technical/aesthetic/hybrid)? (2) For aesthetic notes, does verification acknowledge subjectivity? (3) Do hybrid notes link to both technical basis and aesthetic rationale?

**Implementation:**
```yaml
knowledge-intent: technical|aesthetic|hybrid
# For hybrid notes (technical means to aesthetic ends):
aesthetic-basis:
  - technical-principle: "[[Technical Note]]"
  - aesthetic-intent: "what this achieves"
  - when-to-break: "conditions where rule should be deliberately bent"
```

**See also:** [[Seed Gap - Knowledge Type Taxonomy and Retrieval Optimization]], [[Seed Refinement - Technical vs Aesthetic Knowledge in Creative Domains]]

**Rule:** Organize creative composition knowledge (recipe design, artistic creation, creative writing craft) as principles connected to examples, not as standalone procedures.
**Why:** Composition knowledge is about relationships between elements that can be recombined. Organizing by principles creates reusable frameworks; organizing by specific outputs creates collections that don't transfer. Technical procedures stay together as atomic units; composition principles should be broken into reusable components.
**Test:** For notes about creative composition: (1) Does this express a principle that could apply to multiple creations? (2) Does it connect to examples showing the principle in action? (3) Could someone use this to create something new? If yes to 1 and 2, organize as principle+examples; if yes to 3, it's a reusable component, not a single-use procedure.
**Edge case:** Specific creative works with unique value (family recipes, signature dishes, original compositions) should remain as specific notes but link to the compositional principles they embody.

**Rule (NEW - 2026-03-29):** For creative project knowledge bases (albums, films, novels, games, podcasts), structure notes around project phases and iteration tracking — phase transitions, abandoned directions, deadline trade-offs, and cross-project retrospective capture.
**Why:** Creative output differs from procedural or factual knowledge. Phases are non-linear (mixing triggers re-recording), decisions are subjective ("done" is judgment), and abandonment is normal process, not failure. Without project-phase structure, vaults lose critical creative judgment knowledge that the Seed's general rules don't capture.
**Test:** For creative project knowledge base: (1) Can you identify which iteration a note belongs to? (2) Are phase transition rationales documented? (3) Is abandoned direction stored with learning (not deleted)? (4) Are deadline trade-offs explicit? (5) Is cross-project retrospective captured?
**Implementation:** Use `project-type:` (album|film|novel|game|podcast), `project-phase:` (concept|pre-production|production|post|release|retrospective), `iteration:` frontmatter on project notes. On abandoned direction notes, use `abandoned-direction: true` with `abandonment-rationale:` and `replaced-by:` links. Store phase transition rationales and deadline trade-offs as explicit decision notes.
**Phase structure:** Concept → Pre-production → Production → Post-production → Release → Retrospective. Allow non-linear transitions (rewriting is normal, not failure). Store abandoned directions with rationale — "why abandoned" is learning.
**See also:** [[Seed Gap - Creative Project Phase Knowledge]], [[Frontier Exploration - Interactive Narrative Knowledge]]

**Rule:** Prioritize foundational concepts before applications when bootstrapping a new vault.
**Why:** Without prioritization guidance, agents face analysis paralysis. Foundations (prerequisites, core terminology, high-connectivity nodes) should exist before specialized content.
**Test:** Can you identify 5+ foundational notes that other notes depend on? Are they created early in the vault's history?

**Rule (NEW - 2026-04-06):** Apply domain-aware capture sequence during bootstrap — capture in order: (1) Safety-critical knowledge (what could cause harm), (2) Core principles and essential techniques, (3) Materials and tools, (4) Standard procedures, (5) Advanced applications.
**Why:** The Seed covers what to capture and when to create notes but provides no guidance for determining capture SEQUENCE in unfamiliar domains. Without explicit sequencing, agents default to encounter-order or interest-driven capture, producing suboptimal vault structures where safety knowledge is delayed, foundations are mixed with applications, and the graph develops in the wrong order.
**Test:** For a new domain bootstrap: (1) Can you identify the first 5 concepts to capture in the correct phase order? (2) Does safety-critical knowledge come before applications? (3) Can you explain WHY that sequence? (4) When do you switch from "building foundations" to "filling gaps"? (5) Is the 50/30/20 bootstrap allocation (foundations/applications/exploration) applied?

**Rule:** Balance exploration (adding new topics) and deepening existing ones based on vault maturity — new vaults favor exploration (70/30), mature vaults favor exploitation (80/20).
**Why:** Pure exploration creates shallow vaults with many thin topics; pure exploitation creates stagnant vaults that miss valuable new domains. Explicit balance ensures both breadth and depth grow healthily.
**Test:** Can you categorize your recent capture activity as primarily exploration or exploitation? Is the ratio appropriate for your vault's maturity (new <50 notes = exploration, mature >200 notes = exploitation)?
**Implementation:** Use frontmatter to track vault phase:
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
**Why:** Note-level exploration/exploitation balance is insufficient when vaults contain many domains with different maintenance needs. Without domain-level tracking, portfolio percentages are aspirational targets with no mechanism. Maintenance defaults to recency bias and interest drift, causing domains to starve or overgrow.
**Test:** (1) Can you calculate current allocation percentages by domain? (2) Does each domain stay within 15% variance of its portfolio target? (3) Is there a rebalancing protocol when variance threshold is exceeded? (4) Can you estimate maintenance burden by domain (verification frequency, decay rate)?
**Implementation:** Track domain allocation in frontmatter or separate config:
```yaml
domain-allocation:
  woodworking:
    target: 0.30
    current: 0.38
    variance: +0.08
    status: over-allocated
    maintenance-burden: high  # based on domain velocity
  philosophy:
    target: 0.15
    current: 0.08
    variance: -0.07
    status: under-allocated
    maintenance-burden: low
```
**Rebalancing triggers:** (1) Any domain >15% variance for >30 days, (2) Total verification backlog exceeds threshold, (3) New domain emerges requiring allocation decision, (4) Domain marked dormant/abandoned.
**Rebalancing methods:** (1) Process more notes from under-allocated domain, (2) Pause processing in over-allocated domain, (3) Mark domain as dormant if no longer relevant.
**See also:** [[The Knowledge Portfolio]], [[Seed Gap - Domain-Level Resource Allocation]], [[Frontier Exploration - Knowledge Maintenance]]
**See also:** [[Frontier Exploration - Exploration Exploitation Transition Triggers]] for detailed phase transition criteria

**Rule (NEW - 2026-03-22):** Systematically identify knowledge gaps and prioritize filling them — use prerequisite audits, retrieval failure tracking, graph topology analysis, and contested topic scans.
**Why:** The Seed tells you how to manage existing knowledge (when to merge, split, verify) but not how to identify what's missing. Without gap identification, vaults accumulate based on what capture agents find interesting rather than what the vault needs. This creates coverage illusions where obvious gaps go unnoticed.
**Test:** (1) Can you identify prerequisite gaps (undefined wikilinks to non-existent notes)? (2) Do you track retrieval failures (queries returning insufficient results)? (3) Does graph analysis find high-centrality nodes with poor connectivity? (4) Do you scan for contested topics with only one perspective? (5) Is there an explicit gap prioritization framework (impact × 1/effort)?
**Implementation:** Run gap audits monthly: (1) Prerequisite audit — scan for wikilinks to missing notes, (2) Retrieval failure log — track search queries with <2 satisfactory results, (3) Graph topology — find nodes with high centrality but low outgoing links, (4) Contested scan — find consensus-level: mainstream on potentially debated topics. Prioritize gaps by impact (blocking/useful/nice-to-have) × inverse effort.
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
**Why:** The same problem type appears in every domain but with domain-specific implementations. Without explicit problem-centered structure, this cross-cutting knowledge is invisible and users must rediscover universal patterns in each new domain. The Seed covers thinking tools but doesn't explicitly address organizing problem-solving knowledge across domains.
**Test:** Can you navigate from any domain note about a problem (debugging, deciding, assessing risk) to a universal problem-solving hub? Do domain-specific implementations link to the hub rather than existing in isolation?
**Implementation:** Use frontmatter to tag problem-type:
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

**See also:** [[Frontier Exploration - Problem-Centered Knowledge Organization]]

**Rule (NEW - 2026-03-26):** For knowledge that depends on visual representation (diagrams, charts, maps, architectural drawings, genealogical charts, molecular structures, musical notation, engineering schematics), include visual format alongside text explanation. For other knowledge, default to text unless visual clearly adds value.
**Why:** Some knowledge conveys information through spatial, structural, or visual relationships that text cannot capture equivalently. Converting visual knowledge to text loses essential structure. However, visual formats add maintenance burden (format migration, accessibility, searchability), so they should not be the default.
**Test:** (1) Does this knowledge depend on spatial or structural relationships that text cannot capture? (2) Would a visual representation make this understandable in under 10 seconds? (3) Is there an established visual standard for this domain (flowcharts, UML, family trees, circuit diagrams)? If yes to any, include visual format. Otherwise, default to text.
**Implementation:** Use frontmatter to track visual knowledge:
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

**See also:** [[Frontier Exploration - Visual Knowledge Representation in Knowledge Bases]]

**Edge case (stress test 2026-03-26):** In software architecture knowledge bases, system diagrams communicate structural information that text cannot. Apply this rule for: architecture diagrams, sequence diagrams, ER diagrams, class diagrams, data flow diagrams. Document what each visual element represents in accompanying text.

**Edge case (stress test 2026-03-26):** In genealogy knowledge bases, family trees are inherently visual. Apply this rule to: family trees, ancestor charts, relationship diagrams. Include text equivalents for searchability but preserve visual format.

**Edge case:** In mathematics and logic, notation and graphs convey meaning textually but have visual components (geometric figures, graphs, diagrams). Include visual elements when they are standard notation in the field.

**Edge case:** Visual knowledge creates accessibility barriers. For vaults that must serve screen-reader users, prioritize text alternatives and describe visual relationships in text. Use `visual-accessibility: full|partial|text-only` frontmatter.

**Edge case:** Visual formats have migration risk. If the vault may move platforms, export visuals to portable formats (SVG over PNG, standard notation over proprietary). Document visual dependencies in frontmatter.

**Edge case:** Visual search is limited. Text-based search cannot find content within images. For visual-heavy knowledge, include searchable text summaries or descriptions.

**See also:** [[Frontier Exploration - Visual Literacy and Aesthetic Evaluation Knowledge]] (different angle on visual content)
**See also:** [[Frontier Exploration - Multi-Modal Knowledge]] (broader multi-modal capture)

**Edge case (stress test 2026-03-26):** In safety-critical domains (home repair, automotive, medical, electrical, woodworking with power tools), gap identification must account for safety-specific gaps that are invisible to standard graph analysis. Safety gaps include: missing contra-indications, outdated safety warnings (historical sources predate modern equipment), missing PPE requirements, absent escalation guidance, and incomplete emergency procedures.

Apply safety gap detection: specifically audit for (1) safety-warning frontmatter on procedural notes, (2) contra-indication sections in safety-critical notes, (3) historical sources lacking modern safety information, (4) missing escalation/emergency guidance, (5) outdated equipment-specific safety (tools have changed since source was written). Tag safety gaps with `safety-gap-type:` (missing-warning|outdated-warning|missing-ppe|missing-escalation|equipment-specific) and `safety-review-required: true`.
**70-20-10 allocation:** Mature vaults should allocate 70% gap-filling, 20% verification/depth, 10% exploration. This inverts the bootstrap ratio because maintenance mode means filling known gaps rather than discovering new domains.
**See also:** [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] (gap identification merged)

**See also:** [[Seed Gap - Safety Review for Historical Sources]] (safety gap identification from historical sources)

**See also:** [[Seed Gap - Sensory Anchor Standardization]] (sensory cue standardization for embodied knowledge)

**Rule (NEW - 2026-04-07):** For temporally-sequential knowledge (music, dance, process workflows, recipe procedures, creative project phases), allow sequential organization as an alternative to atomic decomposition when splitting would destroy essential context.
- **Why:** Some knowledge is intrinsically ordered — the sequence IS the knowledge. Breaking it into atomic pieces loses the very thing being captured.
- **Test:** (1) Does this knowledge have intrinsic temporal ordering that defines its meaning? (2) Would splitting into atomic notes lose essential context or flow? (3) Is the sequence itself the knowledge being captured? If yes to 1 AND (yes to 2 OR 3), keep sequential.
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

**See also:** [[Seed Stress Test - Gap Identification Rule in Cooking]]

**Rule:** Use construction-phase model to guide structural decisions — apply relaxed standards during bootstrap, tighten as vault matures.
**Why:** The Seed's rules assume a mature vault with existing structure. During construction (first 50 notes), early structural decisions create the foundation. Relaxing rules temporarily while tracking phase enables better decisions; tightening later ensures quality. Without explicit phases, early mistakes compound.
**Test:** Can you identify the vault's construction phase? For vaults <50 notes: Is orphan rate tracked? Are structural decisions being evaluated? Is there a plan to tighten rules after bootstrap?
**Implementation:** Use `construction-phase:` frontmatter with values: skeleton (1-20 notes), flesh (20-100), muscle (100-200), maturity (200+). Apply relaxed thresholds during the bootstrap period (first 50 notes), not just during skeleton phase:
- Minimum links: 1 instead of 2
- Hop depth: 4 instead of 3  
- Note size: 50+ words instead of 100+
- Hub threshold: 3 notes instead of 5
**Transition rule:** At 50 notes, evaluate: (1) Orphan rate <20%? (2) Can all notes reach root in ≤4 hops? (3) Do major domains have hub notes? If any fail, refactor before continuing growth. After transition, apply full Seed rules for the flesh phase (20-100 notes).

**Rule:** Define explicit construction completion criteria — declare construction complete when orphan rate <10%, core domains have hubs, verification ratio >50%, schema is stable (60+ days), and compliance score >85%.
**Why:** Without explicit completion criteria, vaults stay in construction mode indefinitely (never tightening quality standards) or switch to maintenance too early (leaving structural gaps). Explicit criteria enable intentional phase transitions.
**Test:** Run: orphan_rate()<10% AND hub_coverage()>=80% AND verification_ratio()>50% AND schema_stable_days()>60 AND compliance_score()>85%. If all true, transition to maintenance mode. If any false, continue construction until criteria met.
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

**Rule:** Capture structural trade-offs as explicit knowledge notes when making vault organization decisions.
**Why:** Trade-off knowledge (what you gain vs. lose when choosing one approach) is fundamentally different from knowledge about the approaches themselves. Without explicit capture, vault organization decisions become invisible and unreviewable, leading to repeated mistakes and inability to learn from past choices.
**Test:** Can you identify 3+ structural trade-offs you've made in organizing this vault? Are they documented as notes or in frontmatter?
**Implementation:** Use frontmatter to track trade-offs:
```yaml
trade-off-category: organization|verification|atomicity|structure
trade-off-type: gain-lose|either-or|compromise
description: "What you gain vs. lose"
rationale: "Why this trade-off was chosen"
revisit-when: "When to reconsider this decision"
```
**Examples:**
- Organizing by technique vs. by cuisine: gain (easy technique lookup), lose (meal planning harder)
- High verification threshold (70%): gain (reliable knowledge), lose (slower capture)
- Strict atomicity: gain (reusable components), lose (context fragmentation)

**Rule:** Design intentional metadata schema for the vault — document frontmatter fields, naming conventions, and taxonomy structure.
**Why:** Without explicit schema design, notes get inconsistent metadata, tags explode混乱, and AI agents can't reliably query the vault. Schema is the meta-layer that makes knowledge queryable.
**Test:** (1) Does a Schema.md or _schema.md note exist? (2) Does it document all frontmatter fields in use? (3) Can an AI agent infer metadata expectations from it?

**Rule:** Start with minimal schema (3-5 fields), add fields only when needed — resist over-engineering early.
**Why:** Over-engineered schema creates adoption friction. Notes go unwritten because metadata feels burdensome. Minimal viable schema enables capture; enrichment comes as needs emerge.
**Test:** For vaults <50 notes: Are there 5 or fewer frontmatter fields in active use? For vaults >200 notes: Has schema been evaluated for needed additions?

**Rule:** Use controlled vocabularies for taxonomy tags — define exact strings with documented meanings.
**Why:** Free-form tags create chaos (`ai`, `a.i.`, `AI`, `artificial-intelligence`, `machine-learning`). Controlled vocabularies enable reliable queries and prevent tag explosion.
**Test:** (1) Is there a Taxonomy.md or _tags.md note? (2) Do tags follow naming conventions (kebab-case, singular)? (3) Can you find 3+ similar tags that should be consolidated?

**Rule:** Include schema version in frontmatter — track which schema version each note uses.
**Why:** Schema evolves over time. Notes from 2024 may use different fields than notes from 2026. Version tracking enables backward compatibility and migration planning.
**Test:** Does frontmatter include `schema-version:` or similar? Can you determine which notes use which schema version?

**Rule:** Review schema quarterly for field usage — remove unused fields, consolidate similar ones.
**Why:** Unused fields create noise. Fields added "just in case" often go unused. Regular review keeps schema lean and purposeful.
**Test:** (1) Can you identify fields used on <10% of notes? (2) Are there fields with inconsistent values? (3) Has schema been reviewed in the last 90 days?

**Edge case (NEW - 2026-03-18):** New vaults need minimal schema (purpose, tags, last-updated). Mature vaults need more structure (confidence, verification-status, lifecycle, knowledge-type). High-stakes domains need domain-specific fields (jurisdiction, criticality, source-quality). Scale schema with vault maturity, not before.

**Edge case (NEW - 2026-03-18):** Multi-domain vaults need schema that accommodates domain-specific fields without forcing them on all notes. Use optional extended fields: base schema applies to all notes, domain-specific fields apply only when relevant. Example: `jurisdiction:` only for legal notes, `cuisine-region:` only for cooking notes.

**Rule:** For vaults built for other people (clients, family, users), document explicit user context assumptions in frontmatter.
**Why:** Building a knowledge base for yourself vs. building for others are fundamentally different tasks. When you don't know the user's context, expertise level, or goals, generic structures may fail. Without explicit assumption documentation, the vault lacks the context needed for appropriate navigation and use.
**Test:** For vaults intended for other users: (1) Does frontmatter include `target-user-description:` or similar? (2) Are assumptions about user expertise documented? (3) Are there multiple entry points for different user contexts (beginner, intermediate, advanced)? (4) Does the vault include explicit onboarding guidance?
**Implementation:** Use frontmatter:
```yaml
kb-purpose: client-facing|family|teaching|personal-reference
target-user-expertise: beginner|intermediate|advanced|variable
target-user-description: "Free-text description of intended user"
assumed-context:
  expertise-level: beginner|intermediate|advanced|variable
  terminology-preference: technical|plain|both
```
**Edge case:** When building KBs for unknown future users (estate planning, organizational handover), include extensive self-documentation since context cannot be verified.

**Rule:** For infrastructure-dependent domains (home automation, networking, IoT, energy systems), treat infrastructure configuration as a first-class dependency.
**Why:** In domains where knowledge depends on specific hardware, network setups, or physical infrastructure, generic rules fail. A home automation config on Zigbee differs fundamentally from Z-Wave; solar knowledge depends on grid-tie vs off-grid. Without explicit infrastructure tagging, knowledge becomes untransferable and potentially dangerous (applying wrong config knowledge causes real-world failures).
**Test:** For infrastructure-dependent notes: (1) Does frontmatter include `infrastructure-type:` (network|hardware|geographic|power|configuration)? (2) Can you identify what specific configuration this knowledge depends on? (3) Is there a separation between general principles and config-specific tweaks?
**Implementation:** Use fields:
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

**Why:** Woodworking, metalworking, and other craft domains have explicit equipment tiers that dramatically affect what techniques are accessible. Without explicit equipment-tier tagging, notes assume a tier (often professional), beginners can't assess applicability, and technique adaptations for different tiers are undocumented.

**Test:** For craft domain notes about techniques: (1) Does frontmatter include `equipment-tier:` or `equipment-tiers-required:`? (2) Can a reader determine if the technique applies to their workshop? (3) Are tier adaptations documented when relevant?

**Implementation:** Use fields:
```yaml
equipment-tier: home-workshop  # professional | home-workshop | hand-tools-only | minimal
equipment-tiers-required:
  - circular-saw
  - hand-planes
equipment-tiers_optional:
  - jointer
  - planer
applicability-transferability: medium
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

**See also:** [[Seed Gap - Sensory Anchor Standardization]] (sensory cue standardization for embodied knowledge)

**Edge case (stress test 2026-03-17):** In sequential-skill domains (language learning, music, mathematics, programming) where knowledge has strict prerequisite chains, the construction phase thresholds need modification:
- **Extended skeleton phase:** Language learning vaults may need 75-100 notes in skeleton phase because foundational vocabulary (100+ essential words) is required before basic communication is possible.
- **Allow hop depth up to 6:** Prerequisite chains in sequential domains naturally exceed 4 hops (e.g., Alphabet → Sounds → Pronunciation → Accent Marks → Stress Rules → Advanced Pronunciation). Allow up to 6 hops for genuine learning progressions.
- **Track phase by knowledge type:** Vocabulary, grammar, and practice resources have different structural needs. Track construction phase separately for each knowledge type rather than globally.
- **Directional orphan tolerance:** Foundation notes in sequential domains may legitimately have no incoming links (prerequisites that everything else builds FROM). Distinguish outbound orphans (problematic) from inbound orphans (acceptable for foundations). Use `foundational: true` tag to exempt from inbound-orphan detection.
- **Form-specific hub tracking:** In music composition, different musical forms (sonata, rondo, theme-and-variations, fugue, symphony) represent major structural categories that require separate hub tracking. Each form has its own vocabulary, conventions, and compositional techniques. Track hub creation within each form type separately during construction.

**Rule (NEW - 2026-04-01):** For knowledge domains organized around sequential processing chains where each stage transforms the output of the previous, tag notes with `chain-position:` frontmatter to indicate where in the chain the knowledge applies.
**Why:** Sequential chain domains (audio engineering, photography, manufacturing, video production) have knowledge that depends on processing stage. Early stages (input, capture) affect everything downstream; late stages (output, delivery) only affect final output. Without chain position tagging, position-dependent rules are indistinguishable from generic advice.
**Test:** (1) Can you filter notes by chain position (input, capture, correction, enhancement, space, output)? (2) Does position-dependent knowledge include position metadata? (3) Can you identify which rules have wide vs. narrow impact radius?
**Implementation:**
```yaml
chain-position: input|capture|correction|enhancement|space|output
chain-stage-number: 1  # position in sequence
impact-radius: early-stage|mid-stage|late-stage|full-chain
```
**Impact radius:** Early-stage rules affect everything downstream (wide impact); late-stage rules only affect final output (narrow impact). This distinguishes "use EQ before compression" (correction stage, affects enhancement and output) from "leave headroom for mastering" (output stage, only affects final output).
**Edge case (multi-path chains):** Some domains have branching paths. Use `chain-structure: linear|branching|parallel` and document alternative paths in frontmatter.
**Edge case (feedback loops):** Some processing has feedback where output affects earlier stages. Tag with `feedback-loop: true` and specify which stage receives feedback.

**Rule (NEW - 2026-03-22):** For personal finance budgeting knowledge (cash flow, expenses, savings goals), store transaction data separately from knowledge insights — use dedicated data structures for raw transactions and capture frameworks, methodologies, and patterns as notes.
**Why:** Personal finance involves hundreds of transactions per year that are repetitive and best analyzed programmatically. The knowledge is in the frameworks (budget methodology, category definitions, goal tracking, pattern insights), not in individual transaction records. Storing every purchase as a note creates bloated vaults that lose signal in noise.
**Test:** For personal finance notes: (1) Are raw transactions in a database/spreadsheet with insights captured as notes? (2) Do category notes define hierarchy and rationale? (3) Do goal notes include rationale, timeline, and adjustment history? (4) Is recurring income/expense documented separately from one-time events?
**Implementation:** Use frontmatter for budget knowledge:
```yaml
knowledge-type: budgeting|category|goal|recurring|period-review
budget-scope: personal|household|business
privacy-level: personal|confidential
contains-sensitive-data: true  # for any financial detail
export-excluded: true  # exclude from vault exports
```
**Privacy rule:** Personal finance data should be excluded from vault exports and stored encrypted. Only insights, frameworks, and methodologies belong in the knowledge graph — not account numbers, transaction amounts, or balances.
> This rule was incorporated from an archived Seed Gap note (now archived).

**Rule:** Track vault growth velocity and maintain verification ratio — a healthy vault verifies at least 50% of new captures within 30 days.
**Why:** Without velocity tracking, vaults accumulate faster than they mature. High capture + low verification = shallow vault with unverified knowledge being treated as reliable. Tracking velocity ensures knowledge matures alongside capture.
**Test:** Calculate: (notes verified in last 30 days) / (notes added in last 30 days). Is the ratio ≥0.5? If below threshold, pause exploration and prioritize verification until ratio recovers.
**Edge case:** New vaults (<50 notes) can have lower ratios during bootstrap phase — establish conventions before verification scales. Set threshold at 0.3 for vaults <50 notes.
**Edge case:** High-stakes domains (medical, legal, financial) should maintain higher ratios (≥0.7) — unverified knowledge can cause real harm.
**Edge case:** Experiential domains require even more stringent tracking — "verified" means actually tested, not just source-checked. Require verification-status: verified, not just review completion.
**Edge case (NEW - 2026-03-18):** In domains with seasonal or cyclical verification constraints, the 30-day verification window may unfairly penalize valid captures. Cooking recipes with seasonal ingredients (pumpkin in fall, strawberries in summer), gardening knowledge that can only be verified during growing seasons, or holiday-specific traditions may be captured months before they can be practically tested. Apply domain-aware verification windows: (1) Use `verification-cycle:` field with values `seasonal|annual|circular` for notes that can only be verified at specific times, (2) Track `verification-season:` or `verification-window:` to specify when verification is possible, (3) Count these notes as "pending verification" rather than "unverified" during off-seasons, (4) Set verification ratio targets based on capture timing — a pumpkin recipe captured in March has 6 months to be verified before the next pumpkin season, not 30 days.
**Edge case (NEW - 2026-04-03):** In creative writing and other subjective-domain knowledge bases (art criticism, aesthetic evaluation, creative craft), the verification-ratio rule fails due to dual challenges: (1) feedback cycles exceed 30 days by nature (beta readers: 2-8 weeks, workshop: monthly, publication: weeks to months), (2) "verified" is ambiguous — craft advice is subjective with no objective pass/fail. Apply creative-domain verification: (1) Use `verification-cycle: long-horizon` field for notes requiring extended feedback, (2) Track separate `verification-mode:` (craft-practice|workshop|beta-reader|publication), (3) Apply modified ratio: (notes verified OR notes with verification-in-progress) / notes added in last 90 days ≥0.5, (4) Use alternative status values: `practice-validated`, `workshop-validated`, `beta-validated`, `published-validated`. The standard 30-day ratio will produce false negatives in creative vaults — the vault may be high-quality but inherently slow to verify.

**Edge case (NEW - 2026-04-04):** For fitness/exercise domains where verification requires 4-12 weeks (longer than standard 30-day but shorter than long-horizon), apply medium-horizon verification parameters: (1) Use `verification-cycle: medium-horizon` field for notes requiring extended practice verification, (2) Set `verification-minimum: 8-weeks` as baseline for strength/hypertrophy protocols, (3) Use `verification-cycle: monthly` for progress tracking, (4) Mark notes as `verification-status: testing` until minimum period completes, (5) Apply modified verification ratio: (notes verified OR notes-in-progress) / notes added in last 90 days ≥0.5, (6) Allow higher unverified backlog during capture phase (up to 40%). This addresses the gap where fitness protocols cannot be verified in 30 days but don't fit long-horizon (years) category — strength gains take 4-8 weeks, muscle hypertrophy 8-12 weeks, endurance adaptation 4-12 weeks. This approach also works for habit formation (4-8 weeks to establish, 12+ weeks to confirm) and personal development domains.

**Rule (NEW - 2026-04-04):** Capture validity scope for context-conditional knowledge — explicitly document the contexts where captured knowledge is true, not just where it has been verified.
**Why:** Knowledge that is factually true in one context but false in another (tap water safe in most developed countries but not in many developing countries; home brewing legal in most US states but not Utah) differs from time-bound knowledge (becomes false over time) and from context-gated knowledge (only relevant in certain contexts). Without validity scope tracking, knowledge bases make false universal claims based on local truth. The verification rule verifies accuracy but doesn't capture applicability boundaries.
**Test:** For factual claims: (1) Can you identify at least one context where the claim would NOT hold? (2) Does frontmatter include `validity-scopes:` or equivalent? (3) Can you filter notes by geographic jurisdiction, expertise level, or equipment tier? (4) Do newly captured claims include scope documentation?

**Edge case:** Unknown contexts — when you don't know where knowledge is FALSE, document what's KNOWN rather than unknown: `validity-scopes-known: [contexts where verified true]` vs. `validity-scopes-unknown: [contexts not yet assessed]`.

**Edge case:** Equivalent alternatives are NOT context-switch validity — all alternatives can be valid in all contexts; context determines fit but not validity. Context-switch validity is when the claim itself changes truth value.

**Implementation:**
```yaml
validity-scopes:
  - context: geographic
    regions: [US, CA, UK, AU]
    note: Not applicable in EU regions with different standards
  - context: expertise-level
    levels: [intermediate, advanced]
    note: Not applicable for beginners
validity-scopes-known: [list of verified contexts]
validity-scopes-unknown: [list of unverified contexts]
```

**See also:** [[Frontier Exploration - Context-Switch Validity]] (new note with detailed analysis)

**Rule:** Enforce verification ceiling — when unverified notes exceed 40% of total vault, pause exploration and prioritize verification until ratio drops below 30%.
**Why:** An unverified-heavy vault misleads about its reliability. Users and AI agents cannot distinguish verified from unverified knowledge without explicit status tracking. The vault becomes unreliable as a decision-support tool.
**Test:** Count notes with verification-status: unverified. Divide by total note count. Is it <30%? If above 40%, do not add new notes until verification catches up.
**Edge case:** Domain-critical knowledge (safety procedures, legal requirements) may warrant exemption — tag with criticality: high to allow exception.
**Edge case:** Staging notes (whisper/draft/probe) don't count toward unverified — they have explicit uncertainty markers.

**Rule (NEW - 2026-04-06):** Map knowledge type to verification modality — ensure verification method matches the knowledge type it addresses.
**Why:** "Verified" has different meanings for different knowledge types. A fact is verified by checking sources; a procedure is verified by successfully executing it; experiential knowledge requires repeating the context; conceptual knowledge requires logical consistency check. Without explicit modality mapping, verification status misleads about knowledge reliability — a note marked "verified" via source check may not be actually usable for procedural knowledge.
**Test:**
1. Can you identify the knowledge type for any given note?
2. Does verification-status reflect the appropriate modality for that type?
3. Are there notes where modality is misaligned (factual claim verified procedurally, or vice versa)?
4. For compound notes (multiple types), is each type's verification method appropriate?
**Implementation:**
The Seed already includes verification modality fields for specific cases:
- `verification-modality: passive` — can be verified by reading alone (default)
- `verification-modality: practice-required` — requires active execution to verify
- `verification-modality: embodied` — requires sensory experience to fully verify
- `verification-modality: execution` — requires tool/command execution to verify

Add explicit mapping to knowledge types:
```yaml
knowledge-type: factual → verification-modality: passive (source check)
knowledge-type: procedural → verification-modality: execution (execution test)
knowledge-type: experiential → verification-modality: practice-required (context replication)
knowledge-type: conceptual → verification-modality: passive (logical consistency)
knowledge-type: relational → verification-modality: passive (multi-source triangulation)
knowledge-type: meta → verification-modality: passive (application test)
```

For multi-modal notes requiring multiple verification modalities, track each separately:
```yaml
verification-modes:
  - modality: source
    status: verified
    date: 2026-04-01
  - modality: execution
    status: pending
```

A note is only fully verified when all required modalities pass.

**See also:** [[Seed Gap - Knowledge Type to Verification Modality Mapping]] (gap now integrated)

**Edge case (stress test 2026-04-02):** In automated vaults managed by AI agents (heartbeat-style automation), verification has different constraints:
- **Agent verification limitations:** AI agents can verify source quality, consistency, and structural correctness but cannot perform embodied verification (taste food, test physical skills) or empirical validation (user testing, playtesting)
- **Verification-mode tagging:** Distinguish what agents CAN verify vs. what requires human verification — use `verification-mode: agent-verifiable|human-required`
- **Test for automated vaults:** Can you identify which notes require human verification vs. agent verification? Are verification expectations appropriate to who/what performs them?
- **Implication:** Verification ratios in automated vaults measure agent-verifiable knowledge only; human-verification-dependent notes may remain perpetually unverified by agents but are not indicators of vault health issues

**Rule (NEW - 2026-04-01):** Apply verification priority hierarchy when verification resources are limited — prioritize in order: (1) safety-critical knowledge, (2) decision-critical knowledge, (3) frequently-referenced knowledge, (4) verification cost-effective knowledge.
**Why:** The Seed enforces verification ratios (50%+ within 30 days) and ceilings (pause at 40% unverified) but provides no guidance on *which* notes to verify first. Without priority hierarchy, AI agents verify randomly or default to easiest, wasting effort on low-value items while high-impact items remain unverified.
**Test:** For your verification backlog: (1) Can you identify notes tagged `criticality: high` or `safety-critical: true`? (2) Do these have `verification-status: verified`? (3) Can you distinguish foundational notes (low backlinks, high forward references) from hub notes (high backlinks)? (4) Are foundational notes verified for correctness before hubs are verified for completeness? (5) For small vaults: does expected-frequency scoring replace historical usage? (6) Does your verification history prioritize in Level 1→4 order?

**Priority categories:**
- **Level 1 (Critical):** Knowledge that could cause harm if wrong — medical advice, safety procedures, legal guidance, financial decisions, technical configurations. Requires `criticality: high` AND human expert review before marking verified.
- **Level 2 (High):** Foundational notes (core equations, fundamental laws, base definitions) — errors propagate to everything built upon them. Requires correctness verification before dependent notes are verified. Detection: notes with low backlink counts but high forward references.
- **Level 3 (Medium):** Hub notes (high backlink counts), frequently-searched notes, entry points — high traffic means outsized impact from errors. Requires completeness verification (links valid, content current).
- **Level 4 (Low):** Expensive-to-verify knowledge (long-horizon, experiential requiring specific conditions), redundant notes (delete instead), deprecated knowledge (skip).

**Edge case (NEW - 2026-04-03):** Foundational notes require different verification approach than hub notes. A wrong foundational note corrupts everything built upon it; a wrong hub note is annoying but correctable. Distinguish by:
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

**Implementation:**
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

**Rule:** Distinguish empirically validatable knowledge from source-verifiable knowledge — apply different verification criteria for each.
**Why:** Knowledge that requires direct user experience to validate (game mechanics "fun", UX "intuitive", teaching "effective") follows different rules than factual knowledge. Applying source-verification rules creates false confidence or false doubt. Empirical knowledge needs testing evidence, not source quality.
**Test:** For knowledge claims about user experience, fun, difficulty, or intuition: (1) Is this empirically testable? (2) Has it been tested with actual users? (3) Is confidence tied to testing evidence rather than source quality?

**Rule (NEW - 2026-03-24):** Handle unverifiable knowledge — knowledge that cannot be verified through any known verification pathway.
**Why:** The Seed covers source verification, empirical verification, tool-executable verification, and embodied verification — but misses knowledge that fundamentally cannot be verified. Unverifiable knowledge includes: future-specific predictions, private subjective experience (qualia), unobserved historical events, cosmological claims beyond observation, philosophical counterfactuals. Treating unverifiable as unverified leads to wasted verification effort and inappropriate confidence assignment.
**Test:** For knowledge claims: (1) Can you describe a test that would verify this? If no verification pathway exists, (2) Is this about future events, subjective experience, or philosophical claims? If yes, tag as unverifiable.
**Implementation:** Use frontmatter for unverifiable knowledge:
```yaml
unverifiable-type: prediction|subjective|historical|cosmological|counterfactual|philosophical
verification-pathway: none  # Explicitly mark as unverifiable
confidence: speculative
```
**Categories:**
- **Prediction**: Specific future events ( verifiable only after time passes)
- **Subjective**: First-person experience that cannot be accessed by others (qualia problem)
- **Historical**: Events that left no traceable evidence
- **Cosmological**: Claims beyond observable universe
- **Counterfactual**: What would have happened if something different occurred
- **Philosophical**: Claims that are framework-dependent rather than empirically resolvable
**Note:** This is distinct from unverified — unverified means "not yet checked but checkable," unverifiable means "cannot be checked by any known method." Use `verification-pathway: none` for unverifiable knowledge, not verification-status fields.
**See also:** [[Frontier Exploration - Unverifiable Knowledge Handling]]

**Rule (NEW - 2026-04-03):** Track verification method availability separately from verification status — distinguish between knowledge that cannot be verified (method doesn't exist) vs. knowledge where the verification method exists but is currently unavailable (equipment missing, access revoked, credentials expired, verification window missed).
**Why:** The Seed covers unverifiable knowledge but not verification method unavailability. When knowledge is accurate but the verifier lacks access to the verification method, treating it as "unverified" creates different maintenance actions than "unverifiable." The former can be verified later when access is restored; the latter may never be verifiable. This distinction enables appropriate tracking and future verification planning.
**Test:** Can you categorize each unverified note as: (1) unverifiable (method doesn't exist), (2) verification method unavailable (method exists but currently inaccessible), or (3) verification pending (method available, just not yet done)? For category 2, is there an alternative verification method documented?
**Implementation:** Use frontmatter:
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
**See also:** [[Seed Refinement - Verification Method Availability Tracking]]

**Rule (NEW - 2026-04-05):** For procedural content, use extended verification metadata to distinguish safety-critical procedures from convenience-only ones and enable appropriate user capability assessment.

**Why:** A procedure verified with Brand X epoxy may fail with Brand Y; a procedure verified by experts may be dangerous for beginners; "community-validated" and "community-accepted" represent very different confidence levels. Without extended metadata, procedural verification creates false confidence and doesn't help users assess applicability.

**Test:** For procedural notes: (1) Can you identify high-risk procedures with incomplete verification? (2) Can users determine if they have the required skill level? (3) Can you distinguish tested procedures from traditional wisdom? (4) Can you reproduce verification conditions (materials used)?

**Implementation — `materials-tested`:**
```yaml
materials-tested:
  - "Brand X epoxy"
  - "Jorgensen clamps"
```
**Test:** For procedural notes with `verification-status: tested` or `verified`: (1) Does `materials-tested` list specific products used? (2) Could someone reproduce exactly what was verified?

**Implementation — `risk-level`:**
```yaml
risk-level: high  # potential for injury, property damage
risk-level: medium  # could cause minor issues, waste materials  
risk-level: low  # inconvenience only, no safety implications
```
**Distinction:** `risk-level` is about PROCEDURE risk (what happens if done wrong); `criticality` is about KNOWLEDGE importance (impact if missing); `safety-critical` is a boolean for extreme cases.

**Implementation — `skill-level`:**
```yaml
skill-level: beginner  # no prior experience needed
skill-level: intermediate  # basic familiarity assumed  
skill-level: advanced  # specialized expertise required
```
**Edge case:** Multi-level procedures use `skill-level-components`:
```yaml
skill-level-components:
  - component: "preparation"
    level: beginner
  - component: "execution"
    level: advanced
```

**Implementation — `community-accepted` vs `community-validated`:**
```yaml
# Option 1: Extended verification-status enum
verification-status: unverified|verified|community-validated|community-accepted

# Option 2: Separate boolean fields
community-validated: true  # actually tested by community members
community-accepted: true  # widely believed, not systematically tested
```
**Evidence distinction:** `community-validated` = "I tried this and it worked" (multiple accounts); `community-accepted` = "Everyone says this is how it's done" (traditional wisdom).

**See also:** [[Seed Refinement - Procedural Verification Metadata Integration]]

**Rule (NEW - 2026-03-26):** For knowledge claims requiring external tools or specialized equipment to verify (not code execution, but physical measurement devices, test kits, or expert consultation), tag with `verification-mode: tool-dependent` and document the required verification tool.
**Why:** The Seed covers tool-executable knowledge (running code/commands) but misses knowledge requiring physical tools to verify (water quality test, multimeter, lab equipment, expert eye). Without explicit tagging, AI agents may mark knowledge as "source verified" when the source itself might be wrong (counterfeit product, mislabeled substance, corrupted file). Tool-dependent verification requires external equipment not part of the vault.
**Test:** For knowledge claims about physical states (safety, authenticity, correctness, measurement): (1) Is verification possible with a tool/equipment? (2) Is the required tool documented? (3) Has tool verification been performed? (4) Is confidence tied to tool-verification status, not just source presence?
**Implementation:** Use frontmatter:
```yaml
verification-mode: tool-dependent
verification-tool: [specific-tool-or-expertise-required]
tool-accessibility: available|requires-purchase|requires-expert
verified-by-tool: true|false
tool-verification-date: 2026-03-26
```
**Verification pathway for tool-dependent:** Mark as `verification-status: tool-dependent-pending` until tool verification is performed. Use `verification-status: tool-verified` after confirmed by appropriate tool.
**Edge cases:**
- **Source + tool-dependent:** "This medication was prescribed" is source-verifiable. "This medication is authentic" is tool-dependent (could be counterfeit).
- **Embodied vs tool-dependent:** Eating food to verify it's safe = embodied. Testing food in a lab = tool-dependent.
- **Expertise as tool:** Some verifications require human experts (botanist, electrician). Treat expert consultation as tool verification.
**Relationship to existing rules:** If tool is unavailable or verification is infeasible, apply unverifiable handling. High-stakes domains (medical, safety, structural) often have critical tool-dependent knowledge.
**See also:** [[Seed Gap - Verification Requiring External Tooling]], [[Seed Stress Test - Tool-Dependent Verification in Medical Knowledge]]

**Rule (NEW - 2026-03-27):** For knowledge that can only be validated through practice drills (not through source-checking, actual use, or tool execution), tag with `verification-mode: drill-verified` and track drill frequency.
**Why:** The Seed covers source verification, empirical verification, tool-dependent verification, and embodied verification — but misses knowledge that should be validated through practice drills. Emergency/first-aid knowledge, safety procedures, and survival skills are verified through practice (CPR training, fire drills, evacuation practice) rather than through reading sources or testing in actual emergencies. This is distinct from experiential verification (testing a recipe) — the goal is to never use the knowledge in real situations, so only drill-based verification is appropriate.
**Test:** For emergency, safety, or survival knowledge: (1) Does the note have `verification-mode: drill-verified`? (2) Is there `last-practiced:` frontmatter? (3) Is there `next-drill-due:`? (4) Is certification-equivalent documented (e.g., "AHA CPR 2020")?
**Implementation:** Use frontmatter:
```yaml
verification-mode: drill-verified
verification-status: drill-validated|drill-overdue|drill-pending
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
**Relationship to existing rules:** If drill equipment or certification is unavailable, apply unverifiable handling. Drill verification is orthogonal to source verification — a note can be drill-verified AND source-verified (certified procedure from recognized body).

**Edge cases:**
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

**See also:** [[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]], [[Seed Gap - Emergency Knowledge Retrieval Speed]]

**Rule (REFINED 2026-03-31):** When verification modes produce conflicting results, apply a verification-mode conflict resolution protocol that distinguishes conflict type, applies appropriate resolution strategy, and preserves all evidence with explicit documentation.

**Why:** Different verification modes test different aspects of truth quality. A drill-verified procedure has survived practical testing under stress conditions; a source-verified claim has not. However, simply applying hierarchy doesn't work — some conflicts are complementary (both valid), some represent genuine uncertainty, and some reveal Seed gaps. The rule must classify conflict type before resolution.

**Test:** For any note where two verification modes produced different results: (1) Is the conflict documented with `verification-conflict: {mode1} vs {mode2}`? (2) Is `conflict-type` classified (contradictory/complementary/uncertain/expanding)? (3) Is the resolution methodology explicit (mode-priority/domain-priority/integration/preservation/escalation)? (4) Does confidence reflect the resolution? (5) Is both verification evidence preserved? (6) If complementary, is integration documentation present? (7) If uncertain, is evidence-synthesis noted? (8) If expanding, is knowledge-expansion flag set?

**Conflict Type Taxonomy:**
- **contradictory**: One claim is wrong (resolution needed — choose winner)
- **complementary**: Both valid, measure different dimensions (integration — preserve both)
- **uncertain**: Both may be wrong, genuine uncertainty (preservation with synthesis notes)
- **expanding**: Conflict reveals Seed gap (escalation — flag for Seed update)

**Implementation:**
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
  confidence: disputed|weighted
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

**Edge cases:**
- **Source quality within mode**: "Source verified" conflicts between high-quality source (peer-reviewed) and low-quality source (blog) should weight by quality within the mode, not just mode-level priority. Track `evidence-quality:` with factors (sample-size, study-design, replication, statistical-power).
- **Temporal recency within mode**: Recent empirical results may override older empirical results within the empirical mode. However, in medical domains, newer ≠ better — weight by evidence quality factors, not just recency. Track `verification-date` per mode with quality factors.
- **Cross-tier conflicts**: A lower-tier verification mode (source) can produce stronger evidence than a higher-tier mode (flawed drill test) — domain-priority override applies.
- **Embodied knowledge conflict**: Experiential knowledge that contradicts empirical findings should be preserved (not deleted) with explicit conflict notation — embodied may capture edge cases.
- **Medical domain special case**: Clinical experience (embodied) and RCT evidence (empirical) both capture valid knowledge. Use integration strategy by default, not hierarchy resolution. Clinical expertise synthesizes both modes.

**See also:** [[Seed Gap - Verification Mode Conflict Resolution]] — original gap analysis
**See also:** [[Seed Stress Test - Verification Mode Conflict Resolution in Medical Knowledge]] — edge case documentation
**See also:** [[Seed Refinement - Verification Mode Conflict Resolution Edge Cases]] — refined rule with edge case handling

**Rule (NEW - 2026-03-30):** For emergency and crisis-response knowledge, design for single-view retrieval with minimum confidence thresholds, explicit recency requirements, and panic-optimized formatting.
**Why:** Crisis domains require execution under stress. Standard navigation depth (3 hops), standard verification timelines (weeks), and standard atomicity (multi-note traversals) assume calm reading — not panic retrieval. Without explicit emergency knowledge guidance, vaults produce "helpful" notes that are useless when seconds count. Drill verification (correct procedure) and emergency retrieval (can execute under stress) are orthogonal requirements — both may apply to the same note.
**Test:** For notes tagged `emergency-knowledge: true`: (1) Is the core action self-contained without requiring navigation to other notes? (2) Is confidence `high` or `immediate-action` (not `emerging`, `low`, or `speculative`)? (3) Is `last-updated` within 90 days for life-critical content? (4) Is a visual aid (flowchart/image) present for panic-state retrieval? (5) Is `offline-capable: true` if connectivity cannot be assumed? (6) Does drill-verified knowledge also meet emergency retrieval requirements?

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

**Edge cases:**
- **Contested procedures:** Different authorities teach different approaches (e.g., Heimlich vs. chest thrusts). Tag with `procedure-status: contested`, document which authorities recommend what, and do NOT present contested knowledge as single truth.
- **Equipment-dependent procedures:** Some emergencies require specific equipment (AED, EpiPen). Include required equipment explicitly, equipment alternatives when known, and "If no equipment" fallback procedures.
- **Minimum confidence threshold:** Emergency knowledge tagged `emergency-knowledge: true` with `confidence: emerging` should trigger a compliance audit warning. The minimum confidence for life-critical knowledge is `high`.

**Relationship to drill-verified rule:** Drill verification answers "is the procedure correct?" Emergency retrieval answers "can the procedure be executed under stress?" Both may apply to the same note. Tag accordingly — a note can be drill-verified AND meet emergency retrieval requirements.

**See also:** [[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]]

**Rule:** Handle incorrect or outdated knowledge explicitly — when discovering knowledge is wrong, mark rather than silently delete.
**Why:** Wrong knowledge contains valuable context: why you believed it, what source led you astray, what you learned from the correction. Deleting loses this meta-knowledge. Marking preserves the learning while preventing the vault from spreading incorrect information.
**Test:** Can you trace how each incorrect note was handled? Does each have correction metadata (correction-type, correction-date, corrected-by)?
**Correction types:**
- `factual-error` — The knowledge was never correct (source wrong, misread, flawed synthesis)
- `outdated` — Was correct once but no longer applicable (version deprecated, best practice changed)
- `misinterpretation` — The knowledge is correct but was applied in wrong context
- `personal-error` — Your own synthesis or reasoning was flawed

**Implementation:** Use correction metadata:
```yaml
correction-type: factual-error  # factual-error|outdated|misinterpretation|personal-error
was-valid-until: 2024-06  # for outdated
correction-date: 2026-03-18
corrected-by: [[Note Name]]  # link to corrected version
correction-trigger: new-information  # source-re-evaluation|new-information|practical-failure
# Optional: preserve what was wrong
incorrect-because: "..."
# Optional: lesson learned
lesson-learned: "..."
```
**Preservation principle:** Keep the history, not just the correction. A note showing "I used to think X" is valuable meta-knowledge. Create corrected version, mark original with correction metadata, link between them.

**Rule (NEW - 2026-04-04):** Apply explicit deletion criteria for low-value notes — delete notes that have no current utility, no historical value, no reconnection potential, and where deprecation adds maintenance burden without commensurate benefit.

**Why:** Deprecation assumes someone might reference the note later. But notes with zero incoming links, no historical significance, no reconnection pathway, and ongoing maintenance needs bloat the vault without providing value. Deletion preserves clarity while deprecation preserves noise.

**Test:** Can you identify notes meeting ALL deletion criteria (no links, no historical value, no reconnection, maintenance burden > utility)? Are these explicitly handled differently from deprecated notes?

**Deletion criteria:** A note is a deletion candidate when ALL of these are true: (1) No incoming links (0 backlinks), (2) No historical value (not a record of what you thought), (3) No reconnection potential (can't link to active content), (4) Maintenance burden > utility. OR when ANY of these: true duplicate, factually incorrect with correction lost, violates privacy, ephemeral by design.

**Distinction from deprecation:**
| Scenario | Action |
|----------|--------|
| Note was correct, now superseded | Deprecate (preserve history) |
| Note correct, context changed, might be useful | Archive (mark as-of) |
| Note has 0 links, no significance, no future use | Delete (remove noise) |
| Note wrong, correction captured elsewhere | Delete (preserve correction, not error) |

**Implementation:**
```yaml
deletion-criteria-met: true
deletion-reason: zero-links|no-value|ephemeral|privacy
deletion-date: 2026-04-04
```
**Verification after deletion:** (1) Verify no broken links remain, (2) Check if hubs lost significant connections, (3) Document what was deleted and why.

**Edge cases:** Never delete `protected: true` notes. Foundational notes may have latent value. Seed Gap notes: deprecate when resolved, don't delete.

**Privacy handling:** For notes containing information about specific people (PII, health info, financial details, relationship details), apply anonymization before fully capturing. See privacy-aware capture rule below.

**See also:** [[Seed Gap - Note Deletion Criteria]] (gap now addressed)
**Edge case:** For fast-moving domains (tech, science), consider a "knowledge corrections log" hub note tracking all corrections chronologically.

**Rule (NEW - 2026-04-06):** Apply privacy-aware capture for sensitive knowledge — when capturing knowledge derived from private situations (personal conversations, health events, financial circumstances of specific people), use anonymization strategies to preserve learning while protecting privacy.

**Why:** The standard capture rule ("capture what's valuable") fails when valuable knowledge contains sensitive information about specific people. Excluding sensitive content entirely loses learning; capturing raw creates liability. Anonymization balances preservation with protection.

**Test:** For any note with potentially sensitive information about specific people: (1) Could someone be identified from this note (names, employers, locations, specific dates)? (2) Was this shared in confidence? (3) Would disclosure cause harm? (4) Is there an alternative strategy (abstraction, structural extraction, placeholder substitution) that preserves the learning?

**Anonymization strategies:**
- **Abstraction:** Replace specific details with categories ("colleague in tech industry" instead of name)
- **Placeholder:** Use consistent generic labels ("Person A", "Company X")
- **Structural extraction:** Capture the principle without the instance ("job loss creates financial risk" not "my friend lost their job")
- **Technical protection:** Use encryption, access control, or separate storage

**Privacy stakes by knowledge type:**
- **High (requires protection):** Health info, financial account details, professional secrets
- **Medium (abstraction sufficient):** General lessons from personal experiences
- **Low (capture as-is):** Own preferences, public facts

**Implementation:**
```yaml
privacy-level: public|personal|confidential
anonymized: true
anonymization-strategy: abstraction|placeholder|structural|exclusion
```

**See also:** [[Frontier Exploration - Privacy-Preserving Knowledge Capture]] (frontier note now created)

**Rule (NEW - 2026-03-22):** Tag and track conventional wisdom explicitly — when capturing knowledge that represents the generally accepted view, add `conventional-wisdom: true` frontmatter and document known challenges or update signals.
**Why:** Conventional wisdom is often wrong. History shows that "what everyone knows" frequently gets overturned by new evidence. Without explicit tagging, notes presenting the conventional view gain false authority, future edits reinforce the accepted view rather than challenge it, and early signs of conventional wisdom being wrong go unnoticed. This is distinct from unverified knowledge (you might believe it's true) and low confidence (you think it's probably wrong) — conventional wisdom is knowledge you believe is likely correct BUT historically conventional wisdom is often wrong.
**Test:** For notes representing mainstream consensus: (1) Is there `conventional-wisdom: true` tag? (2) Are known challenges documented in frontmatter or content? (3) Are update signals explicit (what evidence would change this)? (4) Is `conventional_wisdom_strength` documented (strong/moderate/weak)?
**Implementation:** Use frontmatter:
```yaml
conventional-wisdom: true
conventional_wisdom_strength: strong  # strong (universally accepted) | moderate (common belief) | weak (emerging consensus)
conventional_challenges:
  - "Known challenge 1"
  - "Known challenge 2"
conventional_review_indicators:
  - "What would change this view"
```
**Why this matters:** The most damaging vault errors come from conventional wisdom that turns out wrong because it feels authoritative. Explicit tagging creates healthy skepticism and prompts re-evaluation.
**Domain guidance:** Medical (much "standard care" has been overturned), finance ("markets always revert"), personal productivity ("multitasking is efficient"), and technical fields ("X is best framework") all have histories of conventional wisdom being wrong. Tagging enables proactive challenge.
**Interaction with correction workflow:** When conventional wisdom IS overturned, apply existing correction workflow with `correction-type: outdated` — it was correct for its era but context changed, not that it was never correct.
**See also:** [[Frontier Exploration - Conventional Wisdom and Its Limitations]]

**Rule:** Detect and resolve simultaneous contradictions — when the vault contains two verified notes that directly contradict each other (Note A claims "X is true" and Note B claims "X is false" with overlapping validity periods), apply resolution protocol.
**Why:** Undetected contradictions create unreliable knowledge bases where users cannot trust any single claim. Without explicit contradiction handling, the vault undermines its own credibility and cannot serve as a decision-support tool.
**Test:** Can you identify any pairs of verified notes that directly contradict each other? For each detected contradiction, is there a documented resolution (preferred-source, acknowledged-uncertainty, or escalated-to-human)?
**Contradiction detection:** Two notes contradict when one claims X is true and the other claims X is false, both have current validity periods (not marked outdated), and the contradiction is not resolvable by adding context (dose, timing, individual variation).
**Resolution protocol:** (1) If one source is demonstrably more reliable, prefer it and mark the other as corrected; (2) If both sources are equally credible, keep both and tag with `contradiction-status: acknowledged` linking to a synthesis note; (3) If resolution is impossible, escalate to human.
**Implementation:**
```yaml
# For notes involved in contradiction
contradiction-status: acknowledged
contradiction-with: [[Note Name]]
resolution: pending|resolved-in-favor-of|source-required

# For disputed knowledge (legitimate expert disagreement)
verification-status: disputed
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

**Edge case (NEW - 2026-03-21):** Philosophical skepticism and destabilizing arguments may undermine vault reliability. Add `knowledge-safety:` tagging:
- `destabilizing` — arguments that could undermine trust in the vault (e.g., radical skepticism)
- Include counter-argument links when including destabilizing content
- Consider quarantine or explicit warning tags for vault-breaking content

**Edge case (NEW - 2026-03-21):** For ethical and value-based contradictions, use framework tagging:
- Tag with `moral-framework: consequentialist|deontological|virtue-ethics|care-ethics`
- These are framework-dependent, not contradictions to resolve
- Resolution = acknowledgment, not preference for one framework over another

**Rule (NEW - 2026-03-21):** Distinguish prescriptive from descriptive knowledge and apply intent-based resolution for prescriptive conflicts.
**Why:** The Seed covers framework-dependent knowledge (different descriptive models) but prescriptive rule conflicts work differently. When musical styles say "avoid parallel fifths" AND "parallel motion is acceptable," the conflict is about methods for the same goal, not different frameworks describing reality. Resolution requires understanding user intent, not framework selection.
**Test:** For knowledge that provides guidance or rules: (1) Is this prescriptive ("you should do X") or descriptive ("X is Y")? (2) If prescriptive, could a different context validly recommend "do NOT X"? (3) If yes, does the note include intent-based resolution guidance?
**Implementation:** Use frontmatter:
```yaml
prescriptive-type: prescriptive  # vs. descriptive
prescriptive-intent: [aesthetic-quality, efficiency, safety]
conflict-resolution-mode: intent-based  # framework-choice|intent-based|context-dependent|hierarchy
resolution-guide:
  - when: "goal is X"
    do: "follow rule A"
  - when: "goal is Y"
    do: "follow rule B"
```
**Edge case:** When prescriptive rules genuinely cannot both be followed AND there's no resolution, mark with `contradiction-status: genuine` and escalate to human.
**Edge case:** Some prescriptive rules are safety-critical (always follow, no exceptions). Tag with `safety-critical: true` to override intent-based resolution.
**See also:** [[Frontier Exploration - Prescriptive vs Descriptive Knowledge Distinctions]] for detailed exploration of this gap.

**Rule (NEW - 2026-03-22):** Handle personal experience vs. published knowledge conflicts using explicit resolution approaches — distinguish between context reconciliation, sample size acknowledgment, published knowledge update, genuine uncertainty, and personal domain exceptions.
**Why:** The Seed covers contradictions between vault notes and framework-dependent knowledge, but personal-vs-published conflicts are fundamentally different — you're comparing your direct experience against external sources. Without explicit handling, AI agents either dismiss personal experience as invalid or overgeneralize from limited observations. The conflict may reveal valuable insights about context-dependence, rule limitations, or knowledge gaps.
**Test:** For notes where your personal observations contradict published sources: (1) Is there explicit resolution approach documented? (2) Do you distinguish "my experience is wrong" from "the rule doesn't apply to me"? (3) Is the context (sample size, conditions) documented? (4) Does resolution capture what the conflict taught you?
**Implementation:** Use `contradiction-type: personal-vs-published` with `resolution-approach`:
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
confidence: emerging
```
**When to trust personal over published:** (1) Large sample size (N>30 or repeated trials), (2) Consistent results over time, (3) Published source is low-quality or outdated, (4) Your context is well-documented and systematically different.
**When to trust published over personal:** (1) Small sample size, (2) Single observation, (3) Published from high-quality peer-reviewed source, (4) No clear context differences.
**See also:** [[Frontier Exploration - Personal Experience vs Published Knowledge Conflicts]] for detailed exploration.

**Rule:** Resolve Seed rule conflicts using explicit priority hierarchy — when two rules conflict, apply safety > accuracy > domain-adaptation > bootstrap-flexibility > quality > recency.
**Why:** Without explicit conflict resolution, AI agents either arbitrarily choose one rule or freeze in analysis paralysis. Explicit priority enables consistent decision-making.
**Test:** For any decision where rules conflict: (1) Identify rules in tension, (2) Apply priority hierarchy, (3) Document resolution with `conflict-resolution:` frontmatter. Can you resolve all conflicts using this hierarchy?
**Priority order:** (1) Safety/harm-prevention, (2) Verification/accuracy, (3) User-protection/domain-stakes, (4) Domain-specific edge cases, (5) Construction-phase relaxation, (6) Quality over quantity, (7) Recency (newer Seed beats older).
**Implementation:** When documenting conflict resolution:
```yaml
conflict-resolution:
  rules_in_tension: ["rule A", "rule B"]
  resolution: "Which won and why"
  priority_applied: "Which priority level ruled"
```
**Resolution strategies:** Choose rule with more specific scope; default to safer option; escalate to human if truly unresolvable.

**Rule (UPDATED - 2026-03-29):** Use diminishing returns testing before adding notes to existing topics — apply stakes-aware thresholds, use override conditions for critical knowledge, and handle temporal/experiential domains with domain-appropriate tests.
**Why:** Notes that don't improve utility, can't connect naturally, duplicate existing content, or require high maintenance for low value bloat the vault without adding proportional value. But different domains have different stakes, different temporal sensitivity, and different execution uncertainty — a one-size-fits-all test fails across domain boundaries.
**Test:** For the last 5 notes added to a mature topic, do 3+ pass?

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

**Edge case (stress test 2026-03-29):** The unified stakes-aware test consolidates findings from: personal finance domain (medium-stakes distinction), experiential domains (execution uncertainty), game design (phase-aware testing), medical domain (role-dependent utility, critical knowledge exemption), and version-sensitive domains (temporal validity markers). The test structure remains the same — skip or defer if note fails 2+ of utility/connection/uniqueness/effort — but stakes-category and override conditions determine how strictly the test applies.


**Rule (NEW - 2026-03-22):** Evaluate maintenance burden before capturing volatile knowledge — exclude or deprioritize knowledge that is high-maintenance (frequently changing) AND low-utility (easily looked up elsewhere) AND lacks personalization (no unique context you provide).
**Why:** Some knowledge is "expensive" to maintain — it requires ongoing updates just to stay accurate, but provides low value because it's easily found elsewhere. Capturing version-sensitive technical trivia, frequently-changing prices, or transient opportunities creates maintenance debt without proportional benefit. The vault should capture what can't be easily found or what includes your unique context.
**Test:** For knowledge about version-locked software, price-sensitive topics, time-sensitive opportunities, or frequently-changing facts: (1) Does this include personalized context that can't be found elsewhere? (2) Is the volatility so high the knowledge will be stale within 30 days? (3) Could a web search provide current information faster than maintaining this note? If 2-3 are true and 1 is false, exclude or mark with short expiration-interval.
**Implementation:** Use frontmatter to track maintenance burden:
```yaml
maintenance-burden: high|medium|low
volatility-type: version-sensitive|price-sensitive|time-sensitive|stable
external-availability: high|medium|low
```
**Edge case:** Personal context makes high-maintenance knowledge worth capturing. Your specific troubleshooting steps for your setup, your personal workflow adaptations, and your experimental results are high-utility even if the underlying software changes. Capture personalized context; exclude generic facts that others can provide.

**See also:** [[Frontier Exploration - Knowledge Maintenance]]

**Rule (NEW - 2026-03-24):** Apply different update strategies based on knowledge change pattern — distinguish discrete versioning (clear v1→v2 milestones), slow evolution (gradual drift without versions), cyclical preference changes (complete replacement), and deepening understanding (same topic, richer content).
**Why:** The Seed covers discrete version changes and expiration, but not knowledge that changes slowly and gradually. Without pattern-based strategies, notes become either Frankenstein (too much change history) or over-split (v1, v2, v3 fragments). Matching strategy to change pattern preserves both coherence and traceability.
**Test:** For notes updated 3+ times: (1) Can you identify the change pattern? (2) Does the note structure match the pattern? (3) Is there a clearer way to organize this knowledge?
**Implementation:** Use frontmatter:
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

**See also:** [[Frontier Exploration - Knowledge Maintenance]]

**Rule (NEW - 2026-04-01):** Apply explicit version control to knowledge with significant dependencies — track change lineage, update affected notes, and preserve change rationale.

**Why:** Knowledge doesn't exist in isolation. When a core principle changes, notes that depended on the old principle may now contain contradictions or outdated reasoning. The Seed's evolution-pattern captures change TYPE but not the full version control lifecycle: lineage tracking, dependency impact analysis, and change rationale documentation. Without explicit version control, the vault accumulates inconsistent knowledge that appears verified but is actually superseded.

**Test:** For notes with 3+ dependent notes (backlinks): (1) Can you identify what would break if this note changed? (2) Is there a change history documenting previous states? (3) When this note changes, do you check dependent notes for consistency? (4) Is change rationale documented alongside change?

**Implementation:** Use frontmatter for version-controlled knowledge:
```yaml
version-control: enabled
version: 3
version-history:
  - version: 1
    date: 2025-06-15
    change: "Initial capture"
    rationale: "First principles from source X"
  - version: 2
    date: 2025-11-20
    change: "Expanded with new evidence from study Y"
    rationale: "Source provided more complete picture"
  - version: 3
    date: 2026-04-01
    change: "Corrected error in section Z"
    rationale: "Original interpretation was wrong"
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

**See also:** [[Frontier Exploration - Knowledge Version Control]]

**Rule (NEW - 2026-03-25):** Tag knowledge with inherent expiration windows using validity-period metadata — distinguish from outdated knowledge by understanding the difference between "was correct, now wrong" vs. "was applicable, context has passed."

**Why:** Knowledge with built-in expiration (event dates, seasonal applicability, time-limited opportunities) requires different handling than outdated knowledge. Both end up "not currently useful" but the reason differs: outdated means "the knowledge itself was flawed"; inherent expiration means "the context the knowledge applied to has passed." AI agents need to distinguish these to apply correct handling (correction workflow vs. archival workflow).

**Test:** Pick 10 notes containing time-specific information (event details, seasonal guidance, promotional context). (1) Can you identify which have inherent expiration vs. general applicability? (2) Do they have metadata distinguishing "window has closed" from "knowledge is wrong"?

**Implementation:**
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

**See also:** [[Seed Gap - Knowledge with Inherent Expiration Windows]]

**Edge case (NEW - 2026-03-25):** Seasonal knowledge has cyclic applicability — applies during specific seasons, then becomes "dormant" but not "wrong." A planting guide is valid in spring, "wrong" in fall only if applied literally, but actually just "not currently applicable."

**Edge case:** In domains where knowledge is highly subjective (art criticism, aesthetic evaluation, creative domains), "utility" is context-dependent and hard to measure objectively. A note about "moody desaturated look" in photography has high utility for some users and none for others. For subjective domains, apply the test to connection + uniqueness + effort only; use "applicability-scope" (who is this for?) as a proxy for utility. Alternatively, use domain-appropriate utility criteria specific to the domain's goals.

**Edge case (NEW - stress tested):** In context-dependent objective domains (medicine, law, engineering) and high-stakes domains, the diminishing returns test needs modification:
- **Role-dependent utility:** A note about "rare cardiac condition" has high utility for cardiologists but low utility for GPs. Apply role-based utility assessment: use `applicability-role:` to specify who this knowledge serves.
- **Critical knowledge exemption:** In high-stakes domains (medical diagnosis, legal precedent, safety procedures), rare but critical knowledge should be exempt from the test. A note about a rare but life-threatening allergic reaction may fail all four tests but is essential for completeness. Use `criticality: high` frontmatter to exempt from diminishing returns testing.
- **Asymmetric value:** Medical knowledge has inherent asymmetry - common conditions are high-utility but not all high-utility knowledge is common. The test should not favor frequency over importance.

**Edge case (stress test 2026-03-16):** In experiential domains (cooking, music performance, crafts, physical skills, gardening), diminishing returns testing should account for execution uncertainty. The test assumes knowledge can be evaluated without execution — but in experiential domains, you often cannot assess utility without trying. A recipe may look similar to existing ones but produce different results; a technique may seem redundant in description but be transformative in practice.

Apply modified test: (1) Can I actually test this? (execution feasibility), (2) Might the outcome differ despite similar description? (execution uncertainty), (3) Do I need hands-on experience to judge value? If yes to 2-3, capture with verification-status: unverified and prioritize testing over passive expansion.

**Verification workflow (required):** Experiential knowledge requires lifecycle tracking:
- `verification-status: unverified` — captured but not yet tested
- `verification-status: testing` — actively experimenting
- `verification-status: verified` — tested 2+ times with consistent positive results
- `verification-status: failed` — tested but didn't work (also valuable!)
- `verification-status: blocked` — cannot test due to constraints (add `blocker:` field: kitchen|ingredients|time|skill)

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
verification-status: multi-year-pending
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

**Rule (NEW - 2026-03-21):** For embodied knowledge (knowledge requiring physical sensation, touch, feel, or bodily experience to fully understand), add `embodied-component:` frontmatter and apply modified verification rules.
**Why:** Embodied knowledge (tactile cues, kinesthetic feel, sensory judgment) cannot be verified by reading sources. The note may be "correct" in an intellectual sense but incomplete without the sensory component. Standard verification ratio treats all unverified notes equally, but embodied knowledge requires a different verification pathway — physical experience, not source checking.
**Test:** For notes tagged with `embodied-component: essential`: (1) Does the note acknowledge what sensory information is required? (2) Is there a sensory anchor or reference point? (3) Could an AI verify this without physical access?
**Implementation:** Use frontmatter:
```yaml
embodied-component: essential  # essential|nice-to-have|none
sensory-modes: [tactile, kinesthetic, visual, auditory]
sensory-anchor: "Like pressing a ripe avocado — slight give"
verification-modality: embodied  # distinct from passive/practice-required
```
**Verification pathway:** For embodied notes, "verification" means (1) acknowledging the sensory component exists, (2) providing anchors/analogues that help reader recognize the cue, (3) noting whether the vault owner has personally experienced it. Do not count as "verified" through source-checking alone.
**Edge case:** Some embodied knowledge can be approximated through analogues — "what it feels like to ride a bike" can be partially conveyed through comparison. Include `sensory-anchors:` and `approximation-notes:` to capture what's possible in text.

**Rule (NEW - 2026-03-21):** For tool-executable knowledge (knowledge that requires running tools, commands, or automated systems to verify), add execution metadata and apply modified verification rules.
**Why:** Tool-executable knowledge (commands, code, API calls, configs, queries) exists in a distinct category from source verification (checking documentation) and experiential verification (human testing). Without execution metadata, AI agents cannot assess whether tool-executable knowledge is current, correct, or applicable to the user's environment. This is distinct from embodied knowledge (requires human sensation) and experiential knowledge (requires human practice) — tool-executable knowledge can be verified by running automated tools.
**Test:** For notes containing commands, code, API calls, or configs: (1) Does frontmatter include `execution-type:` and `execution-environment:`? (2) Does the note include `expected-output:` or `validation-criteria:`? (3) Is `execution-status:` tracked (verified|failed|pending|not-attempted)? (4) Can an AI determine validity without executing the tool?
**Implementation:** Use frontmatter:
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
**Distinction:** This is distinct from (1) source verification — checking if documentation says it's correct, (2) experiential verification — human testing through practice, (3) embodied verification — sensory judgment. Tool-executable knowledge requires automated execution in a specific environment.
**Edge case:** Some tool executions have side effects (file deletion, database writes, financial transactions). Tag dangerous executions with `execution-safety: destructive` and require explicit user confirmation before execution.

**Rule (NEW - 2026-03-22):** Track knowledge source type to enable source-appropriate verification and weighting — distinguish knowledge derived from intuition (pattern recognition, expert tacit), analysis (statistical, deductive), authority (trusted sources), and direct experiment.
**Why:** The Seed tracks verification-status and confidence, but doesn't distinguish how knowledge was derived. Intuition-based knowledge (expert pattern recognition) requires different verification than analysis-based knowledge (reasoned conclusions) or experimental knowledge (tested directly). Without source tracking, AI agents cannot apply appropriate verification methods or weight knowledge appropriately in decisions.
**Test:** For key knowledge notes used in decisions: (1) Can you identify the source type (intuition|analysis|authority|experiment)? (2) Is the source type appropriate for the domain? (3) Does verification method match the source type?
**Implementation:** Use frontmatter:
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

**Rule (NEW - 2026-04-04):** Track knowledge representation style separately from source type — representation style describes how knowledge "feels" when accessed (intuitive vs analytical), while source type describes how knowledge was acquired.
**Why:** Source (how acquired) and representation (how it feels when accessed) are distinct dimensions. Analytical knowledge can feel intuitive after repetition; intuitive knowledge can be analytically reconstructed. Without tracking both, AI agents cannot distinguish between "knowledge I learned analytically but now use intuitively" vs "knowledge I learned through experience." This causes transfer failures where analytically-reconstructed knowledge looks transferable but isn't.
**Test:** For key knowledge: (1) Can you identify both source type AND representation style? (2) Does the source-representation relationship match? (3) Are conflicts between intuition-feeling and analysis-based knowledge documented?
**Implementation:**
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
conflict-status: active|resolved|superseded
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

**Edge case:** Expert intuition (thousands of pattern recognitions) differs from novice "gut feeling" (may be random or biased). Distinguish with `intuition-experience-level:` field (expert|experienced|novice).

**See also:** [[Frontier Exploration - Intuition vs Analysis Knowledge]]

**Edge case (NEW - 2026-03-23):** For general-purpose knowledge bases without domain-specific evidence hierarchies, use evidence tier classification to weight knowledge appropriately:
- **Tested Methodology (Tier 1):** Directly verified through controlled execution or experiment
- **Documented Experience (Tier 2):** Multiple instances of successful application, tracked outcomes
- **Expert Consensus (Tier 3):** Widely agreed within community of practice, no known contradictions
- **Authoritative Source (Tier 4):** Single trusted source, credible credentials
- **Established Convention (Tier 5):** Commonly accepted practice, origin unclear
- **Personal Discovery (Tier 6):** Individual's own findings, untested by others

**Why:** Domain-specific hierarchies (medical, legal) don't apply to most personal knowledge (cooking tips, hobby techniques, personal experiments). Without general evidence tiers, AI agents cannot appropriately weight knowledge or select verification methods.

**Test:** Can you categorize any piece of knowledge by evidence tier? Do high-stakes decisions reference higher-tier knowledge?

**Implementation:** Use `evidence-tier:` and `evidence-basis:` fields:
```yaml
evidence-tier: tested-methodology  # 1-6 from table above
evidence-basis: "Multiple controlled tests across 3+ recipes"
replication-status: replicated|partial|unreplicated
```

**Note:** Evidence tier is orthogonal to source quality. A Tier 1 tested methodology could be in a blog post (low source quality, high evidence strength). A Tier 6 personal discovery could be from a world-renowned expert (high source quality, low evidence strength because untested).

**Edge case:** In creative domains (art, writing, cooking), "tested methodology" may not apply the same way. A/B testing results, reader feedback, and taste panels can serve as experimental proxies.

**See also:** [[Seed Gap - General Evidence Hierarchy for Non-Domain-Specific Knowledge]]

**Rule (NEW - 2026-03-31):** Track original knowledge provenance separately from sourced knowledge — for knowledge without external sources (original synthesis, personal experiments, untested hypotheses, intuition-based insights), use `source-origin` frontmatter to distinguish from external-sourced knowledge.
**Why:** The Seed's source-citation expectations assume external sources exist. Original knowledge (your synthesis of experiences, novel hypotheses, creative leaps) may have no external sources to cite. Without explicit `source-origin` tracking, source-less knowledge gets marked low-confidence or excluded entirely — but original insights are often the highest-value vault content because they compound uniquely.
**Test:** For notes without `source:` or `source-url:` frontmatter: (1) Is `source-origin: original` present? (2) Is `source-origin-type:` specified (synthesis|hypothesis|invention|intuition|experiential|empirical)? (3) Does confidence reflect the knowledge type (synthesis=medium, hypothesis=speculative, intuition=medium-high if expert-level)?
**Implementation:** Use frontmatter:
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
experiment-context: "Your specific conditions/methodology"
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

**See also:** [[Seed Rule Addition - Knowledge Without External Sources]], [[Frontier Exploration - Knowledge Without Sources]]

**Rule (NEW - 2026-03-25):** Apply inverse authority calibration — trust personal synthesis over authoritative sources only when synthesis meets explicit criteria.
**Why:** The Seed covers source verification, confidence scoring, and evidence tiering, but doesn't address when personal synthesis should override expert consensus. Over-relying on authority creates discovery paralysis; over-relying on personal synthesis creates false confidence. Without explicit criteria, AI agents default to one extreme or the other.
**Test:** For knowledge where your synthesis contradicts an authoritative source: (1) Does your synthesis draw from 3+ independent sources? (2) Is the domain stable (not rapidly evolving)? (3) Can you explain the reasoning step-by-step? (4) Do you have relevant domain expertise? (5) Has your synthesis made validated predictions? If yes to all 5, inverse authority is justified. If no to 2+, defer to authoritative sources.
**Implementation:** Use frontmatter for inverse authority claims:
```yaml
synthesis-vs-authority: true
synthesis-basis: [source1, source2, source3]
reasoning-chain: "Step-by-step explanation"
expertise-level: novice|intermediate|expert
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
stakes-category: medium
expertise-evidence:
  track-record-years: 10
  market-cycles-survived: 3
  verifiable-outcomes: true
authoritative-source-type: peer-reviewed
validation-timeline: long
```
**See also:** [[Frontier Exploration - Inverse Authority Problem]]

**Edge case (stress test 2026-03-16):** In hybrid technical-aesthetic domains (photography, videography, music production, audio engineering), diminishing returns testing must distinguish between:
- **Technical knowledge:** Objectively testable, utility can be evaluated without execution (exposure settings, autofocus modes, color science)
- **Aesthetic knowledge:** Execution-dependent, utility requires trying in context (composition styles, lighting approaches, editing styles)

Apply modified test: For technical notes, apply standard diminishing returns test. For aesthetic notes, apply the experiential domain modified test (can I test this? might outcome differ? need hands-on experience?). Tag aesthetic notes with `knowledge-type: aesthetic` to distinguish from technical `knowledge-type: procedural`.

This is distinct from both subjective domains (where value is inherently perspective-dependent) and pure experiential domains (where execution uncertainty is uniform). Hybrid domains need dual-track assessment.

**Edge case (stress test 2026-03-17):** In early-stage knowledge bases, foundational knowledge should be exempt from diminishing returns testing. Core techniques, essential ingredients, and fundamental principles in a new domain fail the test artificially because there's nothing to connect to yet. Apply the test only to application-level knowledge after foundations are established. The test: (1) Is this domain in bootstrap phase (<20 notes)? (2) Is this note foundational (core technique, essential ingredient, fundamental principle)? If yes to both, exempt from diminishing returns testing.

**Edge case (stress test 2026-03-17):** In cooking and other culinary arts, uniqueness assessment requires cuisine-specific context. A recipe that's redundant in one culinary tradition may be novel in another. Similarly, ingredient availability and equipment requirements dramatically affect utility — a recipe using obscure ingredients has different value depending on cook location and access. Apply modified uniqueness test: (1) Is this distinct within its culinary tradition? (2) Does it address an ingredient/equipment constraint relevant to the target audience? For crossover cuisine, assess uniqueness within each tradition separately.

**Edge case (stress test 2026-03-17):** In rapidly-evolving technical domains (machine learning, data science, software development), the diminishing returns test needs significant modification due to version dependencies, framework churn, and temporal utility:
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

**Rule:** Set explicit priority signals for capture — prioritize in order: (1) blocking knowledge (prerequisites for understanding other notes), (2) high-utility knowledge (frequently needed), (3) gap knowledge (fills holes in connected areas), (4) curiosity knowledge (interesting but optional).
**Why:** Without explicit priorities, capture defaults to ease or recency rather than vault needs. Explicit signals ensure capture effort aligns with vault health.
**Test:** Can you rank your next 5 potential captures by priority signal? Does the ranking match your actual capture order?

**Rule (NEW - 2026-03-22):** Capture error knowledge systematically — document error messages, debugging steps, root causes, and resolutions for errors you encounter.
**Why:** Error knowledge is highly practical personal knowledge that saves time on repeated issues. Unlike anti-patterns (general mistakes) or failed experiments (broader attempts), error notes capture specific problems you faced and how you solved them. Without systematic capture, you rediscover solutions repeatedly.
**Test:** Can you find notes about errors you've encountered? Do they include: (1) exact error message/code, (2) context (what you were doing), (3) root cause, (4) resolution? Can you search for an error and find a previous resolution?
**Implementation:** Use structured frontmatter:
```yaml
error-type: software|system|configuration|dependency|syntax
error-code: "Exact error message"
context:
  tool: tool name and version
  environment: OS, setup details
root-cause: What actually caused the error
resolution: How you fixed it
resolution-type: workaround|fix|config-change|version-bump
applicability: personal|general
error-valid-until: 2026-06  # When this error may become obsolete
```
**Edge case:** The same error can have different causes in different contexts. When capturing an error that already exists in the vault, compare context first — if context differs, add a new note or create a comparative note with multiple resolutions.
**Edge case:** Error knowledge expires faster than other knowledge. Use shorter review intervals for error notes (90 days vs. standard 30 days) and track validity periods.

**Rule (NEW - 2026-03-23):** Distinguish immediate utility from potential utility (option value) — apply different capture criteria for knowledge that might matter someday.
**Why:** The Seed's diminishing returns test optimizes for immediate utility, but systematically under-captures knowledge with potential future value. Knowledge that enables future capabilities, handles rare-but-critical scenarios, or opens unexpected paths has "option value" that the standard utility test misses. Without explicit option value handling, vaults become biased toward current relevance at the expense of future optionality.
**Test:** Can you identify notes tagged with `utility-type: potential`? Do they have documented future scenarios and likelihood assessments? Is there an option value tracking mechanism?
**Implementation:** Use frontmatter to track utility type:
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
**See also:** [[Frontier Exploration - Knowledge Option Value]]

**Edge case (stress test 2026-03-22 - programming domain):** In programming and software development, error knowledge capture needs significant domain-specific enhancements:

- **Same error, different causes:** The same error message (e.g., "ModuleNotFoundError") can have multiple root causes (package not installed, wrong environment, wrong working directory). Use context-specific notes with shared tags rather than consolidated notes — different contexts require different solutions. Consider `error-pattern:` for regex matching across error message variations, with `error-code:` as a primary example.

- **Error validity by category:** Programming errors have different expected lifespans. Use `error-expiry-category:` with values: `tool-version-specific` (6-12 months), `language-version-specific` (12-24 months), `environment-specific` (varies), `permanent` (fundamental errors like division by zero).

- **Cascading errors:** One error often causes another. Use `causes:` and `caused-by:` fields to track error cascades, helping trace failures back to root cause.

- **Reproducibility variation:** Errors may be reproducible on some machines but not others. Use `reproducibility:` field with values `always`, `environment-dependent`, `intermittent`.

- **Community vs personal solutions:** Many errors are already documented on Stack Overflow. Use `solution-source:` field with values `community` (widely available), `personal` (your specific context required unique solution), `hybrid` (community + personal adaptation).

- **Errors vs warnings vs deprecation:** Distinguish `error-type: fatal` (crashes), `error-type: warning` (non-fatal), `error-type: deprecation` (will become error in future). Tag deprecation warnings differently — they're not errors yet but signal upcoming changes.

**See also:** [[Seed Stress Test - Error Knowledge Capture in Programming]]

**Edge case (stress test 2026-03-22 - cooking domain):** In cooking and culinary arts, error knowledge capture needs significant domain-specific adaptations:

- **Cooking "errors" are sensory descriptions, not codes:** Instead of error codes, cooking errors manifest as sensory observations ("sauce is grainy", "bread didn't rise", "steak is tough", "cookies are dry"). Use descriptive error categories: `textural`, `visual`, `flavor`, `structural`, `thermal`. Capture the observable symptom as the "error code."

- **Same error, multiple root causes:** "Sauce broke" can be caused by (1) adding fat too fast, (2) temperature too high, (3) acid added too early, (4) wrong emulsifier ratio, (5) ingredients too cold. Unlike programming where one error message often maps to one cause, cooking requires context-matching. Use `error-pattern:` with multiple `root-cause:` entries per descriptive error, or create separate notes for each cause-solution pair.

- **Context dependencies are critical:** Cooking errors depend on (1) altitude (affects boiling points, leavening), (2) humidity (affects doughs, baking), (3) equipment (gas vs electric ovens vary 50°F+), (4) ingredient brands (different sodium levels, fat contents), (5) pan material (heat distribution differs). Use `error-context:` fields documenting these factors. The same error may require different solutions in different contexts.

- **Sensory vs. measurable errors:** Distinguish errors that are objectively measurable (internal temperature, pH, weight ratios) from those requiring sensory judgment (color, texture, doneness). Use `error-detection-mode:` with values `measurable` (can test with tools), `sensory` (requires human judgment), `both`.

- **Food safety vs. technique errors:** Food safety errors (temperature abuse, cross-contamination) have expiration (guidelines change with new research) and high stakes (can cause illness). Technique errors (sauce breaking, overmixing) are timeless but skill-dependent. Use `error-category:` with values `food-safety` (expirable, high-stakes), `technique` (timeless, skill-dependent), `preference` (taste/texture subjective).

- **Error persistence differs by type:** Food safety errors should have shorter review cycles (90 days, like programming) and `error-valid-until:` for expiration. Technique errors are more durable — a sauce-breaking fix from 1950 still works. Set `review-interval:` appropriately per error type.

**See also:** [[Seed Stress Test - Cooking Knowledge Base]], [[Seed Stress Test - Error Knowledge Capture in Programming]]

**Rule:** Apply the 5:1 personal-to-general knowledge ratio — capture insights, decisions, and experiences (personal) over restatable facts (general).
**Why:** Personal knowledge compounds and provides unique value no web search can match. General knowledge takes maintenance effort but offers little unique value.
**Test:** Pick 10 recent notes. For each: (1) Could a web search replace this note in <30 seconds? (2) Does it contain original insight, decision, or experience? Ratio should be 5:1 personal to general.
**Edge case:** General knowledge is acceptable when: frequently referenced (saves lookup time), synthesized with personal analysis, or domain-specific enough to be hard to find.

**Edge case (stress test 2026-03-17):** In legal knowledge bases, the 5:1 ratio needs significant modification due to domain-specific constraints:

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

**Edge case (stress test 2026-03-18):** In scientific research knowledge bases, the 5:1 ratio needs domain-specific calibration due to unique knowledge dynamics:

- **Literature synthesis as personal knowledge:** Synthesizing 3+ papers with YOUR interpretation adds unique value — count as personal-equivalent. Add `synthesis-type:` field (comparison|contradiction|extension|methodology-review).
- **Methodological tacit knowledge:** Statistical choices, experimental design decisions, and lab techniques are tacit knowledge — document why YOU chose this approach (vs. alternatives) to count as personal.
- **Reproducibility context:** Your specific protocol adaptations, lab conditions, and troubleshooting are uniquely valuable personal knowledge. Add `reproducibility-context:` field (lab-specific|protocol-deviation|troubleshooting-log).
- **Negative results:** What didn't work in YOUR experiments is rarely published but high-value — count as personal. Tag with `result-type: negative`.
- **Tool proficiency:** Database/software expertise (PubMed, R, Python, lab equipment) involves accumulated tacit expertise beyond tutorials — count as personal when including YOUR workflow tips.
- **Temporal validity:** Scientific knowledge expires as new research emerges. Add `temporal-validity: current|contested|superseded` — superseded notes should be archived and don't count toward ratio.
- **Collaborative ownership:** If you contributed original thinking to collaborative work, it counts as personal. Add `contribution-type:` field (led-developed|co-developed|curated|synthesized).

**Modified test for scientific research:** For research notes: (1) Does this synthesize 3+ sources with YOUR interpretation? (2) Does it document why YOU chose this method (vs. alternatives)? (3) Does it include YOUR lab-specific adaptations? (4) Does it document what didn't work in YOUR experiments? (5) Does it include YOUR accumulated tool expertise beyond basic tutorials? Count as personal if yes to any. Exclude `temporal-validity: superseded` from ratio calculations.

**Edge case (stress test 2026-03-21):** In woodworking and similar craft/physical skill domains, the 5:1 ratio needs domain-specific calibration:

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

**See also:** [[Seed Stress Test - 5-1 Ratio in Gardening]] (detailed stress test with additional edge cases)

**Rule:** Treat meta-learning (learning how to learn) as a foundational skill to develop actively, not a passive ability.
**Why:** Meta-learning skills compound across all domains — investing in them provides returns everywhere. A second brain is a concrete implementation of this skill.
**Test:** Can you explain your learning process for a recent topic? Do you have a system for improving how you acquire, organize, and use knowledge?

**Rule:** Distinguish thinking tools from domain knowledge — tag notes containing metacognitive strategies, reasoning frameworks, or cognitive patterns with `thinking-tool: true`.
**Why:** Thinking tools (how to think) serve a different purpose than domain knowledge (what to think about). Separating them enables cross-domain transfer, personalized learning about learning, and explicit verification of effectiveness.
**Test:** Can you apply this knowledge to a completely different domain? If yes, tag as thinking tool with `thinking-tool-type:` (cognitive-strategy|self-regulation|reasoning-framework|bias-awareness).

**Rule:** Include personalization context for self-regulation knowledge — notes about personal cognitive strategies must include `your-context:` and `effectiveness-evidence:` fields.
**Why:** Self-regulation strategies are highly individual. A strategy that works for you may not work for others. Context enables appropriate skepticism and adaptation.
**Test:** Could someone else reasonably adapt this strategy to their context? Does the note include what specifically makes it work for you?

**Rule:** Link thinking tools to application examples — every thinking tool note must link to at least 2 domain notes where the tool was applied.
**Why:** Thinking tools are abstract until seen in action. Links to examples demonstrate transfer and help readers understand practical application.
**Test:** Can you find 2+ domain notes that use this thinking tool? If not, either find applications or defer until you have examples.

**Rule:** Review thinking tools annually — thinking tool notes must have `last-reviewed` no older than 12 months.
**Why:** What works for you may change as your context, goals, and cognitive state evolve. Regular review ensures tools remain relevant and effective.
**Test:** Is `last-reviewed` within 12 months? If older, either update or deprecate with explanation.

See also: [[Frontier Exploration - Metacognitive Knowledge and Thinking Tools]] for frameworks on capturing cognitive strategies.

**Rule (NEW - 2026-03-24):** Separate practice meta-knowledge from skill domain knowledge using dedicated practice notes.
**Why:** Daily practice knowledge (how to maintain consistent practice in skill-building domains) is fundamentally different from skill knowledge (the content of the skill itself). Mixing practice management with skill knowledge creates bloat and makes it hard to find either. Practice notes should be searchable independently from the skill knowledge itself.
**Test:** Can you find your practice routine without navigating through skill notes? Do practice notes contain primarily HOW TO PRACTICE, not WHAT THE SKILL IS? Are practice metrics documented in a way you can actually use?
**Implementation:** Use dedicated practice notes with frontmatter:
```yaml
type: practice-routine
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
**Separation principle:** Practice notes answer "HOW do I practice this skill?" while skill notes answer "WHAT is this skill?" Keep them separate for discoverability and maintenance.
**See also:** [[Seed Gap - Practice Routine Structure]]

**Rule (NEW - 2026-03-25):** Track skill progression using explicit milestone and state tracking.
**Why:** Practice sessions document what you did; progression notes document what you're improving. Without explicit progression tracking, you can't distinguish "practicing" from "improving." Skill regression, plateaus, and transfer learning opportunities are invisible without systematic tracking.
**Test:** For skill domains you're developing: (1) Can you identify current level vs. target level? (2) Are there explicit milestones defining progress? (3) Do you track regression (skills lost due to lack of practice)? (4) Can you identify plateaus (no progress despite practice)? (5) Do you track transfer learning (skills that transfer between domains)?
**Implementation:** Use progression frontmatter:
```yaml
progression:
  current-level: beginner|intermediate|advanced|expert
  target-level: intermediate|advanced|expert
  milestones:
    - label: "Achieve X"
      status: achieved|in-progress|pending
      achieved-date: 2026-03-15
  regression-risk: high|medium|low
  plateau-detected: true|false
  transfer-learning:
    - from-skill: "piano"
      to-skill: "music-theory"
      applicability: high|medium|low
```
**Milestone types:** Technique mastery, repertoire expansion, speed/accuracy improvement, consistency achievement, performance readiness.
**See also:** [[Seed Stress Test - Music Performance Knowledge Base]]

**Rule (NEW - 2026-03-25):** Classify practice by type and apply appropriate session structure.
**Why:** Deliberate practice (improving specific weaknesses) needs different structure than maintenance practice (keeping skills sharp) or exploratory practice (trying new approaches). Using the wrong structure wastes time.
**Test:** Can you categorize your practice sessions by type? Does each type have appropriate structure?
**Practice types:**
- **Deliberate practice:** Focus on specific weaknesses, targeted drills, immediate feedback, narrow scope
- **Maintenance practice:** Keep skills sharp, broader scope, less focused on improvement
- **Exploratory practice:** Try new approaches, experiment with variations, wide scope, no specific goal
- **Performance practice:** Practice for specific events, realistic conditions, full runs not drills

**Implementation:** Use practice-type frontmatter:
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
    - warm-up: 10min
    - practice: 40min varied
    - cool-down: 10min
  exploratory:
    - warm-up: 5min
    - experiment: 50min new approaches
    - reflection: 5min what worked
  performance:
    - warm-up: 15min
    - full-runs: 3x under realistic conditions
    - cool-down: 10min
```
**See also:** [[Seed Gap - Practice Routine Structure]] (gap now partially addressed)

**Rule:** Define explicit vault boundaries — categorize what you keep (core knowledge), what you tolerate (operational), and what you exclude (ephemeral).
**Why:** Without boundaries, the vault accumulates noise, search quality degrades, and the "second brain" becomes a dumping ground. Explicit boundaries enable intentional curation.
**Test:** Can you list: (1) What types of notes are always kept? (2) What types are reviewed and either integrated or deleted? (3) What types are never added? If you can't answer these, the boundary is undefined.

**Rule (NEW - 2026-03-23):** Define explicit exclusion criteria — document what knowledge is systematically excluded and why.
**Why:** The Seed tells you what to capture (priority signals, diminishing returns) but not what to systematically exclude. Without explicit exclusion criteria, vaults accumulate based on what capture agents find interesting rather than what serves the vault's purpose. The inverse of "what to capture" is not "what not to capture" — it's "what creates negative value."
**Test:** Can you identify: (1) Public utility knowledge (easily found via web search, not personalized)? (2) Ephemeral temporal knowledge (stale within 7 days)? (3) Duplicate knowledge (exists already in vault)? (4) Decorative knowledge (exists only to satisfy structural requirements)? (5) Scope-violating knowledge (violates vault's stated purpose)? (6) High-maintenance low-value knowledge (frequent updates, low utility, no unique context)? If you can't categorize exclusions, the criteria are undefined.
**Implementation:** Document exclusion categories in a dedicated Exclusion Policy note or in vault documentation:
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
**See also:** [[Frontier Exploration - Systematic Knowledge Exclusion Criteria]] (frontier gap note documenting this gap and implementation details)

**Rule:** Use a staging area (inbox) for uncategorized captures — process within 48 hours or explicitly defer with a review date.
**Why:** Capture first, process second is good advice, but "process" must have a deadline. Unprocessed captures become permanent clutter.
**Test:** Does an inbox exist? Are there notes older than 48 hours that aren't marked for later review?

**Rule:** Separate operational knowledge from synthesized knowledge — project notes, meeting notes, and task lists should either be time-boxed (auto-deprecate) or clearly marked as temporary.
**Why:** Operational debris looks like knowledge but isn't. It clutters searches and misleads about the vault's actual contents.
**Test:** Pick 10 random notes. Can you categorize each as: (a) permanent knowledge, (b) time-boxed operational, or (c) should be deleted?

**Rule:** Evaluate multi-vault architecture when vaults exceed 200 notes — consider splitting when purposes, audiences, or conventions diverge significantly.
**Why:** Beyond 200 notes, reorganization becomes expensive. It's cheaper to split early based on explicit criteria than migrate later. Different purposes, audiences, or required conventions signal that separate vaults may serve better than one mega-vault.
**Test:** If vault exceeds 200 notes: (1) Can you state a single unified purpose? (2) Do all notes serve that purpose? (3) Are there domains that require different conventions? (4) Do different audiences need different structures? Split if yes to 3-4; reconsider if no to 1-2.

**Rule:** Assess reorganization need when structural symptoms appear — track hop depth trends, hub utilization, link coherence, and category relevance quarterly.
**Why:** Without explicit reorganization assessment, structural debt accumulates until it becomes paralyzing. Explicit triggers make reorganization proactive rather than reactive. Structural decay is silent unlike broken links or missing frontmatter.
**Test:** Can you identify 3+ structural symptoms that would trigger reorganization assessment? Do you track structural health over time, not just current state?
**Trigger thresholds:** Hop depth trend increased >1 hop over 6 months; Hub utilization dropped >30%; Link coherence score declined significantly; Category no longer reflects current interests.

**Rule:** Use reorganization scope to determine approach — categorize as local (1-3 hubs), regional (3-10 hubs), or global (entire structure).
**Why:** Not all reorganization is equal. Matching approach to scope prevents over-reaction to local problems and under-reaction to systemic issues.
**Test:** For reorganization need, can you categorize scope as local/regional/global? Does your approach match the scope?
**Approach mapping:** Local scope → gradual migration, one hub at a time; Regional scope → plan migration sequence, execute in phases; Global scope → consider rebuild instead (full reorganization rarely worth the cost).

**Rule:** Calculate reorganization cost before committing — estimate notes affected, links to rewire, time required, and rollback complexity.
**Why:** Reorganization has a cost in broken links, time, and rollback risk. Without explicit cost calculation, AI agents either avoid necessary reorganization or perform unnecessary reorganization.
**Test:** Before reorganizing, can you estimate: (1) notes affected, (2) links to rewire, (3) time required, (4) rollback complexity? Is cost < benefit threshold before proceeding?
**Cost-benefit formula:** Cost = notes_affected × avg_links_per_note × time_to_rewire; Benefit = expected_improvement_in_navigability × expected_usage_frequency; Proceed if benefit > cost × safety_factor (1.5).

**Rule:** Prefer gradual reorganization for local scope — evolve structure piece by piece, maintain dual-link period, remove old only after 30+ day validation.
**Why:** Radical reorganization creates large commits, risks broken links, and makes rollback difficult. Gradual reorganization allows learning, reduces risk, and maintains vault continuity.
**Test:** For local-scope reorganization, does your approach evolve structure over time rather than in one pass? Do you maintain backward compatibility during migration?
**Implementation:** Create new structure alongside old; Add dual-link period (links to both old and new locations); Monitor usage to verify new structure works; Remove old structure only after validation period (30+ days).

**Rule:** Track structural decisions as explicit knowledge — use frontmatter to document rationale, scope, and outcomes for reorganization decisions.
**Why:** Reorganization decisions are structural trade-offs. Without explicit capture, the vault cannot learn from structural choices or review them later.
**Test:** Can you identify 3+ reorganization decisions made in your vault? Are they documented with rationale, scope, and outcomes?
**Implementation:** Use frontmatter:
```yaml
structural-decision: true
reorganization-type: local|regional|global
scope: affected_hubs_or_notes
decision-rationale: why_this_approach
decision-date: 2026-04-03
rollback-plan: how_to_reverse_if_needed
outcome-tracked: true|false
```

**Rule:** Use cross-vault links sparingly — if >1% of links cross vaults, consider merging or clarifying boundaries.
**Why:** Cross-vault links are harder to maintain, don't benefit from shared conventions, and often signal unclear vault boundaries. Most knowledge should live in one vault.
**Test:** Calculate cross-vault links / total links. Is it under 1%?

**Rule:** When cross-vault knowledge is necessary, use consistent reference patterns — prefer vault alias notes (summaries with links to canonical sources) over raw duplication.
**Why:** Duplication creates sync nightmares; raw links lack context. Alias notes provide local relevance while maintaining single points of truth.
**Test:** For cross-vault knowledge: (1) Is there a clear canonical source? (2) Do other vaults use alias notes or direct links? (3) Can you update all instances from one location?
**Implementation:** Use `canonical-vault:` and `local-variant:` frontmatter to track ownership.

**Rule:** Capture personal experimentation results — document specific things you tried that didn't work for your specific context.
**Why:** Something that works for others may not work for you. Personal experimentation results (what you tried, why it failed for you) are valid knowledge that general anti-patterns can't capture. This helps avoid repeating failed experiments and preserves context-specific learning.
**Test:** Can you list 3 things you tried that didn't work for you? Do you have notes capturing what, why it failed, and the context?
**Implementation:** Use structure:
```yaml
experiment: What you tried
context: Your specific situation  
outcome: What happened
reason-for-failure: Why it didn't work for you
retry-conditions: When you might try again
```

**Rule:** Distinguish general principles from context-specific adaptations — tag knowledge that works specifically for your situation differently from universal advice.
**Why:** General knowledge ("spaced repetition works") is valuable but context-specific knowledge ("spaced repetition with Anki at 20 new cards/day works for me") is more actionable. Without explicit tagging, you rediscover your context every time.
**Test:** Can you identify notes tagged as universal principles vs. your specific adaptations? Do context-specific notes document the parameters that make them work for you?
**Implementation:** Use `applicability: universal|context-specific` frontmatter. For context-specific notes, include `worked-for: [your identifier]` and document specific parameters (tools, timing, constraints).

**Rule:** For domains with extreme individual variation (fitness, nutrition, learning styles, sensory preferences), add `individual-variation` tagging to distinguish person-specific knowledge from universal principles.
**Why:** In domains like fitness, nutrition, and personal productivity, the same advice can be correct for one person and incorrect for another. Without explicit individual-variation tagging, AI agents cannot distinguish "this works for everyone" from "this works for specific body types/conditions/preferences."
**Test:** For fitness/nutrition/productivity notes: (1) Does the note include `individual-variation: high` for person-dependent knowledge? (2) Are person-specific experiments documented separately from universal principles? (3) Can you identify which claims apply broadly vs. only to specific individuals?
**Implementation:** Use frontmatter:
```yaml
individual-variation: high  # vs low/medium
applicability-scope: universal|person-specific|condition-specific
# For person-specific notes, include:
your-context: description of your specific situation
experiment-variables: what makes this work for you specifically
```
**Edge case:** Some fitness principles are universal (progressive overload, adequate recovery) even if specific implementation varies. Tag the universal principles as `individual-variation: low` even within high-variation domains.

**Rule (NEW - 2026-04-05):** For goal-dependent domains (fitness, finance, career, education, creative projects, photography, woodworking, pottery), add `goal-scope:` frontmatter to capture which goals this knowledge serves.
**Why:** In domains where the same knowledge has different utility depending on user goals, the Seed's utility test must be goal-contextualized. Without explicit goal-scope, AI agents cannot correctly evaluate whether a note improves vault answers, and users cannot filter knowledge by their intended purpose.
**Test:** For goal-dependent domain notes: (1) Does frontmatter include `goal-scope:`? (2) Can you filter notes by goal? (3) Does the utility test evaluate within goal context, not in abstract?
**Implementation:**
```yaml
goal-scope: [list of applicable goals]
# Fitness examples:
goal-scope: [strength, hypertrophy, endurance, health, flexibility]
# Photography examples:
goal-scope: [portrait, landscape, street, macro, sports]
# Woodworking examples:
goal-scope: [furniture-making, cabinetry, shop-projects, restoration]
# Pottery examples:
goal-scope: [functional-ware, decorative, sculptural, production]
```
**Modified utility test:** For goal-dependent domains, evaluate utility within goal context:
- **Utility (modified):** Does this improve answers FOR THE SPECIFIED GOAL? Does goal-scope match the intended user's goals?
- **Connection (modified):** Links to 2+ notes WITH SAME GOAL SCOPE; links to goal-specific principles?

**Rule (NEW - 2026-03-22):** For knowledge that depends on multiple conditions being true simultaneously, explicitly document each condition with `compound-conditions:` frontmatter listing all dependencies and verify applicability by checking ALL conditions, not just the primary one.
**Why:** Compound context knowledge fails silently when any single condition is missed. Unlike single-condition knowledge (where the main factor determines applicability), compound knowledge requires ALL conditions to be verified. Without explicit compound documentation, AI agents and users cannot assess whether the knowledge actually applies to their situation.
**Test:** Pick 10 notes with contextual claims (advice, recommendations, procedures). For each: (1) Can you identify all conditions that must be true for this to apply? (2) Does the note explicitly list these conditions? (3) Would missing any single condition make the advice inapplicable or incorrect? (4) Does the note warn about compound failure modes?
**Implementation:** Use frontmatter:
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
**See also:** [[Frontier Exploration - Compound Context Knowledge]]

**Rule:** Assess harm potential before capturing personal or sensitive information — identify what to exclude or encrypt.
**Why:** Knowledge that seems harmless today could cause harm if exposed (identity theft, professional liability, personal embarrassment). Pre-capture harm assessment prevents future problems. This is the inverse of vault boundaries: not just what topics to include, but what specific knowledge to exclude.
**Test:** For notes containing: (1) personal identifiers, (2) financial details, (3) health information, (4) details about living individuals: Can you articulate what harm could result if this note were exposed? Is there a mitigation (encryption, isolation, exclusion)?

**Rule:** Exclude or protect knowledge about living individuals without consent — apply privacy by default.
**Why:** Capturing information about others without their knowledge creates ethical and legal risk. Even in personal vaults, this principle protects against future harm.
**Test:** For notes mentioning specific living people: (1) Did they consent to being recorded? (2) If no, is the note encrypted, excluded, or anonymized? (3) Could this knowledge cause them harm if exposed?

**Rule:** Distinguish relationship-specific knowledge from general interpersonal knowledge — tag notes about specific people with subject, verification status, and sensitivity level.
**Why:** Knowledge about a specific partner, child, friend, or colleague is fundamentally different from general social advice. Tips that work for your partner may not work for anyone else. Without explicit tagging, readers and AI agents cannot assess applicability.
**Test:** For notes about interpersonal dynamics: (1) Does this apply to a specific person or to people in general? (2) If specific, is there `subject:` frontmatter identifying the person? (3) Is it marked as `verification: inferred` vs. `verification: direct-confirmation`? (4) Is `sensitivity:` marked as private, restricted, or shareable?

**Rule:** Distinguish knowledge base purpose — learning vs reference — and apply Seed rules with appropriate flexibility.
**Why:** Learning KBs (prioritizing understanding, progression, prerequisites) and reference KBs (prioritizing findability, quick retrieval, completeness) have different structural needs. The same Seed rule may need different strictness levels.
**Test:** (1) Can you state the vault's primary purpose: learning, reference, or hybrid? (2) For learning KBs: Are prerequisite chains preserved even if they exceed 3 hops? (3) For reference KBs: Is hub density optimized for quick retrieval? (4) For hybrid: Is the purpose stated in `_root.md`?
**Edge case:** Learning KBs may allow: foundational notes with <2 outgoing links (prerequisite chains are reached, not linked from), longer explanatory content (>300 words for depth), and hop counts exceeding 3 for pedagogical depth.
**Edge case:** Reference KBs should enforce: strict atomicity for findability, minimum 2 links for navigation, hub density for multiple entry points, 3-hop maximum for quick retrieval.

**Rule:** Define explicit completion criteria for each knowledge domain — state what "done" looks like before collecting.
**Why:** Without completion criteria, knowledge capture has no natural stopping point. AIs either over-collect (bloat) or under-collect (missing core). Explicit criteria enable intentional prioritization between breadth (many topics) and depth (few topics, many notes).
**Test:** For each major topic area (hub): (1) Can you state what 80% core coverage looks like? (2) What specific notes would exist at that threshold? (3) What indicators would suggest saturation (diminishing returns)?
**Edge case:** Completeness is domain-dependent: reference KBs aim for comprehensive coverage, learning KBs ensure prerequisite chains are complete, project KBs cover anticipated questions. Adjust targets by KB purpose.
**Implementation:** Add `completeness-target:` frontmatter to hub notes (e.g., `completeness-target: core` for essential coverage, `completeness-target: comprehensive` for reference-level).

See also: [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] for detailed guidance on assessing domain coverage and completion criteria.

**Rule:** Define explicit learning progression for learning-focused vaults — identify entry points, milestone nodes, and exit criteria.
Why: Without explicit progression, learning vaults become reference vaults in disguise. Learners need a navigable path, not just a graph. The Seed covers prerequisites but not the intentional design of learning sequences.
Test: (1) Can you trace a learning path from zero to basic competence? (2) Are there explicit milestone notes marking progress? (3) Can a learner determine when they've "completed" the basics? (4) Can you identify domain primitives that unlock most other knowledge?
Edge case: Learning progressions differ from content dependencies — some knowledge enables learning (primitives) while not being a content prerequisite. Mark these with `learning-primitives: true`.
Edge case: Mutually-supporting knowledge (like vocabulary and grammar in language learning) should be identified as such — use `learning-support: bidirectional` for notes that reinforce each other.

See also: [[Frontier Exploration - Learning Progression and Curriculum Design]] for detailed guidance on capturing learning sequences.

**Rule:** For multi-language vaults, establish language relationship conventions before adding translated content.
**Why:** Without explicit conventions, translation relationships become ambiguous (is this a translation or an equivalent concept?), cross-language links break, and search results become confusing.
**Test:** Can you for any note in Language A find its equivalent in Language B using explicit relationship tags? Do all cross-language links specify relationship type?
**Edge case:** Keep the Seed in English as a technical lingua franca — translate only after domain concepts stabilize.
**Edge case:** For language learning vaults, use separate notes for concept (native language) and vocabulary (target language) with explicit `learning-relationship:` linking.

**Rule (NEW - 2026-03-29):** For multilingual knowledge bases, determine cognitive model before choosing organizational structure — cognitive integration (naturally mixing languages in thought) requires different treatment than language separation (different languages for different audiences).
**Why:** The Seed's multilingual guidance assumes languages are co-equal and separate. But bilingual cognitive processes vary: some users naturally code-switch (translanguaging) as a unified thought process, others switch languages for audience separation. Treating both identically creates either fragmentation (over-separating bilingual-integrated notes) or混乱 (unsystematic mixing in bilingual-separated contexts).
**Cognitive models:**
- `cognitive-model: monolingual` — One language primary, others as lookup
- `cognitive-model: bilingual-integrated` — Multiple languages used naturally in single thought (code-switching/translanguaging as cognitive process)
- `cognitive-model: bilingual-separated` — Languages used for different audiences/purposes

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

**Test:**
1. Can you determine the cognitive model of the vault?
2. For bilingual-integrated: Are multiple languages handled as natural co-occurrence with multi-language frontmatter?
3. For bilingual-integrated: Is there a bidirectional terminology index?
4. For bilingual-integrated: Is technical terminology separated from explanatory context?
5. For bilingual-separated: Can users find content in their preferred language?
6. For any multilingual note: Does it have `languages-used:` and `cognitive-model:`?

**See also:** [[Seed Stress Test - Code-Switching in Japanese-English Programming Vault]] — stress test that refined this rule

**Rule:** For timeline-organized vaults (project histories, personal life events, historical research, meeting logs), recognize temporal structure as primary and apply modified Seed rules.
**Why:** The Seed treats time primarily as a decay factor, but many knowledge domains are fundamentally organized around chronology. When time IS the primary structure, standard rules about hubs, atomicity, and linking create friction. Timeline vaults need explicit guidance to avoid forcing topic-based organization where chronology is primary.
**Test:** Can you identify if the vault's primary structure is chronological (timeline) or topical? For timeline-organized vaults: (1) Is there a timeline hub note that sequences major events? (2) Are entries organized by period (year, month, iteration) rather than by topic? (3) Do cross-references link across the timeline (thematic connections) rather than only along it (temporal neighbors)?
**Edge case:** Timeline vaults may have dual structure — chronological primary with topical secondary. The test: Is there a meaningful narrative flow that requires reading in order? If yes, timeline is primary.
**Edge case:** Pure timeline vaults (event logs) should use `period:` frontmatter (year, month, quarter, iteration) and link thematically to related topic notes, not just temporally to neighbors.
**Edge case:** Overlapping timelines (personal + professional simultaneously) need explicit `timeline-type:` tagging to distinguish parallel narratives.

**Rule (NEW - 2026-03-23):** Handle recurring and periodic knowledge distinctly from static or time-sensitive data — capture the recurrence pattern itself, not just the current occurrence.
**Why:** The Seed covers timeline-organized vaults (causal sequences) and time-sensitive data (rapidly changing values), but lacks guidance for recurring knowledge where the schedule IS the knowledge. Treating recurring events as static "fact" notes loses the pattern and makes notes feel outdated between cycles. Capturing recurrence patterns (annual, quarterly, seasonal) preserves reusable knowledge that remains valid across cycles.
**Test:** Can you categorize temporal notes as: (1) one-time event (single date), (2) recurring event (schedule pattern), (3) time-sensitive data (rapidly changing value), (4) sequential knowledge (causal chain)? For recurring notes: Does frontmatter include `recurrence-pattern:`, `cycle-type:`, and `next-occurrence:`?
**Implementation:** Use frontmatter for recurring knowledge:
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
**Edge case:** Variable schedules (Easter, DST transitions) use `schedule-variable: true` with calculation rule. **Edge case:** Multi-year cycles (elections, census) use `cycle-period: N-years`. **Edge case:** Location-dependent schedules (fiscal year start varies by country) use `jurisdiction:` to scope.
**See also:** [[Seed Gap - Recurring and Periodic Knowledge]] (frontier gap note documenting the gap and implementation)

**Rule:** Plan for vault migration before you need it — maintain portable formats, avoid plugin lock-in, and document any tool-specific features.
**Why:** Vaults often outlive the tools that host them. Platforms change, tools sunset, needs evolve. Vaults built with portability in mind survive tool transitions; vaults built on plugin-specific features do not.
**Test:** (1) Can the vault function with basic Markdown only (no plugins)? (2) Are all attachments stored relative to notes (not absolute paths)? (3) Is there documentation of any tool-specific features used?
**Edge case:** If tool-specific features are essential (e.g., Dataview queries), document them as deprecated if the tool sunsets, and create migration paths.

**Rule:** For vault merging scenarios (combining two vaults), establish purpose hierarchy — the primary vault purpose dominates, notes not serving that purpose are candidates for archival.
**Why:** Two vaults with different purposes cannot simply be combined without coherence loss. Without explicit purpose hierarchy, the merged vault lacks direction and notes drift.
**Test:** Given two vaults to merge: (1) Can you state a single primary purpose for the merged vault? (2) Are notes categorized as: serve-primary, serve-secondary, or archive? (3) Are cross-vault duplicates resolved using purpose-alignment?
**Edge case:** When both vaults have equal value but different purposes, consider keeping them as separate vaults with cross-vault links rather than forcing a merge.
**Edge case:** Schema conflicts during merge should default to the more comprehensive schema and migrate notes to that standard.

See also: [[Frontier Exploration - Vault Merging and Migration]] for detailed exploration of this gap.

**Rule:** Track recovery effort vs. rebuild cost — when accumulated decay would take longer to repair than to rebuild, consider rebuild.
**Why:** Continuing to repair a severely degraded vault wastes effort that could build a healthier foundation. Without explicit comparison, AI agents default to repair (sunk cost fallacy). The Seed covers maintenance but not the decision to abandon and start over.
**Test:** Calculate recovery effort across 5 symptom categories: (1) structural rot — orphan rate >30% estimates >20 hours, (2) schema collapse — no dominant pattern estimates >15 hours, (3) quality debt — score >0.50 estimates >40 hours, (4) purpose drift — mismatch >50% estimates >10 hours, (5) technology lock-in — cannot export cleanly. Sum estimates. If total >40 hours AND no improvement in last 90 days → recommend rebuild discussion.
**Symptoms triggering rebuild consideration:**
- Structural rot: >30% orphans, hop depth >5 for >20% of notes, collapsed hub structure
- Schema collapse: multiple competing naming conventions, >10 frontmatter fields undocumented, >100 tags with no controlled vocabulary
- Quality debt: verification ratio <20% for 6+ months, debt score >0.50, >50% stale (>90 days since review)
- Purpose drift: _root.md purpose no longer matches content, vault became dumping ground
- Technology lock-in: depends on deprecated plugins, cannot export to basic Markdown
**When NOT to rebuild:** Vault <50 notes (refactor instead), problems are localizable (split instead), only 1-2 symptoms present (repair is faster), recent improvement trend.
**Hybrid approach:** Archive old vault, start new with Seed; selectively migrate notes passing quality filters.

**Rule (NEW - 2026-03-27):** Create a new note when the knowledge represents a distinct atomic idea that could stand alone; extend an existing note when the knowledge is a variation, example, or elaboration of an existing concept.
**Why:** Without explicit criteria for note creation vs. extension, AI agents default to creating new notes (easier, more visible) even when extending existing notes would strengthen the graph. This creates fragmentation where related ideas are scattered across multiple thin notes instead of concentrated in robust, interconnected ones.
**Test:** For incoming knowledge: (1) Can this idea be expressed in one sentence as a standalone insight? (2) Does it have its own prerequisite structure? (3) Would it naturally link to 2+ existing notes in a way that isn't just "related to"? (4) Could someone search for this specifically and expect a dedicated result? If yes to 2+ criteria, create new. Otherwise, extend existing. See [[Note Creation Decision Framework]] for detailed decision tree.
**Implementation:** Use frontmatter to track note creation rationale:
```yaml
creation-rationale: new-note|extension|split
extension-target: [[Existing Note Name]]  # if extension
creation-criteria-met: [list of criteria met]
```
**Edge case:** When in doubt, extend — it's easier to split later than to merge scattered notes. Stub notes (brief, <100 words) are acceptable placeholders that signal "more coming" and can be expanded.

**Rule (NEW - 2026-03-28):** Track and counteract systematic AI agent behavioral patterns — monitor capture patterns for recency bias, confirmation bias, pattern-matching over discovery, efficiency tunneling, and authority amplification.
**Why:** AI agents have predictable behavioral tendencies that can distort vault structure. Without explicit behavioral monitoring, vaults develop artifacts from agent behavior rather than organic knowledge needs. The Seed assumes a rational capture agent but doesn't account for its systematic biases.
**Test:** (1) Can you identify recency bias in recent captures (recent topics over foundational)? (2) Does the vault show confirmation bias (self-referential links, few external sources)? (3) Are new hubs emerging or only existing hubs growing? (4) Is capture targeting easy wins over high-value work? (5) Is personal synthesis present or only external source aggregation?

**Implementation:** Run behavioral audits quarterly. Track metrics:
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

**Rule:** Every note must contain exactly one idea, summarizable in one sentence.
**Why:** Multi-idea notes are hard to link, hard to find, and impossible to reuse in new contexts.
**Test:** Can the note be summarized in one sentence that captures its core purpose? If the summary requires multiple sentences or fundamentally different topics, split it. (Note: the presence of "and" in a summary does NOT indicate multiple ideas — comparative notes, relationship notes, and hub notes may legitimately use "and" while remaining atomic.)

**Rule:** Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas.
**Why:** Size is a reliable proxy for atomicity — oversized notes almost always bundle concepts.
**Test:** Count words. Flag notes outside the 100-300 range for review. For notes >300 words: (1) Is this an executable procedure (recipe, code, tutorial, technical spec)? (2) Would splitting make it harder to use? (3) Are parts independently reusable? Do NOT flag if yes to 1-2; flag for potential split only if yes to 3. For notes <100 words: verify it has a stub marker OR is a hub/redirect note OR is complete short procedural content (can be executed as-is).
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

**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.
**Why:** Unlinked notes are invisible in the graph — they cannot be discovered through navigation. Foundational elements are a special case that should be explicitly marked, not manually verified each time. Specialized instruments and domain-specific tools may legitimately have only one natural link when used in a single specific context.
**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag AND lacks the `specialized: true` tag.
**Edge case:** Deprecated redirect notes (notes whose only purpose is to point to a replacement) may link to only the replacement note. All other notes must have at least 2 links unless tagged `foundational: true`.
**Edge case:** Foundational elements (core ingredients in cooking like salt/oil/water, basic utilities in software, fundamental concepts in any domain) may legitimately have fewer than 2 natural links — forcing connections creates decorative links that hurt more than help. Tag these notes with `foundational: true` rather than forcing artificial links. The test: (1) Is this a true domain primitive that everything else references? (2) Would added links improve navigation or just inflate the graph? If yes to both, add `foundational: true` tag.
**Edge case:** Domain-specific instruments, tools, or assessment scales (clinical assessment tools like pain scales, specific equipment in technical domains, specialized instruments) may legitimately have only 1 natural link when they are specific to one procedure or use case. Forcing a second link creates decorative connections. The test: (1) Is this note about a specific instrument/tool used in exactly one context? (2) Does adding a second link serve navigation or just meet a quota? If yes to 1-2, allow single link or tag with `specialized: true`.
**Edge case:** Single-term definitions and standard domain terminology may legitimately have fewer outgoing links. This includes: (1) Abbreviations, codes, standard identifiers (BP, CPR, error codes); (2) Standard domain vocabulary that serves as the canonical way a concept is expressed (tempo markings like allegro/adagio in music, dynamics like piano/forte, foreign terminology in classical arts). The test for abbreviations: (1) Is this note primarily a lookup reference? (2) Does the term get referenced via backlinks from content notes? For standard terminology: (1) Is this term the standard way this concept is expressed in the domain? (2) Does the note primarily serve as a definition/lookup? If yes to either test, allow fewer links with `type: terminology` or `type: reference`.

**Edge case:** Physical or material primitives in creative/design domains may legitimately have fewer outgoing links. In board game design, core components (dice, cards, boards, tokens) and fundamental player actions (dice rolling, card drawing, resource tracking) are material and mechanical primitives that serve as category anchors rather than conceptual bridges. The test: (1) Is this a core physical component or fundamental mechanic used across many games? (2) Does it primarily serve as a category reference rather than a conceptual exploration? If yes to both, tag with `component-type: primitive` or `mechanic-type: primitive` and allow fewer links.

**Edge case:** Workflow or phase notes in project-based domains may legitimately have fewer natural links because they connect primarily to adjacent phases in sequence. In board game design, design phases (ideation, prototyping, playtesting, refinement); in software development, development stages; in creative projects, production phases all form linear chains rather than webs. The test: (1) Does this note represent a stage in a sequential process? (2) Do its primary connections point to adjacent phases? If yes to both, use `workflow-phase: true` to mark for threshold relaxation.

**Edge case:** Filter or category notes may legitimately have fewer outgoing links because users navigate TO these notes for filtering, not FROM them for learning. In board game design, genre categories (worker placement, deck building), player count specifications, and play time categories serve as filter criteria. In e-commerce, product category pages are navigated to, not from. The test: (1) Is this note primarily used as a filter or category entry point? (2) Do users arrive here to find specific items rather than learn about a concept? If yes to both, tag with `type: filter` or `category-type: genre-filter` and apply relaxed thresholds.

**Edge case:** Instance or case-study notes about specific entities (individual games, specific projects, concrete examples) may have fewer outgoing links because they are referenced BY conceptual notes, not vice versa. A note about "Catan" as a specific game links to game design concepts, but the conceptual notes (mechanics, genres) are what users explore from. The test: (1) Is this note about a specific instance rather than a general concept? (2) Does it primarily serve as an example for other notes to reference? If yes to both, track backlinks rather than enforcing outgoing link minimums.

**Rule (refined - 2026-04-02):** Apply note-type-aware link density — different note types have different link expectations based on their function in navigation.
**Why:** The uniform "at least 2 outgoing links" rule treats all notes as exploratory navigation points, but notes serve different functions: exploratory notes enable navigation, safety notes are reached via backlinks, foundational notes are referenced by everything, filter notes are entry points. Uniform rules create false positives and miss actual graph health issues.
**Test:** For each note, identify its primary function, then apply the appropriate check:
- Exploratory notes: ≥2 outgoing links (enable navigation to related concepts)
- Reference/definition notes: ≥2 backlinks OR linked from hub (enable discovery)
- Safety-critical notes: Backlinks from the equipment/procedure they protect (users reach via context, not explore)
- Foundational notes: `foundational: true` tag present (everything references them)
- Specialized notes: `specialized: true` tag present (single-use entities)
- Filter/category notes: ≥2 backlinks (users navigate TO for filtering)
**Implementation:** Use `note-type:` frontmatter field with values `exploratory|reference|safety|foundational|specialized|filter`. Apply appropriate link expectations based on type rather than uniform 2-link minimum.

**Equipment-tier connectivity test:** For equipment-dependent notes: Does frontmatter include `equipment-tier:`? Is there a tier-agnostic hub note that users with different equipment can navigate to?
**Cross-domain bridging test:** For notes that reference adjacent domains: Is there a bridging hub note that connects the domain to adjacent domains?

**Rule (NEW - 2026-04-05):** Add note-function taxonomy to complement note-type — content notes require >=2 outgoing links, while gap documentation notes, refinements, and stress tests have 0-1 links by design.
**Why:** Uniform link requirements incorrectly flag structural components as unhealthy. Gap documentation and stress tests serve meta-functions (documenting gaps, testing rules) not building interconnected content. Treating them the same creates noise in health checks.
**Test:**
1. Can you classify notes by function (content|gap-documentation|stress-test|refinement)?
2. Do health checks apply different thresholds based on function?
3. Are gap/refinement/stress-test notes exempted from standard link count requirements?

**Implementation:** Add `note-function:` frontmatter field with values:
- `content` — Core knowledge requiring 2+ outgoing links
- `gap-documentation` — Seed gaps documenting missing rules (0-1 links acceptable)
- `stress-test` — Domain-specific rule tests (0-1 links acceptable)
- `refinement` — Proposed rule changes (0-1 links acceptable)
- `hub` — Aggregation nodes (5+ links expected)

This complements `note-type:` (which covers content purpose) with `note-function:` (structural vault role). Both can coexist: `note-type: exploratory` AND `note-function: gap-documentation`.

**Rule:** Every link must be explainable in one sentence — no decorative or keyword-match links.
**Why:** Meaningless links inflate the graph without adding navigational or conceptual value.
**Test:** For each link in a note, can you state why the reader should follow it? Remove any link where you cannot.
**Edge case:** Domain-specific citation links (legal statutes, academic references, technical specifications) may serve authority rather than navigation — "This statement is supported by [[15 U.S.C. § 78j(b)]]" is explainable as establishing legal authority, even if readers wouldn't follow it for learning.
**Edge case:** Hierarchical references (statutes referencing other statutes, regulations referencing statutes) are explainable — "This regulation implements Section 10(b)" explains the relationship.
**Edge case:** Terminology chains where defining terms link to their components may be circular — "A [[proxy]] is someone who acts as a [[proxy]]" is tautological. Test: Can you explain the connection without repeating the term?
**Edge case:** Links to umbrella/broad terms (e.g., linking "contract law" to "Contract Law") may be too vague. Prefer linking to specific concepts the note actually discusses.
**Edge case:** Precedent chains (case A established X, refined in case B) are explainable when each link clarifies HOW the later case modified the earlier principle.

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

**Implementation:** Use frontmatter to track link types:
```yaml
link-type: learning|constitutive|reference|notation|developmental
```

**Edge case - Circular links:** Linking to [[functional harmony]] from a note about functional harmony is neither learning nor constitutive — it's circular and should be removed.

**Rule:** Use diverse link types — relevance, contrast, analogy, cause/effect, category membership.
**Why:** Homogeneous links create a flat graph; diverse connection types enable richer traversal and insight.
**Test:** Categorize links in a random sample of 5 notes. Are at least 3 different link types represented across the sample?
**Edge case:** "Relevance" is too broad — nearly any link could be called relevant. Define link types more precisely: (1) category membership — note is part of a larger topic, (2) prerequisite — note depends on another, (3) cause/effect — one explains the other, (4) contrast — opposites or alternatives, (5) analogy — similar patterns in different domains.
**Edge case:** Hub notes are inherently homogeneous — by definition they link to member notes via category membership. Exclude hub notes from the diversity test; their purpose is navigation, not diverse connections.
**Edge case:** Sequential knowledge (history, processes, narratives) legitimately has homogeneous cause/effect links. The rule should acknowledge this exception — sequential domains naturally have less link diversity.
**Edge case:** Atomic notes may have few but meaningful links (1-2). Don't penalize atomic notes for having fewer links if each link is substantive. The diversity test applies to larger notes, not atomic units.

**Rule:** Prefer linking to existing notes over creating new ones — search before you create.
**Why:** Duplicate notes fragment knowledge; linking to existing notes strengthens the graph.
**Test:** Before creating a note, search the vault. Does a note covering this idea already exist?

**Rule:** Use tags for broad categorization and filtering; use links for essential relationships and navigation.
**Why:** Tags and links serve different purposes — tags enable faceted search across independent dimensions, links create navigable graph structure. Conflating them loses both benefits.
**Test:** Can you explain why each tag represents a category (not a specific relationship)? Can you explain why each link represents an essential connection (not just categorical membership)?
**Edge case:** When a category IS also a note in the vault (e.g., "Herbs" exists as a hub note), prefer linking to that note rather than adding a tag. Tags work best when filtering is needed AND no note exists for the category. Example: Use a link to Hardiness Zone 7 when the hub note exists; use #hardiness-zone-7 tag only when no hub note exists.

**Edge case (expanded - multiple classification systems):** In domains with multiple competing classification systems (e.g., USDA vs Sunset hardiness zones in gardening, different medical classification systems), using a single tag loses critical information. Solution: (1) When multiple systems exist, use frontmatter fields instead of simple tags — e.g., `usda-zone: 7` and `sunset-zone: 15`; (2) Create hub notes for each classification system so links can point to the appropriate system hub; (3) For cross-system mappings, create dedicated mapping notes rather than trying to encode in tags.

**Edge case (expanded - temporal categories):** Temporal categories like seasons ("#spring", "#summer") sit in a gray area — they're both filterable facets AND navigational concepts (seasonal hub notes). Solution: (1) When temporal knowledge is a primary navigation pattern (e.g., gardening, event planning), prefer hub notes and links over tags; (2) When temporal filtering is needed alongside other facets, use tags for temporal and links for navigation; (3) For domains where both matter significantly, use both — tags enable filtering, links enable exploration.

**Rule:** Capture relational knowledge as first-class content — when knowledge EXISTS in the relationship between entities (not in the entities themselves), create explicit relationship notes or structured frontmatter.
**Why:** Knowledge about "how X relates to Y" (compatibility, conflict, synergy, trade-offs) is fundamentally different from knowledge about X or Y alone. Without explicit treatment, relational knowledge gets embedded in entity notes where it's hard to discover, verify, or maintain.
**Test:** For domains with significant entity relationships (equipment ecosystems, software stacks, ingredient pairings): (1) Can you find explicit documentation of how entities relate? (2) Are relationships typed (works-well-with, conflicts-with, depends-on)? (3) Do relationship notes exist as atomic units, or are relationships buried in entity notes?
**Implementation:** Choose approach based on relationship complexity:
- **Simple relationships:** Use typed links in content ("Lens X [[works-well-with→Camera Y]]")
- **Moderate complexity:** Use frontmatter relationships field
- **Complex/valuable relationships:** Create dedicated atomic notes (e.g., "Lens X + Camera Y Compatibility")
**Edge case:** Multiple relationships between same entities (works well / conflicts / optimal for different use cases) require either typed links, structured frontmatter, or separate notes. A single "they're related" link loses important nuance.
**Edge case:** Relationship validity may change over time (products update, ecosystems evolve). Include `relationship-version:` or `last-verified:` for time-sensitive relationships.

**Rule:** A note should rarely need more than 5 tags; it should link to as many notes as meaningful connections require.
**Why:** Tags represent facets — too many dilute meaning. Links represent relationships — the right number depends on the note's connectivity.
**Test:** Count tags on 10 random notes. Are most under 5? Do links exceed tags in quantity for well-connected notes?

**Edge case (NEW - stress test 2026-03-21):** In domains with orthogonal classification dimensions (machine learning, medicine, scientific research, engineering), notes may legitimately need more than 5 tags when each tag represents a distinct orthogonal axis:
- **Machine learning:** algorithm-type, framework, use-case, difficulty, domain, data-type (6+ distinct dimensions)
- **Medicine:** condition-type, body-system, treatment-category, specialty, acuity, chronicity
- **Scientific research:** methodology, domain, data-type, analysis-method, reproducibility-level

The test should distinguish: (1) Are tags on different orthogonal axes? (2) Does each tag add a distinct filtering dimension? (3) Would removing any tag lose essential classification information? If yes to all, the tags are orthogonal and the 5-tag limit may be relaxed.

**Tag vs. link guidance for orthogonal domains:** When tags represent orthogonal axes, prefer frontmatter fields over tags to maintain queryability without tag explosion:
```yaml
# Instead of multiple tags, use structured fields
algorithm-type: neural-network
framework: pytorch
use-case: classification
difficulty: intermediate
# Use tags for simple categorical filtering only
tags: [deep-learning, neural-networks]
```
**Test:** For domains with orthogonal classification needs: (1) Are orthogonal dimensions captured as frontmatter fields? (2) Are tags reserved for simple categorical membership? (3) Can you filter by any dimension without tag bloat?

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

**Rule:** Every note should have a `last-reviewed` date, updated on each review.
**Why:** Without review tracking, stale notes accumulate undetected.
**Test:** Do all notes have a `last-reviewed` field? Flag notes not reviewed in the last 30 days.
**Edge case:** Use `review-interval` frontmatter for knowledge with different decay rates. Static knowledge (historical facts from ancient periods, mathematical proofs, canonical works, foundational definitions) doesn't need monthly review — use `review-interval: historical` or `review-interval: never` to avoid false positives. The test becomes: Flag notes where days-since-review exceeds their specified review-interval (default 30 days). Domain-specific intervals: ancient history (historical), mathematics (never), classical literature (historical), reference material (180d), general knowledge (30d).

**Rule:** Distinguish staleness from obsolescence — implement explicit detection for three distinct states: time-stale (review needed), reality-obsolete (replacement needed), context-shift (user-specific, may no longer apply).
**Why:** Staleness is mechanical (time passed); obsolescence is semantic (reality changed); context shift is personal (your situation changed). Treating all three the same causes false positives (flagging accurate but old knowledge) and false negatives (missing genuinely obsolete knowledge). Without explicit detection, AI agents cannot determine whether old knowledge is still accurate or needs replacement.
**Test:** For notes flagged as potentially outdated, can you categorize them as: (1) time-stale (still accurate, just needs review), (2) reality-obsolete (the underlying facts changed), or (3) context-shift (your situation differs from what the note assumes)? Do you have detection triggers for each?
**Detection methods:**
- **Time-stale:** `days-since-review > review-interval` — mechanical flag based on time
- **Reality-obsolete:** Source changed, version mismatch, link rot, contradiction with newer knowledge, authority superseded — requires semantic check
- **Context-shift:** User reports situation change, tool/technology migration, goal shift — requires user input
**Lifecycle implication:** Notes marked `confidence: obsolete` should be distinct from `confidence: stale` — obsolete notes need replacement, stale notes need review.

**Rule:** Establish explicit knowledge deprecation workflow — mark superseded knowledge as deprecated rather than deleting it, preserve for historical context while directing users to updated knowledge.
**Why:** Deleting knowledge loses context about why previous understanding was wrong. Deprecation preserves learning while enabling current knowledge retrieval. Combined with the staleness/obsolescence distinction above, this creates a complete lifecycle workflow: review → flag → categorize → deprecate → archive.
**Test:** (1) Can you identify deprecated notes in the vault? (2) Do deprecated notes link to updated replacement knowledge? (3) Is there `deprecated:` or `superseded-by:` frontmatter? (4) Is there a deprecation rationale documented?
**Implementation:**
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

**Rule:** Handle external extinction separately from obsolescence — when the thing described no longer exists, apply different detection and disposition rules.
**Why:** Standard obsolescence handles knowledge that was once true but is now false (facts changed, sources updated). External extinction is different — the knowledge isn't wrong, it's about something that no longer exists (discontinued products, defunct services, dissolved organizations, extinct species, destroyed places). Treating extinct knowledge like obsolete knowledge wastes review effort and misses the unique disposition decisions these notes require.
**Test:** For notes about external entities (products, services, organizations, places): (1) Can you confirm the entity still exists? (2) Is extinct knowledge appropriately tagged vs. standard obsolete knowledge? (3) Does each extinct entity note have a disposition decision (archive/reference-only/deprecate/delete)?
**Detection:** External extinction differs from standard obsolescence:
- **Product discontinuation:** Check manufacturer websites, press releases, archive.org
- **Service shutdown:** Check status pages, news articles, social media announcements
- **Organizational death:** Check business registries, news archives
- **Relationship dissolution:** Personal knowledge (mark with confidence)
- **Physical extinction:** Check historical records, verify destruction/closure
**Edge case:** Partial extinction — product line discontinued but brand continues, service shut down in one region but not others. Apply scope tagging to distinguish.
**Edge case:** Resurrection potential — some discontinued products/services relaunch (Polaroid cameras, vinyl records). Track potential for high-value knowledge.
**Implementation:** Tag extinct entity notes with:
```yaml
extinction-type: product|service|relationship|organization|location
extinction-date: YYYY-MM-DD
extinction-source: discontinuation-notice|shutdown-announcement|verified-absence
historical-status: archived|reference-only|deprecated
```
**Disposition:** (1) Archive — keep as historical record (past employment, discontinued products you might re-buy); (2) Reference-only — mark historical, reduce priority (defunct services, dissolved orgs); (3) Deprecate — keep link but mark superseded (replaced products); (4) Delete — remove when no future value (temporary accounts).

See also: [[Handling Temporal Knowledge]] — Comprehensive guidance including obsolescence detection and external extinction

**Rule:** Apply note maturity staging — use explicit `maturity:` frontmatter to track developmental stage and apply stage-appropriate quality standards.
**Why:** The Seed addresses when to STOP adding new notes to topics (diminishing returns), but lacks guidance on when an individual note itself is "complete." Without maturity tracking, notes either grow indefinitely (bloat) or get abandoned mid-development (inconsistent quality). Maturity staging provides clear progression markers.
**Test:** Can you categorize notes by maturity stage? Do most notes have a clear next developmental step?
**Implementation:**
```yaml
maturity: seed  # Core definition or single insight — just created
maturity: sprouting  # 1-3 links, basic structure, needs development
maturity: growing  # 4+ links, examples added, connected to graph
maturity: mature  # Comprehensive, stable, no obvious gaps
maturity: evergreen  # Foundational, referenced widely, core reference note
```
**Maturity progression criteria:**
- **Seed → Sprouting:** Has core claim + at least 1 outgoing link + basic frontmatter
- **Sprouting → Growing:** Has 2+ outgoing links + at least 1 example or application + source cited + incoming link from at least 1 other note
- **Growing → Mature:** Has 3+ related notes (prerequisites, applications, alternatives) + multiple examples + documented limitations + stable over 30+ days + incoming links from 2+ notes
- **Mature → Evergreen:** Referenced as prerequisite by 5+ notes + no updates needed in 90 days + covers complete concept for vault scope + serves as primary entry point
**Edge case:** Domain-specific maturity may differ — some domains have inherently "perpetually growing" topics where completion is never appropriate. Use `maturity: perpetual` for notes that intentionally remain open-ended.
**Edge case:** Early-stage vaults naturally have more Seed/Sprouting notes — maturity distribution should shift toward Mature/Evergreen as vault grows.

**Rule:** Never delete notes — deprecate them with a marker and a pointer to the replacement.
**Why:** Deletion breaks incoming links silently; deprecation preserves the graph while signaling staleness.
**Test:** Search for broken wikilinks. Are there any dead references? If yes, a deletion happened without cleanup.

**Rule (NEW - 2026-04-01):** When an anti-pattern and its corresponding best practice share >50% identical content, merge into the best practice and redirect the anti-pattern.
**Why:** Identical content in both notes creates maintenance burden and confusion. Positive framing (best practice) is more actionable than negative framing (anti-pattern). This pattern has been applied successfully in the vault (Anti-Pattern - Note Hoarding → Best Practice - Selective Capture).
**Test:** Can you identify anti-pattern/best practice pairs with >50% content overlap? Have redirects been created with appropriate metadata? Is the best practice the primary reference?
**Merge criteria:** Apply merge when ALL of: (1) Anti-pattern is purely framing (same content as best practice, just negative), (2) Both notes pass the same test criteria, (3) Best practice provides more actionable guidance, (4) Keeping both creates maintenance burden.
**Keep separate when ANY of:** (1) Anti-pattern has unique content (specific failure modes, examples), (2) Both notes have distinct test criteria, (3) Anti-pattern provides value as a distinct warning pattern, (4) Domain-specific anti-pattern content differs from generic best practice.
**Required redirect metadata:**
```yaml
redirect_to: [[Best Practice - Name]]
lifecycle: deprecated
correction-type: merged
correction-date: YYYY-MM-DD
corrected-by: [[Best Practice - Name]]
```
**Example:** Anti-Pattern - Note Hoarding was merged into Best Practice - Selective Capture because both contained identical "two-phase workflow" content. The anti-pattern now has redirect metadata pointing to the best practice.

**Rule:** Use active replacement for knowledge that fundamentally changes — track what specifically changed, why, and the evolution of understanding.
**Why:** The Seed covers staleness (time-based decay) and obsolescence (reality-based invalidation), but not active replacement — cases where new knowledge doesn't just supersede old, but requires updating specific claims or fundamentally revising understanding. Without active replacement tracking, you lose the evolution of your understanding.
**Test:** Can you identify knowledge that was explicitly replaced (not just deprecated)? Do replacement notes document what changed and why? Is there a trail showing how understanding evolved?
**Implementation:** Use `replaces:` frontmatter to track active replacements:
```yaml
replaces:
  - note: "[[Old Note Title]]"
    replaced-claims: "Specific claims being superseded"
    reason: "New evidence showed X"
    replacement-type: complete|partial|contextual
```
**Replacement types:** complete (entire note superseded), partial (specific claims updated), contextual (old applies in some contexts, new in others).
**Distinction from deprecation:** Deprecation marks old knowledge as no longer relevant; replacement updates specific claims while preserving what remains valid.

See also: [[Handling Temporal Knowledge]] for detailed exploration of this topic.

**Rule:** Track interlinked update dependencies when changing knowledge that affects multiple notes — proactively identify what else needs updating.
**Why:** The Seed covers active replacement (Note A replaces Note B) and deprecation (Note A is stale), but not coordination — when updating Note A requires checking Notes B, C, and D for consistency. Without tracking, partial updates create silent inconsistency where some notes reflect new knowledge and others still reference the old. This is distinct from replacement: it's about ensuring all affected notes stay synchronized.
**Test:** When you update a hub note, foundational definition, terminology standard, or tool version: (1) Do you identify all notes that might need updating? (2) Are update dependencies tracked in frontmatter? (3) Can you run a scan for pending coordinated updates?
**Implementation:** Use `update-dependencies:` frontmatter to track what else needs review when this note changes:
```yaml
update-dependencies:
  - note: "[[Related Note]]"
    change-type: terminology|reference|procedure|context
    urgency: required|recommended|review
    reason: "Why this note needs updating"
```
**Change types:** terminology (word/phrase usage changed), reference (links or citations updated), procedure (step-by-step knowledge changed), context (assumptions shifted).
**Urgency levels:** required (must update before note is usable), recommended (should update for consistency), review (check if update needed).
**Distinction from replacement:** Replacement tracks that Note A supersedes Note B. Update dependencies track that changing Note A might require changing Notes B, C, D. Use replacement when old knowledge is invalid; use update-dependencies when consistency across multiple notes is needed.

**Rule (NEW - 2026-03-21):** Document at least one known limitation for every note with actionable knowledge — explicitly note where knowledge might not apply, what contextual factors change applicability, or what specific boundaries exist.
**Why:** The Seed covers confidence levels and verification status, but doesn't explicitly require documenting specific known limitations. Actionable knowledge (advice, procedures, recommendations) that claims universal applicability when it has boundaries is misleading. Explicit limitation documentation prevents inappropriate application, accelerates verification, and builds user trust.
**Test:** For notes with prescriptive or procedural content: Can you identify at least one context where this knowledge would NOT apply or would need modification? Can you state specific boundary values rather than vague qualifiers?
**Implementation:** Use `limitations:` frontmatter:
```yaml
limitations:
  - context: "wood thickness over 1 inch"
    effect: "may cause splitting"
    severity: medium
  - context: "non-US jurisdictions"
    effect: "legal requirements differ"
    severity: high
```
**Distinction:** This is different from (1) confidence levels — confidence says "how reliable is this?", limitations say "where does this fail?", (2) verification status — verified notes can still have known limitations, (3) framework-dependent — different frameworks may both be valid in their contexts, limitations are about single notes failing in specific contexts.
**Edge case:** When limitations are unknown, use `limitations: unknown` and prioritize testing to discover them.
**Edge case:** Limit to top 3 most important limitations when there are many — prioritize those most likely to cause issues.
**Edge case:** Update limitations as you learn more — initial boundaries may be too broad or too narrow. Use `limitation-history:` to track refinements.
**See also:** [[Frontier Exploration - Known Limitations Documentation]] for detailed exploration of this gap.

See also: [[Frontier Exploration - Interlinked Note Updates]] for detailed exploration of this gap.

**Rule:** Handle speculative and predictive knowledge with horizon-aware verification — predictions cannot be verified using standard timeframes.
**Why:** Standard verification assumes knowledge can be checked within days or months. Predictions about the future may take years to verify (or never). Treating predictions like regular knowledge creates unfair verification debt and misleading staleness signals.
**Test:** For prediction notes: (1) Does `prediction-horizon:` indicate when verification becomes possible? (2) Is verification debt calculated from horizon, not capture date? (3) Can you distinguish predictions from scenarios?
**Implementation:** Use speculative knowledge frontmatter:
```yaml
knowledge-type: prediction  # vs. scenario vs. projection
prediction-horizon: 2028-12  # When verification becomes possible
prediction-confidence:
  methodology: data-driven|model-based|expert-opinion|intuition
  track-record: strong|moderate|limited|unknown
  horizon: near-term|medium-term|long-term
  consensus-level: unanimous|majority|divergent
verification-status: pending-resolution  # Distinct from unverified
```
**Distinction:** Predictions assert likely outcomes; scenarios explore possible futures. Use `knowledge-type: prediction` for forecasts, `knowledge-type: scenario` for "if-then" explorations.

**Rule:** Preserve failed predictions as methodology evidence — document what was learned when predictions fail.
**Why:** Failed predictions are valuable data about forecasting accuracy and should not be silently deleted. They provide evidence about the reliability of prediction methodologies.
**Test:** For failed predictions: (1) Is `prediction-outcome:` documented (confirmed|failed|pending)? (2) Does it include `resolution-type:`? (3) Are lessons learned captured?
**Implementation:**
```yaml
prediction-outcome: failed
resolution-type: obsoleted-by-events|superseded-by-better-model|invalid-methodology
lessons-learned: "What this reveals about prediction methodology"
```
**Why different from regular correction:** Regular correction handles facts that changed. Failed predictions document that a forecasted outcome did not occur - this is evidence about prediction methodology, not about the underlying knowledge being wrong.

**Rule:** Track meta-prediction knowledge separately from specific predictions — methodology knowledge is more durable.
**Why:** Knowledge about how to make good predictions (track records, methodology comparisons, common failure modes) is more valuable and durable than any specific prediction.
**Test:** Can you distinguish prediction methodology knowledge (durable) from specific predictions (time-sensitive)?
**Implementation:**
```yaml
meta-prediction: true
methodology-type: statistical|expert-judgment|machine-learning|analogical
effectiveness-evidence: "Track record data"
best-practices: ["Practice 1", "Practice 2"]
```

See also: [[Frontier Exploration - Speculative and Predictive Knowledge]] — Detailed exploration of prediction handling

**Rule:** Terminology must be consistent across the vault — pick one term per concept and use it everywhere.
**Why:** Inconsistent terminology fragments search results and confuses navigation.
**Test:** Search for synonym pairs (e.g., "note"/"node", "link"/"connection"). Does the vault use one term consistently?
**Edge case:** Distinct terms that seem like synonyms actually refer to different things — e.g., "sauté" vs "pan-fry" vs "stir-fry" are different techniques; "stock" vs "broth" differ by bone/meat and simmer time; "bell pepper" vs "capsicum" are regional variants of the same vegetable. The test: (1) Do the terms refer to genuinely different techniques/ingredients? (2) Are both regional variants valid and useful? If yes to either, allow both with appropriate context (e.g., note the regional variant in parentheses).
**Edge case:** Technical vs common terminology — different audiences may need different terms (e.g., "fond" for experts, "brown bits" for beginners). Consider creating a definition note linking both terms.
**Edge case:** Historical or classical terms — classical cuisine uses French terms (julienne, mise en place) that may need plain-language equivalents. Document both with a redirect if needed.

**Edge case (compliance audit 2026-03-20, UPDATED 2026-03-20):** Lifecycle field values should use standardized terms. Acceptable values:
- `evergreen` — permanent, long-lived knowledge that remains relevant
- `transient` — time-limited or ephemeral content
- `seed-extension` — notes that extend Seed rules (protected status)
- `living` — continuously updated documents with review-cadence
- `historical` — knowledge about past events or completed topics
- `perpetual-beta` — knowledge domains that inherently resist completion
- For staging statuses, use `status:` field instead (whisper|draft/probe)

**Rule:** Run structural health checks regularly — orphan scan, broken link scan, hub distribution, oversized note scan.
**Why:** Problems accumulate silently; periodic scans catch issues before they compound.
**Test:** Can you run these 4 scans right now? Do they all pass?

**Rule:** Run consistency scans quarterly — proactively detect terminology drift, contradictory claims, and scope mismatches across notes.
**Why:** Knowledge bases evolve organically and silently accumulate inconsistencies. Without systematic detection, the vault erodes in reliability as contradictory claims multiply undetected. Users discover inconsistencies through use rather than through maintenance.
**Test:** (1) Can you scan for terminology variations of the same concept? (2) Can you find notes with contradictory claims on the same topic? (3) Do you have a process for resolving found inconsistencies?

**Rule (NEW - 2026-03-28):** For knowledge domains where terminology changes frequently (technology, research, medicine), track term lifecycle status and maintain migration paths between deprecated and current terminology.
**Why:** Without explicit terminology tracking, knowledge bases in fast-moving domains become cluttered with outdated terms, users get confused about current best practices, and historical context is lost. Terminology evolution is distinct from knowledge obsolescence — a concept may still be valid but the name has changed.
**Test:** (1) Can you identify deprecated terms in the vault? (2) Do deprecated terms link to current alternatives? (3) Is terminology status (current/deprecated/emerging) trackable via frontmatter? (4) Can users find current terminology when searching outdated terms?
**Implementation:** Use frontmatter to track terminology lifecycle:
```yaml
terminology-status: current|deprecated|emerging|archival
deprecated-replaced-by: [[Current Term]]
deprecated-date: 2024-03
emerging-stability: experimental|unstable|stable
```
**Migration path:** When a term is deprecated: (1) Mark old term with `terminology-status: deprecated`, (2) Add `deprecated-replaced-by:` pointing to current term, (3) Keep old note (don't delete) for historical context, (4) Create redirect note for searchability. For emerging terms, capture with `confidence: emerging` and track expected stabilization timeline.
**Edge case:** Meaning shift — same term with evolved definition over time. Track via `definition-evolution:` with timeline periods.
**Edge case:** Sub-field variations — same term means different things in different contexts (e.g., "function" in math vs. programming). Use disambiguation notes and scope tagging.
**See also:** [[Seed Gap - Evolving Terminology in Fast-Moving Domains]]

**Rule:** Track knowledge debt explicitly — monitor verification backlog, staleness, structural decay, redundancy, and retrieval noise as a composite debt score.
**Why:** Knowledge debt (accumulated unverified, outdated, or low-quality notes) misleads users about vault reliability. Unlike technical debt (which slows development), knowledge debt creates false confidence. Tracking debt enables proactive management before it overwhelms the vault.
**Test:** Calculate debt score: (V×0.25)+(S×0.25)+(D×0.20)+(R×0.15)+(N×0.15) where V=verification debt (% unverified/100), S=staleness debt (% stale/100), D=decay debt (broken links/total links), R=redundancy debt (duplicate potential/total), N=noise debt (unused notes/total). Score <0.15 = healthy; 0.15-0.30 = moderate; 0.30-0.50 = high; >0.50 = critical.
**Edge case:** New vaults (<50 notes) naturally have higher debt during bootstrap — apply relaxed thresholds during construction phase. Construction-phase: skeleton notes can remain unverified longer.
**Edge case:** High-stakes domains (medical, financial, safety) should maintain stricter debt ceilings — cap verification debt at 20% vs. 30% for general vaults.
**Edge case:** Vaults in active learning mode (building new domains) can accept temporary debt spikes if there's an explicit verification sprint planned within 30 days.

**Rule:** Calibrate confidence systematically using source quality and intended use — set initial confidence at capture, adjust based on evidence over time.
**Why:** Without explicit calibration methodology, AI agents default to arbitrary confidence levels. Systematic calibration ensures confidence reflects actual reliability, enabling appropriate trust levels for different use cases.
**Test:** For each note: (1) Can you articulate why the current confidence level is appropriate? (2) What evidence would upgrade it? (3) What evidence would downgrade it?
**Initial confidence calibration:**
- `confidence: high` — Authoritative primary sources with clear verification path, personally verified multiple times
- `confidence: emerging` — Reputable sources, or personal experience without explicit verification, established consensus in field
- `confidence: emerging` — Uncertain sources, AI-generated without verification, theoretical speculation, single anecdotal source
- `confidence: emerging` — New knowledge with no track record (replaces "unverified" for non-procedural content)
**Domain-specific floors:** Medical/legal/financial require `medium` floor (require human expert for `high`); personal opinions default to `low` with explicit perspective tagging.
**Confidence adjustment:** Track adjustment events separately from review dates. Each significant use, verification attempt, or failure should potentially adjust confidence.
**Implementation:**
```yaml
confidence-adjustments:
  - date: 2026-03-17
    event: used_successfully
    evidence: "Applied to real decision, positive outcome"
  - date: 2026-03-18
    event: source_verified
    evidence: "Cross-referenced with authoritative source"
```
**Confidence corridor:** For related knowledge clusters, consider the range (corridor) of confidence levels. A topic with notes ranging from `low` to `high` should be treated as "emerging" overall; a topic where all notes are `high` is "established."

**Rule:** Track source reliability and verification status as separate dimensions — a source can be reliable but unverifiable, or verified but unreliable.
**Why:** Reliability (does the source know what they're talking about?) is fundamentally different from verification (can we confirm independently?). A confidential expert whistleblower may be highly reliable but unverifiable; an accidentally-correct rumor is verified but unreliable. Conflating these dimensions loses important knowledge quality signals.
**Test:** For each note with sourcing: (1) Can you assess source reliability (expertise, access, track record)? (2) Can you assess verification status (independently confirmable, unverifiable, disputed)? Are these tracked separately?
**Implementation:** Use separate frontmatter fields:
```yaml
source-reliability: high|medium|low|unknown
source-verification: verified|unverifiable|pending|disputed
```
- High reliability + unverifiable: expert confidential informant, credible anonymous source
- Low reliability + verified: accidentally correct rumor, outdated information that happens to match current facts
- High reliability + verified: gold standard knowledge
- Low reliability + unverifiable: low-priority unless other evidence emerges

**Rule:** Handle contradictory sources explicitly — when two credible sources make conflicting claims, create a dedicated contradiction note rather than choosing arbitrarily.
**Why:** Contradictory sources are common in real knowledge bases. Without explicit handling, AI agents either arbitrarily pick one source (losing information) or leave the contradiction invisible (misleading users about certainty). Explicit contradiction tracking preserves the full picture and enables human resolution.
**Test:** For notes with conflicting sources: (1) Is there a `conflict-type: factual-contradiction` note? (2) Does it document both positions with source attribution? (3) Is resolution-status tracked (unresolved/pending-review/resolved)? (4) Are high-stakes contradictions flagged for human review?
**Implementation:** Use frontmatter:
```yaml
conflict-type: factual-contradiction|framework-difference|interpretation-dispute
sources-in-conflict:
  - source: "[[Note A]]"
    position: "Claim X"
  - source: "[[Note B]]"
    position: "Claim NOT X"
resolution-status: unresolved|pending-review|resolved
```
**When to defer to human:** Flag for human review when both sources have equal reliability, the topic is high-stakes (medical/legal/safety), or the field has no clear authority to resolve.
**Distinction:** Framework differences (approach A vs approach B) are different from factual contradictions (X is true vs X is false). Only factual contradictions need this treatment.

**Rule:** Track knowledge consensus level separately from confidence — distinguish established mainstream consensus from active debate, emerging views, and minority positions.
**Why:** Confidence tracks source reliability, but doesn't capture the state of agreement within a field. Presenting contested knowledge as consensus misleads users; presenting consensus as debate creates false uncertainty. Explicit consensus tracking enables appropriate presentation and weight in decision-making.
**Test:** For factual claims: (1) Can you identify the consensus level (mainstream/debated/emerging/fringe)? (2) Does presentation appropriately reflect agreement state? (3) Can you distinguish field-wide consensus from regional or disciplinary variation?
**Implementation:** Use `consensus-level:` frontmatter:
```yaml
consensus-level: mainstream|debated|emerging|fringe
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

**Rule (NEW - 2026-03-21):** Classify knowledge by source type in domains with distinct source hierarchies — distinguish primary sources (original documents/observations), secondary sources (analysis/interpretation), and tertiary sources (compilations/summaries).
**Why:** Source type affects authority and verification approach differently than source reliability. In legal (case law vs. law review articles), academic (primary research vs. meta-analyses), and historical (original documents vs. histories) domains, source type determines how knowledge should be weighted. Without explicit classification, AI agents cannot apply domain-appropriate evaluation criteria.
**Test:** For notes in domains with source hierarchies: (1) Can you identify the source type (primary/secondary/tertiary)? (2) Does frontmatter include `source-type:`? (3) Does the classification affect how you verify the knowledge?
**Implementation:** Use `source-type:` frontmatter with domain-specific values:
```yaml
# General
source-type: primary  # Original observation, data, or document
source-type: secondary  # Analysis, interpretation, or synthesis
source-type: tertiary  # Compilation, summary, or reference

# Legal specific (optional extension)
source-type: primary-legal  # Constitution, statute, regulation, case law
source-type: secondary-legal  # Law review, treatise, restatement
source-type: tertiary-legal  # Encyclopedia, practice guide

# Academic specific (optional extension)
source-type: empirical  # Primary research data
source-type: review  # Systematic review or meta-analysis
source-type: theoretical  # Framework or model development
```
**Distinction from source-reliability:** `source-reliability` answers "is this source trustworthy?" while `source-type` answers "what kind of source is this?" Both are orthogonal dimensions — a primary source can be low reliability (biased observer) and a tertiary source can be high reliability (well-edited encyclopedia).

**Rule:** Track retrieval patterns to understand actual knowledge usage — capture search queries, access frequency, and retrieval success.
**Why:** A knowledge base's value is proven through retrieval, not storage. Without tracking retrieval patterns, capture decisions lack evidence. Failed searches reveal gaps; frequent access reveals value.
**Test:** Can you list your top 10 retrieval queries? Do they align with your highest-quality notes? Do failed searches drive capture decisions?
**Implementation:** Use retrieval logging: query terms, whether results were found, which notes were accessed, whether retrieved knowledge was sufficient. Review monthly to align capture priorities with actual usage.

See also: [[Frontier Exploration - Knowledge Base Utility Assessment]] for implementation strategies.

**Rule:** Capture meta-knowledge about your knowledge management process — document capture methods, organizational decisions, personal knowledge patterns, and contextual reasoning.
**Why:** Process knowledge compounds — lessons learned about building a vault are more valuable than any single note. Without capturing meta-knowledge, you repeat mistakes and lose institutional knowledge about what works. An AI building a knowledge base from scratch needs guidance on how to capture knowledge about the knowledge management process itself.
**Test:** Can you answer: (1) What capture methods have you tried and what worked/didn't? (2) What organizational decisions did you make and why? (3) What patterns do you notice in your own knowledge usage? (4) What would you do differently if starting over?
**Implementation:** Use `type: capture-process|organizational-decision|knowledge-pattern|contextual-decision` frontmatter:
- For capture-process: `method:`, `effectiveness-rating:`, `best-for-knowledge-types:`
- For organizational-decision: `decision:`, `alternatives-considered:`, `outcome:`, `would-choose-again:`
- For knowledge-pattern: `pattern-type:`, `evidence:`, `implications:`
- For contextual-decision: `constraints:`, `trade-offs-accepted:`, `rationale:`
**Edge case:** Separate process guidance (advice you'd give others) from process description (what actually happened). Tag with `meta-type: personal|preference|transferable-insight`.

See also: [[Frontier Exploration - Vault-Process Meta-Knowledge]] — Comprehensive implementation guide for vault-process meta-knowledge capture

**Rule:** No note should have zero backlinks — every note should be linked to from at least one other note.
**Why:** Notes with no incoming links are invisible in the graph and cannot be discovered through navigation. They represent knowledge that exists but isn't connected to the broader structure.
**Test:** Run a backlink scan. Flag any note with 0 backlinks. For each orphan: (1) Should it be linked from a related note? (2) Should it be listed in a hub or index? (3) Is it truly standalone (like the Seed itself)? Keep orphaned only if yes to 3.
**Edge case:** The Seed file itself may legitimately have zero backlinks as the root reference — but all other notes should be reachable from it.
**Edge case:** Universal/primitive elements in a domain (salt, oil, water in cooking; variables in programming; basic measurements) may legitimately have zero backlinks. These are foundational primitives that everything else references but don't naturally link to. Verify: (1) Is this a domain primitive that others depend on but doesn't depend on others? (2) Is it referenced indirectly (e.g., salt in every recipe but not wikilinked)? (3) Would adding links be decorative rather than navigational? Allow zero backlinks if yes to any.

**Rule:** Every note must use consistent formatting — same heading style, same link syntax, same frontmatter fields.
**Why:** Inconsistent formatting breaks tooling and makes automated processing unreliable.
**Test:** Sample 10 random notes. Do they all use the same heading levels, link format, and frontmatter structure?

**Rule:** Track edit history for high-value notes — include last-edited, edit-count, and attribution for notes above a quality threshold.
**Why:** Without change tracking, you can't understand how knowledge evolved, recover from mistakes, or assess currency. High-value notes (evergreen, foundational) warrant version tracking.
**Test:** For notes with `lifecycle: evergreen` or `lifecycle: cornerstone`: (1) Is there a `last-edited` timestamp? (2) Can you determine who/what made the last edit (human/AI)? (3) Is there an `edit-count` showing revision history?
**Edge case:** Git history provides implicit version tracking — if using git, note-level history is accessible via `git log`. The test applies to explicit frontmatter tracking for immediate visibility.
**Edge case:** Transient notes (whisper, draft, probe) don't need edit tracking — only track stable knowledge.

**Rule:** Create vault snapshots before major refactoring — tag significant change points for rollback capability.
**Why:** Large-scale changes (Seed rule updates, structural reorganizations, bulk edits) risk introducing regressions. Snapshots enable rollback if changes prove problematic.
**Test:** Before modifying >10% of vault content: (1) Was a git tag or snapshot created? (2) Can you identify the snapshot by purpose (e.g., "pre-seed-update-2026-03")? (3) Can you restore to that point if needed?

**Rule:** Use explicit conflict markers when multiple sources modify the same note — preserve both versions rather than silent overwrites.
**Why:** Silent overwrites lose information; explicit markers preserve competing versions for review and reconciliation.
**Test:** When simultaneous edits occur: Is there a conflict note or are both versions preserved? Can you identify what changed in each version?
**Edge case:** For AI-agent-only vaults, auto-merge simple conflicts (formatting, links) and flag content conflicts for human review.
**Edge case:** Use standard conflict markers (`<<<<<<<`, `=======`, `>>>>>>>`) or create a conflict resolution note linking to both versions.

See also: [[Frontier Exploration - Knowledge Version Control]] for detailed implementation strategies.

**Rule:** Notes partially or fully generated by AI must include `author-type` frontmatter indicating provenance.
**Why:** As AI assistants help build knowledge bases, content provenance matters for reliability assessment. Readers need to know whether a note was human-written, AI-assisted, or AI-generated-first-pass.
**Test:** Can you identify the author-type for each note? Are AI-generated notes marked appropriately?
**Edge case:** AI improving existing human-written notes should track changes differently than fully AI-generated notes. Use `author-type: collaborative` for mixed provenance.

**Rule:** For AI-generated content in unfamiliar domains, include `domain-familiarity` frontmatter indicating assessed familiarity level.
**Why:** When AI helps build knowledge bases in domains it doesn't understand well, content quality risks decline. Explicit familiarity markers help readers assess reliability and know when human expert review is needed.
**Test:** Can you identify which notes were generated in familiar vs. unfamiliar domains? Do unfamiliar-domain notes carry appropriate uncertainty markers?
**Implementation:** Use `domain-familiarity: assessed` (AI has verified understanding), `domain-familiarity: learning` (AI is learning), or `domain-familiarity: unknown` (domain is unfamiliar).
**Edge case:** In high-stakes domains (medical, legal, financial), require explicit human expert verification regardless of AI familiarity. Use `verification-required: human-expert` for safety-critical content.

**Rule (NEW - 2026-03-21):** For knowledge domains with safety implications, explicitly identify and flag critical thresholds where crossing the boundary changes the answer from safe to dangerous.
**Why:** Safety-critical knowledge requires different treatment than general knowledge. Unlike general confidence (which is about source reliability), safety-critical knowledge has objective danger zones where "mostly correct" = "potentially harmful." Users need to know: (1) What the exact threshold is, (2) What happens when crossed, (3) That interpolation/approximation is NOT acceptable.
**Test:** For notes in safety-related domains: (1) Can you identify any numerical thresholds where safety depends on meeting or exceeding? (2) Does the note present thresholds as exact boundaries, not ranges? (3) Is there explicit warning when interpolation would be dangerous? (4) Is the verification standard higher than general knowledge (expert source, authoritative standard)?
**Implementation:** Use frontmatter:
```yaml
safety-critical: true
threshold-type: temperature|load|exposure|chemical|electrical|pressure
exact-threshold: "40°F or below"
safety-margin: "Add 5°F buffer for uncertainty"
interpolation-acceptable: false
verification-standard: authoritative-source
danger-consequence: "foodborne-illness"
```
**Edge case:** Some safety thresholds vary by jurisdiction (electrical codes, food safety regulations). Tag with `jurisdiction:` and note that standards may differ regionally.
**Edge case:** Safety margins are NOT the same as thresholds — the threshold is the hard limit, the margin is a buffer for uncertainty. Document both separately.
**Edge case:** Presenting thresholds as ranges ("cook to 160-165°F") is dangerous — specify the minimum threshold and warn against treating the lower bound as acceptable.

See also: [[Frontier Exploration - Safety-Critical Knowledge Thresholds]] for detailed exploration of this gap.

See also: [[Frontier Exploration - Bootstrapping Knowledge Bases in Unfamiliar Domains]] for strategies when the AI doesn't understand the topic and how to bootstrap a knowledge base from zero domain knowledge.

**Rule:** AI-generated content must have at least one spot-verified source before marking as verified.
**Why:** AI can hallucinate citations that appear real. Spot-verification (opening the URL, confirming the claim exists) prevents false attribution.
**Test:** For notes marked AI-generated, can you verify at least one source is real and accurately cited?

**Rule:** AI-generated content should default to `confidence: emerging` unless verified by a human.
**Why:** AI confidence is not calibrated to human reliability standards. A confident AI hallucination is more dangerous than AI uncertainty.
**Test:** Do AI-generated notes show appropriate confidence levels? Are they marked "high" confidence without human verification?

**Rule:** For interpretive knowledge (judgment, taste, evaluation), notes must clearly identify the perspective/framework being applied.
**Why:** Interpretive knowledge is inherently perspective-dependent. Without explicit perspective-tagging, readers and AI agents cannot distinguish subjective judgment from objective fact.
**Test:** For notes containing evaluative judgments: (1) Is there an `interpretive-type:` field? (2) Does the note specify what framework or perspective the judgment comes from? (3) Are alternative interpretations acknowledged?
**Edge case:** Personal taste notes should be tagged `interpretive-type: personal-opinion` with `confidence: emerging`. Professional consensus should note "generally regarded as..." with source.

**Edge case:** Some interpretive knowledge has professional consensus (sommelier ratings, architectural awards). Mark these as "consensus" rather than purely subjective — the perspective is "professional community."

**Rule:** For sensory and aesthetic domains (cooking, wine, coffee, photography, fashion, music), capture personal taste calibration explicitly — express preferences in domain-specific terms, track evolution over time, and link to exploration guidance.
**Why:** "I like X" provides no actionable knowledge; "I prefer X over Y for reason Z, with evolution tracked from previous state" enables informed decision-making. Without explicit calibration, taste knowledge becomes noise that doesn't guide future choices.
**Test:** For taste-relevant domains: (1) Are preferences expressed in domain-specific terminology (not just "good/bad")? (2) Is taste evolution tracked over time? (3) Does calibration guide what to explore next?
**Implementation:** Use frontmatter:
```yaml
taste-calibration: true
domain: cooking  # or wine, coffee, photography, etc.
specific-qualities: ["full body", "low acidity", "roasted not bright"]
preference-strength: strong|moderate|evolving
context-dependency: none|conditional
taste-history:
  - date: 2024-01
    position: "Preferred light roast"
  - date: 2025-06
    position: "Now prefer medium roast"
    trigger: "Palate development"
exploration-guidance:
  try-next: ["Single-origin Ethiopian"]
  avoid: ["Extra dark roast"]
```
**Edge case:** Aspirational taste (what you want to like) should be tracked separately from current calibration. Distinguish "training my palate" from "current preference."
**Edge case:** Group taste (family, household) requires separate calibration with explicit subject tagging.

**Rule:** Add multi-perspective structure when knowledge genuinely benefits from multiple complementary viewpoints.
**Why:** Some knowledge is richer when viewed from multiple valid angles (historical events, technical decisions, personal experiences). This is distinct from contradictory sources (where one view is wrong) and interpretive knowledge (where judgment differs). Without explicit multi-perspective tagging, readers and AI agents may assume a single view is complete when additional perspectives would add value.
**Test:** For notes that could have multiple perspectives: (1) Does each perspective add information the others lack? (2) Is there a genuine reason to present multiple views? (3) Is it clear how the perspectives relate? (4) Does the note avoid false balance?
**Implementation:** Use frontmatter:
```yaml
perspectives: [perspective-1, perspective-2]
perspective-type: complementary|competing|contextual
```
- `complementary`: Different angles that together give fuller picture
- `competing`: Genuine disagreements where truth is unclear
- `contextual`: Different perspectives for different contexts

**Rule:** For knowledge domains where advice and information are easily confused (medical, financial, legal, professional), add explicit disclaimer frontmatter and disclaimer text.
**Why:** Medical, financial, and legal knowledge have specific liability implications. A knowledge base that presents advice without disclaimers may create implied liability or mislead readers into thinking they're getting professional guidance.
**Test:** Pick 10 notes in regulated domains (medical, financial, legal). For each: (1) Is it information (describes how things work) or advice (recommends a specific action)? (2) If advice, does it have a disclaimer? (3) Does the disclaimer specify what type it is (medical, financial, legal)?
**Implementation:** Use fields:
```yaml
disclaimer-required: true|false
disclaimer-type: medical|financial|legal|professional
disclaimer-text: "Required text here"
advisory-type: recommendation|analysis|information
applies-to: ["specific audience or context"]
scope-limitations: ["who this does NOT apply to"]
```

**Rule:** Distinguish information from advice — information describes how things work; advice recommends a specific course of action.
**Why:** Information (describing how tax codes work) and advice (you should contribute to a 401k) have different implications. The same knowledge can be presented as either. A knowledge base should be intentional about which it's providing.
**Test:** For each note: Can you categorize it as (1) information only, (2) advice/recommendation, or (3) analysis applying principles to a situation? Does the presentation match the category?

**Rule:** For interpersonal and social skill knowledge (negotiation, conflict resolution, persuasion, relationship dynamics), include ethical-dimension and cultural-scope tagging.
**Why:** Social skill knowledge has unique properties that break generic rules: it's actor-participant dynamic (people have agency), culturally specific, and has ethical dimensions (techniques can be manipulative). Without explicit tagging, AI agents cannot assess appropriateness or potential harm.
**Test:** For notes about influencing others, navigating relationships, or social dynamics: (1) Does it include `ethical-dimension:` (neutral|questionably-ethical|concerning)? (2) Does it specify `cultural-scope:`? (3) Is it marked as descriptive vs. prescriptive? (4) Does it default to lower confidence given high variability?
**Implementation:** Use fields:
```yaml
ethical-dimension: neutral  # generally accepted behavior
ethical-dimension: questionably-ethical  # exploits psychological biases
ethical-dimension: concerning  # could cause emotional harm
cultural-scope: universal|western|eastern|collectivist|individualist
knowledge-type: descriptive  # how people typically behave
knowledge-type: prescriptive  # what you should do
knowledge-type: conditional  # what works IF certain conditions hold
```
**Edge case:** Relationship-specific advice (about a specific person) differs from general social skills — use `subject:` field per existing rules.
**Edge case:** Power dynamic sensitivity — add `power-dynamic: upward|downward|lateral` for knowledge about influencing those with more/less/same power.

**Rule:** Use attention priority tags to surface notes needing review — separate critical/high/medium/low based on decay rate and value.
**Why:** Without attention signals, all notes are treated equally, causing stale knowledge to accumulate and high-value notes to receive insufficient maintenance. Notes need explicit prioritization to focus review effort.
**Test:** Can you identify the top 5 notes needing attention right now? Can you explain why each needs attention?
**Implementation:** Use `attention-priority: critical|high|medium|low` frontmatter. Critical: needs immediate review; High: review within 1 week; Medium: review within 1 month; Low: review quarterly.
**Edge case:** Domain-specific decay rates — finance knowledge may need monthly review while mathematics may need yearly. Use `decay-rate:` field to specify expected review intervals.

**Rule:** Define decay functions for time-sensitive knowledge — specify static/time-sensitive/event-triggered with explicit review triggers.
**Why:** Different knowledge decays at different rates. Treating all knowledge as static causes time-sensitive knowledge to silently become misleading. Explicit decay functions enable proactive refresh.
**Test:** Pick 10 notes with temporal claims. Can you categorize each as static, time-sensitive, or event-triggered? Do time-sensitive notes have explicit review triggers?
**Implementation:** Use `decay-rate: static|time-sensitive|event-triggered` with `review-trigger:` specifying time-based or event-based conditions.
**Edge case:** Domain variation — "overdue" means different things in math (years) vs. finance (months) vs. news (days). Configure domain-appropriate intervals.

**Rule:** For continuous/streaming data (updates in seconds/minutes), use external references not embedded values — capture interpretive knowledge (patterns, thresholds, anomalies) rather than current values.
**Why:** Continuously-updating data (IoT sensors, real-time prices, live metrics) differs from time-sensitive data — embedding values creates stale data within seconds. The knowledge is the interpretation pattern, not the point-in-time value.
**Test:** For data that updates more frequently than daily: (1) Is it a link to live source, not embedded value? (2) Does metadata specify `data-source:`, `data-freshness:`, `data-type: continuous`? (3) Is the captured knowledge about interpreting patterns, not current values?
**Implementation:** Use frontmatter:
```yaml
data-type: continuous|discrete|aggregated
data-source: https://api.example.com/sensor
data-freshness: seconds|minutes|hours
```
**Distinction from time-sensitive:** Time-sensitive data expires (refresh periodically); continuous data is obsolete immediately (always link to live source).

See also: [[Seed Stress Test - Confidence Markers Rule Across Domains]] — Stress test that proposed the attention priority and decay function rules

**Rule:** Add advisory validity tracking for prescriptive advice notes — include `advisory-validity-period:` specifying when the advice was accurate and `review-trigger:` for when to reassess.
**Why:** Advice that was sound can become unsound as conditions change. Without explicit validity periods, readers cannot distinguish current advice from historical guidance that may no longer apply. This is especially critical for high-stakes domains (finance, medical, legal) where outdated advice can cause real harm.
**Test:** For notes containing prescriptive advice (should/shouldn't, do/don't, recommended): (1) Is there an `advisory-validity-period:` or `valid-from:` date? (2) Is there a `review-trigger:` for when to re-assess? (3) Can readers determine if this advice is current?
**Edge case:** Evergreen advice (fundamental principles) doesn't need validity periods. Only apply to advice that could become outdated due to changed conditions.
**Implementation:** Use `advisory-validity-period: YYYY-MM to YYYY-MM` or `advisory-validity-period: conditional on [condition]` with `review-trigger: [when to reassess]`.

**Rule:** Monitor overflow indicators and enforce recovery when capture exceeds processing capacity — track processing backlog age, verification velocity, and access patterns.
**Why:** Overflow doesn't fix itself — it compounds. Without explicit overflow detection, vaults accumulate faster than they can be maintained, eventually becoming unusable. Early detection prevents collapse into unmanageable debt.
**Test:** Can you calculate: (1) Processing backlog age (days since oldest unprocessed note), (2) Verification velocity (notes verified per week), (3) Access frequency (% of notes accessed monthly)? Is backlog age under 14 days?
**Implementation:** Track overflow metrics:
```yaml
overflow-indicators:
  backlog-age-days: 7
  verification-velocity: 5  # per week
  access-frequency: 0.3  # 30% of notes accessed monthly
```
**Edge case:** New vaults may naturally have higher backlog during bootstrap — apply relaxed thresholds during construction phase.

**Rule:** Use time-boxed recovery when in overflow — allocate fixed time to recovery before resuming normal capture.
**Why:** Without explicit time boundaries, recovery efforts get displaced by new captures. Time-boxed recovery creates protected windows for catching up.
**Test:** When in overflow: (1) Do you allocate fixed time (e.g., 1 week) to recovery? (2) Is capture paused during recovery? (3) Do you have a target ratio (e.g., verification ratio <30%) before resuming?
**Recovery protocol:** Week 1: deprecate stale notes (50% time); Week 2-3: verify critical notes (30% time); Week 4: process new captures only (20% time).

**Rule:** Apply domain completion criteria to prevent overflow — define what "done" looks like before starting new domains.
**Why:** Partial domains accumulate forever without completion criteria. Explicit criteria create natural stopping points and prevent infinite expansion.
**Test:** For each major domain: (1) Can you state what 80% coverage looks like? (2) Are you working toward completion or just accumulating? (3) Do you have more than 3 partially-developed domains?

**Rule:** Use the 3-month access rule to prevent dead knowledge accumulation — review notes not accessed in 3 months.
**Why:** Notes that aren't accessed likely aren't valuable. Regular review of unused notes prevents accumulation of "someday" knowledge that never gets used.
**Test:** Can you identify notes not accessed in 3+ months? For each: (1) Is it still relevant? (2) Should it be deprecated? (3) Could it be replaced by a web search in 30 seconds?

**Rule:** Accept imperfect verification during overflow recovery — prefer "reviewed" status over unverified when truly overwhelmed.
**Why:** Perfect verification is the enemy of done. Some knowledge is better cursory-reviewed than never verified. Explicit "reviewed" status distinguishes effort from full verification.
**Test:** Do you have notes marked as "reviewed (cursory)" or similar? Are they distinguished from fully verified notes?

**Rule:** Use regulatory dating for compliance knowledge — include `regulatory-date:` (when captured), `regulatory-valid-until:` (expiration/review), and `jurisdiction:` tags.
**Why:** Unlike static knowledge, regulatory content has built-in obsolescence. Laws change, regulations update, and jurisdictions evolve. Without explicit dating, AI agents cannot distinguish current regulations from superseded ones.
**Test:** For any regulatory claim: (1) Is there a specific jurisdiction? (2) Is there an effective date? (3) Is there a review trigger?
**Edge case:** Some regulations have no expiration but are subject to enforcement changes. Mark as `regulatory-valid-until: ongoing` with `enforcement-status:` field.

**Rule:** Track legal source hierarchy explicitly — distinguish primary sources (statutes, regulations) from secondary (commentary, guides) from tertiary (summaries, blog posts).
**Why:** Legal knowledge has explicit hierarchy — primary sources have binding authority, tertiary do not. The general source quality rules don't capture this specificity. Without hierarchy, AI agents cannot assess which claims have legal weight.
**Test:** For any legal claim: Can you trace to primary source? Is the note tagged with `legal-source-tier: primary|secondary|tertiary`?

**Rule:** For cross-jurisdiction regulatory knowledge, map which regulations apply where rather than presenting universal claims.
**Why:** A product sold in EU and US may comply with different standards in each market. Single "this product is compliant" claims are incomplete. Readers and AI agents need explicit jurisdiction mapping.
**Test:** For cross-jurisdiction notes: Does the note specify which regulation applies in which jurisdiction?

**Rule:** Use compliance disclaimer layering — distinguish what the law requires, what manufacturers claim, and what practical protection provides.
**Why:** "This product meets safety standards" (legal compliance) differs from "This product is safe" (practical). Conflating them misleads readers about actual protection.
**Test:** Can you separate legal compliance from practical safety from marketing claims? Use `compliance-layer:` frontmatter to distinguish.

**Rule:** Track personal experience separately from source verification — distinguish knowledge you've actually lived through from knowledge collected from external sources.
**Why:** Knowing a source is accurate (verification) is different from having personally experienced the knowledge. A note can pass all quality checks and still misrepresent what you actually know or have done. The gap between "vault knowledge" and "personal knowledge" grows silently, leading to false expertise claims and advice you shouldn't give.
**Test:** For notes containing personal claims ("I learned", "I tried", "my experience"): (1) Is there `personally-experienced:` frontmatter? (2) Can you distinguish theory-only knowledge from practiced knowledge? (3) What is your personal knowledge ratio (personally-experienced / total experience claims)?
**Implementation:** Use frontmatter:
```yaml
personally-experienced: true|false
experience-count: number
last-practiced: YYYY-MM-DD
experience-tier: theory-only|tried-once|practiced|mastered
```

**Rule:** Conduct periodic personal knowledge audits — compare what the vault contains against what you actually know, have experienced, or have verified through action.
**Why:** The gap between vault knowledge and personal knowledge accumulates silently. Notes about topics you've never practiced create false expertise. Regular audits keep the vault honest about what you actually know.
**Test:** (1) Can you calculate a personal knowledge ratio? (2) Do you have a process to identify theory-only knowledge? (3) When did you last audit what you actually know vs. what you've collected?

**Rule:** Mark expertise claims with self-assessment — notes that imply skill level should include explicit self-evaluation.
**Why:** Notes claiming "advanced", "expert", or "mastery" need self-assessment to prevent false expertise. What you wrote about a topic and what you can actually do may differ. Without explicit self-assessment, the vault creates an illusion of competence you don't have.
**Test:** For notes implying expertise: (1) Is there self-assessed level? (2) Can you defend that level with evidence? (3) Would a colleague agree with your self-assessment?
**Implementation:** Use frontmatter:
```yaml
self-assessed-level: beginner|intermediate|advanced|expert
evidence: "What proves this level"
last-assessed: YYYY-MM-DD
```

**Rule:** Define explicit success metrics beyond structural health — track usage engagement, outcome achievement, and value attribution.
**Why:** Structural metrics (graph density, orphan rates, verification ratio) measure organization quality, not usefulness. A perfectly organized vault that no one uses provides no value. Without outcome metrics, you cannot distinguish between a vault that's structurally pristine but practically useless versus one that genuinely serves its purpose.
**Test:** (1) Can you state what outcomes the vault should achieve? (2) Do you track usage engagement (access frequency, search success, time-to-answer)? (3) Can you attribute decisions or outcomes to vault knowledge? (4) Do you compare vault performance to alternatives (web search, memory alone)?
**Implementation:** Define success criteria based on vault purpose:
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
      target: "Desired value"
  usage-tracking:
    access-frequency: true
    search-success: true
    time-to-answer: true
  value-attribution:
    track-decisions: true
    compare-alternatives: true
```
**Edge case:** New vaults (<50 notes) may not have enough usage data for meaningful outcome metrics — focus on structural health during construction, add outcome tracking after transition to maintenance mode.
**Edge case:** Privacy-sensitive vaults (personal journals, health records) may not track usage — use aggregate patterns rather than individual access logs.

## 5b. Edge Cases and Exceptions

*Organizing knowledge about what modifies or contradicts general principles.*

**Rule:** When a note contains knowledge that modifies or limits a general principle, tag it with `exception-type` frontmatter.
**Why:** Without explicit tagging, exception knowledge is invisible to both navigation and AI reasoning. Tagging makes exceptions discoverable and allows reasoning systems to apply them appropriately.
**Test:** Can you find all exceptions to a general principle by querying for `exception-type`?
**Implementation:**
```yaml
exception-type: scope-limitation|condition-trigger|temporal-boundary|population-specific|reverse-exception
applies-to-principle: [[General Principle Note]]
conditions: "When this exception applies"
```

**Rule:** For high-value general principles with multiple exceptions, create an exception hub note that links to the main principle AND all known exceptions.
**Why:** Users and AI agents need to find both the general rule AND its exceptions. Exception hubs make the complete picture discoverable.
**Test:** For principles with 3+ known exceptions: Is there an exception hub linking to all of them?

**Rule:** Exception notes must include explicit `applies-to-principle` frontmatter linking to the general rule they modify.
**Why:** This enables bidirectional reasoning: from principle to exceptions, and from exception back to the principle it modifies.
**Test:** Can you trace from any exception back to its parent principle? Can you find all exceptions for any principle?

**Rule:** Separate exceptions (cases where the general rule doesn't apply) from counter-examples (cases that suggest the general rule is wrong or incomplete).
**Why:** Exceptions preserve the general rule's validity; counter-examples challenge it. Treating counter-examples as exceptions hides potential rule problems.
**Test:** For every tagged exception: Is this genuinely an exception (rule still valid in typical cases) or a counter-example (rule may need revision)?
**Implementation:**
```yaml
exception-category: valid-exception  # Rule still generally valid
# vs
exception-category: counter-example  # Rule may need revision
```

**Rule:** For exceptions tied to specific conditions (regulations, market states, technologies), include `exception-valid-until` or `exception-condition` frontmatter.
**Why:** Exceptions can become invalid as conditions change. Without validity tracking, stale exceptions misinform decisions.
**Test:** For time-sensitive exceptions: Can you identify when the exception no longer applies?

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

**Test:** For jurisdiction-dependent notes: (1) Are the underlying principles the same? (2) Would a reader need different guidance for each jurisdiction? (3) Are there 5+ substantive differences? Split if yes to 3; tag if yes to 1-2.

**Rule:** For knowledge whose validity depends on climate zones, hardiness zones, or environmental conditions, use explicit scope tags (`hardiness-zone`, `climate-zone`, `hemisphere`).
**Why:** Environmental scope is distinct from jurisdiction — advice that's true in Zone 7 (like "plant tomatoes after last frost" in late May) is false in Zone 4 (late May is still frost risk). Without environmental tags, AI agents cannot distinguish between universally applicable advice and zone-specific guidance.
**Test:** Pick 5 gardening, construction, or agricultural notes. Do they have hardiness-zone or climate-scope tags? Can you determine which zones the advice applies to?
**Edge case:** Use `hardiness-zone:` for USDA or similar zone systems (e.g., `hardiness-zone: [4, 5, 6]`). Use `hemisphere: [northern, southern]` for seasonality-dependent knowledge. Use `climate-zone:` for Köppen climate classifications (e.g., `climate-zone: [Cfa, Dfa]`).
**Edge case:** Microclimates within a zone can create exceptions — note when advice applies to "typical" zone conditions vs. special cases (urban heat islands, coastal moderation, altitude effects).

**Rule:** For knowledge in domains with extreme location sensitivity (gardening, agriculture, beekeeping, local ecology), apply multi-dimensional environmental tagging beyond hardiness zones.
**Why:** Hardiness zones are necessary but insufficient — soil type, microclimate, local pest pressure, and water availability vary at scales that affect outcomes but aren't captured by zone alone. Knowledge that "works" in one location may fail dramatically in a nearby location with different conditions.
**Test:** For gardening, agriculture, or local ecology notes: (1) Is hardiness zone captured? (2) Are additional environmental factors tagged (soil type, moisture, sun exposure)? (3) Does the note acknowledge that results may vary by location?
**Implementation:** Use `location-sensitivity:` frontmatter with values:
- `low`: Knowledge transfers broadly (e.g., mathematical principles)
- `medium`: Zone/climate matters but general guidance applies (e.g., what to grow, not specific varieties)
- `high`: Results vary significantly by specific conditions (e.g., variety performance, soil adaptation)
- `extreme`: Must be verified for your specific conditions (e.g., most gardening, local pest management)
**Edge case:** For high/extreme sensitivity, include `trial-status:` (untested|testing|verified-local) and `verification-notes:` documenting what conditions the knowledge was tested under.
**Edge case:** Urban vs. rural differences matter — urban heat islands can shift growing zones 1-2 levels warmer; pest pressure differs in built environments.

**Rule:** For knowledge involving categorical transitions (thresholds), document the transition conditions explicitly — capture what signals a change from one state to another.
**Why:** Without threshold knowledge, AI agents cannot determine when a state transition has occurred. Advice that applies at one threshold may be wrong at another (skill acquisition stages, project health phases, relationship milestones). Explicit threshold documentation enables accurate state assessment.
**Test:** Pick 10 notes with categorical claims (always/never, stages, levels). Can you identify: (1) What threshold the claim depends on? (2) What indicators signal the threshold? (3) Is uncertainty about the boundary acknowledged?
**Edge case:** Some thresholds are gradual (transition happens over time, not at a point). Document the transition range.
**Edge case:** Some thresholds are contested (experts disagree on where the threshold lies). Present competing frameworks.
**Frontmatter:** Use `threshold-knowledge: true` with `threshold-type: gradual|discrete|contested`, `transition-indicators:`, and `uncertainty-band:`.

**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.
**Why:** Readers need to distinguish established facts from debated hypotheses without reading source chains.
**Test:** Do notes with contested claims include confidence metadata?

**See also:** [[Seed Refinement - Domain-Specific Confidence Marker Extensions]] — Domain-specific supplementary fields for scientific, legal, culinary, financial, and medical knowledge

**Rule:** Notes with `confidence: high` should have `last-reviewed` within a domain-appropriate timeframe — legal (6 months), scientific (12 months), general (12 months).
**Why:** High confidence without recent review can be misleading; knowledge may have evolved since last review. Domain-appropriate intervals reflect how quickly knowledge changes in each field.
**Test:** For notes with confidence: high (1) Is last-reviewed within the appropriate timeframe? (2) If older, downgrade to confidence: emerging until re-reviewed?

**Rule:** For domains with inherently different knowledge velocities, use domain-velocity classification to calibrate confidence decay expectations — fast-velocity domains (technology, finance, current events) require shorter review cycles and lower confidence ceilings, while static domains (mathematics, history, philosophy) have extended review intervals.
**Why:** Treating all domains equally causes fast-velocity domains to accumulate false confidence (stale knowledge appears reliable) and slow-velocity domains to suffer unnecessary review overhead. Photography knowledge about 2018 cameras shouldn't have the same confidence decay timeline as fundamental mathematics. Without domain-velocity awareness, AI agents cannot appropriately calibrate confidence and review frequency.
**Test:** 
1. Can you classify your vault's primary domains by velocity (fast/medium/slow/static)?
2. Do high-velocity domain notes (technology, finance, current events) have review intervals ≤90 days?
3. Do static domain notes (mathematics, history, philosophy) have `review-interval: historical` or `review-interval: never`?
4. For fast-velocity domains, does `confidence: high` require verification within the last 30 days?
**Implementation:** Use `domain-velocity:` frontmatter (fast/medium/slow/static) with domain-appropriate default review intervals:
- Fast (30-90 days): consumer electronics, software, social media, market data, current events
- Medium (90-180 days): professional equipment, domain methodologies, industry regulations
- Slow (180-365 days): craft techniques, practice methodologies, health research
- Static (historical/never): mathematical proofs, historical facts, philosophical arguments, foundational definitions

**Rule:** For domains with no consensus, explicitly tag notes with `consensus: none` and default to `confidence: emerging`.
**Why:** In domains where experts fundamentally disagree and empirical verification is impossible (parenting, relationships, personal development), presenting claims as if there's consensus misleads readers. Explicit consensus tracking helps readers understand that uncertainty is inherent to the domain.
**Test:** For notes in domains with no consensus: (1) Does the note explicitly state that consensus is absent? (2) Is confidence tagged as low/emerging by default? (3) Are multiple perspectives presented rather than one "correct" answer?
**Edge case:** Domains with no consensus include: parenting, relationship advice, personal development, philosophy, ethics, many creative domains. The absence of consensus is itself valuable knowledge.
**Edge case:** Some questions genuinely have consensus (safety facts, developmental ranges). Don't over-apply "no consensus" to domains where consensus exists on specific issues.

**Rule:** Track calibration status separately from confidence — use `calibration-status:` to indicate whether knowledge has been verified for your specific use case, independent of its original confidence level.
**Why:** Confidence describes the knowledge's source reliability; calibration describes your trust in it for your specific context. A note with `confidence: high` may still be inapplicable to your situation, unverified for your use case, or based on assumptions that don't hold in your context.
**Test:** For 10 notes you rely on for decisions, can you state their calibration status? Can you explain why you're trusting each one?
**Values:** `calibration-status: pre-calibrated` (default, not yet assessed), `calibration-status: calibrated-yes` (verified applicable to your context), `calibration-status: calibrated-no` (found inapplicable or unreliable), `calibration-status: calibrated-uncertain` (reviewed but can't determine)
**Edge case:** Calibration is orthogonal to confidence — a note can have high confidence but low calibration (author is certain, but you haven't verified applicability) or low confidence but high calibration (you've personally tested and trust it despite weak source).

**Rule:** For knowledge tagged with `stakes: high` or `stakes: medium`, complete a calibration check before acting: verify source reliability, evidence strength, currency, applicability to your context, and reversibility.
**Why:** High-stakes decisions warrant explicit verification. Without calibration, you either over-trust (act on unverified assumptions) or under-trust (never use your knowledge base). Calibration helps make informed trust decisions efficiently.
**Test:** Can you explain why you're trusting this knowledge for this specific decision? Do you know: (1) What's the source? (2) Is the evidence strong? (3) Is it current? (4) Does it apply to your context? (5) Can you reverse this decision if wrong?

**Rule:** Document applicability deviations — when your context differs from the note's assumed context, record the deviation with `context-deviation:` field.
**Why:** Knowledge captured in one context may not apply in another. Documenting deviations helps future reviews, prevents inappropriate application, and helps others in similar situations understand potential issues.
**Test:** For notes where your context differs from the note's assumptions, is the deviation documented?

**Rule:** Present value-laden choices as trade-offs, not recommendations — use `values-trade-off:` field to document what's being traded.
**Why:** In domains where different choices reflect different values (parenting approaches, relationship styles, career paths), presenting one option as "best" misleads readers. The knowledge base should help readers make informed choices aligned with their values, not push a single worldview.
**Test:** For notes containing prescriptive advice: (1) Can you identify what values are being traded? (2) Are both/all options presented with their trade-offs? (3) Is there a `values-trade-off:` field documenting the choice?
**Edge case:** Safety facts and empirical claims aren't value choices. Only apply to genuinely value-laden decisions where reasonable people disagree based on values, not facts.

**Rule:** For domains where personal experience is more valuable than expert analysis, weight n=1 experience appropriately.
**Why:** In domains where empirical verification is impossible (parenting, relationships), dismissing personal experience loses valuable information. Personal experience is n=1 data that may be more applicable to the reader's situation than abstract studies.
**Test:** For notes in experiential domains: (1) Is personal experience included? (2) Is it explicitly attributed? (3) Is context (specific situation, individual differences) documented?

**Rule:** For key domain concepts, include both the technical term and plain-language equivalent — either inline or via a linked definition note.
**Why:** Different readers have different backgrounds. A vault that uses only jargon excludes newcomers; one that only uses plain language frustrates experts. Dual-layer vocabulary serves both.
**Test:** Pick 5 random notes in a domain-specific vault. Can a beginner understand the main concept without clicking any links? Can an expert find the precise terminology?

**Rule:** When introducing a domain-specific term, either define it inline (1-2 sentences) or link to a definition note — never assume the reader knows it.
**Why:** Links break. Definition notes can become orphaned. Inline definitions are always available, ensuring self-containment.
**Test:** Read each note in isolation. Can you understand the key terms without following any links?

**Rule:** Default to the most precise term available, but provide plain-language context for common concepts.
**Why:** A knowledge base should be a source of truth. Precision is harder to achieve than accessibility. Provide both by leading with precision and following with accessibility.
**Test:** For 10 notes, count: (1) technical terms used, (2) plain-language equivalents provided. Is there at least one plain-language aid per 3 technical terms?

**Rule:** Separate time-sensitive data from static knowledge — link to live sources for rapidly changing information, use point-in-time references with dates for moderately temporal knowledge.
**Why:** Embedding transient data (stock prices, weather, news) creates misleading notes that appear authoritative but contain incorrect information. Separation keeps the vault accurate without constant revision.
**Test:** Scan for notes containing specific values (prices, counts, current dates as facts). Check: (1) Is this likely to change? (2) Is there a source URL for current data? (3) Should this be a link instead?
**Edge case:** Illustrative examples (e.g., example prices in a tutorial) differ from factual claims. Mark illustrative examples clearly or use placeholder values.
**Edge case:** For temporal data, use frontmatter `data-date: YYYY-MM-DD` or `data-as-of: YYYY-Q#` to mark the point in time the data is valid.
**Edge case:** In rapidly-changing domains (trading, weather, news), temporal notes may become obsolete quickly. Prioritize linking over embedding, and review temporal notes when conditions shift significantly.

**Rule:** Tag predictive knowledge with explicit temporal scope and verification window — distinguish forecasts (model-based), projections (assumption-based), and predictions (categorical future statements).
**Why:** Predictive knowledge differs fundamentally from temporal data — it cannot be verified at capture time and may never be verifiable. Without explicit verification windows, predictions accumulate as "knowledge" without ever being checked.
**Test:** For notes containing predictions: (1) Is there a `prediction-type:` field (forecast|projection|hypothesis)? (2) Is there a `verify-after:` date marking when verification is possible? (3) Can readers determine when this prediction becomes verifiable?
**Edge case:** Model-based predictions have different reliability than expert intuition — capture the methodology. Some predictions (about unique events) may never be verifiable — acknowledge this limitation.
**Edge case:** Self-defeating predictions: if widely believed, predictions can cause actions that prevent them from occurring. Tag predictions where belief would change the outcome.

**Rule:** Track prediction accuracy over time — review predictions after their verification window and categorize as correct/incorrect/unverifiable.
**Why:** A knowledge base that makes predictions should learn from them. Tracking accuracy builds credibility and helps distinguish reliable predictors from unreliable ones.
**Test:** Can you calculate: (1) What percentage of predictions were correct? (2) Did more confident predictions fare better than less confident ones? (3) Are failed predictions preserved with accuracy notes for future reference?

**Rule:** Distinguish continuous real-time data streams from static and time-sensitive knowledge — use different capture strategies for each.
**Why:** Real-time sensor data (temperature, heart rate, server metrics) is fundamentally different from time-sensitive data (stock prices, news) and static knowledge (facts). Continuous streams cannot be snapshot meaningfully without aggregation. The vault should store synthesized insights from streams, not raw data.
**Test:** For a data source: (1) Is it continuously updating (streams) or periodically updating (time-sensitive)? (2) If continuous, what insight/pattern does this data represent? (3) Is the note capturing the insight, or just a point-in-time reading?
**Edge case:** Use `data-source-type: stream` for continuous sources (sensors, feeds), `data-source-type: periodic` for time-sensitive data, `data-source-type: static` for unchanging facts.
**Edge case:** For streams, define aggregation periods that make sense for the domain — hourly summaries for server metrics, daily for weather, weekly for fitness trends.
**Edge case:** Real-time knowledge often requires location/device context. Include `sensor-location:` or `device-id:` fields for spatially-specific readings.

**Rule:** For real-time and sensor-based knowledge, store synthesized patterns rather than raw readings.
**Why:** A single temperature reading is data; "the office averages 5°F warmer than the bedroom" is knowledge. The vault should contain insights that remain true even if the live source goes offline.
**Test:** If you disconnected this sensor, would the note still contain useful knowledge? If no, it's raw data, not a knowledge note.
**Edge case:** Include a link to the live source for current readings, but the note itself should contain the enduring insight.

**Rule:** Handle sensor fallibility explicitly in sensor-derived knowledge — document known failure modes, drift patterns, and fallback sources.
**Why:** Sensors fail, disagree, and drift. Knowledge derived from sensors without acknowledging uncertainty is unreliable.
**Test:** For sensor-derived notes: (1) Is sensor reliability documented? (2) Are there known failure modes? (3) Is there a verification method or fallback source?

**Rule:** Separate personal biometric and location-sensitive data with appropriate security and privacy considerations.
**Why:** Health data, GPS traces, and other personal sensor data is sensitive. The vault should handle such data differently from public knowledge — with encryption, access controls, and explicit consent considerations.
**Test:** For personal sensor data: (1) Is the data encrypted at rest? (2) Is there a retention policy? (3) What harm could result from exposure?
**Edge case:** Biometric data may have regulatory implications (HIPAA, GDPR). Consult applicable regulations for retention and access requirements.

**Rule:** For personal health metrics and body knowledge (sleep, mood, exercise, weight, biometrics), separate raw measurement data from synthesized insights, apply appropriate sensitivity tagging, and use self-referential verification criteria.
**Why:** Personal health data is highly sensitive, time-series data differs from atomic knowledge, and self-verification requires different criteria than source-based verification. Raw measurements without synthesis create noise; synthesized insights without raw data lack evidence.
**Test:** (1) Can you identify which notes are raw data vs synthesized insights? (2) Are sensitive notes appropriately tagged with `sensitivity:` field? (3) For pattern claims, do you have sufficient data points (30+) to claim confidence? (4) Are context factors documented alongside correlations?
**Implementation:** For personal health vaults:
- Separate raw data (timestamps, measurements) from interpretive notes (patterns, correlations)
- Use tiered sensitivity: public (trends only), private (synthesis, not raw data), highly-sensitive (raw data excluded)
- Track verification with self-referential criteria: `verification-status: self-observed`, `verification-status: pattern-suspected`, `verification-status: pattern-confirmed`
- Use `metric:` frontmatter to identify what's being tracked, `context-factors:` for relevant conditions
- Document context boundaries for patterns ("this works when I'm not traveling")
**Edge case:** Goals are not knowledge — distinguish desired outcomes (goals) from observed facts (knowledge). Use `type: goal` with `target:`, `progress:`, `review-cycle:` for goals; keep knowledge notes focused on synthesis, not desired outcomes.
**Edge case:** Metric overload — limit active tracking to 5-7 key metrics to avoid action fatigue and pattern dilution. Apply diminishing returns test: does this metric help you make decisions? Can you act on this information?

See also: [[Frontier Exploration - Personal Health Metrics and Body Knowledge]] for detailed exploration of this frontier.

**Rule:** Distinguish sequential knowledge (where order IS the knowledge) from static and time-sensitive knowledge — tag temporal sequences with `temporal-type: sequence` and prerequisites with `prerequisites: []`.
**Why:** Knowledge where sequence is intrinsic (history, music composition, biological processes, learning progressions) requires different structure than static facts or time-sensitive data. Without temporal tagging, AIs cannot distinguish "the causes of WWI" (sequence matters) from "the causes of cancer" (static knowledge).
**Test:** Pick 10 notes in a domain with inherent sequences (history, music, biology, learning). Can you categorize each as: (1) static fact, (2) time-sensitive data, or (3) sequential knowledge? Do sequential notes have temporal-type or prerequisites metadata?
**Edge case:** Historical causation (why events happened) is sequential knowledge — the ORDER of causes produces different effects. Tag with `temporal-type: causal-sequence`.
**Edge case:** Musical composition, story structure, and dance choreography are inherently sequential — the sequence IS the knowledge being captured. Consider `temporal-type: compositional`.
**Edge case:** Learning progressions are sequential — understanding B requires understanding A first. Tag with `prerequisites: []` listing required prior knowledge.
**Edge case:** Some knowledge is cyclical (seasons, biological rhythms) — tag with `temporal-type: cyclical` to distinguish from linear sequences.

**Rule:** For sequential knowledge, capture both the sequence AND the key moments — atomic notes for key points, links for temporal relationships.
**Why:** A sequence without key moments is overwhelming; key moments without sequence loses causal structure. Both are needed for understanding.
**Test:** For a sequential knowledge note: (1) Can you identify the key moments as atomic notes? (2) Can you trace the temporal/causal chain between them? (3) Are the relationships explicitly tagged (causes, enables, precedes)?
**Edge case:** Not every step in a sequence needs its own note — only pivotal moments that are referenced elsewhere. Routine steps can be embedded in the sequential note.

**Rule:** Distinguish cyclical knowledge (recurring patterns) from linear temporal knowledge — tag recurring knowledge with `temporal-type: cyclical`, `cycle-period`, and `cycle-phase`.
**Why:** Knowledge that recurs seasonally (holiday recipes, tax preparation, sports seasons) behaves differently from linear time-sensitive data. Without cyclical tagging, AIs may incorrectly flag accurate seasonal knowledge as "stale" during dormancy periods. Cyclical knowledge is accurate but temporarily inapplicable; temporal data changes over time.
**Test:** Pick 10 notes with time-related content. Can you categorize each as: (1) static (never changes), (2) time-sensitive (changes linearly), or (3) cyclical (recurs predictably)? Do cyclical notes have `cycle-period` and `next-relevant` metadata?
**Edge case:** "Expired" (was correct, now wrong) differs from "dormant" (still accurate, just not currently applicable) — distinguish with different status markers.
**Edge case:** Create seasonal hub notes that shift active status each cycle — a "Holiday Baking" hub activates in fall each year.

**Rule:** Use typed temporal relationships — distinguish "prerequisite" (must learn first) from "related" (helpful but not required) and "builds on" (extends but independent).
**Why:** "You need A before B" is a different relationship than "A relates to B" or "B builds on A." Typed relationships enable learning path construction.
**Test:** For sequential notes with prerequisites: (1) Are prerequisite links explicitly tagged? (2) Can an AI construct a learning path from the graph? (3) Is the difference between "prerequisite" and "related" clear?

**Rule:** For knowledge domains with established evidence hierarchies (medicine, law, science), capture source quality tier in addition to confidence levels.
**Why:** Source quality (systematic reviews > RCTs > case reports) is distinct from confidence (how certain we are about the knowledge). Treating all sources equally loses critical reliability information in high-stakes domains.
**Test:** For notes in medicine, law, or science: (1) Does each major claim cite a source? (2) Is there source-tier metadata (systematic-review/rct/observational/case-study/expert-opinion/anecdote)? (3) Do claims from higher-tier sources receive higher confidence markers?
**Edge case:** When lower-tier sources contradict higher-tier sources, present the conflict explicitly and default to higher-tier evidence. Source quality (methodological rigor) differs from current validity.
**Edge case:** For multi-claim notes with different source tiers: either split into atomic notes per source tier, or clearly mark each claim inline with its source tier.
**Edge case:** Clinical guidelines (from reputable bodies like AHA, WHO) count as high-tier evidence — treat as systematic-level or add "guideline" as a distinct source tier.
**Edge case:** Add "textbook/educational" as a source tier for knowledge that's generally accepted in education but not directly cited to primary sources.
**Edge case:** Source tier reflects methodological quality; confidence reflects current validity. A high-tier source that's been superseded should show "confidence: disputed" or "confidence: obsolete."
**Edge case:** For AI-generated notes, verify at least one citation is accurate before publishing and mark with appropriate author-type.

**Rule:** Separate core knowledge from supplementary media — text must stand alone, media should enhance but not be required.
**Why:** Media files rot (links die, platforms shut down), formats become obsolete, and searchability depends on text. A knowledge base that depends on external media becomes unreliable over time.
**Test:** Read each note in isolation. Can you understand the core knowledge from text alone? If the note becomes meaningless without clicking a media link, it's fragile and needs text summarization.
**Edge case:** Some domains are inherently multi-modal (music, video tutorials, languages). In these cases, provide a text summary alongside every media reference so the knowledge remains searchable and accessible even if media links break.
**Edge case:** Use frontmatter `media: []` field to list associated media files, with `media-type: audio|video|image` and `media-summary: ` for each.

**Rule:** Use domain-appropriate formats for embedded media — prefer open, searchable, portable formats when possible.
**Why:** Some formats are domain-standard and more searchable (MIDI for music, ABC notation for melodies, SVG for diagrams) than proprietary formats. Portability affects long-term accessibility.
**Test:** For the vault's domain, what is the standard format? Are media files in portable formats when choice exists?

**Rule:** For domains with established notation systems (music, math, chess, programming), distinguish notational knowledge from descriptive knowledge.
**Why:** In domains with symbolic notation, the notation itself carries precision that text cannot match. But notation alone may be inaccessible to novices. The knowledge base should serve both experts (who need precision) and newcomers (who need explanation).
**Test:** (1) Does this domain have established notation systems? (2) Would converting notation to text lose essential precision? (3) Is the target audience fluent in the notation? Use `knowledge-encoding: symbolic|text|synthetic` and `notation-type:` frontmatter to clarify.
**Edge case:** Some notation is universally readable (chess PGN, chemical formulas); some requires training (music standard notation, mathematical proofs). Adjust accessibility expectations based on notation complexity.
**Edge case:** Provide dual-layer representation: notation for precision, text explanation for accessibility. A note should be valuable to both notation-fluent and notation-novice readers.

**Rule:** Tag notation complexity level for symbolic knowledge — distinguish basic, intermediate, advanced, and expert notation.
**Why:** Chord symbols are basic; jazz voicings are intermediate; atonal notation is expert. Without complexity tagging, readers cannot assess whether they have the required fluency.
**Test:** Can you identify what minimum notation fluency is needed to understand this note? Use `notation-fluency-required:` frontmatter.

**Rule:** For temporal-spatial knowledge (music, dance, chess), capture both temporal relationships (sequence, progression) AND structural relationships (harmony, form, function) separately.
**Why:** Music has both: melody unfolds in time (temporal) while chord function exists in structural relationship. Current temporal rules focus on sequence (A before B), but domains like music need "this functions as X within the harmonic context."
**Test:** For a music/choreography/sequential art note: (1) Does it have temporal-type for sequential relationships? (2) Does it also capture structural/formal relationships separately? Use `temporal-type: sequential|structural|cyclical` and `form-type:` for structural relationships.

**Rule:** Assess modal essentiality for knowledge capture — determine whether text alone can convey the knowledge or whether multi-modal representation is required.
**Why:** In some domains (cooking, music, clinical skills), text cannot fully convey the knowledge. Attempting to capture "how dough should feel" or "how a chord should sound" in text alone guarantees incomplete knowledge. Assessing essentiality upfront prevents gaps.
**Test:** For knowledge you want to capture: (1) Can this be fully conveyed in text alone? (2) Would missing the visual/audio/kinesthetic element make the knowledge incomplete? (3) Can you name what text cannot capture?
**Implementation:** Use `modal-essentiality:` frontmatter with values:
- `text-sufficient`: Text alone conveys the knowledge fully
- `text-primary-media-optional`: Text works but media significantly enhances understanding  
- `media-essential`: Cannot be understood without the non-text modality
- `multi-modal-required`: Requires multiple modalities (video with audio)
**Edge case:** Domain assessment — some domains inherently require multi-modal capture (clinical medicine, performing arts, cooking). The Seed should acknowledge which domains demand this.

**Rule:** Create dual-layer notes for media-essential knowledge — ensure text layer stands alone while media provides enhancement.
**Why:** Media files rot (links die, platforms shut down, formats obsolete). A knowledge base that depends on external media becomes unreliable. Dual-layer notes ensure knowledge survives media loss while preserving enhancement value.
**Test:** For notes tagged media-essential: (1) Is there a text layer conveying the core knowledge? (2) Does media enhance but not replace text? (3) If all media links died, would the note still have value?
**Structure:**
```yaml
modal-essentiality: media-essential
media-layer:
  - type: image
    purpose: "Shows proper dough consistency"
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

**Rule:** Every quality criterion must apply to any knowledge domain — software, cooking, history, physics.
**Why:** Domain-specific rules limit reuse; the Seed must work everywhere.
**Test:** For each rule, substitute 3 different domains. Does the rule still make sense?

**Rule:** Structure is universal; only content is domain-specific.
**Why:** Atomicity, linking, and navigation work identically regardless of subject matter.
**Test:** Could you replace all note content with a different domain's content and have the structure still be valid?

**Rule:** Hub notes should reflect the domain's natural concept hierarchy, not an imposed taxonomy.
**Why:** Forcing a generic taxonomy onto domain content creates friction; let the domain's own structure emerge.
**Test:** Do hub note titles match how practitioners in the domain naturally categorize knowledge?

**Rule:** For knowledge spanning multiple domains, use domain tags on atomic notes and create cross-domain hub notes that connect domain-specific perspectives.
**Why:** Single-domain vaults are simple; cross-domain vaults need explicit structure to avoid fragmentation or duplication. Tags enable filtering, hubs enable navigation.
**Test:** Pick a topic spanning 2+ domains. Can you identify all domains? Does each domain aspect have an atomic note? Is there a hub connecting them? Are domain tags applied consistently?

**Rule:** When knowledge from one domain explains or informs another, explicitly tag the interaction type — explanatory (domain B explains why A works), applicational (domain A applies to domain B), or conflicting (principles from different domains contradict).
**Why:** Cross-domain connections are valuable but not all are equal. Explanatory relationships help understanding; applicational relationships enable transfer; conflicting relationships require navigation. Without explicit typing, AI agents cannot distinguish between these or make good navigation decisions.
**Test:** Pick 5 notes that reference multiple domains. Can you categorize each as explanatory, applicational, or conflicting? Is the type documented in frontmatter?
**Implementation:**
```yaml
domain-interaction-type: explanatory|applicational|conflicting
domains: [primary-domain, secondary-domain]
```

**Rule:** For explanatory cross-domain knowledge, decide on inline vs. link based on reusability — if the explanatory knowledge appears in 3+ notes, create a separate note; otherwise inline the explanation.
**Why:** Separating reusable explanations strengthens the graph; inlining unique explanations maintains atomicity. The threshold prevents over-linking while ensuring frequently-referenced knowledge is discoverable.
**Test:** (1) How many notes reference this explanatory knowledge? (2) Does the explanation need to evolve independently? Split if yes to 1 (3+ references) or 2; inline if 1-2 references.

**Rule:** Present conflicting domain principles as explicit tensions with synthesis guidance, not false syntheses — document what conditions make each principle valid.
**Why:** When psychology and economics offer contradictory guidance, forcing a synthesis misleads readers. Explicit tensions with context guidance help readers navigate rather than choose incorrectly.
**Test:** For notes with cross-domain conflicts: (1) Can you articulate both positions fairly? (2) Are validity conditions explicit? (3) Is there synthesis guidance for different contexts?
**Implementation:**
```yaml
domain-conflict:
  domain-a: psychology
  domain-a-principle: "[principle]"
  domain-b: economics
  domain-b-principle: "[principle]"
  synthesis-guidance: "[when each applies]"
```

**Rule:** For vaults with frequent cross-domain interactions (5+ notes referencing two specific domains), create an integration hub that connects domain-specific perspectives.
**Why:** Dedicated intersection hubs (e.g., "Fitness Nutrition" connecting exercise science + nutrition) help navigate the most valuable domain interactions without cluttering individual notes.
**Test:** (1) Do 5+ notes reference both domain A and B? (2) Is there a hub note for the intersection? (3) Can users find cross-domain knowledge through the hub?

**Rule:** Tag notes with domain transfer potential — capture which principles could apply beyond their source domain.
**Why:** Knowledge transfer is one of the most valuable forms of insight. Systematically capturing transfer potential helps discover unexpected connections and builds expertise.
**Test:** For a random note: (1) Could this principle apply elsewhere? (2) Has transfer been documented? (3) Can you find transfer examples in the vault?
**Implementation:**
```yaml
domain-transfer-potential:
  - from: [source-domain]
    to: [target-domain]
    transfer-principle: "[how it transfers]"
```

**Rule:** For vaults primarily serving AI agents (RAG systems, AI agents, automated reasoning), optimize structure for retrieval precision over human comprehension.
**Why:** AI agents and embedding-based retrieval have different needs than human readers - they need explicit semantic contracts, typed relationships, and machine-readable confidence. Optimizing for AI changes how atomicity, linking, and verification work.
**Test:** Pick 5 notes. Can an AI determine: (1) what each link semantically means (evidence, prerequisite, contradiction)? (2) how to verify each claim? (3) what the core concept is from the first 100 words? If no to any, the note is human-native, not AI-native.
**Edge case:** Many vaults serve both humans and AIs. In mixed-use vaults, prioritize human comprehension but include AI-optimized frontmatter (typed relationships, explicit verification pathways) as supplementary structure.
**Edge case:** Domain-specific link semantics matter for AI retrieval. In legal knowledge bases, links should specify relationship type (precedent:established, precedent:distinguished, jurisdiction:applies, superseded:by). In medical knowledge bases, links should indicate evidence strength (guideline:strong, evidence:moderate, expert-opinion:low). Generic "related" links don't provide enough context for AI agents to use links appropriately.
**Implementation:** Use link prefixes: [[evidence:Smith v. Jones]] for supporting citations, [[prerequisite:contract-law]] for required background, [[jurisdiction:delaware]] for jurisdiction-specific content.

**Rule:** For domains where core knowledge exists in computational models (simulations, simulations, agent-based models), document the model with structured fields — assumptions, parameters, version, outputs, and interpretation guidance.
**Why:** Model-based knowledge has different properties than text — it's executable, parameterized, and version-dependent. Treating model documentation like regular notes loses these properties.
**Test:** For notes describing model behavior: (1) Can you identify key assumptions the model makes? (2) Can you list input parameters and their typical ranges? (3) Is there guidance on how to interpret model outputs? (4) Can you determine which model version produced this insight?
**Edge case:** Some domains have competing models with different assumptions — document model choice criteria as distinct knowledge. The selection of which model to use is often as important as the model itself.

**Rule:** For vaults serving multilingual audiences, distinguish language-neutral knowledge from language-specific knowledge — keep conceptual knowledge unified, create language-specific notes only when cultural context differs.
**Why:** Language-neutral knowledge (technical concepts, universal principles) shouldn't be duplicated across languages. Language-specific knowledge (cultural practices, idioms, context-dependent concepts) requires separate notes with cultural context. Without this distinction, vaults either duplicate content or lose cultural nuance.
**Test:** Pick 10 notes that could apply across languages. Can you categorize each as: (a) language-neutral (create one unified note), (b) language-specific (create separate notes with language tags), or (c) hybrid (unified note with language-specific examples)?
**Edge case:** Technical domain terminology that exists in multiple languages (programming, science) is often language-neutral even when the words differ. Use one note with all language variants listed.

**Rule:** Use language tags for filtering, not as primary structure — organize by topic first, filter by language second.
**Why:** Primary organization by topic keeps related knowledge together; language is an access dimension. Flipping this (organizing by language first) fragments topic knowledge across the vault.
**Test:** Can you filter notes by language tag? Do topic hubs connect language-specific variants, or does each language have separate topic hierarchies?

**Rule:** For untranslatable concepts, use `language-of-origin` frontmatter — document the concept in its source language with explanation of why it doesn't map to other languages.
**Why:** Some concepts are culturally embedded and have no direct translation. Documenting them preserves the knowledge; attempting forced translation loses meaning.
**Test:** For notes about culturally-embedded concepts: (1) Is there a `language-of-origin:` field? (2) Does the note explain why direct translation isn't possible? (3) Are there linked notes for other language variants if they exist?

**Rule:** For domains with established structural templates (forms, frameworks, standard architectures), create canonical structure notes that define the template and link to examples.
**Why:** Practitioners expect to find canonical structures; AI agents need to know what "standard" looks like in the domain. Without explicit capture, canonical knowledge remains tacit and scattered.
**Test:** In a domain with canonical structures: (1) Can you identify the standard forms/frameworks? (2) Are there notes defining each canonical structure? (3) Do example notes link to their structural template?
**Edge case:** Competing canonical structures — some domains have multiple valid frameworks. Create a hub note for each and link examples to their applicable structure with `framework:` tags.
**Edge case:** Evolving structures — some canonical forms change over time. Use `valid-from:` and `valid-until:` for time-sensitive structures.
**Implementation:**
```yaml
canonical-structure: true
structure-type: form|framework|pattern|methodology
domain: [domain name]
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

**Rule:** Identify tacit knowledge boundaries — explicitly mark where written knowledge ends and experiential knowledge begins.
**Why:** Readers need to know what cannot be learned from text alone. Tacit knowledge (intuition, feel, muscle memory, judgment through experience) cannot be fully captured in notes, but the gap can be acknowledged.
**Test:** In experiential domain notes, can you identify what's missing that experience would provide? Is the gap acknowledged?

**Rule:** Document what can't be captured — when tacit knowledge resists capture, note the gap explicitly.
**Why:** An explicit acknowledgment of what's missing is more useful than a silent gap. Future note versions or multimedia content may address what text cannot.
**Test:** If a note describes a process requiring judgment, does it acknowledge what experience would teach? Are there "requires hands-on practice" warnings or explicit gaps noted?

**Rule:** Capture failure modes and proxies when tacit knowledge can't be written — describe what goes wrong more easily than what goes right.
**Why:** Tacit knowledge is easier to describe in negative: "when it sounds off" is easier to articulate than "when it sounds right." Failure modes and analogies are the primary capture mechanism for tacit knowledge.
**Test:** Do notes in experiential domains include failure mode descriptions? Do they use analogies or proxies for direct knowledge?

**Test for tacit knowledge severity:** Pick a domain (music, sports, crafts). Estimate: What percentage of expertise in this domain is tacit (cannot be fully articulated)? High tacit domains need more proxy markers, failure mode documentation, and multimedia links.

**Rule:** Distinguish tacit knowledge from embodied knowledge — tacit CAN be approximated through proxies, embodied CANNOT exist in text at all.
Why: Some domains (performing arts, physical skills, clinical procedures) have knowledge that IS the physical execution. The movement/sound itself is the knowledge — text is merely a reference, not the knowledge itself. Tacit knowledge resists articulation; embodied knowledge is non-textual by nature.
Test: For domain notes, ask: (1) Can this be fully captured in text without media? (2) Is there a "correct" physical execution? (3) Does knowledge emerge from execution context? If yes to 2-3, tag with `knowledge-type: embodied`.

**Rule:** For embodied knowledge domains, use multi-media-first capture with text summary as secondary.
Why: Text alone cannot contain embodied knowledge. The media (video, audio) IS the primary note; text describes what to look for, not what to do.
Test: For performing arts or physical skill notes: (1) Is media the primary content? (2) Does text provide execution guidance, not just description? (3) Is there `verification-mode: real-time` frontmatter?

**Rule:** Tag embodied knowledge with `knowledge-type: embodied` and `verification-mode: real-time` to distinguish from standard tacit knowledge.
Why: Standard verification (sources, tests) doesn't apply. Embodied knowledge is validated during execution by audience response, physical feedback, or real-time assessment.
Test: Can you identify: (1) What is the execution context? (2) What indicates successful execution? (3) Is this individual or collective knowledge?

**Rule:** For ensemble/collective knowledge (musical ensembles, theater troupes, team sports), document participant requirements explicitly.
Why: Some knowledge only emerges from interaction between participants. Individual notes cannot capture what exists only in the group context.
Test: For collective knowledge notes: (1) What participants are required? (2) What roles does each play? (3) Is the knowledge in the interaction, not any individual?

**Rule:** For embodied knowledge, include "execution criteria" frontmatter defining what success looks like during performance.
Why: Unlike procedural knowledge where success is binary (recipe works/doesn't), embodied knowledge quality is often subjective. Explicit criteria enable assessment even when full judgment requires expertise.
Test: Can an AI agent determine: (1) What does successful execution look like? (2) What are common failure modes? (3) Who can judge quality (expert vs. trained observer)?

**Rule:** Use cross-domain anchors for embodied knowledge — connect physical executions to verbal/ textual equivalents where possible.
Why: A dance move can be described verbally; a musical passage can be notated. These anchors bridge embodied and textual knowledge even when they can't fully capture each other.
Test: For embodied notes: (1) Is there a verbal/written description? (2) Is there notation or symbolic representation? (3) Do these anchor to each other?

**Rule:** For sensory domains (cooking, wine, perfumery, materials), create explicit sensory reference standards — documented benchmarks that serve as common vocabulary.
**Why:** Sensory descriptions are meaningless without reference points. "Tastes like burnt caramel" only works if the reader has experienced burnt caramel. Explicit standards enable consistent communication.
**Test:** Can you point to 3+ reference standards in your sensory domain? (e.g., "ripe banana" as sweetness reference, "00 steel wool" as texture reference)

**Rule:** Use cross-modal anchors in sensory notes — connect experiences to more universal references when possible.
**Why:** "Smells like cut grass" is more accessible than "green notes" for those unfamiliar with wine jargon. Cross-modal anchors make sensory knowledge accessible to newcomers.
**Test:** Can a beginner understand sensory descriptions without requiring domain expertise?

**Rule:** Define explicit intensity scales for sensory domains — document what "mild", "medium", "strong" actually mean numerically or descriptively.
**Why:** Subjective qualifiers vary wildly between people. Explicit scales enable consistent assessment and comparison.
**Test:** Can two different people use your scale and arrive at similar assessments?

**Rule:** Capture complete sensory profiles, not single descriptors — note multiple dimensions (aroma, flavor, texture, finish for food/drink; timbre, sustain, attack for sound).
**Why:** Single descriptors ("fruity", "bright") are meaningless in isolation. Multi-dimensional profiles create meaningful comparison and enable precise retrieval.
**Test:** Does each sensory note include 3+ dimensions of description?

**Rule:** For visual/aesthetic knowledge domains (photography, cinematography, painting, design), tag notes with `visual-aspect:` to distinguish technical (measurable), compositional (principle-based), and aesthetic (judgment-based) knowledge.
**Why:** Visual literacy requires distinguishing what can be objectively measured (exposure, focus) from documented principles (rule of thirds, leading lines) from subjective aesthetic judgment (mood, emotion, "it just works"). Each requires different capture strategies.
**Test:** Pick 10 notes in a visual domain. Can you categorize each as technical, compositional, or aesthetic? Do aesthetic notes include reference examples (positive and negative)?
**Edge case:** Technical visual knowledge (exposure triangle, color theory fundamentals) is objectively testable. Compositional principles have documented rules but also "when to break them" cases. Aesthetic judgment is inherently subjective — use `claim-type: subjective` and `consensus:` markers.
**Edge case:** Visual trends are temporal — tag with `trend-status: current|declining|historical|cyclical` to distinguish enduring principles from passing trends.

**Rule:** Include reference examples for visual concepts — document both positive and negative examples to illustrate what "works" and what doesn't.
**Why:** Visual literacy is perceptual — readers must SEE to evaluate. A note about "strong leading lines" is incomplete without examples showing lines that lead effectively vs. lines that lead nowhere.
**Test:** For 5 visual principle notes, can you identify: (1) what the principle is, (2) a positive example, (3) a negative example? Are examples linked or described in sufficient detail?
**Edge case:** Reference images may be external links — verify links periodically and use archive.org fallback.
**Edge case:** Some visual concepts are universal (contrast, balance); others are genre-specific (shallow depth for portraits, deep focus for landscapes). Tag genre applicability.

**Rule:** Distinguish emotional knowledge from informational knowledge — tag notes with significant emotional/sentimental value using `emotional-value:` frontmatter.
**Why:** Knowledge that derives value from personal connection (family recipes, memory-anchored facts, heritage traditions) serves different purposes than neutral information. Without tagging, emotional knowledge risks being treated as deletable clutter or deprecated without consideration.
**Test:** For notes with personal significance (family, heritage, memories): (1) Does it have `emotional-value:` tag? (2) Are sentimental anchors (people, places, objects) documented? (3) Would removing this note lose something beyond mere information?
**Edge case:** Emotional knowledge is distinct from tacit knowledge — tacit knowledge CANNOT be fully articulated, emotional knowledge CAN but its value includes the emotional context. Don't confuse the two.

**Rule:** Separate integral emotional content from incidental emotional flavor — keep them together only when removing context changes the knowledge's nature.
**Why:** Some emotional context is essential (grandmother's recipe story IS the recipe), some is incidental (a fact happens to remind you of a memory). Treating all emotional content as essential creates bloat; treating it all as optional loses meaning.
**Test:** For a note with emotional content: (1) Would removing the emotional context change what the knowledge IS? (2) Is the emotional component referenced by other notes? Keep together if yes to 1; optional if no.

**Rule:** Capture domain-specific tacit prerequisites explicitly — tag knowledge requiring prerequisite skills that cannot be fully captured in text with `prerequisite-type: tacit` and document what the tacit skill involves.
**Why:** AI agents need to know when knowledge cannot be fully captured in text and must be supplemented with practice, feedback, or multimedia. Domains like music (ear training), medicine (visual diagnosis), and sports (muscle memory) require skills that precede and enable domain knowledge.
**Test:** For a domain with known tacit prerequisites: (1) Does the vault acknowledge which skills are tacit? (2) Are there proxies or training guidance for developing tacit skills? (3) Is there explicit acknowledgment of what cannot be learned from text alone?

**Rule:** Capture canonical domain structures explicitly — for domains with established structural templates (forms, frameworks, standard architectures), create canonical structure notes that define the template and link to examples.
**Why:** Practitioners expect to find canonical structures; AI agents need to know what "standard" looks like in the domain. Music (sonata form, rondo), law (legal doctrines), and software (design patterns) all have recognized templates.
**Test:** In a domain with canonical structures: (1) Can you identify the standard forms/frameworks? (2) Are there notes defining each canonical structure? (3) Do example notes link to their structural template?

**Rule:** Handle shared affective responses distinctly from subjective opinion — for domains where emotional/affective responses are relatively consistent across practitioners (music, art, design), use `interpretive-type: shared-affect` with consensus levels.
**Why:** Unlike purely subjective opinion, shared affective responses represent transferable knowledge about how humans respond to stimuli. Distinguishing "personal taste" from "commonly felt response" enables appropriate confidence levels and helps users understand applicability.
**Test:** For notes containing emotional/affective claims: (1) Is there a distinction between personal taste and shared response? (2) Is `consensus:` tagged for affective claims? (3) Can users distinguish "I prefer this" from "this is generally perceived as X"?

**Rule:** Categorize knowledge by learning mode — use explicit `learning-mode:` frontmatter to distinguish text-sufficient, text-helps-practice, practice-required, and teacher-required knowledge.
**Why:** Readers and AI agents need to know upfront whether reading a note is sufficient or real-world practice/teaching is mandatory. False promises waste time and may cause harm.
**Test:** For notes in experiential domains: (1) Can you identify what learning mode applies? (2) Do notes requiring practice clearly signal this? (3) Do notes requiring teachers recommend where to find instruction?

**Rule:** Set capture limits for embodied domains — in knowledge areas where text is fundamentally insufficient, cap capture at "enough to know you need hands-on learning" rather than comprehensive coverage.
**Why:** Attempting to fully capture embodied knowledge produces false confidence. Better to acknowledge the limit and guide toward practice.
**Test:** For notes in embodied domains: (1) Does the note avoid claiming to teach more than awareness? (2) Does it guide toward practice opportunities? (3) Does it avoid false comprehensiveness?

**Rule:** Verify embodied knowledge through performance, not recall — for knowledge marked `learning-mode: practice-required` or beyond, verification must be through practical demonstration.
**Why:** Someone can describe a clinical examination perfectly yet perform it incorrectly. Text-based verification creates false confidence in embodied domains.
**Test:** In embodied domains: Can verification be performed through practice? If yes, is text-based verification marked insufficient?

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

**Rule:** Identify analysis-sensitive knowledge — domains where full explanation reduces or eliminates the knowledge's effectiveness.
**Why:** Some knowledge domains have an inherent paradox: the moment you fully explain WHY something works, it stops working. Humor relies on surprise (explaining the joke kills it); mystery relies on the unknown (explaining the trick ruins it); aesthetic appreciation can be diminished by over-analysis; some forms of persuasion lose effectiveness when the mechanism is exposed. This is distinct from tacit knowledge (which CAN'T be fully articulated) — analysis-sensitive knowledge CAN be articulated, but doing so destroys its value.
**Test:** For knowledge in creative, comedic, persuasive, or mystery domains: (1) Does full explanation reduce effectiveness? (2) Is there a known "explanation threshold" beyond which value is lost? (3) Can you capture principles without specific examples that would ruin surprises?
**Edge case:** This is NOT the same as tacit knowledge — tacit knowledge resists articulation, analysis-sensitive knowledge loses value when fully articulated. A joke CAN be explained (unlike tacit "feel"), but explaining it kills the humor.

**Rule:** For analysis-sensitive knowledge, use separation structure — capture principles separately from specific instances.
**Why:** The principle behind a joke can be learned without ruining specific jokes. The technique for creating mystery can be taught without revealing specific mysteries. Separation enables learning without spoiling.
**Test:** Can you extract the transferable principle from specific instances without destroying the instances' value?
**Structure:**
```yaml
analysis-sensitivity: high
# Separate into:
# - [[Principle Note]] - captures the mechanism/pattern
# - [[Example Note]] - contains specific instances
# Link between them, but don't inline examples in principle notes
```

**Rule:** Tag analysis-sensitive notes with `analysis-sensitivity:` frontmatter indicating the level of risk.
**Why:** Not all knowledge in sensitive domains is equally sensitive. A joke's punchline is maximally sensitive; the general principle of incongruity is moderately sensitive; the existence of comedy as a communication tool is not sensitive at all.
**Test:** Can you categorize notes by how much value is lost when fully explained?
**Values:**
- `analysis-sensitivity: none` - Explaining doesn't reduce value
- `analysis-sensitivity: low` - Some nuance lost but core value preserved
- `analysis-sensitivity: medium` - Significant value lost, use separation structure
- `analysis-sensitivity: high` - Full explanation destroys value, capture principles only

**Rule:** For humor/comedy knowledge specifically, separate comedic principles from joke instances.
**Why:** Documenting why something is funny (incongruity, timing, subversion) can be done without ruining specific jokes. But the moment you explain WHY a specific joke works, the surprise is lost.
**Test:** Can you create a note explaining comedic principles that remains valuable without including the specific jokes that demonstrate those principles?
**Structure:**
```yaml
knowledge-type: comedy-principle
analysis-sensitivity: medium
# Note contains: principles, techniques, theory
# Links to: joke examples (separate notes)
# Does NOT include: specific punchlines inline
```

**Rule:** For mystery/suspense knowledge, separate the mechanism from the execution.
**Why:** The technique for building suspense (foreshadowing, misdirection, pacing) can be taught. The specific execution (plot twists, reveals) cannot be spoiled without losing value.
**Test:** Can you separate "how suspense works" from "what happens in this story"?
**Structure:**
```yaml
knowledge-type: suspense-technique
spoiler-warning: true
# Capture technique without specific plot details
# Link to analysis notes that can discuss execution
```

**Rule:** Use "spoiler tags" for analysis-sensitive content — allow readers to choose whether to see explanation.
**Why:** Some readers want to understand the mechanism, others want to experience the original without analysis. Providing both preserves value for both audiences.
**Test:** Can readers choose to learn the technique without seeing specific examples that would be spoiled?
**Implementation:** Use `spoiler-content:` sections that can be hidden, or separate notes with clear warnings:
```markdown
## Technique (spoiler-free)
[explanation of how this works]

## Examples (WARNING: contains spoilers)
[[Link to specific instances that demonstrate the technique]]
```

See also: [[Frontier Exploration - Humor and Comedy Knowledge]] — Extended exploration of capturing comedy principles without killing humor

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

**Rule:** Include retrieval guidance in vault onboarding — explain query patterns beyond navigation.
**Why:** A perfectly structured vault is useless if users can't find relevant knowledge for their specific question. Onboarding should cover how to formulate queries, not just how the graph is structured.
**Test:** Can a new user find answers to 3 random questions within 5 minutes using query strategies? Can they explain their retrieval strategy?

**Rule:** Tag notes with `decision-relevance:` indicating which decision types the note informs.
**Why:** Not all notes are equally relevant to decision-making. Tagging enables efficient retrieval when facing specific decisions.
**Test:** For notes containing actionable knowledge: (1) Is there `decision-relevance:` frontmatter? (2) Does it cover major decision categories the vault addresses?

**Rule:** For major decisions, include `framework-selection` metadata documenting which decision frameworks were considered and why the chosen framework fits the decision characteristics.
**Why:** Different decision frameworks (first principles, cost-benefit, satisficing, reversibility-based) apply to different decision types. Without explicit framework selection, it's impossible to review whether the right approach was used or to learn from past decisions.
**Test:** For major decisions documented in the vault: (1) Is there framework-selection metadata? (2) Does it list alternatives considered? (3) Does it explain why the chosen framework fits the decision characteristics (reversibility, stakes, time available, expertise)? (4) Is there post-decision review of framework appropriateness?

**Rule:** Provide explicit conflict-resolution guidance when vault notes contradict each other.
**Why:** Well-maintained vaults accumulate multiple perspectives over time. When notes conflict, users need guidance on how to resolve or weigh them.
**Test:** For notes on contested topics: (1) Is there explicit conflict-resolution guidance? (2) Are the competing perspectives each linked to their source/authority? (3) Is there guidance on which to prefer for different contexts?

**Rule (NEW - 2026-03-28):** Document reasoning traces for complex queries — capture the step-by-step path from question to answer, including consulted notes, weighting rationale, confidence at each step, and identified gaps.
**Why:** Without reasoning traces, users cannot verify AI logic, audit conclusions, or improve the vault based on reasoning failures. The Seed covers reasoning strategies but not the explicit documentation of reasoning execution. This gap matters especially when AI assists decision-making — users need to see how conclusions were reached.
**Test:** For a complex query (3+ notes consulted): (1) Can you generate a reasoning trace showing the path from question to answer? (2) Does the trace include consulted notes, weighting rationale, confidence at each step, and any gaps identified? (3) Can a user follow the trace to verify or replicate the reasoning? (4) Does the trace identify specific vault gaps that caused reasoning failures?
**Implementation:** Reasoning traces should include: query decomposition (sub-questions), traversal path (each note consulted with relevance score, confidence, and role), synthesis rationale (how sources were combined), gaps identified, and final confidence. Default: ephemeral (discard after response). Optional: session-based or permanent storage for audit.

**Rule (NEW - 2026-04-05):** Before discarding ephemeral reasoning traces, extract reusable insights — identify session-specific content vs transferable knowledge and link extracted insights to permanent notes.
**Why:** The "default: ephemeral" rule commits to discarding but provides no extraction mechanism. Without explicit extraction guidance, valuable meta-knowledge about reasoning strategies is lost, and there's no mechanism to improve the vault based on reasoning failures.
**Test:** For a reasoning trace marked "ephemeral": (1) Can you apply criteria to identify reusable content? (2) Is there a documented extraction process? (3) Do extracted insights become notes or get linked to existing notes? (4) Can you identify what's session-specific (user context, query details) vs transferable?
**Implementation:**
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

**Rule:** Apply sensitivity classification to knowledge with potential for harm — use `sensitivity-level`, `sensitivity-reason`, `capture-justification`, and `mitigation-strategy` frontmatter.
**Why:** Unclassified sensitive knowledge creates uncontrolled risk. Without explicit classification, sensitive knowledge looks identical to regular knowledge and gets treated the same (shared, exported, etc.). Sensitive knowledge requires different handling for verification, access control, and export.
**Test:** For knowledge that could cause harm if misused: (1) Is sensitivity-level specified? (2) Is sensitivity-reason documented? (3) Is capture-justification recorded? (4) Is mitigation-strategy defined? (5) Are appropriate access restrictions applied?
**Values:**
- `sensitivity-level: none | low | medium | high | extreme`
- `sensitivity-reason: dual-use | harmful-content | personally-identifiable | misuse-potential | legal-risk`
- `access-restriction: none | vault-internal | human-only | encrypted | never-publish`

**Rule:** For dual-use knowledge (knowledge that can be used for both benefit and harm), capture the defense, analysis, and context — not the attack, substance, or methods.
**Why:** Security vulnerabilities, dangerous procedures, and manipulation techniques have value for defense and understanding, but detailed harmful content enables misuse. Capturing lessons, defenses, and analysis enables benefit while minimizing weaponization risk.
**Test:** For dual-use notes: (1) Does the note focus on defense/analysis/context? (2) Does it avoid detailed harmful content? (3) Can someone use this for legitimate protection without getting harm instructions?

**Rule:** Apply the "necessity test" before capturing extreme-sensitivity knowledge — require demonstrated need, less-sensitive alternatives, essential verification, minimization, and mitigation capability.
**Why:** Extreme-sensitivity knowledge (weapons manufacturing, detailed harmful content) carries severe risks. The default should be exclusion; capture only when benefits clearly outweigh risks and safeguards exist.
**Test:** For sensitivity-level: extreme notes: (1) Is there documented need? (2) Can less-sensitive alternatives work? (3) Has second opinion verified necessity? (4) Can exposure be minimized? (5) Is there mitigation capability?

**Rule:** Sensitive knowledge requires MORE verification, not less — high-sensitivity errors cause more harm than regular errors.
**Why:** A security vulnerability documented incorrectly could lead to actual exploits. Medical errors could cause harm. The stakes are higher for sensitive knowledge, so verification standards should be stricter.
**Test:** For high and extreme sensitivity notes: (1) Is verification status: verified? (2) Are sources authoritative? (3) Has review occurred more recently than general notes?

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

**Rule (NEW - 2026-04-07):** For domains requiring differential reasoning (diagnosis, troubleshooting, decision analysis), structure knowledge as explicit option sets with shared evaluation criteria rather than as separate, unconnected notes.

**Why:** Differential reasoning requires comparing like with like. Without shared evaluation criteria, consumers face unorganized options. Structured differentials enable systematic comparison and reasoned selection. The Seed provides atomicity, linking, source evaluation — but doesn't address organizing competing alternatives as a cohesive reasoning structure.

**Test:** Can you identify a differential (3+ alternatives for single problem/question)? Do all alternatives reference common evaluation criteria? Can you explain the prioritization framework that's applied?

**Implementation:**
```yaml
differential-type: diagnostic|troubleshooting|decision|prognostic
prioritization-framework: likelihood|severity|cost|reversibility|time-urgency
common-criteria:
  - criterion: "likelihood"
    evaluation: "frequency in population/experience"
  - criterion: "severity"
    evaluation: "worst-case if missed"
  - criterion: "reversibility"
    evaluation: "ease of intervention"
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

**See also:** [[Frontier Exploration - Differential Knowledge Organization]] — Original gap documentation

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

- [[Seed Gap - Functional Threshold for Knowledge Bases]] — Missing: functional readiness test beyond structural metrics — when is a vault actually usable?
- [[Seed Gap - Multi-Vault Migration Knowledge]] — New gap: migration between vaults, platform transitions, and vault merging

- [[Frontier Exploration - Crisis and Emergency Response Knowledge]] — Handling time-critical, high-stakes knowledge requiring single-view retrieval and panic-optimized formatting
- [[Frontier Exploration - Legal Knowledge Base Gaps]] — Testing Seed rules against legal domain challenges: jurisdiction hierarchy, authority levels, legal information vs. advice boundary

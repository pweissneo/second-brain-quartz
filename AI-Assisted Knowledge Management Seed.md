---
protected: true
last-reviewed: 2026-03-14
last-updated: 2026-03-14
lifecycle: evergreen
confidence: high
author-type: ai-assisted
---
# AI-Assisted Knowledge Management Seed

> Drop this file into any vault to bootstrap a healthy, self-improving knowledge base.
> Every rule is testable by an AI agent — no human judgment required.
> Every rule is domain-agnostic — works for any topic.

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

**Rule:** Use flat file structure with wikilinks — no nested folders.
**Why:** Folders impose hierarchy that constrains discovery; links create organic, multi-dimensional structure.
**Test:** Are all notes in a single directory? Are connections made via `[[Wikilinks]]`, not folder paths?

**Rule:** Ignore generated files — never commit cache, logs, or build artifacts.
**Why:** Generated files bloat the repository and cause merge conflicts.
**Test:** Does `.gitignore` exclude cache directories, logs, and build output?

**Rule:** Use consistent note naming — descriptive noun phrases, title case, kebab-case for filenames.
**Why:** Inconsistent naming hurts search accuracy and graph readability.
**Test:** Do note titles follow a consistent pattern? Can you predict a new note's title?
**Edge case:** Domain-specific abbreviations (MRI, ECG) are acceptable when they are standard terminology.

**Rule:** Distinguish conceptual notes from procedural content — atomicity applies to ideas, not to executable workflows.
**Why:** Recipes, code samples, and technical specs must stay together for usability, even when >300 words. Splitting them breaks the workflow.
**Test:** For notes >300 words: (1) Is this an executable procedure? (2) Would splitting make it harder to use? (3) Are parts independently reusable? Keep together if yes to 1-2; split if yes to 3.

**Rule:** Prioritize foundational concepts before applications when bootstrapping a new vault.
**Why:** Without prioritization guidance, agents face analysis paralysis. Foundations (prerequisites, core terminology, high-connectivity nodes) should exist before specialized content.
**Test:** Can you identify 5+ foundational notes that other notes depend on? Are they created early in the vault's history?

**Rule:** Balance exploration (adding new topics) and exploitation (deepening existing ones) based on vault maturity — new vaults favor exploration (70/30), mature vaults favor exploitation (80/20).
**Why:** Pure exploration creates shallow vaults with many thin topics; pure exploitation creates stagnant vaults that miss valuable new domains. Explicit balance ensures both breadth and depth grow healthily.
**Test:** Can you categorize your recent capture activity as primarily exploration or exploitation? Is the ratio appropriate for your vault's maturity (new <50 notes = exploration, mature >200 notes = exploitation)?

**Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility (improves vault answers), connection (links to 2+ existing naturally), uniqueness (adds new knowledge), effort (maintenance worth value).
**Why:** Notes that don't improve utility, can't connect naturally, duplicate existing content, or require high maintenance for low value bloat the vault without adding proportional value.
**Test:** For the last 5 notes added to a mature topic: Do 3+ pass all four tests?
**Edge case:** In domains where knowledge is highly subjective (art criticism, aesthetic evaluation, creative domains), "utility" is context-dependent and hard to measure objectively. A note about "moody desaturated look" in photography has high utility for some users and none for others. For subjective domains, apply the test to connection + uniqueness + effort only; use "applicability-scope" (who is this for?) as a proxy for utility. Alternatively, use domain-appropriate utility criteria specific to the domain's goals.

**Rule:** Set explicit priority signals for capture — prioritize in order: (1) blocking knowledge (prerequisites for understanding other notes), (2) high-utility knowledge (frequently needed), (3) gap knowledge (fills holes in connected areas), (4) curiosity knowledge (interesting but optional).
**Why:** Without explicit priorities, capture defaults to ease or recency rather than vault needs. Explicit signals ensure capture effort aligns with vault health.
**Test:** Can you rank your next 5 potential captures by priority signal? Does the ranking match your actual capture order?

**Rule:** Apply the 5:1 personal-to-general knowledge ratio — capture insights, decisions, and experiences (personal) over restatable facts (general).
**Why:** Personal knowledge compounds and provides unique value no web search can match. General knowledge takes maintenance effort but offers little unique value.
**Test:** Pick 10 recent notes. For each: (1) Could a web search replace this note in <30 seconds? (2) Does it contain original insight, decision, or experience? Ratio should be 5:1 personal to general.
**Edge case:** General knowledge is acceptable when: frequently referenced (saves lookup time), synthesized with personal analysis, or domain-specific enough to be hard to find.

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

**Rule:** Define explicit vault boundaries — categorize what you keep (core knowledge), what you tolerate (operational), and what you exclude (ephemeral).
**Why:** Without boundaries, the vault accumulates noise, search quality degrades, and the "second brain" becomes a dumping ground. Explicit boundaries enable intentional curation.
**Test:** Can you list: (1) What types of notes are always kept? (2) What types are reviewed and either integrated or deleted? (3) What types are never added? If you can't answer these, the boundary is undefined.

**Rule:** Use a staging area (inbox) for uncategorized captures — process within 48 hours or explicitly defer with a review date.
**Why:** Capture first, process second is good advice, but "process" must have a deadline. Unprocessed captures become permanent clutter.
**Test:** Does an inbox exist? Are there notes older than 48 hours that aren't marked for later review?

**Rule:** Separate operational knowledge from synthesized knowledge — project notes, meeting notes, and task lists should either be time-boxed (auto-deprecate) or clearly marked as temporary.
**Why:** Operational debris looks like knowledge but isn't. It clutters searches and misleads about the vault's actual contents.
**Test:** Pick 10 random notes. Can you categorize each as: (a) permanent knowledge, (b) time-boxed operational, or (c) should be deleted?

**Rule:** Evaluate multi-vault architecture when vaults exceed 200 notes — consider splitting when purposes, audiences, or conventions diverge significantly.
**Why:** Beyond 200 notes, reorganization becomes expensive. It's cheaper to split early based on explicit criteria than migrate later. Different purposes, audiences, or required conventions signal that separate vaults may serve better than one mega-vault.
**Test:** If vault exceeds 200 notes: (1) Can you state a single unified purpose? (2) Do all notes serve that purpose? (3) Are there domains that require different conventions? (4) Do different audiences need different structures? Split if yes to 3-4; reconsider if no to 1-2.

**Rule:** Use cross-vault links sparingly — if >1% of links cross vaults, consider merging or clarifying boundaries.
**Why:** Cross-vault links are harder to maintain, don't benefit from shared conventions, and often signal unclear vault boundaries. Most knowledge should live in one vault.
**Test:** Calculate cross-vault links / total links. Is it under 1%?

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

See also: [[Frontier Exploration - Knowledge Domain Completeness]] for detailed guidance on assessing domain coverage.

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
**Edge case:** Comprehensive principle/explanation notes that cover multiple related sub-points in a coherent framework (e.g., "Note Lifecycle Management" covering stages, deprecation criteria, and archival guidelines) may exceed 300 words when splitting would reduce explanatory coherence. Apply the atomicity test first: does the note explore one theme comprehensively, or does it bundle unrelated ideas?
**Edge case:** Educational/explanatory content that requires depth for comprehension (e.g., explaining the science behind a technique, comprehensive topic overviews, comparative analyses of variations within one category) may legitimately exceed 300 words. The test: (1) Can this note be summarized in one sentence capturing its core purpose? (2) Would splitting lose essential synthesis or context? (3) Is this one coherent topic being explored comprehensively? Keep together if yes to any.
**Test for procedural content:** For notes >300 words that are procedures: (1) Does the user need to execute this linearly from start to finish? (2) Would splitting make it harder to use? (3) Are the parts independently reusable? Keep together if yes to 1-2; split only if yes to 3.
**AI agent guidance:** When uncertain about procedural content, prefer keeping notes together. Split only when: (a) parts are genuinely reusable in other contexts, AND (b) the note exceeds 1000 words. For recipes, code tutorials, and technical specs: err on the side of keeping together.

**Edge case:** Complete short procedural content (under 100 words) is valid when the procedure can be executed from the note alone — all necessary information (ingredients, steps, timing) is present and no essential components are omitted. The test: Can you execute this note's procedure without additional information? If yes, it's complete regardless of word count. This applies to complete short recipes, quick reference guides, and condensed how-to notes that are self-contained but concise.
**Edge case:** Notes under 50 words must either be explicitly marked as stubs (with `status: stub` or `todo: true`) or must provide sufficient substance to stand alone.
**Why:** Thin notes without markers waste graph space and mislead — they appear complete but contain no real knowledge. Stubs signal intentional incompleteness; unmarkedly thin notes are quality failures.
**Test:** Count words in notes under 50 words. Does each have a stub marker OR contain a complete definition/explanation that could stand alone?
**Edge case:** Hub notes (pure navigation) under 200 words are acceptable. Redirect notes are acceptable. All other notes under 50 words need expansion or a stub marker.
**Edge case:** Domain unit concepts — standard notation elements, measurement units, or definition-atomic concepts — may legitimately fall below 100 words. Examples: musical dynamics (piano, forte), SI units (meter, kilogram), mathematical axioms, chemical elements. These are not stubs; their brevity is inherent to their nature. Verify: (1) Is this a standard unit/notation element of the domain? (2) Would expanding it add meaning, or just padding?

**Edge case:** Single creative works (compositions, books, paintings, films) may legitimately exceed 300 words when comprehensively analyzing that specific work. The test: (1) Is this note primarily about one specific work? (2) Is the work referenced by multiple other notes? (3) Would splitting lose essential context that benefits from being unified? Keep together if yes to 2-3. Use "overview + linked deep-dives" pattern for major works with extensive analysis.

**Edge case:** Opposition-dependent concepts — some concepts only exist in opposition to another concept and require the pair to be understood. Examples: materialism/idealism, determinism/free will, empiricism/rationalism. Create bidirectional pairs; neither note is complete alone. The test: (1) Does this concept require defining its opposite to be understood? (2) Do both concepts reference each other? Create pairs with bidirectional links.

**Edge case:** Argument structures — premises leading to a conclusion are valid atomic units even when referencing multiple concepts. The argument itself is the atomic unit; individual premises may be separate notes for reuse. The test: (1) Is this a single inferential structure? (2) Does splitting break the logical flow? Keep together if yes; link to component premises.

**Edge case:** Contested concepts with no consensus — concepts that have 3+ major competing accounts cannot have a single "definition." Use perspectives structure with sections for each major view. Examples: consciousness, free will, meaning of life. The test: (1) Do experts fundamentally disagree on what this IS? (2) Are there 3+ major competing theories? Use perspectives structure, not single definition.

**Rule:** When splitting a note, create bidirectional links between the parts and rewire all incoming links.
**Why:** Splitting without rewiring breaks navigation paths and orphans content.
**Test:** After a split, do both new notes link to each other? Do all previous incoming links point to the correct part?

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
**Test:** Pick 5 notes that could serve multiple purposes. Can you identify: (1) Is the core knowledge the same across purposes? (2) Would splitting improve clarity? (3) Is there a hub pattern that preserves atomicity while serving multiple contexts?

**Rule:** Distinguish context frames from expertise levels — frame is about purpose, level is about complexity.
**Why:** A beginner can have a professional purpose (junior developer reading architecture docs). Conflating frame with level loses important distinction.
**Test:** For a note tagged with expertise-level AND context-frame: Can you explain why both are needed? Does changing one without the other make sense?

---

## 3. Linking

*Meaningful connections between notes.*

**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true` OR be tagged with `specialized: true`.
**Why:** Unlinked notes are invisible in the graph — they cannot be discovered through navigation. Foundational elements are a special case that should be explicitly marked, not manually verified each time. Specialized instruments and domain-specific tools may legitimately have only one natural link when used in a single specific context.
**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag AND lacks the `specialized: true` tag.
**Edge case:** Deprecated redirect notes (notes whose only purpose is to point to a replacement) may link to only the replacement note. All other notes must have at least 2 links unless tagged `foundational: true`.
**Edge case:** Foundational elements (core ingredients in cooking like salt/oil/water, basic utilities in software, fundamental concepts in any domain) may legitimately have fewer than 2 natural links — forcing connections creates decorative links that hurt more than help. Tag these notes with `foundational: true` rather than forcing artificial links. The test: (1) Is this a true domain primitive that everything else references? (2) Would added links improve navigation or just inflate the graph? If yes to both, add `foundational: true` tag.
**Edge case:** Domain-specific instruments, tools, or assessment scales (clinical assessment tools like pain scales, specific equipment in technical domains, specialized instruments) may legitimately have only 1 natural link when they are specific to one procedure or use case. Forcing a second link creates decorative connections. The test: (1) Is this note about a specific instrument/tool used in exactly one context? (2) Does adding a second link serve navigation or just meet a quota? If yes to 1-2, allow single link or tag with `specialized: true`.
**Edge case:** Single-term definitions (abbreviations, codes, standard identifiers) may legitimately have zero outgoing links when the note exists purely as a reference lookup. Examples: medical abbreviations (BP, CPR), drug names in a pharmacopoeia, chemical element symbols, standard error codes. The test: (1) Is this note primarily a lookup reference for a term that is used elsewhere? (2) Does the term get referenced via backlinks from content notes rather than being a navigation hub? If yes to both, allow zero links with tag `type: reference`.

**Rule:** Every link must be explainable in one sentence — no decorative or keyword-match links.
**Why:** Meaningless links inflate the graph without adding navigational or conceptual value.
**Test:** For each link in a note, can you state why the reader should follow it? Remove any link where you cannot.
**Edge case:** Domain-specific citation links (legal statutes, academic references, technical specifications) may serve authority rather than navigation — "This statement is supported by [[15 U.S.C. § 78j(b)]]" is explainable as establishing legal authority, even if readers wouldn't follow it for learning.
**Edge case:** Hierarchical references (statutes referencing other statutes, regulations referencing statutes) are explainable — "This regulation implements Section 10(b)" explains the relationship.
**Edge case:** Terminology chains where defining terms link to their components may be circular — "A [[proxy]] is someone who acts as a [[proxy]]" is tautological. Test: Can you explain the connection without repeating the term?
**Edge case:** Links to umbrella/broad terms (e.g., linking "contract law" to "Contract Law") may be too vague. Prefer linking to specific concepts the note actually discusses.
**Edge case:** Precedent chains (case A established X, refined in case B) are explainable when each link clarifies HOW the later case modified the earlier principle.

**Rule:** Use diverse link types — relevance, contrast, analogy, cause/effect, category membership.
**Why:** Homogeneous links create a flat graph; diverse connection types enable richer traversal and insight.
**Test:** Categorize links in a random sample of 5 notes. Are at least 3 different link types represented across the sample?

**Rule:** Prefer linking to existing notes over creating new ones — search before you create.
**Why:** Duplicate notes fragment knowledge; linking to existing notes strengthens the graph.
**Test:** Before creating a note, search the vault. Does a note covering this idea already exist?

**Rule:** Use tags for broad categorization and filtering; use links for essential relationships and navigation.
**Why:** Tags and links serve different purposes — tags enable faceted search across independent dimensions, links create navigable graph structure. Conflating them loses both benefits.
**Test:** Can you explain why each tag represents a category (not a specific relationship)? Can you explain why each link represents an essential connection (not just categorical membership)?
**Edge case:** When a category IS also a note in the vault (e.g., "Herbs" exists as a hub note), prefer linking to that note rather than adding a tag. Tags work best when filtering is needed AND no note exists for the category. Example: Use a link to Hardiness Zone 7 when the hub note exists; use #hardiness-zone-7 tag only when no hub note exists.

**Rule:** A note should rarely need more than 5 tags; it should link to as many notes as meaningful connections require.
**Why:** Tags represent facets — too many dilute meaning. Links represent relationships — the right number depends on the note's connectivity.
**Test:** Count tags on 10 random notes. Are most under 5? Do links exceed tags in quantity for well-connected notes?

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

---

## 5. Quality Maintenance

*Keeping the vault healthy over time.*

**Rule:** Every note should have a `last-reviewed` date, updated on each review.
**Why:** Without review tracking, stale notes accumulate undetected.
**Test:** Do all notes have a `last-reviewed` field? Flag notes not reviewed in the last 30 days.
**Edge case:** Use `review-interval` frontmatter for knowledge with different decay rates. Static knowledge (historical facts from ancient periods, mathematical proofs, canonical works, foundational definitions) doesn't need monthly review — use `review-interval: historical` or `review-interval: never` to avoid false positives. The test becomes: Flag notes where days-since-review exceeds their specified review-interval (default 30 days). Domain-specific intervals: ancient history (historical), mathematics (never), classical literature (historical), reference material (180d), general knowledge (30d).

**Rule:** Never delete notes — deprecate them with a marker and a pointer to the replacement.
**Why:** Deletion breaks incoming links silently; deprecation preserves the graph while signaling staleness.
**Test:** Search for broken wikilinks. Are there any dead references? If yes, a deletion happened without cleanup.

**Rule:** Terminology must be consistent across the vault — pick one term per concept and use it everywhere.
**Why:** Inconsistent terminology fragments search results and confuses navigation.
**Test:** Search for synonym pairs (e.g., "note"/"node", "link"/"connection"). Does the vault use one term consistently?
**Edge case:** Distinct terms that seem like synonyms actually refer to different things — e.g., "sauté" vs "pan-fry" vs "stir-fry" are different techniques; "stock" vs "broth" differ by bone/meat and simmer time; "bell pepper" vs "capsicum" are regional variants of the same vegetable. The test: (1) Do the terms refer to genuinely different techniques/ingredients? (2) Are both regional variants valid and useful? If yes to either, allow both with appropriate context (e.g., note the regional variant in parentheses).
**Edge case:** Technical vs common terminology — different audiences may need different terms (e.g., "fond" for experts, "brown bits" for beginners). Consider creating a definition note linking both terms.
**Edge case:** Historical or classical terms — classical cuisine uses French terms (julienne, mise en place) that may need plain-language equivalents. Document both with a redirect if needed.

**Rule:** Run structural health checks regularly — orphan scan, broken link scan, hub distribution, oversized note scan.
**Why:** Problems accumulate silently; periodic scans catch issues before they compound.
**Test:** Can you run these 4 scans right now? Do they all pass?

**Rule:** Track retrieval patterns to understand actual knowledge usage — capture search queries, access frequency, and retrieval success.
**Why:** A knowledge base's value is proven through retrieval, not storage. Without tracking retrieval patterns, capture decisions lack evidence. Failed searches reveal gaps; frequent access reveals value.
**Test:** Can you list your top 10 retrieval queries? Do they align with your highest-quality notes? Do failed searches drive capture decisions?
**Implementation:** Use retrieval logging: query terms, whether results were found, which notes were accessed, whether retrieved knowledge was sufficient. Review monthly to align capture priorities with actual usage.

See also: [[Frontier Exploration - Knowledge Retrieval Patterns and Usage Tracking]] for implementation strategies.

**Rule:** No note should have zero backlinks — every note should be linked to from at least one other note.
**Why:** Notes with no incoming links are invisible in the graph and cannot be discovered through navigation. They represent knowledge that exists but isn't connected to the broader structure.
**Test:** Run a backlink scan. Flag any note with 0 backlinks. For each orphan: (1) Should it be linked from a related note? (2) Should it be listed in a hub or index? (3) Is it truly standalone (like the Seed itself)? Keep orphaned only if yes to 3.
**Edge case:** The Seed file itself may legitimately have zero backlinks as the root reference — but all other notes should be reachable from it.
**Edge case:** Universal/primitive elements in a domain (salt, oil, water in cooking; variables in programming; basic measurements) may legitimately have zero backlinks. These are foundational primitives that everything else references but don't naturally link to. Verify: (1) Is this a domain primitive that others depend on but doesn't depend on others? (2) Is it referenced indirectly (e.g., salt in every recipe but not wikilinked)? (3) Would adding links be decorative rather than navigational? Allow zero backlinks if yes to any.

**Rule:** Every note must use consistent formatting — same heading style, same link syntax, same frontmatter fields.
**Why:** Inconsistent formatting breaks tooling and makes automated processing unreliable.
**Test:** Sample 10 random notes. Do they all use the same heading levels, link format, and frontmatter structure?

**Rule:** Notes partially or fully generated by AI must include `author-type` frontmatter indicating provenance.
**Why:** As AI assistants help build knowledge bases, content provenance matters for reliability assessment. Readers need to know whether a note was human-written, AI-assisted, or AI-generated-first-pass.
**Test:** Can you identify the author-type for each note? Are AI-generated notes marked appropriately?
**Edge case:** AI improving existing human-written notes should track changes differently than fully AI-generated notes. Use `author-type: collaborative` for mixed provenance.

**Rule:** For AI-generated content in unfamiliar domains, include `domain-familiarity` frontmatter indicating assessed familiarity level.
**Why:** When AI helps build knowledge bases in domains it doesn't understand well, content quality risks decline. Explicit familiarity markers help readers assess reliability and know when human expert review is needed.
**Test:** Can you identify which notes were generated in familiar vs. unfamiliar domains? Do unfamiliar-domain notes carry appropriate uncertainty markers?
**Implementation:** Use `domain-familiarity: assessed` (AI has verified understanding), `domain-familiarity: learning` (AI is learning), or `domain-familiarity: unknown` (domain is unfamiliar).
**Edge case:** In high-stakes domains (medical, legal, financial), require explicit human expert verification regardless of AI familiarity. Use `verification-required: human-expert` for safety-critical content.

See also: [[Frontier Exploration - Building Knowledge Bases in Unfamiliar Domains]] for strategies when the AI doesn't understand the topic.

**Rule:** AI-generated content must have at least one spot-verified source before marking as verified.
**Why:** AI can hallucinate citations that appear real. Spot-verification (opening the URL, confirming the claim exists) prevents false attribution.
**Test:** For notes marked AI-generated, can you verify at least one source is real and accurately cited?

**Rule:** AI-generated content should default to `confidence: emerging` unless verified by a human.
**Why:** AI confidence is not calibrated to human reliability standards. A confident AI hallucination is more dangerous than AI uncertainty.
**Test:** Do AI-generated notes show appropriate confidence levels? Are they marked "high" confidence without human verification?

**Rule:** For interpretive knowledge (judgment, taste, evaluation), notes must clearly identify the perspective/framework being applied.
**Why:** Interpretive knowledge is inherently perspective-dependent. Without explicit perspective-tagging, readers and AI agents cannot distinguish subjective judgment from objective fact.
**Test:** For notes containing evaluative judgments: (1) Is there an `interpretive-type:` field? (2) Does the note specify what framework or perspective the judgment comes from? (3) Are alternative interpretations acknowledged?
**Edge case:** Personal taste notes should be tagged `interpretive-type: personal-opinion` with `confidence: subjective`. Professional consensus should note "generally regarded as..." with source.

**Edge case:** Some interpretive knowledge has professional consensus (sommelier ratings, architectural awards). Mark these as "consensus" rather than purely subjective — the perspective is "professional community."

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

**Rule:** Add advisory validity tracking for prescriptive advice notes — include `advisory-validity-period:` specifying when the advice was accurate and `review-trigger:` for when to reassess.
**Why:** Advice that was sound can become unsound as conditions change. Without explicit validity periods, readers cannot distinguish current advice from historical guidance that may no longer apply. This is especially critical for high-stakes domains (finance, medical, legal) where outdated advice can cause real harm.
**Test:** For notes containing prescriptive advice (should/shouldn't, do/don't, recommended): (1) Is there an `advisory-validity-period:` or `valid-from:` date? (2) Is there a `review-trigger:` for when to re-assess? (3) Can readers determine if this advice is current?
**Edge case:** Evergreen advice (fundamental principles) doesn't need validity periods. Only apply to advice that could become outdated due to changed conditions.
**Implementation:** Use `advisory-validity-period: YYYY-MM to YYYY-MM` or `advisory-validity-period: conditional on [condition]` with `review-trigger: [when to reassess]`.

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
  - [[Note A]]
  - [[Note B]]
synthesis-method: How this was derived (induction, analogy, deduction)
derived-date: YYYY-MM-DD
```
**Edge case:** This is distinct from link relationships — links connect notes, while derived knowledge provenance tracks which specific notes contributed to a NEW synthesized insight. Hub notes that represent emergent clusters should document what unifies them.

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

**Rule:** For procedural content (recipes, code, tutorials, technical specs), include a verification-status field: `unverified` | `tested` | `community-validated`.
**Why:** Procedural content that hasn't been tested may cause harm (medical procedures, broken code) or waste time (recipes that don't work). Readers and AI agents need to know whether the steps have been verified.
**Test:** Pick 10 notes containing procedural content. Can you categorize each by verification status? Are any unmarked?
**Edge case:** Domain-standard procedures (well-known algorithms, classic recipes) may be marked as `community-validated` by virtue of widespread use. New or experimental procedures should be marked `unverified` until tested.
**Edge case:** AI agents cannot verify procedural content by execution - they should mark procedural notes as `unverified` unless source explicitly states testing was performed.

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

See also: [[Frontier Exploration - Ephemeral and Event-Based Knowledge]] for strategies on capturing transient knowledge.

**Rule:** Capture the framework for attending ephemeral events, not just the content — document what questions to ask, what to observe, what to do after.
**Why:** The permanent content (slides, recordings) exists and can be captured once; the unique value of attending live is the context, questions, and experience that won't recur. Prioritizing permanent content over experiential capture misses the point of attending.
**Test:** For notes about events attended: (1) Is there a permanent artifact (recording, slides) linked? (2) Is there unique experiential content (questions asked, insights gained, context captured)? (3) Is there guidance for future attendees?
**Edge case:** When no recording exists, prioritize capturing as much as possible but acknowledge incompleteness with `completeness: partial` and list what's permanently lost.

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

## Stress Tests
- [[Stress Test - Verification Status Rule in Home Repair]] — Testing verification-status in safety-critical home repair domain

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

**Rule:** For knowledge where applicability depends on user situational constraints (time, budget, equipment access, physical ability, social context), include explicit constraint scope in frontmatter or create constraint-specific hub notes.
**Why:** Expertise-level covers "what you know," but doesn't cover "what you can actually do given your situation." A beginner with 5 minutes needs different knowledge than a beginner with 2 hours. An expert with no oven needs different approaches than an expert with a fully equipped kitchen. Without constraint tracking, AI agents cannot determine which knowledge is relevant to a user's actual situation.
**Test:** Pick 10 notes in a domain with time/budget/equipment variation. Can you determine: (1) What constraints does this knowledge assume? (2) Are constraint assumptions explicit? (3) Could an AI filter this knowledge by user constraints?
**Edge case:** Create constraint-aware hub notes for common situations: "Quick Meals (Under 30 min)", "Budget Cooking (Under $10/day)", "No-Oven Recipes". These hubs aggregate approaches that work within specific constraints.
**Edge case:** Constraints differ from expertise-level: a time constraint affects what approach is valid regardless of skill level. A 5-minute recipe isn't "beginner" — it's "time-constrained."

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

**Rule:** For knowledge involving categorical transitions (thresholds), document the transition conditions explicitly — capture what signals a change from one state to another.
**Why:** Without threshold knowledge, AI agents cannot determine when a state transition has occurred. Advice that applies at one threshold may be wrong at another (skill acquisition stages, project health phases, relationship milestones). Explicit threshold documentation enables accurate state assessment.
**Test:** Pick 10 notes with categorical claims (always/never, stages, levels). Can you identify: (1) What threshold the claim depends on? (2) What indicators signal the threshold? (3) Is uncertainty about the boundary acknowledged?
**Edge case:** Some thresholds are gradual (transition happens over time, not at a point). Document the transition range.
**Edge case:** Some thresholds are contested (experts disagree on where the threshold lies). Present competing frameworks.
**Frontmatter:** Use `threshold-knowledge: true` with `threshold-type: gradual|discrete|contested`, `transition-indicators:`, and `uncertainty-band:`.

**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.
**Why:** Readers need to distinguish established facts from debated hypotheses without reading source chains.
**Test:** Do notes with contested claims include confidence metadata?

**Rule:** Notes with `confidence: high` should have `last-reviewed` within a domain-appropriate timeframe — legal (6 months), scientific (12 months), general (12 months).
**Why:** High confidence without recent review can be misleading; knowledge may have evolved since last review. Domain-appropriate intervals reflect how quickly knowledge changes in each field.
**Test:** For notes with confidence: high: (1) Is last-reviewed within the appropriate timeframe? (2) If older, downgrade to confidence: emerging until re-reviewed?

**Rule:** For domains with no consensus, explicitly tag notes with `consensus: none` and default to `confidence: low`.
**Why:** In domains where experts fundamentally disagree and empirical verification is impossible (parenting, relationships, personal development), presenting claims as if there's consensus misleads readers. Explicit consensus tracking helps readers understand that uncertainty is inherent to the domain.
**Test:** For notes in domains with no consensus: (1) Does the note explicitly state that consensus is absent? (2) Is confidence tagged as low/emerging by default? (3) Are multiple perspectives presented rather than one "correct" answer?
**Edge case:** Domains with no consensus include: parenting, relationship advice, personal development, philosophy, ethics, many creative domains. The absence of consensus is itself valuable knowledge.
**Edge case:** Some questions genuinely have consensus (safety facts, developmental ranges). Don't over-apply "no consensus" to domains where consensus exists on specific issues.

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
**Edge case:** Equipment cost can be a vault boundary criterion — if equipment cost excludes certain users, consider this when capturing knowledge.
**Edge case (refined):** For domains where software is as critical as hardware (music production, video editing, design), distinguish `equipment:` (physical tools) from `software:` (digital tools), or use `equipment:` with `type: physical|software` sub-field.
**Edge case (refined):** For domains with wide quality spectrums (free to professional-grade), add `quality-tier:` or `entry-level-alternative:` to help beginners determine what they can START with, not just what professionals use.
**Edge case (expanded):** For domains requiring make/model/year specificity (automotive repair, electronics, appliances), equipment varies by specific vehicle/device:
```yaml
equipment-scope:
  make: [Toyota, Honda]
  year: [2015-2022]
  model: [Camry, Accord]
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

**Rule:** For conditional/troubleshooting knowledge with 3+ branches, create a decision-point hub that links to each branch as separate atomic notes — do not embed all branches in one note.
**Why:** Embedding 3+ conditional branches violates atomicity and makes the note unusable; splitting without a hub loses the decision context.
**Test:** Pick a note with conditional branches. (1) Does it have 3+ branches? (2) If yes, is there a hub note explaining the decision point? (3) Are branches linked from the hub?

**Rule:** Use typed relationships to clarify the nature of conditional links — distinguish "if symptom then try this" (diagnostic) from "if that doesn't work then try that" (fallback sequence).
**Why:** Readers need to know whether to try all options in sequence or stop at the first success.
**Test:** For troubleshooting notes with multiple steps: (1) Can you distinguish primary attempts from fallback attempts? (2) Is the relationship between steps explicit?

**Rule:** Include exit criteria in troubleshooting notes — define what success looks like and when to stop or escalate.
**Why:** Without exit criteria, users don't know when the problem is solved or when they've reached a dead end requiring external help.
**Test:** Pick a troubleshooting note. Can you identify: (1) What success looks like? (2) When to stop trying branches? (3) When to escalate?

**Rule:** For substitution knowledge (ingredient, material, or component alternatives), capture with explicit substitution ratio, property impact, and contextual applicability.
**Why:** Substitutions are conditional by nature - they only apply when the primary is unavailable. Without explicit ratio and impact data, AIs cannot make informed substitution decisions or warn about context failures.
**Test:** For substitution notes: (1) Is there a substitution ratio (e.g., "1 cup X = 1 cup Y + Z")? (2) Is there a property impact description (texture, flavor, chemical behavior)? (3) Is contextual applicability stated (works in baking? fails when heated?)?
**Edge case:** Universal substitutes that always work (salt as preservative) are general knowledge, not substitution knowledge. Equipment alternatives are equipment dependencies, covered elsewhere.
**Implementation:** Use structure:
```yaml
substitution:
  primary: Original ingredient
  ratio: "1:1"  # or specific ratio
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

**Rule:** Notes evolve through lifecycle stages: draft -> active -> evergreen -> deprecated -> archived.
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

**Rule:** Deprecate notes using clear criteria — contradicted by new info, redundant, or low value. Never delete; always mark and point to replacement.
**Why:** Deletion breaks links silently; deprecation preserves graph integrity while signaling staleness.
**Test:** Can you list 3 reasons to deprecate a note? Are deprecated notes pointing to replacements?

Example: [[Graph Visualization]] was deprecated and merged into [[Knowledge Graph Structure]] — see how deprecation handles the transition while preserving access to the historical note.

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

## 11. Trade-off Knowledge

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

---

## 12. Vault Query and Retrieval

*How to find and use knowledge in your vault for decisions.*

**Rule:** Include retrieval guidance in vault onboarding — explain query patterns beyond navigation.
**Why:** A perfectly structured vault is useless if users can't find relevant knowledge for their specific question. Onboarding should cover how to formulate queries, not just how the graph is structured.
**Test:** Can a new user find answers to 3 random questions within 5 minutes using query strategies? Can they explain their retrieval strategy?

**Rule:** Tag notes with `decision-relevance:` indicating which decision types the note informs.
**Why:** Not all notes are equally relevant to decision-making. Tagging enables efficient retrieval when facing specific decisions.
**Test:** For notes containing actionable knowledge: (1) Is there `decision-relevance:` frontmatter? (2) Does it cover major decision categories the vault addresses?

**Rule:** Provide explicit conflict-resolution guidance when vault notes contradict each other.
**Why:** Well-maintained vaults accumulate multiple perspectives over time. When notes conflict, users need guidance on how to resolve or weigh them.
**Test:** For notes on contested topics: (1) Is there explicit conflict-resolution guidance? (2) Are the competing perspectives each linked to their source/authority? (3) Is there guidance on which to prefer for different contexts?

---

## Related
- [[_root|Vault root]] — Entry point demonstrating the Seed in action
- [[Atomic Note Principle]] — One idea per note
- [[Linking Principle]] — Meaningful connections
- [[Graph Traversal Efficiency]] — Maximum 3 hops navigation
- [[Self-Improvement Cycle]] — Continuous improvement process
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — What to create first when bootstrapping
- [[Frontier Exploration - Knowledge Prioritization and Focus Decisions]] — Balancing breadth vs depth, exploration vs exploitation
- [[Handling Temporal Knowledge]] — Keeping cited sources accessible
- [[Frontier Exploration - Probabilistic Knowledge]] — Handling inherently uncertain knowledge
- [[Frontier Exploration - AI-Optimized Knowledge Bases]] — Structuring knowledge for AI agents and RAG systems
- [[Frontier Exploration - Capturing AI Prompt Knowledge]] — Structuring knowledge about AI interactions and prompts
- [[Handling Contradictory Sources]] — Handling subjective vs objective claims in creative domains
- [[Frontier Gap - Embodied Knowledge]] — Capturing knowledge that resists articulation
- [[Frontier Exploration - Emotional and Sentimental Knowledge]] — Handling knowledge with emotional/sentimental value
- [[Frontier Exploration - Sensory Knowledge Capture]] — Capturing taste, smell, texture, and other sensory experiences
- [[Handling Temporal Knowledge]] — Handling temporal, outdated, and sequential knowledge (covers time-sensitive data, stale knowledge, and knowledge where sequence is intrinsic)
- [[Frontier Exploration - Comparative Knowledge Structures]] — Structuring notes that compare approaches, tools, or methods
- [[Frontier Exploration - Knowledge Ethics and Exclusion]] — When NOT to capture knowledge for ethical/safety reasons
- [[Frontier Exploration - Professional Advice Disclaimer Requirements]] — When knowledge becomes advice requiring disclaimers
- [[Frontier Exploration - Equipment and Tool Dependencies]] — Documenting physical tools required to execute knowledge
- [[Frontier Exploration - Conditional and Troubleshooting Knowledge]] — Handling if-then branches and decision trees
- [[Frontier Exploration - Myths, Misconceptions, and Folk Knowledge]] — Distinguishing widely-believed but unverified claims from evidence-based facts
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]] — Handling knowledge that's only appropriate at certain skill levels
- [[Frontier Exploration - User Situational Constraints]] — Handling knowledge constrained by time, budget, equipment access, and other user situations
- [[Types of Applicability Boundaries]] — Documenting when knowledge DOESN'T apply — edge cases, limitations, and known failure contexts
- [[Frontier Exploration - Threshold Knowledge]] — Capturing categorical transitions and the moments when states change
- [[Frontier Exploration - Legal Knowledge Bases]] — Handling legal confidentiality, authority status, and jurisdiction complexity
- [[Frontier Exploration - Knowledge Debt]] — Managing maintenance burden from shortcuts and incomplete capture
- [[Frontier Exploration - Musical Arrangement Knowledge]] — Handling cyclic-branching knowledge where elements repeat with variations
- [[Frontier Exploration - AI-Generated Content Verification]] — Verifying AI-generated notes are accurate and properly sourced
- [[Frontier Exploration - Knowledge Context Frames]] — Handling purpose-specific knowledge presentations
- [[Frontier Exploration - Visual Literacy and Aesthetic Evaluation Knowledge]] — Capturing visual judgment in photography, design, and creative arts
- [[Frontier Exploration - Trade-off Knowledge Capture]] — Capturing权衡 (trade-offs), competing priorities, and contextual decision-making
- [[Frontier Exploration - Adaptation and Transcoding Knowledge]] — Transforming knowledge between representations (arrangement, transcription, porting)

### Seed Stress Tests
- [[Seed Stress Test - Craft Knowledge Bases]] — Comprehensive stress testing of all Seed rules in cooking domain
- [[Stress Test - Equipment Dependencies Rule in Music Production]] — Testing equipment dependencies in music production
- [[Stress Test - Seed Rules in Programming Knowledge Bases]] — Testing Seed rules against software development domain challenges
- [[Seed Refinement - 3-Hop Rule Medical Domain]] — Refining the 3-hop rule for medical knowledge bases with natural taxonomies
- [[Stress Test - Atomicity Rule Across Domains]] — Testing atomicity across multiple domains including astronomy with observatory and equipment dependencies
- [[Frontier Exploration - Tool-Interface Knowledge]] — Handling keybindings, menu paths, and API endpoints

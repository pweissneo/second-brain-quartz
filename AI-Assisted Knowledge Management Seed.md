---
protected: true
last-reviewed: 2026-03-12
lifecycle: evergreen
confidence: high
author-type: ai
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

**Rule:** Treat meta-learning (learning how to learn) as a foundational skill to develop actively, not a passive ability.
**Why:** Meta-learning skills compound across all domains — investing in them provides returns everywhere. A second brain is a concrete implementation of this skill.
**Test:** Can you explain your learning process for a recent topic? Do you have a system for improving how you acquire, organize, and use knowledge?

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

**Rule:** Distinguish personal knowledge from general knowledge — prioritize capturing insights, decisions, and experiences over restatable facts.
**Why:** Personal knowledge (unique insights, lessons learned, decisions) compounds over time and provides value no web search can match. General knowledge (easily lookable facts) takes maintenance effort but offers little unique value.
**Test:** Pick 10 recent notes. For each: (1) Could a web search replace this note in <30 seconds? (2) Does it contain original insight, decision, or experience? Ratio should be 5:1 personal to general.
**Edge case:** General knowledge is acceptable when: frequently referenced (saves lookup time), synthesized with personal analysis, or domain-specific enough to be hard to find.

**Rule:** Assess harm potential before capturing personal or sensitive information — identify what to exclude or encrypt.
**Why:** Knowledge that seems harmless today could cause harm if exposed (identity theft, professional liability, personal embarrassment). Pre-capture harm assessment prevents future problems. This is the inverse of vault boundaries: not just what topics to include, but what specific knowledge to exclude.
**Test:** For notes containing: (1) personal identifiers, (2) financial details, (3) health information, (4) details about living individuals: Can you articulate what harm could result if this note were exposed? Is there a mitigation (encryption, isolation, exclusion)?

**Rule:** Exclude or protect knowledge about living individuals without consent — apply privacy by default.
**Why:** Capturing information about others without their knowledge creates ethical and legal risk. Even in personal vaults, this principle protects against future harm.
**Test:** For notes mentioning specific living people: (1) Did they consent to being recorded? (2) If no, is the note encrypted, excluded, or anonymized? (3) Could this knowledge cause them harm if exposed?

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

---

## 2. Atomicity

*One idea per note, properly sized.*

**Rule:** Every note must contain exactly one idea, summarizable in one sentence.
**Why:** Multi-idea notes are hard to link, hard to find, and impossible to reuse in new contexts.
**Test:** Can the note be summarized in one sentence without losing its core meaning? If the summary requires "and", split it.

**Rule:** Notes should be 100-300 words. Under 100 is too thin; over 300 likely contains multiple ideas.
**Why:** Size is a reliable proxy for atomicity — oversized notes almost always bundle concepts.
**Test:** Count words. Flag notes outside the 100-300 range for review. For notes >300 words: (1) Is this an executable procedure (recipe, code, tutorial, technical spec)? (2) Would splitting make it harder to use? (3) Are parts independently reusable? Do NOT flag if yes to 1-2; flag for potential split only if yes to 3. For notes <100 words: verify it has a stub marker (status: stub, todo: true) OR is a hub/redirect note.
**Edge case:** Procedural content (recipes, tutorials, code samples, technical specs, reference tables, legal documents) may legitimately exceed 300 words. Use atomicity test (one idea per note) as the primary check; word count is secondary for procedural formats.
**Edge case:** Comprehensive principle/explanation notes that cover multiple related sub-points in a coherent framework (e.g., "Note Lifecycle Management" covering stages, deprecation criteria, and archival guidelines) may exceed 300 words when splitting would reduce explanatory coherence. Apply the atomicity test first: does the note explore one theme comprehensively, or does it bundle unrelated ideas?
**Edge case:** Educational/explanatory content that requires depth for comprehension (e.g., explaining the science behind a technique, comprehensive topic overviews, comparative analyses of variations within one category) may legitimately exceed 300 words. The test: (1) Can this note be summarized in one sentence capturing its core purpose? (2) Would splitting lose essential synthesis or context? (3) Is this one coherent topic being explored comprehensively? Keep together if yes to any.
**Test for procedural content:** For notes >300 words that are procedures: (1) Does the user need to execute this linearly from start to finish? (2) Would splitting make it harder to use? (3) Are the parts independently reusable? Keep together if yes to 1-2; split only if yes to 3.
**AI agent guidance:** When uncertain about procedural content, prefer keeping notes together. Split only when: (a) parts are genuinely reusable in other contexts, AND (b) the note exceeds 1000 words. For recipes, code tutorials, and technical specs: err on the side of keeping together.

**Rule:** Notes under 50 words must either be explicitly marked as stubs (with `status: stub` or `todo: true`) or must provide sufficient substance to stand alone.
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

**Rule:** Every note must link to at least 2 other notes OR be tagged with `foundational: true`.
**Why:** Unlinked notes are invisible in the graph — they cannot be discovered through navigation. Foundational elements are a special case that should be explicitly marked, not manually verified each time.
**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links that lacks the `foundational: true` tag.
**Edge case:** Deprecated redirect notes (notes whose only purpose is to point to a replacement) may link to only the replacement note. All other notes must have at least 2 links unless tagged `foundational: true`.
**Edge case:** Foundational elements (core ingredients in cooking like salt/oil/water, basic utilities in software, fundamental concepts in any domain) may legitimately have fewer than 2 natural links — forcing connections creates decorative links that hurt more than help. Tag these notes with `foundational: true` rather than forcing artificial links. The test: (1) Is this a true domain primitive that everything else references? (2) Would added links improve navigation or just inflate the graph? If yes to both, add `foundational: true` tag.
**Edge case:** Domain-specific instruments, tools, or assessment scales (clinical assessment tools like pain scales, specific equipment in technical domains, specialized instruments) may legitimately have only 1 natural link when they are specific to one procedure or use case. Forcing a second link creates decorative connections. The test: (1) Is this note about a specific instrument/tool used in exactly one context? (2) Does adding a second link serve navigation or just meet a quota? If yes to 1-2, allow single link or tag with `specialized: true`.

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

**Rule:** Hub notes should link outward (to topic notes), not contain substantial content themselves.
**Why:** Hubs that contain long content violate atomicity; their job is navigation, not knowledge.
**Test:** Is the hub note under 200 words? Does it primarily consist of links with brief context?

**Rule:** Graph density (edges/nodes ratio) should increase over time, not just node count.
**Why:** A vault that grows in notes but not connections is accumulating, not building knowledge.
**Test:** Compare edges/nodes ratio across time. Is it trending upward?

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

---

## 6. Knowledge Processing

*How new knowledge enters and integrates into the vault.*

**Rule:** Capture first, process second — never try to write a perfect note on the first pass.
**Why:** Perfectionism at capture time slows input and loses ideas; separate capture from refinement.
**Test:** Is there an inbox or staging area? Do notes go through at least two passes before being considered complete?

**Rule:** Process incoming knowledge into atomic notes within 48 hours.
**Why:** Unprocessed captures degrade in value as context fades; a growing inbox signals a broken pipeline.
**Test:** Count unprocessed captures. Are there more than 10? If yes, the processing pipeline is stalled.

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

**Rule:** For access-controlled sources (paywalled content, subscription services, members-only), document access requirements and capture key insights before access is lost.
**Why:** Subscriptions expire, platforms change, communities close. Access-controlled content can become inaccessible without warning. Capturing synthesized insights ensures knowledge survives access loss.
**Test:** For notes citing access-controlled sources: (1) Does the frontmatter document what access is required? (2) Have you captured the key insights, not just a link? (3) Can someone understand the knowledge without accessing the original?
**Edge case:** Access tier (free/subscription/paid) is orthogonal to source quality. A free blog post may be more reliable than a paid advertisement. Distinguish access requirements from quality assessment.
**Implementation:** Use fields `access-requirements: type: subscription|paid|membership|authentication`, `access-verified: YYYY-MM-DD` to track currency of access.

**Rule:** For procedural content (recipes, code, tutorials, technical specs), include a verification-status field: `unverified` | `tested` | `community-validated`.
**Why:** Procedural content that hasn't been tested may cause harm (medical procedures, broken code) or waste time (recipes that don't work). Readers and AI agents need to know whether the steps have been verified.
**Test:** Pick 10 notes containing procedural content. Can you categorize each by verification status? Are any unmarked?
**Edge case:** Domain-standard procedures (well-known algorithms, classic recipes) may be marked as `community-validated` by virtue of widespread use. New or experimental procedures should be marked `unverified` until tested.
**Edge case:** AI agents cannot verify procedural content by execution - they should mark procedural notes as `unverified` unless source explicitly states testing was performed.

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

**Rule:** Use confidence markers (high/emerging/disputed/obsolete) to signal reliability of knowledge.
**Why:** Readers need to distinguish established facts from debated hypotheses without reading source chains.
**Test:** Do notes with contested claims include confidence metadata?

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
**Why:** Knowledge that requires specific tools to execute is fundamentally different from knowledge prerequisites. Readers need to know upfront what equipment investment is required before committing to learn. This is distinct from software version requirements (which are covered above).
**Test:** For procedural notes (recipes, crafts, repairs, techniques): (1) Is there an `equipment:` field in frontmatter? (2) Does it list required vs. optional tools? (3) Are alternatives documented for optional equipment? (4) For safety-critical equipment, is safety guidance included?
**Edge case:** Some domains have "basic toolkit" assumptions — don't list common tools (screwdriver, knife) unless the technique requires specialized versions.
**Edge case:** Equipment may have safety requirements (gloves, glasses, masks) — tag these separately from tools. For non-physical safety (e.g., hearing protection in audio), include `safety-type: hearing|cumulative`.
**Edge case:** Equipment cost can be a vault boundary criterion — if equipment cost excludes certain users, consider this when capturing knowledge.
**Edge case (refined):** For domains where software is as critical as hardware (music production, video editing, design), distinguish `equipment:` (physical tools) from `software:` (digital tools), or use `equipment:` with `type: physical|software` sub-field.
**Edge case (refined):** For domains with wide quality spectrums (free to professional-grade), add `quality-tier:` or `entry-level-alternative:` to help beginners determine what they can START with, not just what professionals use.

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

**Rule:** Notes evolve through lifecycle stages: draft -> active -> evergreen -> deprecated.
**Why:** Not all notes are equal; lifecycle tracking focuses review effort on notes that matter.
**Test:** Can each note be assigned a lifecycle stage? Are deprecated notes marked clearly?

**Rule:** Deprecate notes using clear criteria — contradicted by new info, redundant, or low value. Never delete; always mark and point to replacement.
**Why:** Deletion breaks links silently; deprecation preserves graph integrity while signaling staleness.
**Test:** Can you list 3 reasons to deprecate a note? Are deprecated notes pointing to replacements?

**Rule:** Iterate on existing notes rather than creating new ones on the same topic.
**Why:** Parallel notes on the same idea fragment knowledge; iteration concentrates and deepens it.
**Test:** Search for notes with similar titles or overlapping content. Should any be merged?

**Rule:** When understanding changes, update the note — don't create a "v2".
**Why:** Versioned duplicates confuse navigation; a single evolving note is the source of truth.
**Test:** Search for notes with version indicators (v2, "updated", "new"). Merge them into the canonical note.

**Rule:** Review the most-linked notes first — they have the highest impact on vault quality.
**Why:** A flawed hub note propagates its problems to every note that links through it.
**Test:** Run `graph_hubs`. Have the top 5 hubs been reviewed in the last 2 weeks?

**Rule:** Track knowledge validity periods for evolving domains — include `valid-from` date when understanding became accurate.
**Why:** Readers and AI agents need to know whether captured knowledge reflects current understanding or historical understanding.
**Test:** Pick 10 notes in an evolving domain. Can you determine when each piece of knowledge became accurate?

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

**Rule:** For vaults primarily serving AI agents (RAG systems, AI agents, automated reasoning), optimize structure for retrieval precision over human comprehension.
**Why:** AI agents and embedding-based retrieval have different needs than human readers - they need explicit semantic contracts, typed relationships, and machine-readable confidence. Optimizing for AI changes how atomicity, linking, and verification work.
**Test:** Pick 5 notes. Can an AI determine: (1) what each link semantically means (evidence, prerequisite, contradiction)? (2) how to verify each claim? (3) what the core concept is from the first 100 words? If no to any, the note is human-native, not AI-native.
**Edge case:** Many vaults serve both humans and AIs. In mixed-use vaults, prioritize human comprehension but include AI-optimized frontmatter (typed relationships, explicit verification pathways) as supplementary structure.

**Rule:** For domains where core knowledge exists in computational models (simulations, simulations, agent-based models), document the model with structured fields — assumptions, parameters, version, outputs, and interpretation guidance.
**Why:** Model-based knowledge has different properties than text — it's executable, parameterized, and version-dependent. Treating model documentation like regular notes loses these properties.
**Test:** For notes describing model behavior: (1) Can you identify key assumptions the model makes? (2) Can you list input parameters and their typical ranges? (3) Is there guidance on how to interpret model outputs? (4) Can you determine which model version produced this insight?
**Edge case:** Some domains have competing models with different assumptions — document model choice criteria as distinct knowledge. The selection of which model to use is often as important as the model itself.

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

## Related
- [[_root|Vault root]] — Entry point demonstrating the Seed in action
- [[Atomic Note Principle]] — One idea per note
- [[Linking Principle]] — Meaningful connections
- [[Graph Traversal Efficiency]] — Maximum 3 hops navigation
- [[Self-Improvement Cycle]] — Continuous improvement process
- [[Note Prioritization Strategy]] — What to create first when bootstrapping
- [[Source Validation Over Time]] — Keeping cited sources accessible
- [[Frontier Exploration - Probabilistic Knowledge]] — Handling inherently uncertain knowledge
- [[Frontier Exploration - AI-Optimized Knowledge Bases]] — Structuring knowledge for AI agents and RAG systems
- [[Frontier Exploration - Capturing AI Prompt Knowledge]] — Structuring knowledge about AI interactions and prompts
- [[Handling Contradictory Sources]] — Handling subjective vs objective claims in creative domains
- [[Frontier Exploration - Tacit Knowledge Capture]] — Capturing knowledge that resists articulation
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
- [[Frontier Exploration - Legal Knowledge Bases]] — Handling legal confidentiality, authority status, and jurisdiction complexity
- [[Frontier Exploration - Knowledge Debt]] — Managing maintenance burden from shortcuts and incomplete capture
- [[Frontier Exploration - AI-Generated Content Verification]] — Verifying AI-generated notes are accurate and properly sourced
- [[Frontier Exploration - Knowledge Context Frames]] — Handling purpose-specific knowledge presentations
- [[Frontier Exploration - Visual Literacy and Aesthetic Evaluation Knowledge]] — Capturing visual judgment in photography, design, and creative arts
- [[Frontier Exploration - Trade-off Knowledge Capture]] — Capturing权衡 (trade-offs), competing priorities, and contextual decision-making

### Seed Stress Tests
- [[Seed Stress Test - Cooking Knowledge Base]] — Comprehensive stress testing of all Seed rules in cooking domain
- [[Stress Test - Equipment Dependencies Rule in Music Production]] — Testing equipment dependencies in music production
- [[Stress Test - Seed Rules in Programming Knowledge Bases]] — Testing Seed rules against software development domain challenges

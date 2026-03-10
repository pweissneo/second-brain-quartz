---
protected: true
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
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

**Rule:** Define explicit vault boundaries — categorize what you keep (core knowledge), what you tolerate (operational), and what you exclude (ephemeral).
**Why:** Without boundaries, the vault accumulates noise, search quality degrades, and the "second brain" becomes a dumping ground. Explicit boundaries enable intentional curation.
**Test:** Can you list: (1) What types of notes are always kept? (2) What types are reviewed and either integrated or deleted? (3) What types are never added? If you can't answer these, the boundary is undefined.

**Rule:** Use a staging area (inbox) for uncategorized captures — process within 48 hours or explicitly defer with a review date.
**Why:** Capture first, process second is good advice, but "process" must have a deadline. Unprocessed captures become permanent clutter.
**Test:** Does an inbox exist? Are there notes older than 48 hours that aren't marked for later review?

**Rule:** Separate operational knowledge from synthesized knowledge — project notes, meeting notes, and task lists should either be time-boxed (auto-deprecate) or clearly marked as temporary.
**Why:** Operational debris looks like knowledge but isn't. It clutters searches and misleads about the vault's actual contents.
**Test:** Pick 10 random notes. Can you categorize each as: (a) permanent knowledge, (b) time-boxed operational, or (c) should be deleted?

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

**Rule:** Notes under 50 words must either be explicitly marked as stubs (with `status: stub` or `todo: true`) or must provide sufficient substance to stand alone.
**Why:** Thin notes without markers waste graph space and mislead — they appear complete but contain no real knowledge. Stubs signal intentional incompleteness; unmarkedly thin notes are quality failures.
**Test:** Count words in notes under 50 words. Does each have a stub marker OR contain a complete definition/explanation that could stand alone?
**Edge case:** Hub notes (pure navigation) under 200 words are acceptable. Redirect notes are acceptable. All other notes under 50 words need expansion or a stub marker.
**Edge case:** Domain unit concepts — standard notation elements, measurement units, or definition-atomic concepts — may legitimately fall below 100 words. Examples: musical dynamics (piano, forte), SI units (meter, kilogram), mathematical axioms, chemical elements. These are not stubs; their brevity is inherent to their nature. Verify: (1) Is this a standard unit/notation element of the domain? (2) Would expanding it add meaning, or just padding?

**Rule:** When splitting a note, create bidirectional links between the parts and rewire all incoming links.
**Why:** Splitting without rewiring breaks navigation paths and orphans content.
**Test:** After a split, do both new notes link to each other? Do all previous incoming links point to the correct part?

**Rule:** Each note must be self-contained — readable without clicking any links.
**Why:** Notes that depend on external context become meaningless when links break or context shifts.
**Test:** Read the note in isolation. Does it make sense without following any links?

---

## 3. Linking

*Meaningful connections between notes.*

**Rule:** Every note must link to at least 2 other notes.
**Why:** Unlinked notes are invisible in the graph — they cannot be discovered through navigation.
**Test:** Run an orphan scan. Flag any note with fewer than 2 outgoing links.
**Edge case:** Deprecated redirect notes (notes whose only purpose is to point to a replacement) may link to only the replacement note. All other notes must have at least 2 links.
**Edge case:** Foundational elements (core ingredients in cooking, basic utilities in software, fundamental concepts in any domain) may legitimately have fewer than 2 natural links — forcing connections creates decorative links that hurt more than help. Verify manually: (1) Is this a true foundation element? (2) Would added links improve navigation or just inflate the graph?

**Rule:** Every link must be explainable in one sentence — no decorative or keyword-match links.
**Why:** Meaningless links inflate the graph without adding navigational or conceptual value.
**Test:** For each link in a note, can you state why the reader should follow it? Remove any link where you cannot.

**Rule:** Use diverse link types — relevance, contrast, analogy, cause/effect, category membership.
**Why:** Homogeneous links create a flat graph; diverse connection types enable richer traversal and insight.
**Test:** Categorize links in a random sample of 5 notes. Are at least 3 different link types represented across the sample?

**Rule:** Prefer linking to existing notes over creating new ones — search before you create.
**Why:** Duplicate notes fragment knowledge; linking to existing notes strengthens the graph.
**Test:** Before creating a note, search the vault. Does a note covering this idea already exist?

**Rule:** Use tags for broad categorization and filtering; use links for essential relationships and navigation.
**Why:** Tags and links serve different purposes — tags enable faceted search across independent dimensions, links create navigable graph structure. Conflating them loses both benefits.
**Test:** Can you explain why each tag represents a category (not a specific relationship)? Can you explain why each link represents an essential connection (not just categorical membership)?

**Rule:** A note should rarely need more than 5 tags; it should link to as many notes as meaningful connections require.
**Why:** Tags represent facets — too many dilute meaning. Links represent relationships — the right number depends on the note's connectivity.
**Test:** Count tags on 10 random notes. Are most under 5? Do links exceed tags in quantity for well-connected notes?

---

## 4. Navigation

*The graph must be traversable and well-structured.*

**Rule:** Every note must be reachable from `_root.md` in 3 hops or fewer.
**Why:** Deep chains indicate structural problems — important content becomes buried and undiscoverable.
**Test:** Run a breadth-first traversal from `_root.md`. Flag any note requiring more than 3 hops.
**Edge case:** Natural domain hierarchies (taxonomies, classification systems, geographic/regional breakdowns) may legitimately exceed 3 hops. Examples: cooking (Cuisine → Region → Dish → Recipe), medicine (Field → Specialty → Condition → Treatment), biology (Kingdom → Phylum → Class → Order → Family). Use hub notes at intermediate levels to shorten paths where possible, but don't force artificial categorizations to flatten natural hierarchies. Verify: (1) Does this path reflect a genuine domain taxonomy? (2) Would adding a hub at an intermediate level improve discoverability? (3) Is the deep path serving a valid navigation purpose?

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

**Rule:** Create gateway notes for topics that unlock 5+ other notes, marking them with `gateway: true` and an `unlocks` list.
**Why:** Gateway notes serve as navigation landmarks that help readers and AIs find entry points into complex topic areas.
**Test:** Run a hub analysis. Are the top 5 hubs also marked with `gateway: true` in their frontmatter?

**Rule:** For vaults serving multiple expertise levels, create audience-specific entry points rather than duplicating atomic notes.
**Why:** Duplication fragments knowledge and creates maintenance burden; tiered entry points preserve atomicity while serving diverse audiences.
**Test:** Can a beginner find accessible entry points? Can an expert find deep dives without wading through basics?

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

**Rule:** Run structural health checks regularly — orphan scan, broken link scan, hub distribution, oversized note scan.
**Why:** Problems accumulate silently; periodic scans catch issues before they compound.
**Test:** Can you run these 4 scans right now? Do they all pass?

**Rule:** Every note must use consistent formatting — same heading style, same link syntax, same frontmatter fields.
**Why:** Inconsistent formatting breaks tooling and makes automated processing unreliable.
**Test:** Sample 10 random notes. Do they all use the same heading levels, link format, and frontmatter structure?

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

**Rule:** For procedural content (recipes, code, tutorials, technical specs), include a verification-status field: `unverified` | `tested` | `community-validated`.
**Why:** Procedural content that hasn't been tested may cause harm (medical procedures, broken code) or waste time (recipes that don't work). Readers and AI agents need to know whether the steps have been verified.
**Test:** Pick 10 notes containing procedural content. Can you categorize each by verification status? Are any unmarked?
**Edge case:** Domain-standard procedures (well-known algorithms, classic recipes) may be marked as `community-validated` by virtue of widespread use. New or experimental procedures should be marked `unverified` until tested.
**Edge case:** AI agents cannot verify procedural content by execution - they should mark procedural notes as `unverified` unless source explicitly states testing was performed.

**Rule:** When sources contradict, create a synthesis note presenting both perspectives with source attribution, rather than choosing one side.
**Why:** Choosing one side loses information; a knowledge base should represent reality accurately, including uncertainty and debate.
**Test:** Identify a note where sources disagreed. Does it present multiple viewpoints rather than picking one?

**Rule:** Distinguish objective contradictions from subjective ones — synthesize facts, present preferences as options.
**Why:** Objective contradictions (safety, correctness) require synthesis to avoid harm; subjective contradictions (taste, style) should present options without over-synthesizing opinions as facts.
**Test:** For a contradictory-sources note: (1) Is there an objective truth at stake? (2) Could getting it wrong cause harm? (3) Is it a preference vs. a fact? Synthesize if yes to 1-2; present as options if yes to 3.

**Rule:** Distinguish illustrative examples from factual examples — mark hypothetical/ teaching examples as such, date real-world examples.
**Why:** Illustrative examples explain concepts; factual examples demonstrate reality. Conflating them causes AI agents to cite hypotheticals as evidence and miss outdated facts.
**Test:** Pick 5 notes with examples. Can you categorize each as illustrative (hypothetical) or factual (real-world)? Are factual examples dated?

**Rule:** Capture negative knowledge — anti-patterns, failure modes, and lessons learned are as valuable as positive knowledge.
**Why:** A knowledge base that only captures successes is incomplete. Knowing what doesn't work prevents repeated mistakes and builds better judgment.
**Test:** Can you identify at least 3 anti-patterns or failure modes captured in the vault? Are negative knowledge notes linked to the related positive knowledge (what to do instead)?
**Edge case:** Negative knowledge notes should still follow atomicity — one failure/anti-pattern per note. Tag with `type: negative-knowledge` for filtering.
**Edge case:** Warnings and "never do this" statements are negative knowledge. Include the corrective action or link to the correct approach.

**Rule:** Tag context-scope for knowledge that changes validity across styles, frameworks, or approaches — don't universalize context-dependent rules.
**Why:** A rule true in one context (jazz harmony) may be false in another (classical counterpoint). Universalizing context-dependent knowledge creates misleading advice. Tagging scope helps readers and AIs understand applicability.
**Test:** For notes containing absolute statements (always/never/best): (1) Is there scope/applies-to metadata? (2) Are validity conditions explicitly stated? (3) Should framework-specific variants exist instead?
**Edge case:** Knowledge that is universally true (mathematical proofs, physical laws) does not need scope tags. Only tag when validity genuinely varies across contexts.

**Rule:** For knowledge whose validity depends on jurisdiction (legal, geographic, cultural), tag with explicit scope metadata.
**Why:** Without jurisdiction tags, an AI cannot distinguish between universally true knowledge, jurisdiction-specific knowledge, and misapplied knowledge. Legal, medical, and financial knowledge vary dramatically across borders.
**Test:** Pick 10 random notes in a domain-sensitive vault (law, medicine, finance). For each: (1) Does this knowledge apply universally? (2) If no, does it have jurisdiction/region scope tags? (3) Can you identify the applicable jurisdictions?
**Edge case:** Use `jurisdiction: [US, EU, UK]` for legal/governmental scope, `region:` for geographic/cultural scope. For overlapping jurisdictions (EU, US states), list applicable units.
**Edge case:** Historical jurisdictions (e.g., "East Germany") may be relevant for historical knowledge but should be clearly marked as historical with `status: historical`.

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

**Rule:** For knowledge domains with established evidence hierarchies (medicine, law, science), capture source quality tier in addition to confidence levels.
**Why:** Source quality (systematic reviews > RCTs > case reports) is distinct from confidence (how certain we are about the knowledge). Treating all sources equally loses critical reliability information in high-stakes domains.
**Test:** For notes in medicine, law, or science: (1) Does each major claim cite a source? (2) Is there source-tier metadata (systematic-review/rct/observational/case-study/expert-opinion/anecdote)? (3) Do claims from higher-tier sources receive higher confidence markers?

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

---

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

## Related
- [[_root|Vault root]] — Entry point demonstrating the Seed in action
- [[Atomic Note Principle]] — One idea per note
- [[Linking Principle]] — Meaningful connections
- [[Graph Traversal Efficiency]] — Maximum 3 hops navigation
- [[Self-Improvement Cycle]] — Continuous improvement process
- [[Note Prioritization Strategy]] — What to create first when bootstrapping
- [[Source Validation Over Time]] — Keeping cited sources accessible
- [[Frontier Exploration - Probabilistic Knowledge]] — Handling inherently uncertain knowledge

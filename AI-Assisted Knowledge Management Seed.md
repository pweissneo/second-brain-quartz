---
protected: true
last-reviewed: 2026-03-19
last-updated: 2026-03-19
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

**Rule:** Organize creative composition knowledge (recipe design, artistic creation, creative writing craft) as principles connected to examples, not as standalone procedures.
**Why:** Composition knowledge is about relationships between elements that can be recombined. Organizing by principles creates reusable frameworks; organizing by specific outputs creates collections that don't transfer. Technical procedures stay together as atomic units; composition principles should be broken into reusable components.
**Test:** For notes about creative composition: (1) Does this express a principle that could apply to multiple creations? (2) Does it connect to examples showing the principle in action? (3) Could someone use this to create something new? If yes to 1 and 2, organize as principle+examples; if yes to 3, it's a reusable component, not a single-use procedure.
**Edge case:** Specific creative works with unique value (family recipes, signature dishes, original compositions) should remain as specific notes but link to the compositional principles they embody.

**Rule:** Prioritize foundational concepts before applications when bootstrapping a new vault.
**Why:** Without prioritization guidance, agents face analysis paralysis. Foundations (prerequisites, core terminology, high-connectivity nodes) should exist before specialized content.
**Test:** Can you identify 5+ foundational notes that other notes depend on? Are they created early in the vault's history?

**Rule:** Balance exploration (adding new topics) and exploitation (deepening existing ones) based on vault maturity — new vaults favor exploration (70/30), mature vaults favor exploitation (80/20).
**Why:** Pure exploration creates shallow vaults with many thin topics; pure exploitation creates stagnant vaults that miss valuable new domains. Explicit balance ensures both breadth and depth grow healthily.
**Test:** Can you categorize your recent capture activity as primarily exploration or exploitation? Is the ratio appropriate for your vault's maturity (new <50 notes = exploration, mature >200 notes = exploitation)?

**Rule:** Use construction-phase model to guide structural decisions — apply relaxed standards during bootstrap, tighten as vault matures.
**Why:** The Seed's rules assume a mature vault with existing structure. During construction (first 50 notes), early structural decisions create the foundation. Relaxing rules temporarily while tracking phase enables better decisions; tightening later ensures quality. Without explicit phases, early mistakes compound.
**Test:** Can you identify the vault's construction phase? For vaults <50 notes: Is orphan rate tracked? Are structural decisions being evaluated? Is there a plan to tighten rules after bootstrap?
**Implementation:** Use `construction-phase:` frontmatter with values: skeleton (1-20 notes), flesh (20-100), muscle (100-200), maturity (200+). Apply relaxed thresholds during the bootstrap period (first 50 notes), not just during skeleton phase:
- Minimum links: 1 instead of 2
- Hop depth: 4 instead of 3  
- Note size: 50+ words instead of 100+
- Hub threshold: 3 notes instead of 5
**Transition rule:** At 50 notes, evaluate: (1) Orphan rate <20%? (2) Can all notes reach root in ≤4 hops? (3) Do major domains have hub notes? If any fail, refactor before continuing growth. After transition, apply full Seed rules for the flesh phase (20-100 notes).

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

**Edge case (stress test 2026-03-17):** In sequential-skill domains (language learning, music, mathematics, programming) where knowledge has strict prerequisite chains, the construction phase thresholds need modification:
- **Extended skeleton phase:** Language learning vaults may need 75-100 notes in skeleton phase because foundational vocabulary (100+ essential words) is required before basic communication is possible.
- **Allow hop depth up to 6:** Prerequisite chains in sequential domains naturally exceed 4 hops (e.g., Alphabet → Sounds → Pronunciation → Accent Marks → Stress Rules → Advanced Pronunciation). Allow up to 6 hops for genuine learning progressions.
- **Track phase by knowledge type:** Vocabulary, grammar, and practice resources have different structural needs. Track construction phase separately for each knowledge type rather than globally.
- **Directional orphan tolerance:** Foundation notes in sequential domains may legitimately have no incoming links (prerequisites that everything else builds FROM). Distinguish outbound orphans (problematic) from inbound orphans (acceptable for foundations). Use `foundational: true` tag to exempt from inbound-orphan detection.

**Rule:** Track vault growth velocity and maintain verification ratio — a healthy vault verifies at least 50% of new captures within 30 days.
**Why:** Without velocity tracking, vaults accumulate faster than they mature. High capture + low verification = shallow vault with unverified knowledge being treated as reliable. Tracking velocity ensures knowledge matures alongside capture.
**Test:** Calculate: (notes verified in last 30 days) / (notes added in last 30 days). Is the ratio ≥0.5? If below threshold, pause exploration and prioritize verification until ratio recovers.
**Edge case:** New vaults (<50 notes) can have lower ratios during bootstrap phase — establish conventions before verification scales. Set threshold at 0.3 for vaults <50 notes.
**Edge case:** High-stakes domains (medical, legal, financial) should maintain higher ratios (≥0.7) — unverified knowledge can cause real harm.
**Edge case:** Experiential domains require even more stringent tracking — "verified" means actually tested, not just source-checked. Require verification-status: verified, not just review completion.
**Edge case (NEW - 2026-03-18):** In domains with seasonal or cyclical verification constraints, the 30-day verification window may unfairly penalize valid captures. Cooking recipes with seasonal ingredients (pumpkin in fall, strawberries in summer), gardening knowledge that can only be verified during growing seasons, or holiday-specific traditions may be captured months before they can be practically tested. Apply domain-aware verification windows: (1) Use `verification-cycle:` field with values `seasonal|annual|circular` for notes that can only be verified at specific times, (2) Track `verification-season:` or `verification-window:` to specify when verification is possible, (3) Count these notes as "pending verification" rather than "unverified" during off-seasons, (4) Set verification ratio targets based on capture timing — a pumpkin recipe captured in March has 6 months to be verified before the next pumpkin season, not 30 days.

**Rule:** Enforce verification ceiling — when unverified notes exceed 40% of total vault, pause exploration and prioritize verification until ratio drops below 30%.
**Why:** An unverified-heavy vault misleads about its reliability. Users and AI agents cannot distinguish verified from unverified knowledge without explicit status tracking. The vault becomes unreliable as a decision-support tool.
**Test:** Count notes with verification-status: unverified. Divide by total note count. Is it <30%? If above 40%, do not add new notes until verification catches up.
**Edge case:** Domain-critical knowledge (safety procedures, legal requirements) may warrant exemption — tag with criticality: high to allow exception.
**Edge case:** Staging notes (whisper/draft/probe) don't count toward unverified — they have explicit uncertainty markers.

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
**Edge case:** For fast-moving domains (tech, science), consider a "knowledge corrections log" hub note tracking all corrections chronologically.

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
**Edge case - framework-dependent:** Value investing says "P/E ratios matter"; momentum investing says "they don't." These are framework-dependent, not contradictions. Tag as `framework-dependent: true` instead.
**Edge case - temporal:** If one note is marked outdated, it's not a simultaneous contradiction — it's handled by existing correction rules.

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

**Rule:** Use diminishing returns testing before adding notes to existing topics — skip or defer if the note fails 2+ of: utility (improves vault answers), connection (links to 2+ existing naturally), uniqueness (adds new knowledge), effort (maintenance worth value).
**Why:** Notes that don't improve utility, can't connect naturally, duplicate existing content, or require high maintenance for low value bloat the vault without adding proportional value.
**Test:** For the last 5 notes added to a mature topic: Do 3+ pass all four tests?
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
- One year's failure may be weather, not the knowledge (need multiple years to confirm)
- Seasonal variations mean spring planting ≠ fall planting success

Apply long-horizon verification: (1) Use `verification-cycle:` field with values `annual|multi-year|perennial`, (2) Mark notes as `verification-status: multi-year-pending` with explicit `verification-completion-target: YYYY`, (3) Don't count toward verification ratio until cycle completes, (4) Allow higher unverified backlog for long-horizon domains (up to 50%) since verification is inherently slower.

Example frontmatter for long-horizon knowledge:
```yaml
verification-status: multi-year-pending
verification-cycle: perennial
verification-completion-target: 2029
verification-years-completed: 1
```

The test: For gardening/permaculture/tree notes, do 3+ pass OR have verification-cycle: perennial with at least 2 years of data? (First-year notes don't count toward verified status until year 2+ confirms success.)

This is distinct from standard experiential domains — the issue is not that execution is uncertain (cooking), but that the verification timeline itself spans years.

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

**Edge case (stress test 2026-03-18):** In scientific research knowledge bases, the 5:1 ratio needs domain-specific calibration due to unique knowledge dynamics:

- **Literature synthesis as personal knowledge:** Synthesizing 3+ papers with YOUR interpretation adds unique value — count as personal-equivalent. Add `synthesis-type:` field (comparison|contradiction|extension|methodology-review).
- **Methodological tacit knowledge:** Statistical choices, experimental design decisions, and lab techniques are tacit knowledge — document why YOU chose this approach (vs. alternatives) to count as personal.
- **Reproducibility context:** Your specific protocol adaptations, lab conditions, and troubleshooting are uniquely valuable personal knowledge. Add `reproducibility-context:` field (lab-specific|protocol-deviation|troubleshooting-log).
- **Negative results:** What didn't work in YOUR experiments is rarely published but high-value — count as personal. Tag with `result-type: negative`.
- **Tool proficiency:** Database/software expertise (PubMed, R, Python, lab equipment) involves accumulated tacit expertise beyond tutorials — count as personal when including YOUR workflow tips.
- **Temporal validity:** Scientific knowledge expires as new research emerges. Add `temporal-validity: current|contested|superseded` — superseded notes should be archived and don't count toward ratio.
- **Collaborative ownership:** If you contributed original thinking to collaborative work, it counts as personal. Add `contribution-type:` field (led-developed|co-developed|curated|synthesized).

**Modified test for scientific research:** For research notes: (1) Does this synthesize 3+ sources with YOUR interpretation? (2) Does it document why YOU chose this method (vs. alternatives)? (3) Does it include YOUR lab-specific adaptations? (4) Does it document what didn't work in YOUR experiments? (5) Does it include YOUR accumulated tool expertise beyond basic tutorials? Count as personal if yes to any. Exclude `temporal-validity: superseded` from ratio calculations.

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

**Rule:** For timeline-organized vaults (project histories, personal life events, historical research, meeting logs), recognize temporal structure as primary and apply modified Seed rules.
**Why:** The Seed treats time primarily as a decay factor, but many knowledge domains are fundamentally organized around chronology. When time IS the primary structure, standard rules about hubs, atomicity, and linking create friction. Timeline vaults need explicit guidance to avoid forcing topic-based organization where chronology is primary.
**Test:** Can you identify if the vault's primary structure is chronological (timeline) or topical? For timeline-organized vaults: (1) Is there a timeline hub note that sequences major events? (2) Are entries organized by period (year, month, iteration) rather than by topic? (3) Do cross-references link across the timeline (thematic connections) rather than only along it (temporal neighbors)?
**Edge case:** Timeline vaults may have dual structure — chronological primary with topical secondary. The test: Is there a meaningful narrative flow that requires reading in order? If yes, timeline is primary.
**Edge case:** Pure timeline vaults (event logs) should use `period:` frontmatter (year, month, quarter, iteration) and link thematically to related topic notes, not just temporally to neighbors.
**Edge case:** Overlapping timelines (personal + professional simultaneously) need explicit `timeline-type:` tagging to distinguish parallel narratives.

See also: [[Frontier Exploration - Timeline-Based Knowledge Structures]] for detailed exploration of this gap.

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
- **Confidence defaults:** Philosophy has lower consensus than empirical domains. Default to `confidence: low` unless marking established consensus positions.

**Edge case (NEW - frontier exploration 2026-03-16):** Recognition-based knowledge requires different atomicity treatment — organize as training examples rather than definitions.
- **Visual/auditory recognition:** Pattern recognition knowledge (identifying celestial objects, identifying plant species by sight, recognizing bird calls) cannot be fully captured in descriptions — it requires exposure to examples. Notes should link to multiple instances that train the pattern.
- **The test:** Can you identify 3+ example instances of this pattern in the vault? Are they linked from the recognition note?
- **Tag:** Use `knowledge-type: recognition` for notes that capture pattern recognition knowledge.

**Edge case (NEW - frontier exploration 2026-03-16):** Software stack knowledge requires explicit version tracking — knowledge that exists in tool interactions often doesn't transfer across versions.
- **Software stack dependencies:** When knowledge lives in the gaps between tools (astrophotography stacks, development environments, data pipelines), version combinations matter. Knowledge about "how to process images in PixInsight" may not transfer to other software.
- **The test:** For notes about tool interactions, is there a `software-stack:` tag listing the specific versions?
- **Tag:** Use `software-stack:` frontmatter listing the specific version combination (e.g., `software-stack: "NINA 3.0 + PHD2 2.6 + PixInsight 1.8"`).

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

**Edge case (NEW - frontier exploration 2026-03-16):** Sensory threshold knowledge requires lower confidence defaults — knowledge at the boundary of perception has inherent uncertainty.
- **Perceptual limits:** Astronomy (limiting magnitude at the eyepiece), audio (threshold of hearing), touch (just-noticeable differences) — knowledge at perceptual limits is inherently uncertain.
- **The test:** For observation notes at the limit of perception, is confidence marked appropriately and sensory context documented?
- **Default:** For sensory threshold knowledge, default to `confidence: low` and include sensory context (equipment, conditions, observer experience).

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
**Edge case:** Single-term definitions and standard domain terminology may legitimately have fewer outgoing links. This includes: (1) Abbreviations, codes, standard identifiers (BP, CPR, error codes); (2) Standard domain vocabulary that serves as the canonical way a concept is expressed (tempo markings like allegro/adagio in music, dynamics like piano/forte, foreign terminology in classical arts). The test for abbreviations: (1) Is this note primarily a lookup reference? (2) Does the term get referenced via backlinks from content notes? For standard terminology: (1) Is this term the standard way this concept is expressed in the domain? (2) Does the note primarily serve as a definition/lookup? If yes to either test, allow fewer links with `type: terminology` or `type: reference`.

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

**Rule:** Define reasoning strategies for query answering — include explicit rules for query decomposition, traversal planning, relevance scoring, confidence aggregation, and gap detection.
**Why:** A perfectly structured vault is useless without strategies for traversing and synthesizing knowledge. Without reasoning guidance, AI agents over-traverse, under-traverse, or miss key connections. Explicit strategies ensure consistent, high-quality answers.
**Test:** For a complex query, can you: (1) decompose it into atomic sub-questions? (2) plan traversal paths before executing? (3) score note relevance using explicit criteria? (4) aggregate confidence from component notes? (5) detect and flag knowledge gaps encountered during reasoning?
**Edge case:** Different vault purposes require different reasoning strategies — reference KBs favor precision over breadth, learning KBs include path construction. Let query intent determine strategy.

**Rule:** Document synthesis logic for complex answers — when combining multiple notes, track which notes contributed, how synthesis was performed, and any assumptions made.
**Why:** Reproducibility matters for AI-generated answers. Without synthesis documentation, future queries cannot verify or improve the reasoning path.
**Test:** Can another agent reproduce your answer by following the same synthesis logic? Are synthesis sources and methods documented?

**Rule:** Track reasoning success rate as a proxy for vault usability — monitor query completion, gap detection frequency, and answer quality.
**Why:** Vault health isn't just about structure — it's about usability. Reasoning metrics reveal whether the knowledge base actually serves its purpose.
**Test:** Can you calculate: (1) What percentage of queries complete successfully? (2) How often do queries reveal knowledge gaps? (3) Do reasoning failures correlate with specific structural issues?

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

**Rule:** Never delete notes — deprecate them with a marker and a pointer to the replacement.
**Why:** Deletion breaks incoming links silently; deprecation preserves the graph while signaling staleness.
**Test:** Search for broken wikilinks. Are there any dead references? If yes, a deletion happened without cleanup.

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

See also: [[Frontier Exploration - Active Knowledge Replacement]] for detailed exploration of this gap.

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

See also: [[Frontier Exploration - Interlinked Note Updates]] for detailed exploration of this gap.

**Rule:** Terminology must be consistent across the vault — pick one term per concept and use it everywhere.
**Why:** Inconsistent terminology fragments search results and confuses navigation.
**Test:** Search for synonym pairs (e.g., "note"/"node", "link"/"connection"). Does the vault use one term consistently?
**Edge case:** Distinct terms that seem like synonyms actually refer to different things — e.g., "sauté" vs "pan-fry" vs "stir-fry" are different techniques; "stock" vs "broth" differ by bone/meat and simmer time; "bell pepper" vs "capsicum" are regional variants of the same vegetable. The test: (1) Do the terms refer to genuinely different techniques/ingredients? (2) Are both regional variants valid and useful? If yes to either, allow both with appropriate context (e.g., note the regional variant in parentheses).
**Edge case:** Technical vs common terminology — different audiences may need different terms (e.g., "fond" for experts, "brown bits" for beginners). Consider creating a definition note linking both terms.
**Edge case:** Historical or classical terms — classical cuisine uses French terms (julienne, mise en place) that may need plain-language equivalents. Document both with a redirect if needed.

**Rule:** Run structural health checks regularly — orphan scan, broken link scan, hub distribution, oversized note scan.
**Why:** Problems accumulate silently; periodic scans catch issues before they compound.
**Test:** Can you run these 4 scans right now? Do they all pass?

**Rule:** Run consistency scans quarterly — proactively detect terminology drift, contradictory claims, and scope mismatches across notes.
**Why:** Knowledge bases evolve organically and silently accumulate inconsistencies. Without systematic detection, the vault erodes in reliability as contradictory claims multiply undetected. Users discover inconsistencies through use rather than through maintenance.
**Test:** (1) Can you scan for terminology variations of the same concept? (2) Can you find notes with contradictory claims on the same topic? (3) Do you have a process for resolving found inconsistencies?
**Implementation:** Group notes by topic, compare key claims, identify conflicts, prioritize resolution by impact (decision-critical > frequently-referenced > obscure).

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
- `confidence: medium` — Reputable sources, or personal experience without explicit verification, established consensus in field
- `confidence: low` — Uncertain sources, AI-generated without verification, theoretical speculation, single anecdotal source
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

**Rule:** Track retrieval patterns to understand actual knowledge usage — capture search queries, access frequency, and retrieval success.
**Why:** A knowledge base's value is proven through retrieval, not storage. Without tracking retrieval patterns, capture decisions lack evidence. Failed searches reveal gaps; frequent access reveals value.
**Test:** Can you list your top 10 retrieval queries? Do they align with your highest-quality notes? Do failed searches drive capture decisions?
**Implementation:** Use retrieval logging: query terms, whether results were found, which notes were accessed, whether retrieved knowledge was sufficient. Review monthly to align capture priorities with actual usage.

See also: [[Frontier Exploration - Knowledge Retrieval Patterns and Usage Tracking]] for implementation strategies.

**Rule:** Capture meta-knowledge about your knowledge management process — document capture methods, organizational decisions, personal knowledge patterns, and contextual reasoning.
**Why:** Process knowledge compounds — lessons learned about building a vault are more valuable than any single note. Without capturing meta-knowledge, you repeat mistakes and lose institutional knowledge about what works. An AI building a knowledge base from scratch needs guidance on how to capture knowledge about the knowledge management process itself.
**Test:** Can you answer: (1) What capture methods have you tried and what worked/didn't? (2) What organizational decisions did you make and why? (3) What patterns do you notice in your own knowledge usage? (4) What would you do differently if starting over?
**Implementation:** Use `type: capture-process|organizational-decision|knowledge-pattern|contextual-decision` frontmatter:
- For capture-process: `method:`, `effectiveness-rating:`, `best-for-knowledge-types:`
- For organizational-decision: `decision:`, `alternatives-considered:`, `outcome:`, `would-choose-again:`
- For knowledge-pattern: `pattern-type:`, `evidence:`, `implications:`
- For contextual-decision: `constraints:`, `trade-offs-accepted:`, `rationale:`
**Edge case:** Separate process guidance (advice you'd give others) from process description (what actually happened). Tag with `meta-type: personal|preference|transferable-insight`.

See also: [[Frontier Exploration - Meta-Knowledge About Knowledge Management]] — Extended exploration of meta-knowledge capture

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

See also: [[Frontier Exploration - Knowledge Base Version Control and Change Tracking]] for detailed implementation strategies.

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

See also: [[Stress Test - Confidence Markers Rule Across Domains]] — Stress test that proposed the attention priority and decay function rules

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

See also: [[Seed Gap - Music Composition Knowledge Bases]] — Domain-specific exploration of tacit knowledge in music

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

See also: [[Frontier Exploration - Multi-Modal Knowledge Representation]] — Detailed exploration of this frontier gap

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

**Rule:** Notes with `confidence: high` should have `last-reviewed` within a domain-appropriate timeframe — legal (6 months), scientific (12 months), general (12 months).
**Why:** High confidence without recent review can be misleading; knowledge may have evolved since last review. Domain-appropriate intervals reflect how quickly knowledge changes in each field.
**Test:** For notes with confidence: high: (1) Is last-reviewed within the appropriate timeframe? (2) If older, downgrade to confidence: emerging until re-reviewed?

**Rule:** For domains with no consensus, explicitly tag notes with `consensus: none` and default to `confidence: low`.
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

Example: Graph Visualization was deprecated and merged into [[Knowledge Graph Structure]] — see how deprecation handles the transition while preserving access to the historical note.

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

---

## 13. Vault Query and Retrieval

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
**Implementation:** Use `confidence: high|medium|low|subjective` with `confidence-basis: tradition-authority|scholarly|personal|empirical`.

**Edge case:** Mixed domains (religious history, philosophy of religion, faith healing) need combined treatment. Religious historical claims (when did the Council of Nicaea happen?) are verifiable historically. Religious ethics may be reasoned about philosophically. Faith healing claims may have safety implications requiring professional advice disclaimers.

**Edge case:** Interfaith comparative knowledge needs accuracy and respect. Each tradition should be represented fairly, not through the lens of another tradition. Different traditions have different sensitivities about how they're described.

**Edge case:** New religious movements lack established verification mechanisms. What's authoritative is still being determined. Apply knowledge ethics rules for potentially harmful movements.

---

## Related
- [[_root|Vault root]] — Entry point demonstrating the Seed in action
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
- [[Frontier Exploration - Legal Knowledge Bases]] — Handling legal confidentiality, authority status, and jurisdiction complexity
- [[Frontier Exploration - Knowledge Debt]] — Managing maintenance burden from shortcuts and incomplete capture
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
- [[Stress Test - Atomicity Rule Across Domains]] — Testing atomicity across multiple domains including astronomy with observatory and equipment dependencies
- [[Frontier Exploration - Amateur Astronomy Knowledge Bases]] — Specialized challenges of astronomy knowledge: equipment dependencies, location sensitivity, pattern recognition
- [[Frontier Exploration - Tool-Interface Knowledge]] — Handling keybindings, menu paths, and API endpoints
- [[Seed Stress Test - 5-1 Ratio Across Domains]] — Testing 5:1 personal-to-general ratio across multiple domains
- [[Seed Stress Test - Finance and Investment Knowledge Base]] — Testing Seed rules in finance and investing domain
- [[Seed Stress Test - Mathematics Knowledge Base]] — Testing Seed rules in mathematics domain
- [[Seed Stress Test - Stub Notes Rule in Mathematics Knowledge Base]] — Testing stub notes rule in mathematics
- [[Frontier Gap - Embodied Knowledge]] — Testing diminishing returns rule in photography
- [[Stress Test - Knowledge Activation States in Medical Knowledge]] — Testing knowledge activation states in medical domain
- [[Stress Test - Last-Reviewed Rule in Historical Knowledge]] — Testing last-reviewed rule for historical knowledge
- [[Stress Test - Thinking Tools Rule in Meditation Mindfulness Knowledge Base]] — Testing thinking tools rule in meditation
- [[Seed Stress Test - Gardening Knowledge Base]] — Testing long-horizon verification, climate specificity, and seasonal knowledge rules
- [[Seed Stress Test - Diminishing Returns Rule in Machine Learning Data Science]] — Testing diminishing returns in rapidly-evolving technical domains
- [[Seed Stress Test - Construction Phase Model in Language Learning]] — Testing construction phase rules in sequential-skill domains
- [[Seed Stress Test - Philosophy Knowledge Base]] — Testing humanities concepts, contested knowledge, and historical development

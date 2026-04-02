---
gap-status: deprecated
gap-priority: medium
gap-phase: implementation
gap-severity: useful
gap-source: frontier-exploration
discovered: 2026-04-01
analyzed: 2026-04-01
resolved: 2026-04-02
resolved-by: "[[AI-Assisted Knowledge Management Seed]]"
resolution-note: "Seed already contains comprehensive deprecation workflow. This Seed Gap is resolved - the rule exists at lines 2147-2182 in the Seed."
lifecycle: deprecated
analysis-notes: "Gap is well-formed with proposed rule. Ready for Seed integration consideration. Strong overlap with Seed Refinement - Version-Specific Knowledge Obsolescence Handling (different focus: general vs version-specific). Recommend general deprecation rule in Seed with reference to version-specific handling as edge case. NOTE: Seed already contains substantial deprecation guidance (staleness vs obsolescence distinction, maturity staging, framework-status, terminology-status, external extinction handling) but it's scattered across multiple sections. This gap validates the need for a CONSOLIDATED deprecation workflow section, not new rules. Integration recommendation: Create explicit 'Knowledge Deprecation Workflow' subsection in Seed Quality Maintenance section (around line 2132) that synthesizes existing guidance into a cohesive end-to-end workflow."
---

# Seed Gap - Knowledge Deprecation and Obsolescence Management

## Gap Description

The Seed covers knowledge capture, verification, and organization in great detail, but provides minimal guidance on what happens when knowledge becomes outdated, obsolete, or incorrect. This creates several problems:

1. **Stale knowledge accumulation** — Outdated notes remain in the vault, potentially misleading users or AI agents
2. **No deprecation pathway** — There's no standard way to mark knowledge as superseded without deleting it
3. **Version confusion** — When knowledge updates, old versions are lost or orphaned
4. **Obsolescence detection** — No systematic way to detect when knowledge has expired

## Why This Gap Exists

The Seed emphasizes capture and verification as core activities. Deprecation is treated as implicit (delete bad notes) rather than explicit (mark stale notes as deprecated). This works during construction but fails in maintenance mode where knowledge updates are common.

## Proposed Rule: Knowledge Deprecation and Obsolescence Management

**Rule:** Establish explicit knowledge deprecation workflow — mark superseded knowledge as deprecated rather than deleting it, include deprecation metadata, and link to updated knowledge.

**Why:** Deleting knowledge loses context about why previous understanding was wrong. Deprecation preserves historical knowledge while directing users to current understanding. It also enables analytics on how often knowledge becomes stale (informing capture practices).

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
1. Mark with `deprecated: true`
2. Add `superseded-by:` link to replacement note
3. Document `supersession-rationale:`
4. Add `was-correct-until:` for temporal context
5. Keep note (don't delete) for historical reference

**Edge case: Partial deprecation** — Sometimes only part of a note is outdated. Extract the valid portion to a new or existing note, mark original as partially deprecated with `partial-deprecation: true` and `valid-sections:` listing what remains relevant.

**Edge case: Contradictory knowledge** — If deprecated knowledge contradicts current knowledge, preserve both with explicit conflict notation. This is different from simple deprecation — it's verification-mode conflict resolution applied to temporal knowledge.

**Edge case: Security-sensitive deprecation** — For security vulnerabilities, deprecation should be public (others may have the old knowledge). Use `security-advisory: true` and link to CVE or security advisory.

**Relationship to existing rules:**
- Complements verification-status: unverified → verified flow
- Works with staleness detection rules
- Enables verification-ratio calculation to exclude deprecated notes appropriately

**See also:**
- [[Seed Gap - Staleness Detection vs. Staleness Computation]]
- [[Seed Gap - Verification Timeline Management]]
- [[Frontier Exploration - Knowledge Versioning Strategies]]

## Gap-to-Seed Pathway

If this gap analysis reveals a pattern where the Seed lacks a rule to prevent the gap, this documents what rule is missing:

**Proposed Seed addition:**
> **Rule:** Establish explicit knowledge deprecation workflow — mark superseded knowledge as deprecated rather than deleting it. Preserve deprecated knowledge for historical context while directing users to updated understanding.
> **Why:** Deleting knowledge loses context about why previous understanding was wrong. Deprecation preserves learning while enabling current knowledge retrieval.
> **Test:** Can you identify deprecated notes? Do they link to replacements? Is deprecation metadata complete?

---

**This note is a Seed Gap analysis — not a Seed rule itself. It documents a potential gap and proposed rule. If merged into the Seed, this note should be archived.**

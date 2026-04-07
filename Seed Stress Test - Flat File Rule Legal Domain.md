---
last-reviewed: 2026-04-01
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: testing
compliance-audited: 2026-04-01
auditor: heartbeat-cron
---

# Seed Stress Test: Flat File Structure Rule (Legal Domain)

## Compliance Audit Notes (2026-04-01)

- [x] Follows Seed rule format (Rule/Why/Test structure)
- [x] Has verification-status frontmatter
- [x] Includes domain-specific edge case
- [x] Links to Domain-Specific Knowledge Bases
- [x] Test criteria present and executable by AI

## Rule Under Test

**Source:** [[AI-Assisted Knowledge Management Seed]]

> Use flat file structure with wikilinks — no nested folders.
> **Why:** Folders impose hierarchy that constrains discovery; links create organic, multi-dimensional structure.
> **Test:** Are all notes in a single directory? Are connections made via `[[Wikilinks]]`, not folder paths?

## Stress Test: Legal Knowledge Management

### Domain Characteristics

Legal knowledge has inherent hierarchical structure that differs from typical PKM:

1. **Jurisdictional hierarchy:** Federal → State → Local
2. **Source hierarchy:** Constitution → Statutes → Regulations → Cases
3. **Citation hierarchy:** Court → Reporter → Year → Case
4. **Practice hierarchy:** Practice Area → Matter Type → Client → Matter
5. **Rule hierarchy:** Rules of Court → Specific Rule → Commentary

### Where the Rule Fails

1. **Retrieval context loss:** A note about " hearsay exception" has different meaning in criminal vs civil vs administrative contexts. Flat structure loses jurisdictional/subject context.

2. **Hierarchy as knowledge:** In legal domains, the hierarchical position IS information. Rule 801(d) of Federal Rules of Evidence means something specific; the number encodes meaning.

3. **Citation chains:** Legal research follows hierarchical citations. A casenote without knowing which court decided it loses critical context.

4. **Matter organization:** Attorneys organize by client → matter. Flat structure makes this retrieval pattern inefficient.

5. **Version-sensitive law:** Statutes change; knowing WHICH version applies is essential. Flat structure without metadata makes version tracking harder.

### What Works Instead

- Use frontmatter for hierarchical context: `jurisdiction:`, `court-level:`, `rule-number:`
- Embed hierarchy in wikilinks: `[[Federal Rules of Evidence/Rule 801]]`
- Use tags for faceted retrieval: `#criminal-law #evidence #hearsay`
- Store version metadata: `effective-date:`, `superseded-by:`

### Proposed Edge Case

**Edge case (stress test 2026-03-24):** In domains where the knowledge itself has inherent hierarchical structure (legal codes, technical standards, regulatory frameworks, academic curricula), pure flat-file organization loses important context. Apply modified approach:

- **Flat files still:** All notes in single directory
- **Hierarchical metadata:** Use frontmatter to encode structural relationships
- **Structured wikilinks:** Allow `[[Parent/Child]]` pattern for encoding hierarchy
- **Faceted retrieval:** Use tags for multi-dimensional classification

**Test:** For hierarchical domains: (1) Does frontmatter capture structural relationships? (2) Can you reconstruct hierarchy from metadata? (3) Do wikilinks encode parent-child relationships? (4) Is retrieval efficient without folder navigation?

## Related Notes

- [[Domain-Specific Knowledge Bases]]
- [[Seed Stress Test - Gap Identification Rule in Cooking]]
- [[AI-Assisted Knowledge Management Seed]]

## Meta

- **Test conducted:** 2026-03-24
- **Domain:** Legal knowledge management
- **Verdict:** Rule needs domain adaptation for hierarchical knowledge domains
- **Severity:** Medium — works for research notes, fails for code/rule organization- [[_root]]

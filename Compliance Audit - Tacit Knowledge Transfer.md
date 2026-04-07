---
knowledge-type: meta
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: seed-refinement
confidence: emerging
author-type: ai-assisted
tags:
  - compliance-audit
  - seed-gap
  - tacit-knowledge
level: extension
schema-version: "1.0"
---

# Compliance Audit - Tacit Knowledge Transfer (2026-04-06)

> Audit of [[Seed Refinement - Tacit Knowledge Transfer Mechanism Documentation]] against current Seed rules.

## Summary

The Seed Refinement proposes three new rules for tacit knowledge transfer. This audit checks for conflicts with existing Seed rules.

## Existing Seed Coverage

The Seed already includes:

1. **`prerequisite-type: tacit`** (line 3732-3739): Tags knowledge requiring prerequisite skills that cannot be fully captured in text
2. **`experiential-component`** (line 3721-3724, 4034-4037): Indicates which aspects require direct experience
3. **`transfer-reliability: reduced`** (line 1305): For knowledge with source-representation gap
4. **`applicability-transferability`** (line 394, 413): For infrastructure-dependent knowledge

## Proposed Refinements vs Existing Rules

| Proposed Field | Status | Notes |
|---------------|--------|-------|
| `transfer-mechanism` | ADDITIVE | No conflict; extends coverage beyond current transfer-reliability |
| `tacit-level` | ADDITIVE | Complements `experiential-component: none/partial/essential` |
| `transfer-incomplete` | ADDITIVE | New concept; no existing equivalent |
| `completion-path` | ADDITIVE | New concept; helps readers complete knowledge transfer |

## Finding

**No conflicts found.** The proposed refinements are additive extensions to existing tacit knowledge rules. They add:
- Mechanism-level guidance (not just type-level)
- Incomplete transfer flags (not just reliability scores)
- Completion paths (not just prerequisites)

## Recommendation

The three proposed rules can be integrated into the Seed as extensions without breaking existing rules. They address a genuine gap: the Seed covers WHAT tacit knowledge IS but not HOW IT TRANSFERS between people.

## Related Notes

- [[Seed Refinement - Tacit Knowledge Transfer Mechanism Documentation]] — Source proposal
- [[AI-Assisted Knowledge Management Seed]] — Foundation rules being extended
- [[Frontier Exploration - Tacit Knowledge Transfer Mechanisms]] — Original gap documentation

## Next Steps

These proposed rules should be stress-tested against additional domains (music performance, sports coaching, medical diagnosis) before full Seed integration.
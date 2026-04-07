---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
gap-type: seed-missing
gap-status: analyzed
gap-source: audit
gap-severity: low
discovered: 2026-04-03
---

# Seed Gap - Multi-Modal Verification Tracking

## Identified Gap

The Seed provides extensive rules for individual verification modes (source, empirical, tool-dependent, drill-verified, embodied) and even has conflict resolution guidance (verification mode conflict resolution rule). However, **it lacks guidance for notes that legitimately require multiple simultaneous verification modes**.

## The Problem

Some knowledge claims require verification through multiple pathways simultaneously:

1. **Recipe with safety critical content**: Needs source verification (trusted cookbook) AND embodied verification (tasted for doneness) AND food safety verification (temperature check)

2. **Emergency procedure note**: Needs drill-verified (practiced) AND source-verified (matches current guidelines) AND tool-dependent (requires AED availability)

3. **Tool-executable knowledge with safety implications**: Needs execution verification (command runs successfully) AND source verification (security audit passed) AND embodied verification (output matches expected result)

The current system tracks ONE primary verification mode per note. But multi-modal knowledge exists and should be tracked comprehensively.

## Evidence from Current Vault

- Notes with both `verification-mode: embodied` AND `verification-status: verified` exist in the vault
- Emergency knowledge notes often require drill verification AND source verification
- Tool-executable notes may need both tool execution AND source verification

## Proposed Seed Update

Add frontmatter field for multi-modal tracking:

```yaml
verification-modes:
  - mode: source
    status: verified
    date: 2026-04-01
  - mode: embodied  
    status: pending
    date: null
  - mode: drill-verified
    status: verified
    date: 2026-03-15
```

OR extend existing single-mode field to accept arrays:

```yaml
verification-mode: [source, embodied]
verification-status: [verified, testing]
```

## Related

- [[Seed Rule - Verification Mode Conflict Resolution]] - existing conflict resolution
- [[Seed Refinement - Verification Mode Conflict Resolution Edge Cases]] - edge case handling
- [[AI-Assisted Knowledge Management Seed]] - core verification rules

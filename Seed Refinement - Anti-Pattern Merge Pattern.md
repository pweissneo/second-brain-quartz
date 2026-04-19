---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-03-30
last-updated: 2026-03-30
lifecycle: seed-refinement
confidence: high
tags:
  - seed-refinement
  - anti-pattern
  - best-practice
  - merge-pattern
---

# Seed Refinement: Anti-Pattern to Best Practice Merge Pattern

> When an anti-pattern and its corresponding best practice contain identical content, merge into the best practice and redirect the anti-pattern.

## The Pattern

During redundancy scanning, discovered that `Anti-Pattern - Perfectionism` and `Best Practice - Progress Over Perfection` contained nearly identical content with mirrored framing (negative vs. positive).

**Resolution applied:**
1. Merged content into the best practice note (more actionable framing)
2. Added redirect metadata to anti-pattern:
   ```yaml
   redirect_to: [[Best Practice - Progress Over Perfection]]
   lifecycle: deprecated
   correction-type: merged
   correction-date: 2026-03-30
   corrected-by: [[Best Practice - Progress Over Perfection]]
   ```

## Why This Works

- **Best practice wins** — Positive framing is more actionable
- **Redirect preserves references** — Existing links don't break
- **Clear deprecation** — The redirect note explains where content went
- **Audit trail** — Future reviewers can see the merge happened

## When to Apply

This merge pattern applies when:
1. Anti-pattern note is purely framing (same content as best practice)
2. Both notes pass the same test criteria
3. The best practice provides more actionable guidance
4. Keeping both creates maintenance burden (two places to update)

**Do NOT merge when:**
- Anti-pattern has unique content (specific failure modes, examples)
- Both notes have distinct test criteria
- The anti-pattern provides value as a distinct warning pattern

## Implementation Template

For deprecated anti-patterns:
```yaml
redirect_to: [[Best Practice - Name]]
lifecycle: deprecated
correction-type: merged
correction-date: YYYY-MM-DD
corrected-by: [[Best Practice - Name]]
```

For deprecated best practices:
```yaml
redirect_to: [[New Best Practice - Name]]
lifecycle: deprecated
correction-type: superseded
correction-date: YYYY-MM-DD
replaced-by: [[New Best Practice - Name]]
```

## Related

- [[Anti-Patterns in Knowledge Management]] — Anti-pattern hub
- [[Anti-Patterns in Knowledge Management]] — Best practice hub (consolidated 2026-04-07)
- [[Seed Refinement - Lifecycle Field Extension]] — Lifecycle field extensions

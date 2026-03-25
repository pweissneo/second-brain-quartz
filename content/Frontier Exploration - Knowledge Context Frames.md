---
last-reviewed: 2026-03-15
last-updated: 2026-03-24
lifecycle: evergreen
confidence: emerging
verification-status: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - context-frame
  - knowledge-presentation
schema-version: "1.0"
---

# Frontier Exploration: Knowledge Context Frames

> How to handle knowledge that requires different presentations for different purposes.

## The Problem

The same underlying knowledge may need different presentations depending on context:
- Patient education vs. clinical documentation vs. policy writing
- Tutorial vs. reference vs. scholarly article
- Beginner explanation vs. expert brief

The Seed currently handles expertise levels but not purpose-specific presentations.

## What the Seed Covers

As of 2026-03-23, the Seed now includes context-frame handling:

- **Rule:** For knowledge that legitimately requires different presentations for different purposes, use hub + variants pattern with explicit `context-frame` tagging.
- **Rule:** Distinguish context frames from expertise levels — frame is about purpose, level is about complexity.
- **Implementation:** Use `context-frame:` frontmatter field with values like `patient-education`, `clinical`, `policy`, `tutorial`, `reference`, `beginner-tutorial`.

## Remaining Considerations

While the core rule now exists, some aspects remain partially addressed:
- Testing criteria could be clearer (provide explicit yes/no checks)
- Examples in different domains (beyond medical) would strengthen the rule
- Guidance on when hub+variants vs. single note with sections could be explicit

## Validation (Cooking Domain Stress Test)

This rule was stress-tested against cooking domain:
- **Does it make sense?** Yes — recipes need different presentations (quick ref vs tutorial vs narrative)
- **Is the Test executable?** Partially — questions asked but not binary yes/no
- **Edge case:** Cooking context frames overlap more with expertise levels than in other domains (a "quick reference" recipe is both frame AND level)

## Examples

### Medical Domain
| Knowledge | Patient Ed | Clinical | Policy |
|-----------|-----------|----------|--------|
| Diabetes management | Simple explanations | Clinical protocols | Coverage rules |

### Generic/Knowledge Management
| Knowledge | Tutorial | Reference | Scholarly |
|-----------|----------|-----------|-----------|
| Atomicity principle | Step-by-step guide | Quick definition | Full theory + history |

Each variant has different emphasis, detail level, and terminology.

## Test Criteria

- [ ] Can you identify knowledge that needs different presentations?
- [ ] Do variants use consistent `context-frame` tagging?
- [ ] Can users find the appropriate variant for their purpose?

## Related
- [[Frontier Exploration - Expertise-Level Dependent Knowledge]]
- [[Frontier Exploration - Knowledge Base Onboarding]]
- [[Domain-Specific Knowledge Bases]]
- [[Note Types and Templates]]
- [[AI-Assisted Knowledge Management Seed]]

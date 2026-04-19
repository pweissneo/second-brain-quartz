---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-05
lifecycle: seed-refinement
confidence: emerging
tags:
  - seed-refinement
  - testing
  - automation
  - executable-tests
---

# Seed Refinement - Seed Test Automation Guidance
**Date:** 2026-04-05
**Method:** SEED_STRESS_TEST
**Domain:** Seed-level meta
---
## Finding: Seed Tests Need Automation Guidance
The Seed includes tests (rule validation criteria) but most are descriptive rather than executable. This creates work for AI agents running heartbeats.
## Principle
Every Seed rule test should be executable by an AI agent without requiring human judgment. When a test cannot be automated, document the automation approach.
## Test Automation Patterns
### Pattern 1: Grep-Based Tests
For frontmatter checks:
```bash
# Example: Count verified notes
grep -l "verification-status: verified" *.md | wc -l
for f in *.md; do grep -q "^\\[\\[.*\\]\\]" "$f" || echo "$f"; done
```
### Pattern 2: Link Analysis
# Find notes with <2 outgoing links
for f in *.md; do 
  links=$(grep -o "\\[\\[.*\\]\\]" "$f" | wc -l)
  [ "$links" -lt 2 ] && echo "$f"
done
### Pattern 3: Metadata Validation
# Verify required frontmatter fields
for f in *.md; do
  grep -q "^confidence:" "$f" || echo "missing confidence: $f"
  grep -q "^knowledge-type:" "$f" || echo "missing knowledge-type: $f"
### Pattern 4: Content Quality Checks
# Find notes that are too short to be atomic
  lines=$(wc -l < "$f")
  [ "$lines" -lt 10 ] && echo "possibly-stub: $f"
## Test Categorization
| Test Type | Automatable | Approach |
|------------|---------------|-----------|
| Frontmatter presence | Yes | grep-based |
| Link count | Yes | grep + wc |
| Content length | Yes | wc-based |
| Factual claims | Partial | regex extraction |
| Contradiction detection | No | manual review |
| Consensus level | No | external research |
## Proposed Test Format
Seed rule tests should include automation guidance:
```markdown
**Rule:** Every note must have at least 2 outgoing links
**Why:** Dense connectivity enables graph traversal
**Test:** 
- Executable: `for f in *.md; do links=$(grep -o "\\[\\[.*\\]\\]" "$f" | wc -l); [ "$links" -lt 2 ] && echo "$f"; done`
- Manual fallback: Open each note, count wikilinks, verify ≥2
## Gap Identified
The Seed lacks explicit automation guidance for rule tests. This note documents the need.
## Related
- [[Seed Refinement - Test Executability in Seed Stress Tests]]
- [[Seed Development Hub]]
- [[AI-Assisted Knowledge Management Seed]]

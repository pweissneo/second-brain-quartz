---
last-reviewed: 2026-03-10
lifecycle: draft
confidence: emerging
tags:
- seed-stress-test
- lifecycle
- software-development
---

# Stress Test: Note Lifecycle Rule in Software Development

## Seed Rule Being Tested

**Rule:** Notes evolve through lifecycle stages: draft -> active -> evergreen -> deprecated.
**Test:** Can each note be assigned a lifecycle stage? Are deprecated notes marked clearly?

**Rule:** Deprecate notes using clear criteria — contradicted by new info, redundant, or low value. Never delete; always mark and point to replacement.
**Test:** Can you list 3 reasons to deprecate a note? Are deprecated notes pointing to replacements?

## Application to Software Development Knowledge Base

Software development is an excellent stress test for lifecycle rules because:
1. APIs deprecate frequently
2. Programming languages evolve
3. Best practices change over time
4. Tools and frameworks become obsolete

### Scenario 1: Programming Language Version

**Note content:**
"Python 2.7 was the dominant version for data science."

**Analysis:**
- Lifecycle stage: **deprecated** (Python 2 reached end of life)
- Should point to: Python 3 Migration Guide
- Does this pass? YES — properly marked as historical

### Scenario 2: Framework Documentation

**Note content:**
"Building React apps with class components"

**Analysis:**
- Lifecycle: **deprecated** (React hooks replaced class components)
- Should point to: React Functional Components or React Hooks Guide
- Problem: Is this note marked as deprecated? If not, violates the rule

### Scenario 3: Tutorial for Deprecated Tool

**Note content:**
"How to set up a Jenkins pipeline using the classic UI"

**Analysis:**
- Lifecycle: **active** (Jenkins still widely used) OR **deprecated** if using deprecated features
- The tool itself may be active, but specific deprecated features need lifecycle tracking
- Edge case: Distinguishing between "the tool is active" vs "this specific approach is deprecated"

### Scenario 4: API Documentation

**Note content:**
"Using the v1 API endpoints"

**Analysis:**
- If v2 exists: **deprecated** — must link to v2 migration guide
- If v1 is still active: **active**
- Problem: In fast-moving APIs, notes can become obsolete within months

### Scenario 5: Best Practices That Changed

**Note content:**
"jQuery was the standard for DOM manipulation"

**Analysis:**
- Lifecycle: **deprecated** (modern frameworks made jQuery largely obsolete)
- Should point to: Vanilla JavaScript DOM or Modern Frontend Frameworks
- This is borderline: It's historical knowledge, not necessarily deprecated

## Edge Cases Discovered

### Edge Case 1: "Abandoned" vs "Deprecated"

A note about a tool that's no longer maintained (e.g., "AngularJS" vs "Angular 2+"):
- AngularJS: abandoned (no updates) — lifecycle: **historical**
- Angular 2+: active — lifecycle: **evergreen**

**Problem:** The current Seed doesn't distinguish between "deprecated but supported" and "abandoned/unmaintained."

### Edge Case 2: Version-Specific Knowledge

**Note content:**
"Python list comprehensions (Python 2)"

**Analysis:**
- In Python 3, list comprehensions work differently (no `xrange`, etc.)
- Is this a separate note or part of a general "Python List Comprehensions" note?
- Recommendation: Version-specific knowledge should either:
  - Have clear version tags: `applies-to: python2`
  - Be merged with version-agnostic content

### Edge Case 3: " evergreen" Is Hard to Maintain

**Note content:**
"JavaScript ES6 Features"

**Analysis:**
- ES6 is now standard (2015), but JavaScript evolves continuously
- Is it "evergreen" or does it need continuous updates?
- Recommendation: Add sub-lifecycle for "base standard" notes that need periodic review

### Edge Case 4: Security Vulnerabilities

**Note content:**
"Log4Shell vulnerability (CVE-2021-44228)"

**Analysis:**
- This is a historical security event
- Should it be deprecated when patched? NO — historical knowledge is valuable
- But the "fix" information becomes deprecated when new vulnerabilities emerge

### Edge Case 5: Soft Deprecation

Some technologies are "soft deprecated" — discouraged but not removed:
- Python `string.maketrans` → `str.maketrans` (soft deprecated, both work)
- React `componentWillMount` → deprecated but still runs

**Problem:** The current lifecycle model doesn't capture "soft deprecated" — notes that still work but shouldn't be used in new projects.

## Rule Refinements Needed

### Refinement 1: Add "abandoned" stage

**Rule:** Notes for abandoned tools/technologies should be marked **historical** (not deprecated), with context that the project is no longer maintained.

### Refinement 2: Version-specific frontmatter

**Rule:** Notes containing version-specific knowledge should include `applies-to:` or `version:` frontmatter to clarify scope.

### Refinement 3: Soft deprecation marker

**Rule:** Add `deprecation-type: hard | soft | historical` to distinguish between:
- **hard**: feature removed/removed
- **soft**: discouraged but functional
- **historical**: no longer maintained but historically significant

### Refinement 4: Review frequency by lifecycle

**Rule:** 
- draft: review weekly
- active: review monthly
- evergreen: review quarterly
- deprecated: review when replacement receives major updates

## Test for AI Agents

Given a software development note:
1. What is the lifecycle stage?
2. Does it reference deprecated tools/versions?
3. If deprecated, does it point to a replacement?
4. Is the version/scope clearly marked?

## Related
- [[Note Lifecycle Management]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Domain-Specific Knowledge Bases]] - Software development as a domain
- [[Handling Temporal Knowledge]] - Related to version-specific knowledge

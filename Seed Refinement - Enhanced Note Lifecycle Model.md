---
last-reviewed: 2026-03-24
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
verification-status: verified
tags:
  - seed-refinement
  - lifecycle
  - edge-cases
---

# Seed Refinement: Enhanced Note Lifecycle Model

> Additions to the Note Lifecycle rule based on cross-domain stress testing

## Current Seed Rule

Notes evolve through lifecycle stages: draft → active → evergreen → deprecated.

## Refinements Needed

### 1. Add "archived" for temporal data

**Rule:** Annual/temporal data (tax brackets, limits, API versions) should be marked `archived` rather than `deprecated` when superseded by updated values.
**Why:** Deprecated implies "wrong," but temporal data for a past period is accurate - just not current.
**Test:** For temporal notes: (1) Is it factually wrong or just outdated? (2) Does it have `as-of:` date? (3) Is there a current version to link to?

### 2. Add "conditional" for context-dependent advice

**Rule:** Notes containing advice that depends on conditions should include `condition:` or `applies-when:` scope tags.
**Why:** Context-dependent advice isn't deprecated when conditions change - it's just not currently applicable.
**Test:** For advice notes: (1) Does it make absolute claims (always/never)? (2) If yes, should it have scope/condition tags?

### 3. Add "historical" for one-time events

**Rule:** Notes about specific historical events should be marked `lifecycle: historical`.
**Why:** These aren't deprecated - they're complete records of what happened.
**Test:** For event notes: (1) Is this a one-time event or an ongoing category? (2) Does it need lifecycle tracking or is it archival?

### 4. Separate principle from parameters

**Rule:** Notes containing both timeless principles and time-sensitive parameters should separate them or note which is which.
**Why:** The 4% withdrawal rule principle may be evergreen, but the 4% number may not be.
**Test:** For numeric guidance: (1) Is the NUMBER tied to current conditions? (2) Should it have `last-reviewed` and `as-of:`?

### 5. Distinguish cyclical from deprecated

**Rule:** Strategies/approaches that cycle in and out of favor should be marked `status: cyclical` rather than deprecated.
**Why:** These aren't wrong - they're just currently unfashionable. They will return.
**Test:** For strategy notes: (1) Is this fundamentally discredited? (2) Or is it just currently unfashionable?

### 6. Add "abandoned" stage

**Rule:** Notes for abandoned tools/technologies should be marked **historical** (not deprecated), with context that the project is no longer maintained.

### 7. Version-specific frontmatter

**Rule:** Notes containing version-specific knowledge should include `applies-to:` or `version:` frontmatter to clarify scope.

### 8. Soft deprecation marker

**Rule:** Add `deprecation-type: hard | soft | historical` to distinguish between:
- **hard**: feature removed
- **soft**: discouraged but functional
- **historical**: no longer maintained but historically significant

### 9. Review frequency by lifecycle

**Rule:** 
- draft: review weekly
- active: review monthly
- evergreen: review quarterly
- deprecated: review when replacement receives major updates

## Summary

| Concept | Handling |
|---------|----------|
| Deprecated (contradicted) | Point to replacement |
| Archived (temporal data) | Add `as-of:` date |
| Historical (one-time events) | Complete records |
| Conditional (context-dependent) | Add scope tags |
| Cyclical (comes in/out of favor) | Mark as cyclical |
| Abandoned (unmaintained) | Mark as historical |

## Source

Derived from stress testing the Note Lifecycle rule across personal finance/investing and software development domains.

## Related

- [[Stress Test - Note Lifecycle Rule Across Domains]]
- [[Note Lifecycle Management]]
- [[AI-Assisted Knowledge Management Seed]]
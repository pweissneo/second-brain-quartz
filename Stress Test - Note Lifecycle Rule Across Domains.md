---
last-reviewed: 2026-03-11
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - lifecycle
  - personal-finance
  - investing
  - software-development
---

# Stress Test: Note Lifecycle Rule Across Domains

## Seed Rule Being Tested

**Rule:** Notes evolve through lifecycle stages: draft -> active -> evergreen -> deprecated.
**Why:** Not all notes are equal; lifecycle tracking focuses review effort on notes that matter.
**Test:** Can each note be assigned a lifecycle stage? Are deprecated notes marked clearly?

**Rule:** Deprecate notes using clear criteria — contradicted by new info, redundant, or low value. Never delete; always mark and point to the replacement.
**Test:** Can you list 3 reasons to deprecate a note? Are deprecated notes pointing to replacements?

---

## Domain 1: Personal Finance / Investing

Personal finance and investing knowledge has unique lifecycle challenges:
1. Market conditions change (bull/bear markets)
2. Tax laws change annually
3. Investment strategies go in and out of favor
4. Financial products evolve
5. Economic theories rise and fall

### Scenario 1: Tax Law Notes

**Note content:**
"2024 US Federal Income Tax Brackets"

**Analysis:**
- Lifecycle: **deprecated** (tax year ended, 2025 brackets differ)
- Should point to: 2025 US Federal Income Tax Brackets
- Does this pass? YES if properly marked and linked to current year
- Problem: Tax notes become obsolete every year - requiring constant updates

### Scenario 2: Investment Strategy Notes

**Note content:**
"Value Investing: How to find undervalued stocks using P/E ratios"

**Analysis:**
- Lifecycle: **evergreen** (value investing is a timeless strategy)
- BUT: The specific metrics and thresholds change
- Edge case: The PRINCIPLE is evergreen, but SPECIFIC PARAMETERS may not be

### Scenario 3: Market Timing Advice

**Note content:**
"During bear markets, move to bonds for safety"

**Analysis:**
- Lifecycle: **active** (relevant in current market conditions)
- Problem: This advice is context-dependent - good in bear, bad in bull
- This isn't deprecated, but it's CONDITIONAL - needs scope tags

### Scenario 4: Deprecated Investment Product

**Note content:**
"How to invest in closed-end funds"

**Analysis:**
- Lifecycle: **active** (closed-end funds still exist)
- BUT: If note recommends specific products that no longer exist → deprecated
- Edge case: Distinguishing between "product category" vs "specific product"

### Scenario 5: Economic Theory

**Note content:**
"The Efficient Market Hypothesis"

**Analysis:**
- Lifecycle: **evergreen** (academic theory, still taught)
- Problem: Confidence varies - some think it's partially correct, others disagree
- Should have: `confidence: disputed` with perspectives from both sides

### Scenario 6: Retirement Account Rules

**Note content:**
"Traditional IRA contribution limits for 2023"

**Analysis:**
- Lifecycle: **deprecated** (superseded by 2024 and 2025 limits)
- Should point to: Current year limits
- Problem: These are inherently temporal - every year creates new "deprecated" notes

### Scenario 7: Cryptocurrency Notes

**Note content:**
"Bitcoin mining profitability calculations"

**Analysis:**
- Lifecycle: **active** but rapidly changing
- Problem: Profitability depends on energy costs, hash rate, BTC price - all volatile
- Note may be factually wrong within months due to market movement

### Scenario 8: Real Estate Investment

**Note content:**
"Cap rate calculations for rental properties"

**Analysis:**
- Lifecycle: **evergreen** (the formula is timeless)
- BUT: "A good cap rate is 5-8%" changes with interest rates
- Problem: Evergreen PRINCIPLE vs. time-sensitive THRESHOLD

---

## Domain 2: Software Development

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

---

## Cross-Domain Edge Cases

### Edge Case 1: Temporal Knowledge That "Expires"

Tax brackets, contribution limits, API versions - all temporal data that gets superseded:
- Should they be DEPRECATED or ARCHIVED?
- Recommendation: Archive with `as-of: 2024` rather than deprecated
- Current rule: deprecated is for "contradicted by new info" - these are UPDATED, not contradicted

### Edge Case 2: Context-Dependent Advice

Advice that's good in one condition but bad in another:
- "Hold cash during inflation" - was good advice in 2022, terrible in 2019
- This isn't deprecated - it's CONDITIONAL
- Recommendation: Add `market-condition:` or `applies-when:` scope tags

### Edge Case 3: Strategy/Approach "Cycles" vs "Deprecated"

Some approaches cycle in and out of favor:
- Momentum investing (hot in 2020-2021, out in 2022-2023)
- jQuery (deprecated now, but may return)
- Is this deprecated? NO - it will likely come back
- Recommendation: Add `status: cyclical` in addition to lifecycle stage

### Edge Case 4: Product vs. Concept

A note about "specific event" vs "general category":
- "WeWork's IPO" (specific event) vs "SPAC IPO process" (concept)
- One-time events: lifecycle: **historical**
- Ongoing categories: lifecycle: **evergreen**
- Problem: AI may conflate specific product notes with category notes

### Edge Case 5: "Rule of Thumb" Numbers

Domain-specific thresholds that change with conditions:
- Financial: "4% safe withdrawal rate" - increasingly disputed
- Software: "Use try-catch for all errors" - depends on language
- The PRINCIPLE is evergreen, but the NUMBER may not be
- Recommendation: Separate the PRINCIPLE from the PARAMETER

### Edge Case 6: Geographic/Regulatory Variation

Notes that differ by jurisdiction:
- "401k contribution strategies" (US) vs "RRSP contribution strategies" (Canada)
- Both active in their jurisdictions
- Recommendation: Add `jurisdiction:` for all regulatory/tax notes

### Edge Case 7: "Abandoned" vs "Deprecated" (Software)

Tools that are no longer maintained:
- AngularJS: abandoned — lifecycle: **historical**
- Angular 2+: active — lifecycle: **evergreen**
- Problem: Current Seed doesn't distinguish "deprecated but supported" from "abandoned"

### Edge Case 8: Version-Specific Knowledge

Knowledge tied to specific versions:
- Python list comprehensions differ in Python 2 vs 3
- Recommendation: Use version tags `applies-to: python2` or merge with version-agnostic content

### Edge Case 9: Soft Deprecation

Technologies discouraged but not removed:
- Python `string.maketrans` → `str.maketrans` (soft deprecated)
- React `componentWillMount` → deprecated but still runs
- Problem: Lifecycle model doesn't capture "soft deprecated"

### Edge Case 10: Security Vulnerabilities

Historical security events:
- Note about "Log4Shell vulnerability"
- Should it be deprecated when patched? NO — historical knowledge
- But "fix" information becomes deprecated when new vulnerabilities emerge

---

## Rule Refinements Needed

### Refinement 1: Add "archived" for temporal data

**Rule:** Annual/temporal data (tax brackets, limits, API versions) should be marked `archived` rather than `deprecated` when superseded by updated values.
**Why:** Deprecated implies "wrong," but temporal data for a past period is accurate - just not current.
**Test:** For temporal notes: (1) Is it factually wrong or just outdated? (2) Does it have `as-of:` date? (3) Is there a current version to link to?

### Refinement 2: Add "conditional" for context-dependent advice

**Rule:** Notes containing advice that depends on conditions should include `condition:` or `applies-when:` scope tags.
**Why:** Context-dependent advice isn't deprecated when conditions change - it's just not currently applicable.
**Test:** For advice notes: (1) Does it make absolute claims (always/never)? (2) If yes, should it have scope/condition tags?

### Refinement 3: Add "historical" for one-time events

**Rule:** Notes about specific historical events should be marked `lifecycle: historical`.
**Why:** These aren't deprecated - they're complete records of what happened.
**Test:** For event notes: (1) Is this a one-time event or an ongoing category? (2) Does it need lifecycle tracking or is it archival?

### Refinement 4: Separate principle from parameters

**Rule:** Notes containing both timeless principles and time-sensitive parameters should separate them or note which is which.
**Why:** The 4% withdrawal rule principle may be evergreen, but the 4% number may not be.
**Test:** For numeric guidance: (1) Is the NUMBER tied to current conditions? (2) Should it have `last-reviewed` and `as-of:`?

### Refinement 5: Distinguish cyclical from deprecated

**Rule:** Strategies/approaches that cycle in and out of favor should be marked `status: cyclical` rather than deprecated.
**Why:** These aren't wrong - they're just currently unfashionable. They will return.
**Test:** For strategy notes: (1) Is this fundamentally discredited? (2) Or is it just currently unfashionable?

### Refinement 6: Add "abandoned" stage

**Rule:** Notes for abandoned tools/technologies should be marked **historical** (not deprecated), with context that the project is no longer maintained.

### Refinement 7: Version-specific frontmatter

**Rule:** Notes containing version-specific knowledge should include `applies-to:` or `version:` frontmatter to clarify scope.

### Refinement 8: Soft deprecation marker

**Rule:** Add `deprecation-type: hard | soft | historical` to distinguish between:
- **hard**: feature removed
- **soft**: discouraged but functional
- **historical**: no longer maintained but historically significant

### Refinement 9: Review frequency by lifecycle

**Rule:** 
- draft: review weekly
- active: review monthly
- evergreen: review quarterly
- deprecated: review when replacement receives major updates

---

## Summary

The Note Lifecycle rule needs to handle nuances across domains:

| Concept | Handling |
|---------|----------|
| Deprecated (contradicted) | Point to replacement |
| Archived (temporal data) | Add `as-of:` date |
| Historical (one-time events) | Complete records |
| Conditional (context-dependent) | Add scope tags |
| Cyclical (comes in/out of favor) | Mark as cyclical |
| Abandoned (unmaintained) | Mark as historical |

The current draft/active/evergreen/deprecated model doesn't capture these nuances.

## Related
- [[Note Lifecycle Management]]
- [[Handling Temporal Knowledge]]
- [[Domain-Specific Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed]]

---
last-reviewed: 2026-03-22
last-updated: 2026-03-22
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
verification-status: unverified
tags:
  - seed-stress-test
  - error-knowledge
  - programming
  - debugging
  - developer-experience
---

# Seed Stress Test: Error Knowledge Capture in Programming

> Testing the error knowledge capture rule against programming/developer experience — a domain where error documentation is critical but challenging.
> Date: 2026-03-22

*This note combines content from the related Frontier Exploration note on Error and Debugging Knowledge Capture.*

## Rule Under Test

**Rule (NEW - 2026-03-22):** Capture error knowledge systematically — document error messages, debugging steps, root causes, and resolutions for errors you encounter.

**Why:** Error knowledge is highly practical personal knowledge that saves time on repeated issues. Without systematic capture, you rediscover solutions repeatedly.

**Test:** Can you find notes about errors you've encountered? Do they include: (1) exact error message/code, (2) context (what you were doing), (3) root cause, (4) resolution? Can you search for an error and find a previous resolution?

**Implementation:**
```yaml
error-type: software|system|configuration|dependency|syntax
error-code: "Exact error message"
context:
  tool: tool name and version
  environment: OS, setup details
root-cause: What actually caused the error
resolution: How you fixed it
resolution-type: workaround|fix|config-change|version-bump
applicability: personal|general
error-valid-until: 2026-06  # When this error may become obsolete
```

## Domain Context: Programming

Programming is a natural fit for error knowledge capture:
- Errors are common and repetitive
- Same error can have different causes in different contexts
- Stack Overflow/search is the default, but personal context matters
- Tool versions change, making old errors obsolete
- Environment-specific errors (OS, configuration, dependencies)

## Stress Test Questions

### 1. Does the rule make sense for programming?

**Yes, absolutely.** Programming is perhaps THE canonical use case for error knowledge. The rule was clearly designed with programming in mind (references to "tool", "version", "dependencies").

### 2. Is the Test executable by an AI?

**Partially.** The test asks "Can you search for an error and find a previous resolution?" — this requires:
1. Error notes to exist in the vault
2. Searchable error codes/messages
3. Consistent naming conventions for error notes

An AI can verify if error notes exist and have the required fields, but cannot verify if the resolution actually works (that requires execution).

### 3. Edge Cases Found

#### Edge Case 1: Same Error, Different Causes

**Problem:** The same error message can have multiple root causes in programming.

Example: "ModuleNotFoundError: No module named 'requests'" can be caused by:
- Package not installed (`pip install requests`)
- Wrong Python environment (venv not activated)
- Wrong working directory
- Package name confusion (`requests` vs `urllib`)

**Current guidance:** The rule says "When capturing an error that already exists in the vault, compare context first — if context differs, add a new note or create a comparative note with multiple resolutions."

**Question:** Should error notes be:
- Context-specific (separate note per cause)?
- General (one note with multiple resolutions sorted by context)?

**Recommendation:** Use context-specific notes with a shared tag for the error message. This allows searching by error message AND distinguishing by context.

```yaml
# Note 1: requests not installed
error-type: dependency
error-code: "ModuleNotFoundError: No module named 'requests'"
context:
  environment: python-3.11
  package-manager: pip
root-cause: requests package not installed in environment
resolution: pip install requests
resolution-type: version-bump

# Note 2: wrong environment
error-type: configuration  
error-code: "ModuleNotFoundError: No module named 'requests'"
context:
  environment: venv-not-activated
  package-manager: pip
root-cause: Virtual environment not activated
resolution: source venv/bin/activate
resolution-type: config-change
```

#### Edge Case 2: Error Message Variability

**Problem:** Error messages vary by version, language, and library.

Example: Python 3.10 vs 3.11 have different error messages for the same issue. Different libraries format errors differently.

**Recommendation:** Use `error-pattern:` for regex matching across versions, not just exact `error-code:`.

```yaml
error-pattern: "ModuleNotFoundError.*No module named"  # Matches multiple variations
error-code: "Primary example: ModuleNotFoundError: No module named 'requests'"
```

#### Edge Case 3: Error Validity Expiration

**Problem:** Programming errors become obsolete faster than almost any other domain. A fix from 2020 may not work in 2026.

**Current guidance:** Use `error-valid-until:` field.

**Question:** What's the appropriate default? 3 months? 6 months? 1 year?

**Recommendation:** Programming errors should have shorter validity periods:
- Tool-specific errors: 6-12 months (tool versions change)
- Language errors: 12-24 months (language versions change slower)
- Fundamental errors (e.g., division by zero): permanent

Add `error-expiry-category:` field:
- `tool-version-specific`: tied to specific tool version
- `language-version-specific`: tied to specific language version  
- `environment-specific`: tied to OS/config
- `permanent`: fundamental error that doesn't expire

#### Edge Case 4: Multi-Step Debugging Processes

**Problem:** Some errors require extensive debugging with multiple steps. A single note might become huge.

**Recommendation:** Create a hub+spoke structure for complex debugging:
- Hub: Main error note with overview
- Spokes: Individual debugging step notes linked from hub

```yaml
# Hub note
error-type: software
error-code: "Connection refused error"
debugging-status: in-progress
debugging-steps:
  - "[[Debug Step 1: Check if service is running]]"
  - "[[Debug Step 2: Verify firewall rules]]"
  - "[[Debug Step 3: Check port configuration]]"
```

#### Edge Case 5: Errors That Are Not Errors

**Problem:** Some "errors" in programming are actually expected behavior (warnings, deprecation notices).

**Recommendation:** Distinguish:
- `error-type: fatal` — crashes, prevents execution
- `error-type: warning` — non-fatal but concerning
- `error-type: deprecation` — will become error in future

Tag deprecation warnings differently — they're not errors yet but signal upcoming changes.

#### Edge Case 6: Community-Solved vs Personal Context

**Problem:** Many errors are already documented on Stack Overflow. When is personal documentation needed vs. just linking to community solutions?

**Current guidance:** The rule implies personal knowledge is valuable, but doesn't distinguish when community solutions suffice.

**Recommendation:** Add `solution-source:` field:
- `community`: widely available solution (Stack Overflow, docs)
- `personal`: your specific context required unique solution
- `hybrid`: community solution + personal adaptation

For `personal` and `hybrid`, document what made the community solution insufficient for your context.

#### Edge Case 7: Cascading Errors

**Problem:** One error often causes another. The "real" error is buried under downstream failures.

**Recommendation:** Use `error-causes:` and `caused-by:` fields to track cascades:

```yaml
error-type: configuration
error-code: "Cannot connect to database"
root-cause: Database credentials incorrect
causes:
  - error: "Authentication failed"
  - error: "Connection timeout"
caused-by:
  - error: "Environment variable not set"
    note: "[[DB Connection - Environment Setup]]"
```

#### Edge Case 8: Reproducibility Variation

**Problem:** An error might be reproducible on your machine but not on another, or vice versa.

**Recommendation:** Add `reproducibility:` field:
- `always`: consistent across environments
- `environment-dependent`: requires specific setup
- `intermittent`: sometimes works, sometimes doesn't

For environment-dependent errors, document the required conditions explicitly.

## Gap Analysis

An AI building a programming knowledge base using only current Seed error knowledge rules would:

1. ✓ Know to capture error messages
2. ✓ Know to document context
3. ✓ Know to record root cause and resolution
4. ✓ Know to track validity periods
5. ✗ Not know how to handle same error with different causes
6. ✗ Not know how to handle error message variability across versions
7. ✗ Not know appropriate validity periods for different error types
8. ✗ Not know how to structure complex multi-step debugging
9. ✗ Not distinguish errors from warnings and deprecations
10. ✗ Not know when personal documentation is needed vs community solutions

## Recommendations

### Enhancement 1: Context-Differentiated Error Notes

**Rule:** For recurring error codes with multiple root causes, create separate notes per context rather than trying to consolidate.

**Why:** Different contexts require different solutions. Consolidated notes become confusing.

**Test:** Can you identify the specific context for each error occurrence?

### Enhancement 2: Version-Aware Error Matching

**Rule:** Use `error-pattern:` for regex matching across error message variations, with `error-code:` as a primary example.

**Why:** Error messages change across versions. Exact matching is too brittle.

**Test:** Can you find this error regardless of version-specific message phrasing?

### Enhancement 3: Error Expiry Categories

**Rule:** Programming errors should be categorized by expected lifespan:
- Tool-specific: 6-12 months validity
- Language-specific: 12-24 months validity
- Environment-specific: varies by setup stability
- Fundamental: permanent

**Why:** One-size-fits-all validity periods don't work for fast-changing domains.

**Test:** Can you categorize errors by expected lifespan and set appropriate validity periods?

### Enhancement 4: Error Cascade Documentation

**Rule:** Track errors that cause other errors using `causes:` and `caused-by:` fields.

**Why:** Real errors often have cascading effects. Understanding the chain helps debugging.

**Test:** Can you trace an error back to its root cause through the cascade?

## Conclusion

The error knowledge capture rule is well-suited for programming but needs domain-specific enhancements for:
- Handling same error with different causes
- Version-aware matching
- Appropriate validity periods
- Complex debugging structure
- Distinguishing errors from warnings
- Community vs personal solutions
- Error cascades
- Reproducibility variation

The core rule is sound; these are implementation refinements for a fast-moving domain.

---

## Related Notes

- [[Seed Stress Test - Error Knowledge Capture in Programming]] — This note (merged from Frontier Exploration)
- [[AI-Assisted Knowledge Management Seed]] — Source of rule being tested
- [[Seed Stress Test - Version Scope Rule in Data Science ML]] — Related: version handling in fast-changing domains

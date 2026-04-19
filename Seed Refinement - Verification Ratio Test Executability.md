---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-07
lifecycle: emerging
confidence: emerging
tags:
  - seed-refinement
  - stress-test
  - verification
  - test-quality
---

# Seed Refinement - Verification Ratio Test Executability

**Date:** 2026-04-07  
**Method:** SEED_STRESS_TEST  
**Domain Tested:** Multiple domains (cooking, woodworking, philosophy, fitness)

---

## Finding: Verification Ratio Test Is Descriptive, Not Executable

The Seed's verification ratio rule is well-specified conceptually but lacks an executable test.

### Current Seed Rule:

> **Test:** Calculate: (notes verified in last 30 days) / (notes added in last 30 days). Is the ratio ≥0.5?

### Problem:

This test is **descriptive** — it tells you what to calculate but not **how** to execute the calculation programmatically. An AI agent cannot easily compute this without:
1. Parsing frontmatter for `verification-status` and `last-updated` dates
2. Determining "last 30 days" from current date
3. Counting notes added vs verified in that window
4. Handling edge cases (seasonal notes, long-horizon verification)

### Proposed Executable Test:

```bash
# Calculate verification ratio for last 30 days
CURRENT_DATE=$(date +%Y-%m-%d)
THIRTY_DAYS_AGO=$(date -d "30 days ago" +%Y-%m-%d)

# Count notes added in last 30 days
NOTES_ADDED=$(grep -l "last-updated:.*${THIRTY_DAYS_AGO}\|last-updated:.*${CURRENT_DATE}" *.md | wc -l)

# Count notes verified in last 30 days (verification-status: verified)
NOTES_VERIFIED=$(grep -l "verification-status: verified" *.md | wc -l)

# Calculate ratio
RATIO=$(echo "scale=2; $NOTES_VERIFIED / $NOTES_ADDED" | bc)

# Check threshold
if (( $(echo "$RATIO >= 0.5" | bc -l) )); then
  echo "PASS: Verification ratio $RATIO >= 0.5"
else
  echo "FAIL: Verification ratio $RATIO < 0.5"
fi
```

### Problem with Simple Counting:

The above approach is naive because it counts ALL notes with verification-status: verified, not just those verified in the last 30 days. A note verified 6 months ago counts the same as one verified yesterday.

### Refined Executable Approach:

1. Extract `verification-date:` from notes with `verification-status: verified`
2. Filter to last 30 days
3. Compare against notes with `last-updated:` in last 30 days

```yaml
# Required frontmatter for executable verification ratio:
verification-status: unverified|verified|community-validated|community-accepted
verification-date: 2026-04-07  # When verification occurred
last-updated: 2026-03-15        # When note was created/updated
```

### Current State:

The Seed does NOT currently require `verification-date` frontmatter — it only tracks `last-updated` (when the note was modified) and `verification-status`. This means the current test cannot be executed precisely.

---

## Related Finding: Verification Status Has Multiple Dimensions

The Seed tracks:
- `verification-status` (unverified, verified, community-validated, etc.)
- `verification-mode` (source, tool, practice, drill, embodied)
- `verification-cycle` (seasonal, annual, long-horizon)
- `verification-priority` (critical, high, medium, low)

But it does NOT track:
- `verification-date` — when verification occurred
- `verification-duration` — how long verification took
- `verification-attempts` — how many attempts before success

### Proposed Frontmatter Addition:

```yaml
verification-date: 2026-04-07      # When verification was completed
verification-duration-days: 5    # How long verification took
verification-attempts: 2          # Attempts before successful verification
last-verification-attempt: 2026-04-05
```

---

## Finding: Verification Ceiling Test Also Descriptive

### Current Rule:

> **Test:** Count notes with verification-status: unverified. Divide by total note count. Is it <30%? If above 40%, do not add new notes until verification catches up.

### Executable Version:

```bash
TOTAL_NOTES=$(ls *.md | wc -l)
UNVERIFIED=$(grep -l "verification-status: unverified" *.md | wc -l)
UNVERIFIED_PCT=$((UNVERIFIED * 100 / TOTAL_NOTES))

if (( UNVERIFIED_PCT > 40 )); then
  echo "PAUSE: $UNVERIFIED_PCT% unverified (threshold: 40%)"
elif (( UNVERIFIED_PCT > 30 )); then
  echo "WARNING: $UNVERIFIED_PCT% unverified (target: <30%)"
else
  echo "OK: $UNVERIFIED_PCT% unverified"
fi
```

---

## Summary of Recommended Seed Updates

### 1. Add Verification Date Tracking

Add to Seed rule implementation:
```yaml
# In verification-status section, add:
verification-date: YYYY-MM-DD  # Required when verification-status is verified
```

### 2. Make Verification Ratio Test Executable

Update the test from:
> Calculate: (notes verified in last 30 days) / (notes added in last 30 days). Is the ratio ≥0.5?

To:
> Execute: For each note with `last-updated` in last 30 days, check if it has `verification-status: verified` AND `verification-date` in last 30 days. Count passing notes / total notes added. Compare against 0.5 threshold.

### 3. Add Verification Duration Tracking

For long-horizon verification domains (gardening, fitness, creative), add:
```yaml
verification-duration-days: 30    # Expected duration for verification
verification-completion-target: 2026-05-07  # Expected completion date
```

### 4. Document Test Executability Standards

Add meta-rule to Seed:
> **Rule:** Every Seed rule with a "Test:" section should be executable by an AI agent without human interpretation. If the test requires human judgment, explicitly note what judgment is required.

---

## Related Notes

- [[Seed Refinement - Test Executability in Seed Stress Tests]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Verification Priority in Cooking Domain]]
- [[Seed Stress Test - 2-Outgoing-Links Rule in Woodworking]]
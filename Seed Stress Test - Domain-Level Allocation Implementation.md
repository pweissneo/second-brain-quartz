---
last-reviewed: 2026-04-06
last-updated: 2026-04-06
lifecycle: seed-extension
confidence: medium
author-type: ai-assisted
verification-status: unverified
gap-status: identified
gap-priority: medium
gap-type: seed-missing
discovered: 2026-04-06
gap-source: seed-stress-test
tags:
  - seed-stress-test
  - domain-allocation
  - implementation-gap
  - operational-tracking
---

# Seed Stress Test - Domain-Level Allocation Implementation Gap

## Test Date: 2026-04-06

**Method:** SEED_STRESS_TEST

**Seed Rule Tested:** Domain-level allocation tracking (2026-04-01)

## The Problem

The Seed includes a rule requiring domain-level allocation tracking:
> "For vaults spanning multiple domains, track domain-level allocation — calculate current maintenance effort by domain, measure variance from portfolio targets (30% core, 40% domain, 20% adjacent, 10% exploratory), and rebalance when variance exceeds 15% for >30 days."

However, the **implementation is aspirational** — it describes what the tracking SHOULD look like but provides no mechanism for:
1. Actually calculating current allocation percentages
2. Comparing against portfolio targets
3. Detecting when variance exceeds threshold
4. Triggering rebalancing

## What the Stress Test Revealed

- **Seed says:** Track domain allocation in frontmatter or separate config
- **Reality:** Only 3 notes in the vault mention `domain-allocation:` — and they're all about the rule itself, not operational tracking
- **Seed says:** Calculate current allocation percentages by domain  
- **Reality:** No notes contain actual domain-level statistics (notes per domain, verification burden, health scores)
- **Seed says:** Rebalance when variance >15% for >30 days
- **Reality:** No operational mechanism exists to detect or trigger rebalancing

## Domain Coverage in Vault

Manual survey found domain tags across only ~15 notes:
- cooking (2)
- woodworking, programming-knowledge, music, language-learning, knowledge-management, etc. (1 each)

This suggests either:
1. Most notes don't have domain tags (violates Seed's own tagging requirements)
2. The vault doesn't track domains systematically

## The Gap

The Seed includes a well-designed rule with clear implementation examples, but there's no:
- **Operational config** — No .yaml or JSON file tracking domain allocation
- **Automation** — No scripts to calculate domain statistics
- **Dashboard** — No view showing current vs. target allocation
- **Enforcement** — No mechanism to flag variance violations

## Why This Matters

Without operational tracking:
- The 15% variance threshold is invisible
- Recency bias and interest drift still dominate maintenance decisions
- Portfolio percentages remain aspirational targets
- The rule exists but doesn't actually constrain behavior

## Proposed Solution

**Option A (Light):** Create operational config file (domain-allocation.yaml) that gets updated manually:
```yaml
# Updated 2026-04-06
domains:
  knowledge-management:
    target: 0.30
    current: 0.65  # guessed - most notes are KM
    variance: +0.35
  cooking:
    target: 0.15
    current: 0.05
    variance: -0.10
```

**Option B (Medium):** Add automation to calculate domain stats from note frontmatter and generate allocation report

**Option C (Heavy):** Integrate with MCP to track domain allocation as first-class vault metric

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Contains the rule being stress-tested
- [[Seed Gap - Knowledge Domain Allocation Strategy]] — Original gap analysis (resolved via rule addition)
- [[Seed Refinement - Domain-Level Allocation Edge Cases]] — Refinements

## Test Verdict

**Rule exists but lacks implementation pathway** — The domain allocation rule is well-specified but not operationalized. Stress test reveals a second-order gap: the Seed tells you WHAT to track but not HOW to make tracking happen.

**Recommendation:** Either simplify the rule to something achievable (e.g., "Review domain balance quarterly") or add implementation guidance for operational tracking.
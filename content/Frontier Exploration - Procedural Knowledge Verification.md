---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
- frontier-exploration
- knowledge-verification
- procedural-content
---

# Frontier Exploration: Procedural Knowledge Verification

## The Gap

The Seed has rules for:
- Source validation (URLs still work)
- Temporal knowledge handling
- Confidence markers

But there's no rule for **verifying that procedural content actually works**.

### Where This Matters

**Cooking:** A recipe note claims "caramelize onions for 10 minutes" - but does this produce the intended result? At what temperature? With what starting conditions?

**Code:** A code example claims to "fetch data from API" - does it actually run? What dependencies does it need?

**Woodworking:** A technique note says "plane until smooth" - smooth by what standard? How flat is "flat enough"?

**Fitness:** An exercise note describes proper form - how do we verify the description is accurate?

## Why This Is Different From Source Validation

- Source validation checks if URLs still work (external verification)
- Procedural verification checks if the steps produce the claimed result (internal verification)

A recipe can have a working URL but still produce wrong results if:
- The author made a mistake
- The technique description is ambiguous
- Context is missing (equipment, temperature, timing)

## The Problem for AI Agents

An AI building a knowledge base cannot verify procedural claims because:
1. It can't execute code to test if it runs
2. It can't cook to test a recipe
3. It can't perform surgery to verify a technique

The AI must trust procedural content - but the Seed doesn't acknowledge this limitation or provide guidance.

## Proposed Seed Rule

**Rule:** For procedural content (recipes, code, tutorials), include an explicit `verification-status` field: `unverified` | `tested-by-author` | `community-validated` | `formally-verified`.
**Why:** Readers and AI agents need to know whether procedural content has been tested. Unverified procedures may cause harm (medical, technical) or waste time (recipes that don't work).
**Test:** Pick 10 notes containing procedural content. Can you categorize each by verification status? Are any unmarked?

## Alternative Approach

Rather than requiring verification (which may be impossible for AI agents), tag procedural notes with `audience: intermediate` or `audience: expert` to signal that some knowledge may require external verification.

## Related
- [[Source Validation Over Time]]
- [[Seed Stress Test - Cooking Knowledge Base]] — Comprehensive stress testing (includes link requirements for recipes)
- [[Confidence Markers]]
- [[Frontier Exploration - Conditional and Troubleshooting Knowledge]] — For branching procedures with multiple outcomes
- [[Handling Temporal Knowledge]]
- [[Frontier Exploration - Temporal and Sequential Knowledge]] — Related: sequential knowledge structure

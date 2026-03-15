---
last-reviewed: 2026-03-12
lifecycle: active
confidence: emerging
author-type: ai-assisted
domain: software-development
tags:
  - stress-test
  - programming
  - software
---

# Stress Test - Seed Rules in Programming Knowledge Bases

> Testing whether Seed rules hold up when applied to software development knowledge bases.

This note tests the [[AI-Assisted Knowledge Management Seed]] against the unique challenges of programming and software development knowledge bases. It builds on findings from [[Stress Test - Atomicity Rule Across Domains]] and [[Stress Test - Self-Contained Notes Rule Across Domains]].

## Domain Characteristics

Programming knowledge bases have unique traits:
- Code snippets must stay with explanation (violates pure atomicity)
- API knowledge is version-specific
- Error messages are specific and searchable
- Documentation and implementation evolve together
- Terms are often in English even in non-English speakers' vaults

## Atomicity Rule Test

**Rule:** One idea per note, 100-300 words.

**Challenge:** A code example with 50 lines of code violates word count but is essential to understand the concept. Splitting it from the explanation breaks usability.

**Observations:**
- Code+explanation pairs often exceed 300 words naturally
- Error message + solution pairs are atomic but exceed word count
- API endpoint + example are inseparable

**Verdict:** Rule HOLDS but needs procedural content edge case (which exists). Code samples are properly covered under procedural content exception.

## Self-Contained Notes Rule Test

**Rule:** Notes must be readable without clicking links.

**Challenge:** Programming notes often reference:
- External documentation URLs
- Source code in other files
- Package names that need `npm install` or `pip install`

**Observations:**
- Code import statements are essential but external
- Package dependencies aren't captured in the note
- Version numbers of dependencies matter but aren't always specified

**Verdict:** Rule PARTIALLY HOLDS. Need clearer guidance on:
- When external dependencies should be inline vs. linked
- How to handle package version requirements

## Minimum Links Rule Test

**Rule:** Every note must link to at least 2 other notes.

**Challenge:** A new API endpoint note might only naturally link to its documentation.

**Observations:**
- Generic utility functions often have few natural links
- Notes about very specific errors may not connect to other notes
- Foundational programming concepts (variables, loops) may seem "obvious" but need links

**Verdict:** Rule HOLDS but foundation element edge case applies. Some programming concepts are foundational.

## Version Scope Test

**Seed has rule:** Include explicit version scope for software versions.

**Challenge:** Programming knowledge often doesn't state version applicability:
- "Python" could mean 2.7, 3.x, or specific version
- "React" could mean 15, 16, 17, 18, or 19
- Library APIs change drastically between versions

**Observations:**
- Most programming notes DON'T include version scope
- This is a major gap - knowledge becomes misleading without versions
- Should be enforced more strictly for programming vaults

**Verdict:** Seed rule is GOOD but not followed. Need enforcement mechanism.

## The "Unknown Unknowns" Problem

**Challenge:** When learning programming, you don't know what you don't know:
- You don't know what concepts exist
- You don't know what terminology to search for
- You don't know what libraries solve your problem

**Observations:**
- Programming has massive unknown unknowns
- Seed doesn't address how to discover unknown unknowns
- This is where community forums, aggregators (HN, Reddit) help

**Verdict:** Seed is MISSING guidance on discovering unknown unknowns in vast domains.

## Link Explainability Test

**Rule:** Every link must be explainable in one sentence.

**Challenge:** Programming notes often have "see also" links that are tangential:
- "Related: testing frameworks"
- "See: error handling"

**Observations:**
- Many programming notes have decorative links
- Hard to explain why "testing" relates to "error handling"

**Verdict:** Rule is VALUABLE for programming. Forces meaningful connections.

## Recommendations for Seed

**Update (2026-03-12):** Several recommendations from this stress test have been incorporated into the Seed:

1. **Version-Everything** → Incorporated as: "For knowledge that applies only to specific software versions... include explicit version scope"
2. **Unknown Unknowns Discovery** → Incorporated as: "For vast knowledge domains... actively discover unknown unknowns"
3. **Package Dependency Tracking** → Incorporated as: "For software-based domains... track software dependencies separately from physical equipment"

See also: [[Frontier Exploration - API and External Service Dependencies]] for handling version-specific knowledge, and [[Frontier Exploration - Equipment and Tool Dependencies]] for documenting tool requirements.

### New Rule Needed: Version-Everything

For programming vaults, enforce:
- Language version in frontmatter
- Library/framework versions for all dependencies
- Date when knowledge was accurate

### New Rule Needed: Unknown Unknowns Discovery

Add guidance:
- Use community aggregators to discover gaps
- Track what questions you couldn't answer
- Note terminology you had to look up

### Gap: Package Dependency Tracking

Seed's equipment rule covers physical tools but not software packages. Need:
- Frontmatter field for required packages
- Version constraints
- Installation commands

## Conclusion

The Seed holds well for programming but needs:
1. Stronger enforcement of version metadata
2. Guidance on discovering unknown gaps in vast domains
3. Software-specific dependency tracking (separate from physical equipment)

This stress test contributes to the [[Self-Improvement Cycle]] by identifying gaps in the Seed rules. Related explorations include [[Domain-Specific Knowledge Bases]] for adapting rules to different fields.

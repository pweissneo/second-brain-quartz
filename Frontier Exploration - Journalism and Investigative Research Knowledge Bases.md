---
last-reviewed: 2026-03-18
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - frontier-exploration
  - journalism
  - source-verification
  - confidential-sources
  - ethical-knowledge
---

# Frontier Exploration: Journalism and Investigative Research Knowledge Bases

Testing Seed rules against journalism — a domain that combines source verification, confidential sources, time sensitivity, ethical decision-making, and legal considerations in ways not explicitly addressed by current Seed rules.

## Domain Overview

Journalism knowledge bases face unique challenges that stress-test existing Seed rules:
- Source credibility assessment differs from academic source quality
- Confidential/anonymous sources provide high-value knowledge but cannot be verified
- Attribution itself is knowledge (who said what)
- Time sensitivity creates different verification standards (breaking vs investigative)
- Legal considerations (libel, privacy) affect what can be captured
- Redaction decisions are knowledge-worthy but sensitive
- Source protection is a core ethical commitment

---

## Gap 1: Confidential Source Knowledge

### The Problem

The Seed's source quality rules assume transparent sourcing — you can verify claims by checking sources. But journalism routinely captures knowledge from:
- Anonymous officials providing background information
- Whistleblowers who must remain protected
- Deep background vs on-record distinctions
- "Sources familiar with the matter" who cannot be named

This creates knowledge that is:
- High value (insiders know what they're talking about)
- Unverifiable (cannot confirm with other sources)
- Ethically must remain confidential (source protection)

### Current Seed Gap

The Seed has:
- Source quality tracking
- Confidence calibration
- Verification types (source-based vs execution-tested)

But NO explicit handling for:
- Knowledge that is inherently confidential
- Balancing source protection with knowledge capture
- Grading confidential information by reliability (anonymous is not all equal)

### Suggested Rule Addition

> **Rule:** For knowledge derived from confidential sources, use `source-confidentiality:` frontmatter with levels: `on-record`, `background`, `deep-background`, `anonymous`.
> **Why:** Confidential sources range from named officials speaking off-record to completely anonymous tips. Treating all confidential knowledge the same misrepresents reliability.
> **Test:** Can you categorize each confidential source by protection level? Do higher-stakes decisions require on-record sources?

> **Rule:** Distinguish confidential knowledge (source identity protected) from unverified knowledge (source quality unknown).
> **Why:** A confidential source can be highly reliable (an expert whistleblower); an unverified source may be anyone. Conflating these loses important reliability signals.
> **Test:** For knowledge without transparent sourcing: Is the confidentiality intentional (source protection) or incidental (could verify but haven't)?

---

## Gap 2: Attribution as Knowledge

### The Problem

In journalism, **who said something** is often as important as **what they said**:
- A claim from the CEO carries different weight than from a line worker
- Contradictory statements from different sources IS the knowledge
- Tracking who has said what enables pattern recognition over time

### Current Seed Gap

The Seed treats attribution as metadata for sourcing, not as knowledge content. But in journalism:
- Source attribution patterns reveal consistency/reliability
- Contradictory attributions (Source A says X, Source B says not-X) are valuable knowledge
- Source credibility evolves over time based on track record

### Suggested Rule Addition

> **Rule:** For knowledge domains where attribution is central (journalism, legal, intelligence), track source statements separately from claims.
> **Why:** Attribution enables tracking who believes what, detecting shifts in position, and assessing source reliability over time.
> **Test:** Can you trace a source's evolution on a topic? Can you identify contradictory statements from different sources?

---

## Gap 3: Time-Sensitive Verification Standards

### The Problem

Breaking news verification operates under different standards than investigative journalism:
- Breaking: "What we know vs what we're still confirming" is explicitly tracked
- Investigative: Standard is "would this survive legal scrutiny"
- Feature: More flexibility for context and uncertainty

The same claim has different appropriate verification levels depending on context.

### Current Seed Gap

The Seed has:
- Verification status (unverified, testing, verified)
- Confidence levels
- Decay functions

But NO explicit handling for:
- Context-dependent verification standards
- "Pending confirmation" as a valid state
- The explicit tracking of uncertainty in real-time

### Suggested Rule Addition

> **Rule:** For time-sensitive knowledge domains (news, intelligence, market data), use `verification-context:` to specify applicable standard: `breaking-investigative-legal-feature`.
> **Why:** Different contexts have different appropriate verification thresholds. Breaking news can acknowledge uncertainty; legal scrutiny requires higher bar.
> **Test:** For time-sensitive claims: Can you identify which verification context applies? Does the knowledge explicitly acknowledge what's confirmed vs pending?

---

## Gap 4: Legal Pre-Publication Review

### The Problem

In journalism, some knowledge cannot be published due to:
- Libel risk (knowing something is false could be imputed)
- Privacy violations
- Source confidentiality obligations
- National security classifications

This creates knowledge that:
- Exists in the vault
- Cannot be acted upon or shared
- May be relevant to future decisions

### Current Seed Gap

The Seed has:
- Privacy rules
- Harm potential assessment
- Exclusion criteria

But NO explicit handling for:
- Knowledge that exists but cannot be used
- Pre-publication holds
- Legal review status

### Suggested Rule Addition

> **Rule:** For knowledge subject to legal hold or review, use `publication-status:` with values: `cleared`, `pending-review`, `held`, `blocked`.
> **Why:** Some knowledge cannot be acted upon until legal clears it. Treating held knowledge as available misleads users.
> **Test:** For high-stakes knowledge: Can you identify what's cleared vs held? Do decision-support queries filter by publication status?

---

## Gap 5: Redaction Knowledge

### The Problem

Journalists make decisions about what to withhold:
- Source identity protection
- Legal risk mitigation
- Privacy considerations
- Harm prevention

These redaction decisions are:
- Knowledge-worthy (why did we withhold X?)
- Context-dependent (same info might be publishable in different context)
- Legally sensitive (withholding can be as meaningful as publishing)

### Current Seed Gap

The Seed doesn't address:
- Capturing what was intentionally excluded
- Documenting why information was withheld
- Context conditions for potential future release

### Suggested Rule Addition

> **Rule:** For knowledge where redaction decisions were made, document: (1) what was withheld, (2) why, (3) what conditions would allow release.
> **Why:** Redaction decisions contain valuable knowledge. Future events may change what's appropriate to publish.
> **Test:** For sensitive topics: Can you identify what was withheld and why? Are conditions for release documented?

---

## Synthesis: What This Means for the Seed

The journalism domain reveals that the Seed's verification framework assumes:
1. Sources can be verified
2. Verification improves confidence
3. Knowledge is meant to be used

Journalism challenges all three:
1. Confidential sources cannot be verified by definition
2. Source protection may LOWER confidence but the knowledge is still valuable
3. Some knowledge exists but cannot be used until conditions change

### Core Insight

**Verification and reliability are not the same thing.**

A confidential source can be highly reliable (they know what they're talking about and have demonstrated access). Anonymous tips may be unreliable (no accountability). Current Seed rules conflate verification with reliability.

### Proposed Rule

> **Rule:** Track source reliability and verification status as separate dimensions — a source can be reliable but unverifiable, or verified but unreliable.
> **Why:** Reliability (does the source know what they're talking about?) is different from verification (can we confirm independently?). Current rules don't capture this distinction.
> **Test:** Can you assess: (1) Does this source have access/expertise? (2) Is the claim independently verifiable? Rate each separately.

### Implementation

```yaml
source-reliability: high|medium|low|unknown
source-verification: verified|unverifiable|pending|disputed
# A high-reliability + unverifiable source: expert confidential informant
# A low-reliability + verified source: accidentally correct rumor
```

---

## Related Notes

- [[Frontier Exploration - Source Quality Assessment]]
- [[Frontier Exploration - Access-Controlled Knowledge]]
- [[Frontier Exploration - Knowledge Ethics and Exclusion]]
- [[Seed Stress Test - Verification Status Rule in Home Repair]] (safety-critical has similar urgency-but-uncertainty dynamics)

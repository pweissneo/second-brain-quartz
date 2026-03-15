---
last-reviewed: 2026-03-14
confidence: emerging
lifecycle: active
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-sources
  - interpersonal
---

# Frontier Exploration - Conversational Knowledge Capture

> Knowledge from conversations, interviews, and verbal exchanges has properties distinct from written sources - context, relationship, and non-verbal cues that affect meaning but are hard to capture.

## The Problem

The Seed has rules for capturing knowledge from:
- Written documents (sources, citations)
- Online resources (URLs, access requirements)
- Access-controlled content (paywalls, subscriptions)

But it's missing guidance for knowledge gained from **conversations** - interviews, meetings, phone calls, verbal consultations, discussions with experts. This is a major source of tacit knowledge that often contains the most valuable insights.

## Unique Properties of Conversational Knowledge

### 1. Context-Dependent Meaning

**The Gap:** The same words can mean different things based on:
- Relationship between speakers (peer, authority, personal)
- Setting (formal meeting, casual conversation, phone call)
- Non-verbal cues (tone, emphasis, hesitation)
- Historical context of the relationship

**Current Seed Gap:** No guidance for capturing relationship context that affects meaning.

**Impact without guidance:** An AI would capture the words but lose the subtext that changes interpretation.

### 2. Source Attribution Complexity

**The Gap:** In written sources, the author is clear. In conversations:
- Who said what may be fuzzy
- Information may be "heard from someone else" (hearsay)
- The speaker may be sharing someone else's knowledge

**Current Seed Gap:** No framework for attributing conversational knowledge with appropriate confidence levels.

### 3. Volatility and Revision

**The Gap:** People misremember, clarify later, or contradict themselves:
- A follow-up conversation may correct earlier statements
- The speaker might not have been certain when they spoke
- Memory of the conversation is itself fallible

**Current Seed Gap:** No rule for updating conversational knowledge based on later clarification.

### 4. Ethical Considerations

**The Gap:** Recording or documenting conversations raises consent issues:
- Was the person aware this was being captured?
- Do they consent to being quoted?
- What level of attribution is appropriate?

**Current Seed Gap:** No guidance on ethical capture of conversational knowledge.

## Structure for Conversational Knowledge

```yaml
knowledge-source: conversation
conversation-type: interview | meeting | phone | casual
attribution-type: direct-quote | paraphrase | third-party-report
speaker-relationship: peer | authority | personal | unknown
consent: explicit | implied | unknown
follow-up-available: true | false
captured-at: YYYY-MM-DD
```

## Gap Analysis: Where would an AI get stuck?

An AI building a knowledge base using only current Seed rules would:

1. Treat conversation notes like any other source - losing context
2. Not capture relationship dynamics that affect meaning
3. Not flag uncertainty about what was actually said vs. paraphrased
4. Not handle consent appropriately
5. Not have a framework for follow-up clarification

## Proposed Seed Rules

### Rule: For knowledge captured from conversations, include relationship context in frontmatter

**Why:** The same statement means different things based on who's saying it and the relationship dynamic. Capturing this context preserves interpretive accuracy.

**Test:** For conversation-based notes: (1) Is speaker relationship documented? (2) Is conversation type (formal/casual) noted? (3) Can a reader understand the context in which this was said?

### Rule: Distinguish direct quotes from paraphrase in conversational knowledge

**Why:** Paraphrase loses nuance and may introduce interpretation error. Readers should know what's exact vs. reconstructed.

**Test:** For conversational notes: (1) Is there attribution-type: direct-quote | paraphrase? (2) For paraphrase: is uncertainty acknowledged? (3) Can readers distinguish what was said vs. interpreted?

### Rule: Document consent status for conversational knowledge

**Why:** Ethical capture requires understanding what the speaker expects. Casual conversation may not imply consent to be quoted.

**Test:** For conversational notes: (1) Is there consent: explicit | implied | unknown? (2) For explicit: what form (recorded, noted, shared)? (3) Does the note appropriately limit attribution?

### Rule: Include follow-up availability in conversational knowledge

**Why:** Conversational knowledge may be corrected or clarified later. Tracking follow-up availability enables verification.

**Test:** For conversational notes: (1) Can you contact the speaker for clarification? (2) Is follow-up-available flagged? (3) Is there a process for updating based on later conversations?

## Related Notes

- [[Frontier Gap - Embodied Knowledge]] — Related to hard-to-articulate knowledge
- [[Frontier Exploration - Source Credibility Assessment]] — Assessing source reliability
- [[Frontier Exploration - Knowledge Source Types]] — Types of knowledge sources

## Test Case

Without this rule, an AI would:
1. Capture interview notes as if they were written documents
2. Not flag that "John said X" is different from "The article says X"
3. Not capture relationship dynamics
4. Not handle consent appropriately

With this rule, an AI would:
1. Document conversation type, speaker relationship
2. Distinguish direct quotes from paraphrase
3. Track consent status
4. Note follow-up availability for verification
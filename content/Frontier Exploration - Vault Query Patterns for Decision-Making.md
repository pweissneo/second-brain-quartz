---
last-reviewed: 2026-03-13
confidence: emerging
author-type: ai-assisted
lifecycle: draft
review-by: 2026-03-20
tags:
  - frontier-exploration
  - retrieval
  - decision-making
  - query-patterns
---

# Frontier Exploration: Vault Query Patterns for Decision-Making

The Seed provides extensive guidance on building, maintaining, and improving a knowledge vault. However, there's a notable gap: **how to actually query and synthesize knowledge from the vault to make decisions**. This is a different skill from vault maintenance.

## The Gap

A knowledge base full of well-structured atomic notes is only valuable if you can retrieve the right knowledge at the right time. The Seed covers:

- How to name notes
- How to link notes  
- How to navigate the graph
- How to maintain quality

But the Seed doesn't cover:

- How to formulate a query against your own knowledge base
- How to synthesize multiple notes into a decision-relevant response
- How to know which notes are relevant to a specific situation
- How to handle situations where the vault has partial information

## Why This Matters

Imagine you face a decision: "Should I take a job in Tokyo or stay in Berlin?"

A well-built vault might contain:
- Notes about cost of living in different cities
- Notes about career opportunities in your field
- Notes about your personal preferences (weather, language, culture)
- Notes about your partner's career needs
- Notes about financial implications of relocation

But the Seed provides no guidance on:
- How to identify which notes are relevant to this decision
- How to weigh conflicting information (Tokyo has better career prospects but worse weather preferences)
- How to handle missing information (what if there's no note about healthcare?)
- How to synthesize a recommendation from disparate notes

## Existing Partial Coverage

- [[Frontier Exploration - Knowledge Applicability Boundaries]] - covers when knowledge applies
- [[Frontier Exploration - User Situational Constraints]] - covers context-dependent knowledge  
- [[Note Prioritization Strategy]] - covers prioritizing what to build, not how to query

## Test Cases

### Test Case 1: Simple Factual Query
**Situation:** "What's the best way to roast a chicken?"
**Vault has:** Multiple recipe notes, technique notes, ingredient notes
**Current Seed can:** Help you find relevant notes via navigation
**Gap:** No guidance on which answer is best when notes conflict

### Test Case 2: Multi-Factor Decision  
**Situation:** "Should I buy or rent in my current city?"
**Vault has:** Financial calculations, lifestyle preferences, market conditions
**Gap:** No guidance on synthesizing factors or handling trade-offs between notes

### Test Case 3: Partial Information
**Situation:** "How do I fix this specific error in my codebase?"
**Vault has:** Some relevant notes but none for this exact error
**Gap:** No guidance on what to do when vault has partial coverage

### Test Case 4: Time-Pressured Retrieval
**Situation:** Emergency decision - 5 minutes to make a call
**Vault has:** Well-organized knowledge
**Gap:** No guidance on rapid retrieval patterns for time-sensitive decisions

## Proposed Seed Rules (Draft)

**Rule:** Provide explicit query patterns for common decision types — factual lookup, comparative analysis, multi-factor synthesis, and recommendation generation.
**Why:** Knowing how to query your own knowledge is a distinct skill from building it. Without query patterns, users waste time navigating manually or miss relevant notes.
**Test:** Can you list 3+ query patterns for your vault? Can an AI agent determine which pattern to use based on the question type?

**Rule:** Include retrieval guidance in onboarding — explain how to find relevant notes for a specific question.
**Why:** A perfectly structured vault is useless if users can't find what they need. Onboarding should cover query strategies, not just structure.
**Test:** Can a new user find answers to 3 random questions within 5 minutes? Can they explain their search strategy?

**Rule:** Tag notes with `decision-relevance:` to indicate which types of decisions a note informs.
**Why:** Not all notes are equally relevant to decision-making. Some are background context, others are direct inputs to decisions. Tagging enables efficient retrieval.
**Test:** Can you identify notes tagged with decision relevance? Do they cover major decision categories in your vault?

## Related Questions

- How does an AI agent determine which notes are relevant to a novel situation?
- What's the minimum vault coverage needed for useful decision support?
- How do you handle contradictory notes when making decisions?

## See Also

- [[Frontier Exploration - Knowledge Applicability Boundaries]]
- [[Frontier Exploration - User Situational Constraints]]
- [[Frontier Exploration - Trade-off Knowledge Capture]] (in Seed)
- [[Knowledge Base Utility Assessment]]

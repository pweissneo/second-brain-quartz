---
last-reviewed: 2026-03-09
lifecycle: evergreen
confidence: high
tags:
  - seed-rule
  - terminology
  - jargon
  - accessibility
---

# Jargon vs Plain Language in Knowledge Bases

> This note elaborates on Seed rules about terminology. See [[AI-Assisted Knowledge Management Seed]] for the authoritative rules.

## The Challenge

When building a knowledge base, how should an AI agent balance technical precision with accessibility?

The Seed provides excellent rules for:
- Atomicity (one idea per note)
- Linking (meaningful connections)  
- Navigation (graph traversal)
- Domain agnosticism (portability across topics)

However, terminology choice requires additional guidance:
1. When to use domain jargon vs plain language
2. How to make vaults accessible to newcomers
3. Whether technical terms should be defined inline or in separate notes

## Why It Matters

Consider a medical knowledge base:
- "Myocardial infarction" is precise but excludes non-experts
- "Heart attack" is accessible but loses clinical nuance
- Both are valid, but the choice affects who can use the vault

The same applies to:
- Law (plaintiff vs person suing)
- Finance (bull market vs rising prices)
- Programming (recursion vs calling yourself)

## Seed Rules on This Topic

The Seed addresses this in Section 6 (Knowledge Processing):

### Rule 1: Dual-Layer Vocabulary
**From Seed:** For key concepts, include both the technical term and plain-language equivalent.

**Elaboration:** Different readers have different backgrounds. A vault that uses only jargon excludes newcomers; one that only uses plain language frustrates experts. Dual-layer vocabulary serves both.

**Test:** Pick 5 random notes in a domain-specific vault. Can a beginner understand the main concept without clicking any links? Can an expert find the precise terminology?

### Rule 2: Define Before Using
**From Seed:** When introducing a domain-specific term, either define it inline (1-2 sentences) or link to a definition note.

**Elaboration:** Links break. Definition notes can become orphaned. Inline definitions are always available, ensuring self-containment.

**Test:** Read each note in isolation. Can you understand the key terms without following any links?

### Rule 3: Precision over Accessibility
**From Seed:** Default to the most precise term available, but provide plain-language context for common concepts.

**Elaboration:** A knowledge base should be a source of truth. Precision is harder to achieve than accessibility. Provide both by leading with precision and following with accessibility.

**Test:** For 10 notes, count: (1) technical terms used, (2) plain-language equivalents provided. Is there at least one plain-language aid per 3 technical terms?

## Stress Test: Medical Vault

Imagine building a knowledge base about heart disease:

**Without the rules:**
- [[Myocardial Infarction]] - atomic, well-linked, navigable
- But: A non-medical user cannot understand it
- And: No guidance on whether to also create [[Heart Attack]] as a link

**With the Seed rules:**
- [[Myocardial Infarction]] would define "heart attack" inline
- A user searching for either term would find the note
- Both technical and casual users are served

## Related
- [[AI-Assisted Knowledge Management Seed]] — The authoritative rules
- [[Note Naming Conventions]] — Related to terminology
- [[Atomic Note Principle]] — One idea per note (applies to definitions too)

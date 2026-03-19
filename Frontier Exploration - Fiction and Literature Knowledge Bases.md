---
last-reviewed: 2026-03-18
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - fiction
  - literature
  - literary-criticism
  - spoiler
---

# Frontier Exploration - Fiction and Literature Knowledge Bases

> How to organize knowledge about fiction, literature, and narrative works — a gap in current Seed rules

## The Problem

The Seed provides extensive guidance for:
- ✓ Non-fiction knowledge bases
- ✓ Technical/scientific domains
- ✓ Procedural knowledge (recipes, code)
- ✓ Creative skill domains (cooking, music)
- ✓ Single creative works (via Single-Work Knowledge note)

But the Seed lacks guidance for **fiction and literature knowledge bases**, which have unique challenges:
- Spoiler management
- Character persistence across works
- Theme abstraction and recurring motifs
- Literary criticism frameworks (Marxist, feminist, psychoanalytic, structuralist)
- Quote attribution and organization
- Fiction vs. non-fiction organizational differences
- Authorial intent vs. reader interpretation

## Why This Is a Frontier

An AI building a literature knowledge base using current Seed rules would face these unaddressed situations:

### 1. Spoiler Management

How do you tag knowledge that reveals plot points? The Seed has no guidance on:
- Spoiler levels (mild spoilers vs. major twists)
- Spoiler scope (entire work, specific chapter, ending)
- Reader opt-in (knowledge that requires spoiler acknowledgment)

### 2. Character Knowledge Persistence

Characters appear across multiple works:
- Same author: Sherlock Holmes in Doyle's stories
- Adaptations: Jane Eyre across novel, film, musical
- Retellings: Greek myths across literature

The Seed's atomicity rule assumes one idea per note, but a character is both:
- A single entity (one "idea")
- A node connecting to multiple works, themes, character traits, authorial commentary

### 3. Theme Abstraction

Themes (love, death, power, identity) are:
- Abstract concepts (like any other principle)
- Recurring across unrelated works
- Expressed differently in each work

The Seed doesn't address: at what point does "theme in Work A" become "Theme X" as a general principle?

### 4. Literary Criticism Frameworks

Different critical lenses produce different analyses:
- Marxist: class, capitalism, labor
- Feminist: gender, patriarchy, agency
- Psychoanalytic: unconscious, repression, dream analysis
- Structuralist: signs, binaries, language systems
- Post-colonial: race, identity, othering

One work can have multiple valid interpretations. The Seed's "confidence" system doesn't capture this.

### 5. Quote Organization

Quotes are unique:
- They're exact text from the work (not synthesis)
- They need attribution (book, chapter, page)
- They can be used as evidence for multiple themes
- Too many quotes fragment the knowledge base

### 6. Fiction vs. Non-Fiction

Non-fiction: knowledge is the facts themselves
Fiction: knowledge is the interpretation, themes, techniques

The Seed treats knowledge as "information about the world" but literature knowledge is "interpretation of crafted objects."

## Test Cases

### Test Case 1: Building a Harry Potter Knowledge Base

An AI would face these decisions:
1. Should "Harry Potter" be one note or split by book?
2. How to handle characters that appear across all books (Harry, Hermione, Ron)?
3. How to organize themes (friendship, death, power) — as general principles or work-specific?
4. How to tag spoiler knowledge (the entire series has been out for years, but new readers still exist)?
5. How to handle quotes — link to characters, themes, or both?

### Test Case 2: Building a Greek Mythology Knowledge Base

An AI would face:
1. Same myths retold by different authors (Hesiod vs. Ovid vs. modern retellings) — how to organize?
2. Characters that appear across myths (Zeus, Athena)
3. Themes that appear across myths (fate, hubris, transformation)
4. How to distinguish "the myth" (core story) from "interpretation" (what the myth means)

### Test Case 3: Literary Criticism Application

An AI analyzing "The Great Gatsby" would need to decide:
1. Should Marxist, feminist, and psychoanalytic analyses be separate notes or unified?
2. How to tag which framework each analysis uses?
3. How to indicate that interpretations are perspectives, not facts?

## Proposed Seed Extensions

### Rule: Use spoiler tagging for plot-revealing knowledge

**Why:** Literature knowledge often reveals plot elements. Without explicit spoiler tags, readers cannot choose whether to learn about plot twists. This is distinct from general "sensitivity" tagging because spoilers are specifically about narrative surprise.

**Test:** For notes containing plot-revealing content:
1. Is there `spoiler-level:` (minor|moderate|major|ending)?
2. Is there `spoiler-scope:` (character-reveal|plot-twist|ending|entire-work)?
3. Can readers filter results to exclude spoilers?

**Implementation:**
```yaml
spoiler-level: moderate  # reveals significant plot development
spoiler-scope: ending    # specifically reveals how the work ends
spoiler-opt-in: true     # requires reader acknowledgment
```

### Rule: Create character hub notes for persistent characters

**Why:** Characters that appear across multiple works, retellings, or adaptations are knowledge nodes that connect works together. Treating them as hubs (rather than splitting into work-specific character notes) preserves the connective value.

**Test:** For characters appearing in 3+ works:
1. Is there a central character hub note?
2. Does the hub link to each work where the character appears?
3. Can you find all appearances of a character in one place?

### Rule: Extract themes to principle notes when they appear in 3+ works

**Why:** A theme that appears in only one work is best kept as work-specific analysis. Once a theme recurs across 3+ works, it has "principleness" worth capturing as a standalone note.

**Test:** Before creating a theme principle note:
1. Does this theme appear in at least 3 different works?
2. Is the expression of the theme meaningfully different in each work?
3. Does the principle note reference specific examples from each work?

### Rule: Tag interpretive analysis notes with `interpretive-framework:`

**Why:** Literary criticism produces multiple valid interpretations. Unlike factual knowledge (where confidence tracks reliability), interpretive knowledge needs to track which analytical framework is being applied.

**Test:** For notes containing interpretive analysis:
1. Is there `interpretive-framework:` (marxist|feminist|psychoanalytic|structuralist|post-colonial|reader-response)?
2. Is it clear this is one interpretation among valid alternatives?
3. Can you find counter-interpretations from different frameworks?

### Rule: Use quote notes as evidence, not as primary knowledge

**Why:** Quotes themselves are not synthesis — they're direct text. The knowledge comes from the interpretation of the quote. Quotes should support principle or analysis notes, not stand alone as the primary knowledge.

**Test:** For quote-containing notes:
1. Is there a parent analysis note that the quote supports?
2. Does the quote note link to relevant themes, characters, or principles?
3. Can quotes be found via multiple paths (by character, by theme, by work)?

### Rule: Separate fiction knowledge into layers: work → element → interpretation

**Why:** Fiction knowledge has three distinct layers:
- **Work layer:** facts about the book itself (author, publication, genre)
- **Element layer:** characters, settings, plots, themes
- **Interpretation layer:** what the elements mean

Each layer has different atomicity and linking rules.

**Test:** For fiction notes:
1. Can you identify which layer each note belongs to?
2. Do higher layers link to lower layers?
3. Can you navigate from interpretation to element to work?

## Related

- [[Frontier Exploration - Single-Work Knowledge vs General Principles]]
- [[Frontier Exploration - Interpretive Knowledge]]
- [[Frontier Exploration - Multi-Perspective Knowledge]]
- [[Frontier Exploration - Emotional and Sentimental Knowledge]]
- [[AI-Assisted Knowledge Management Seed]]

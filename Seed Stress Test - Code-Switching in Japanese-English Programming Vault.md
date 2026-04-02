---
last-reviewed: 2026-03-29
last-updated: 2026-03-29
confidence: emerging
author-type: ai-assisted
lifecycle: active
meta-type: stress-test
schema-version: "1.0"
level: stress-test
test-target: "[[Seed Gap - Code-Switching and Translanguaging]]"
domain: programming-knowledge
test-scenario: Japanese-English bilingual programming vault
tags:
  - stress-test
  - code-switching
  - translanguaging
  - multilingual
  - bilingual
  - japanese-english
---

# Seed Stress Test - Code-Switching in Japanese-English Programming Vault

## Test Scenario

A knowledge base for a bilingual programmer who thinks primarily in Japanese but codes in English. Common real-world scenario: Japanese developers who write code, documentation, and comments in English but think and take personal notes in Japanese.

## Applying the Proposed Rules

### Proposed Rule 1: Code-Switching Policy

The proposed frontmatter:
```yaml
language-convention: monolingual|code-switching-allowed|code-switching-separate
```

**Test Case 1: Personal notes with mixed content**

A note titled "JavaScript async patterns" — the programmer's personal understanding written in Japanese mixed with English technical terms.

```markdown
# JavaScript async patterns

コールバック的地獄から逃れるには、async/await が必須。Promise を chain じゃなくて await で待つ meaning をちゃんと理解해야 해.

Key patterns:
- async function は promise を返す
- await で待てば sequential に見えるけど concurrent
- Error handling は try/catch が基本
```

**Stress test questions:**
1. Does `language-convention: code-switching-allowed` fit this note? YES
2. But the note mixes Japanese prose with English code terms AND has a Korean phrase ("meaningをちゃんと理解해야 해" — this is translanguaging into a THIRD language)
3. The proposed rule only handles 2 languages — what about the third?

**Finding 1:** The proposed `language-convention` field doesn't handle polyglot code-switching where 3+ languages appear naturally. Need `languages-used: [ja, en, ko]` as a more flexible alternative.

---

### Proposed Rule 2: Translation vs Translanguaging

**Test Case 2: Two approaches for the same knowledge**

**Approach A (translation):** Two parallel notes
- [[JavaScript async patterns (Japanese)]]
- [[JavaScript async patterns (English)]]

**Approach B (translanguaging):** One unified note with code-switching

**Stress test questions:**
1. Which approach better serves the programmer's actual use case?
2. When retrieving "how do I handle async errors", which note is found?
3. The programmer needs BOTH languages simultaneously — they're not choosing one

**Finding 2:** The proposed distinction assumes a choice between parallel vs. unified. But for personal working notes, the programmer WANTS translanguaging because their cognitive process is bilingual. Translation is for audience separation (Japanese speakers vs English speakers); translanguaging is for internal cognitive flow. The proposed rule doesn't capture this audience-vs-cognition distinction.

---

### Proposed Rule 3: Search Hierarchy

```yaml
search-hierarchy:
  primary: en
  secondary: [de, fr]
  fallback: other
```

**Test Case 3: Search behavior**

The programmer searches for "非同期 エラー handling" (async error handling in Japanese).

**Stress test questions:**
1. Does primary=English search return Japanese results? Not if Japanese is only in `fallback`
2. But English-technical terms (async, error) ARE the primary indexing language
3. The Japanese is explanatory context, not the technical content

**Finding 3:** Search hierarchy is backwards for technical bilingual vaults. The technical terms (async, error) are in English; the explanatory context (非同期, エラー) is in Japanese. The proposed rule assumes content-language priority, but for technical domains, terminology-language priority matters more.

**Revised approach:**
```yaml
search-hierarchy:
  terminology-primary: en  # Technical terms are indexed in English
  context-primary: ja  # Explanatory context is in Japanese
  fallback: translanguaging
```

---

### Proposed Rule 4: Terminology Mapping

The proposed rule asks for "terminology mapping notes that show equivalent terms across languages."

**Test Case 4: Domain-specific terminology**

| English | Japanese | Notes |
|---------|----------|-------|
| async/await | 非同期関数/await | 日本語では「非同期関数」が一般的 |
| Promise | 約束ではない！プロミス | Common confusion for Japanese learners |
| callback | コールバック | Often used as-is |
| error handling | エラー処理 | Standard translation |
| await | await（非同期処理の完了を待つ） | Often kept as katakana |

**Stress test questions:**
1. Does a flat terminology list capture the nuance? Not really.
2. "Promise" → "約束" is WRONG (semantic false friend) — this needs explicit warning.
3. Each term has different "naturalness" — some stay in English, some translate, some hybrid

**Finding 4:** Terminology mapping needs more structure than just a table. Need:
- `term-status: natural-loanword | hybrid | full-translation | false-friend-warning`
- `usage-note:` explaining when to use which
- `community-norm:` documenting how Japanese programmers actually talk about this

---

## Edge Cases from Stress Testing

### Edge Case 1: Technical English Dominance

In programming, English is the universal technical language. Japanese developers often:
- Use English variable names, function names, documentation
- Mix English and Japanese based on what they're doing (coding in English, explaining in Japanese)

The proposed rules treat languages as co-equal, but in technical domains English has structural dominance (it's the syntax) while Japanese has explanatory/communicative role.

**Refinement:** For technical vaults, add `technical-language: en` (the language of the technical content) separate from `context-language: ja` (the language of explanation).

### Edge Case 2: Code-Switching as Cognitive Process

For personal notes, code-switching isn't "messy" — it's how the bilingual brain actually works. The programmer isn't translating; they're expressing bilingual thought.

The proposed rule says "document code-switching policy" — but policy implies rules about what's allowed. For personal cognitive expression, the "policy" is just "capture how I think."

**Refinement:** For personal cognitive vaults, replace `language-convention` with `cognitive-mode: bilingual-integrated | bilingual-separated | monolingual-with-translation`.

### Edge Case 3: Search vs. Navigation

The proposed search hierarchy assumes users search in one language. But bilingual users often:
- Remember terms in one language but not the other
- Know what English term they want but not the Japanese
- Know the Japanese concept but not the English term

**Refinement:** Both-language search with cross-language linking is more valuable than hierarchy. A "bidirectional terminology index" that links English ↔ Japanese concepts bidirectionally.

---

## Refined Proposed Rule

Based on stress testing, the proposed rule needs refinement:

```markdown
**Rule (REFINED):** For multilingual knowledge bases, determine cognitive model before choosing organizational structure.

**Cognitive models:**
- `cognitive-model: monolingual` — One language primary, others as lookup
- `cognitive-model: bilingual-integrated` — Multiple languages used naturally in single thought (code-switching/translanguaging as cognitive process)
- `cognitive-model: bilingual-separated` — Languages used for different audiences/purposes

**For bilingual-integrated vaults:**
- Use `languages-used: [lang1, lang2, ...]` frontmatter (multi-language, not single convention)
- Tag technical terminology separately from explanatory context
- Create bidirectional terminology indexes, not hierarchical search
- Use `language-role:` frontmatter per note: `technical-primary | context-primary | mixed`

**For bilingual-separated vaults:**
- Use `language-convention: separate-notes | same-note-translation` per domain
- Apply normal search hierarchy (primary/secondary/tertiary)
- Create terminology maps that preserve distinction between translation equivalence and conceptual equivalence

**Test:**
1. Can you determine the cognitive model of the vault?
2. For bilingual-integrated: Are multiple languages handled as natural co-occurrence?
3. For bilingual-integrated: Is there a bidirectional terminology index?
4. For bilingual-separated: Can users find content in their preferred language?
5. For technical vaults: Is technical language (English for programming) separated from explanatory context?

**See also:** [[Frontier Exploration - Multi-Language Knowledge Bases]]
```

---

## What Didn't Work in the Original Proposed Rule

1. **Single `language-convention` value** — Too rigid for multi-language code-switching
2. **Translation vs Translanguaging as choice** — Ignores cognitive integration as third option
3. **Search hierarchy assumes content priority** — Fails for technical domains where terminology and explanation use different languages
4. **Flat terminology mapping** — Doesn't capture term status (natural loanword vs false friend)

## What the Stress Test Taught About Knowledge Bases

1. **Cognitive model matters more than language count** — The reason for using multiple languages determines organizational structure
2. **Technical domains have inherent language hierarchy** — English dominates for syntax, native language for explanation
3. **Bidirectional linking > hierarchical search** — Bilingual users need both directions, not just primary→secondary
4. **Term status is metadata, not just translation** — A term's community acceptance varies and this is valuable knowledge

## Next Steps

- [ ] Validate refined rule against a Japanese-Spanish bilingual scenario (different language family)
- [ ] Test against a heritage language learner vault (different cognitive model)
- [ ] Check if `cognitive-model` distinction applies to other Seed rules (perhaps similar to `advisory-level` distinction)

---

*This stress test refined the proposed Seed Gap rules for code-switching. The original proposal was theoretical; this test applied it to a real scenario and found it needed significant refinement for technical bilingual vaults.*
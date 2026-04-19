---
last-reviewed: 2026-04-09
lifecycle: redirect
redirect: true
redirect-target: Voice and Persona Consistency - Consolidated
tags:
  - redirect
  - seed-stress-test
  - voice-consistency
  - consolidated
---

# Redirect

This stress test has been consolidated into [[Voice and Persona Consistency - Consolidated]], which contains the refined rule and test.

## Rule Under Test

**Proposed Rule:** Define vault voice standard in frontmatter — for vaults where AI agents contribute content, specify `vault-voice: formal|technical|casual|friendly|academic` and apply consistent tone to all AI-generated notes.

**Proposed Test:** (1) Does the vault have `vault-voice:` defined? (2) Do AI-generated notes consistently follow this voice? (3) Is there a mechanism to detect voice drift? (4) Can you distinguish AI-generated from human-authored content by tone alone?

---

## Domain Stress Tests

### Test 1: Cooking Knowledge Base

**Scenario:** A home cook maintains a personal recipe vault.

**Analysis:**
- Domain expectation: Casual, practical, friendly tone
- Current state: Recipes are inherently informal ("Add a pinch of salt" not "One should add sodium chloride at 0.3% concentration")
- Voice rule application: `vault-voice: casual` or `vault-voice: friendly`

**Edge Case Found:**
- Recipe steps need imperative voice ("Add the flour") - this is inherent to the domain, not voice drift
- Culinary techniques might need technical terms (Sous vide, emulsification) - this is domain vocabulary, not voice

**Test Executability Issue:**
- The test asks "Can you distinguish AI-generated from human-authored content by tone alone?" - This is actually hard to verify objectively. Tone is subjective.

**Refinement Needed:** The rule should distinguish domain-appropriate technical vocabulary from voice inconsistency.

---

### Test 2: Legal Knowledge Base

**Scenario:** A paralegal maintains case law references and legal procedures.

**Analysis:**
- Domain expectation: Formal, precise, academic tone
- Current state: Legal documents inherently use formal language
- Voice rule application: `vault-voice: formal` or `vault-voice: academic`

**Edge Case Found:**
- Jurisdiction-specific terminology (stare decisis, res judicata) - technical vocabulary expected
- Different voice for client-facing vs. court-facing documents
- AI-generated notes might actually be MORE formal than human-written (AI tends toward formal)

**Test Executability Issue:**
- "Detect voice drift" - How? No automated mechanism exists in current tooling

---

### Test 3: Music Composition Knowledge Base

**Scenario:** A composer maintains a vault of composition techniques and music theory.

**Analysis:**
- Domain expectation: Technical but with aesthetic discussion
- Current state: Mix of technical notation (chord progressions, time signatures) and expressive discussion (mood, feel, artistic intent)
- Voice rule application: `vault-voice: technical`

**Edge Case Found:**
- Hybrid content: Technical instructions ("Resolve the leading tone to the tonic") but also aesthetic guidance ("create a sense of tension that releases beautifully")
- Different voice for theory vs. composition tips

**Finding:** Music composition is a hybrid domain (technical + aesthetic) - single voice might not fit all notes.

---

## Rule Refinement

### Original Proposed Rule

> Define vault voice standard in frontmatter — specify `vault-voice: formal|technical|casual|friendly|academic` and apply consistent tone to all AI-generated notes.

### Issues Identified

1. **One-size-fits-all fails for hybrid domains** - Music composition has both technical and aesthetic content
2. **Test criterion 3 "detect voice drift" is not executable** - No tooling to automatically detect tone inconsistency
3. **Test criterion 4 is subjective** - "Distinguish by tone alone" is hard to verify objectively
4. **Domain vocabulary vs. voice inconsistency** - Technical terms are not voice drift

### Refined Rule

**Rule:** Define vault voice standard in frontmatter with domain-aware defaults — for vaults where AI agents contribute content, specify `vault-voice:` based on domain norms, but allow `voice-mode: mixed` for domains that naturally span multiple tones. Apply voice consistency within each defined mode.

```yaml
vault-voice: formal|technical|casual|friendly|academic|mixed
voice-mode: single|mixed  # single = consistent across all notes, mixed = varies by note type
voice-domain-guidance: "Brief guidance on when each voice applies"
```

**Why:** Some domains naturally require multiple voices (music: technical for theory, friendly for tips). Single voice rule is too restrictive. Domain-appropriate defaults prevent unnatural tone.

**Test (Revised):**
1. Does the vault have `vault-voice:` defined?
2. If voice-mode is "single," do all AI notes consistently follow that voice?
3. If voice-mode is "mixed," is there clear guidance on when each voice applies?
4. Is there a documented mechanism to review voice consistency? (manual checklist acceptable)

**Edge Cases:**
- Multi-audience vaults (internal technical, external friendly) - use context-frame tagging
- Voice evolution over time (vault starts casual, becomes more formal) - track voice history
- User preference override - allow user to set preferred voice for their view

---

## Conclusion

| Aspect | Original | Refined |
|--------|----------|---------|
| Domain applicability | Universal | Domain-aware with mixed mode |
| Test executability | Partially subjective | More objective |
| Edge case handling | Not addressed | Explicit mixed mode |
| Hybrid domain support | Fails | Supported |

**Recommendation:** Add the refined rule to the Seed with voice-mode distinction. The test is now more executable - checking for frontmatter presence and consistency within defined mode is verifiable.

---

## Related Notes

- [[Seed Gap - Knowledge Base Voice and Persona Consistency]] - Original gap note
- [[Frontier Exploration - Knowledge Base Voice and Persona Consistency]] - Frontier exploration
- [[AI-Assisted Knowledge Management Seed]] - Base Seed
- [[Frontier Exploration - Knowledge Intent]] - Related to technical vs. aesthetic content distinction
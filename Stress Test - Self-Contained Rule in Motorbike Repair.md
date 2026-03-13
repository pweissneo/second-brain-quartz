---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - seed-stress-test
  - tacit-knowledge
  - domain-uncrafted
---

# Stress Test: Tacit Knowledge Capture in Motorbike Repair

## Seed Rule Being Tested

**Rule:** Each note must be self-contained — readable without clicking any links.
**Test:** Read the note in isolation. Does it make sense without following any links?

## Domain: Motorbike Repair

Motorbike repair is an excellent stress test for tacit knowledge because:
1. Heavy reliance on "feel" and sensory feedback
2. Many procedures depend on tacit knowledge (knowing by doing)
3. Verbal instructions often incomplete without hands-on experience
4. Troubleshooting requires intuition built through experience

## Scenario 1: Clutch Adjustment

**Note content:**
"Adjust the clutch free play to 2-3mm at the lever. Turn the adjuster until you feel a slight resistance."

**Analysis:**
- Is it self-contained? Partially — "2-3mm" is specific, but "feel a slight resistance" is tacit
- What the note captures: specific measurement
- What's missing: the physical feel of "slight resistance" — a beginner won't know what that feels like
- The tacit knowledge: recognizing the exact point where tension begins

**Edge case discovered:** Tacit knowledge resists full capture in text. The Seed rule assumes knowledge CAN be self-contained, but some knowledge inherently cannot be fully articulated.

## Scenario 2: Carburetor Tuning

**Note content:**
"Set the idle mixture screw to 2.5 turns out from seated. Then adjust the idle speed to 1200 RPM."

**Analysis:**
- Is it self-contained? Yes — numbers are precise
- But: The note assumes you know how to "feel" for the correct idle behavior
- Tacit element: Knowing when the engine "sounds right" vs. "something's off"
- What experience provides: audio recognition of engine states

**Edge case discovered:** Even precise numbers require tacit calibration. "2.5 turns" assumes you know what the starting position feels like.

## Scenario 3: Chain Tension

**Note content:**
"Check chain sag. With the bike on its center stand, the chain should sag 15-20mm when pressed halfway between sprockets."

**Analysis:**
- Is it self-contained? Yes — measurement provided
- Tacit knowledge: How hard to "press" — too light gives false reading, too heavy compresses suspension
- What experience teaches: the right amount of pressure

**Edge case discovered:** Measurement requires tactile calibration that varies by bike weight, suspension setup, and rider technique.

## Scenario 4: "Knowing When Something's Wrong"

**Note content:**
"Listen to the engine. If it sounds normal, proceed. If something sounds off, investigate further."

**Analysis:**
- Is this self-contained? NO — "sounds normal" means nothing without experience
- What makes it tacit: There's no way to define "normal" in text for someone who's never heard this specific engine
- Even recording wouldn't help: different engines sound different

**Major edge case discovered:** Some knowledge cannot be captured textually AT ALL. The self-containment rule fails for inherently experiential knowledge.

## Rule Refinements Needed

### For tacit knowledge domains:

1. **Acknowledge the boundary:** Some knowledge cannot be fully captured. Notes should explicitly mark where written knowledge ends.

2. **Add failure-mode descriptions:** Instead of "when it sounds right," describe what goes wrong: "If the engine stumbles at low RPM, the mixture is too lean."

3. **Use proxies and analogies:** "The clutch engagement feels like... [analogy]" — some people understand through comparison.

4. **Multi-media guidance:** For highly tacit domains, text is insufficient. Notes should flag where video demonstration or hands-on training is required.

5. **Explicit gap markers:** Add `tacit-knowledge: high` to frontmatter when a note relies on experiential understanding.

## Test for AI Agents

Given a note in a tacit-knowledge domain:
1. Does the note use subjective language ("feel," "sounds," "right") without definition?
2. Could a complete beginner follow this without additional context?
3. Is there failure-mode guidance (what goes wrong) as backup?
4. Should this note explicitly acknowledge its tacit boundaries?

## Related
- [[Frontier Exploration - Tacit Knowledge Capture]]
- [[Stress Test - Self-Contained Notes Rule Across Domains]]
- [[AI-Assisted Knowledge Management Seed]]

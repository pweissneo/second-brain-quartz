---
knowledge-type: meta
access-pattern: lookup
verification-status: unverified
author-type: ai-assisted
schema-version: "1.0"
last-reviewed: 2026-04-04
last-updated: 2026-04-04
lifecycle: staging
confidence: emerging
tags:
  - seed-refinement
  - interaction-mode
  - knowledge-presentation
  - context-dependent
---

# Seed Refinement - Interaction Mode Specification

> Refinement to address [[Seed Gap - Interaction Mode Specification]]

## Proposed Integration

This refinement proposes integrating interaction mode rules into the Seed to complement existing context-frame rules.

## Rule: Interaction Mode Tagging

**Rule:** Identify and tag knowledge with its primary interaction mode — performative (executed step-by-step), exploratory (browsed and discovered), compressed (quick recall under stress), progressive (designed for learning), or comparative (decision-making between options).
**Why:** Different consumption contexts require different structures. A recipe as an exploratory concept graph fails in the kitchen; emergency steps as exploratory prose fails in crisis. Mode identification ensures knowledge serves its primary use context.
**Test:** For any note, can you identify its primary interaction mode? Could someone in that use context use it effectively without manual restructuring?

**Implementation:**
```yaml
interaction-mode: performative|exploratory|compressed|progressive|comparative
```
- **performative**: Step-by-step execution, measurements inline, no links required during use
- **exploratory**: Rich connections, links to background, conceptual exploration
- **compressed**: Minimal text, bold actions, single-view retrieval
- **progressive**: Sequential complexity, clear prerequisites, learning path
- **comparative**: Options laid out, trade-offs explicit, criteria visible

## Rule: Mode-Specific Optimization

**Rule:** For high-frequency use contexts (kitchen use, emergency response, quick reference), maintain mode-optimized representations alongside reference versions.
**Why:** One-size-fits-all representation loses the specific benefits of each mode. Knowledge that is actively used in specific contexts should be optimized for those contexts.
**Test:** For knowledge frequently used in distinct contexts, is there a mode-optimized version?

**Implementation:** Create variant notes with mode-specific suffixes:
- `Recipe Name.md` (reference version)
- `Recipe Name - Kitchen Use.md` (performative version)
- `Recipe Name - Quick Reference.md` (compressed version)

Or use frontmatter for mode switching:
```yaml
mode-variants:
  - mode: performative
    note: [[Recipe Name - Kitchen Use]]
  - mode: compressed  
    note: [[Recipe Name - Quick Reference]]
```

## Rule: Emergency Knowledge Compression

**Rule:** For knowledge tagged `emergency-knowledge: true`, create a compressed-mode version with single-view retrieval and minimum confidence thresholds.
**Why:** Crisis domains require execution under stress. Standard navigation and verification assumptions fail when seconds count.
**Test:** For emergency notes: Is there a compressed version that requires no navigation to other notes?

**Compressed emergency format:**
- Single sentence action: "DO X → Y → Z"
- No explanatory links during crisis
- Visual flowchart for panic-state retrieval
- Full explanation in separate background note

## Relationship to Context Frame

| Dimension | Context Frame | Interaction Mode |
|-----------|--------------|------------------|
| Question | "For whom?" | "How consumed?" |
| Current field | `context-frame` | `interaction-mode` (proposed) |
| Examples | tutorial, reference, patient-education | performative, exploratory, compressed |

These are orthogonal and should be used together:
```yaml
context-frame: tutorial
interaction-mode: progressive
```

## Concrete Example: First Aid Choking Response

The gap manifests clearly in emergency knowledge:

| Aspect | Current Seed Coverage | Interaction Mode Gap |
|--------|----------------------|---------------------|
| Context Frame | Can tag `context-frame: emergency` | ✓ Covered |
| Knowledge Type | Can tag `knowledge-type: procedural` | ✓ Covered |
| Interaction Mode | No equivalent field | ✗ Missing |

When a user is actually choking, they cannot:
- Follow wikilinks to explore "airway obstruction" concepts
- Read explanatory paragraphs about why Heimlich works
- Browse multiple notes to find the right technique

They need: **compressed performative mode** — single step, bold action, no links.

Current Seed produces:
```markdown
## Choking Response
1. Stand behind the person [[Heimlich Maneuver]]
2. Make a fist at [[Abdomen Location]]
3. Press inward and upward
```

Missing the compressed version:
```markdown
**CHOKING: DO THIS NOW**
Stand behind → Fist above navel → Press up and in → Repeat
```

This demonstrates why interaction mode is orthogonal to context frame: the Seed enables correct tagging but doesn't guide creating mode-specific representations.

## Gap Resolution Status

- [x] Gap identified
- [x] Domain stress test conducted (cooking, first aid)
- [x] Refined rules with test criteria  
- [x] Integration pathway with existing context-frame rules

**Ready for:** Seed integration

## Related

- [[Seed Gap - Interaction Mode Specification]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Frontier Exploration - Context-Dependent Knowledge Interaction]]
- [[Frontier Exploration - Emergency and First-Aid Knowledge in Knowledge Bases]]

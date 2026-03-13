---
last-reviewed: 2026-03-13
lifecycle: evergreen
confidence: emerging
knowledge-type: analysis
tags:
  - seed-stress-test
  - woodworking-domain
  - edge-case
---

# Seed Stress Test: Woodworking Knowledge Base

Testing Seed rules against the woodworking domain reveals unique challenges for managing craft knowledge.

## Domain Overview

Woodworking knowledge bases face distinct challenges:
- Procedural content (project plans, techniques) legitimately exceeds 300+ words
- Tool-specific knowledge (each tool has unique techniques)
- Material-dependent knowledge (wood species, grain, working properties)
- Sequential knowledge (project steps must follow logical order)
- Safety-critical content (inherent risks in power tools)
- Regional variation (terminology differs US/UK/EU)
- Skill progression (hand tools → power tools → machines)

---

## 1. Word Count / Atomicity Rule

**Rule:** Notes should be 100-300 words. Notes >300 likely contain multiple ideas.

**Woodworking Application:**
- Project plans: 1000+ words covering materials, cuts, assembly
- Technique explanations: 400-600 words for complex joints
- Tool reviews: 300-800 words covering features, usage, safety

**Edge Cases:**

1. **Complete project plans**: "Build a Dining Table" at 1500 words
   - Verdict: Procedural content - user executes linearly
   - Split only if parts are independently reusable (e.g., "Table Leg Styles" as separate note)

2. **Compound techniques**: "Through Tenon joinery" - combines concept + procedure
   - Verdict: Keep together; technique and execution are inseparable

3. **Tool comparison**: "Table Saw vs Track Saw" at 400 words
   - Verdict: Single comparative note is appropriate - comparison IS the insight

**Proposed Refinement:**
> For craft/procedural domains: Apply atomicity test first (one idea), then word count as secondary. If the note is a complete executable procedure or comprehensive single-topic comparison, length is acceptable.

**Related:** [[Atomic Note Principle]], [[Note Types and Templates]]

---

## 2. "At Least 2 Links" Rule

**Rule:** Every note must link to at least 2 other notes OR be tagged `foundational: true`.

**Woodworking Application:**
- "Dovetail Joint" → links to "Joinery Techniques," "Hand Tools"
- "Hardwood Flooring" → links to "Wood Species," "Finishing Techniques"

**Edge Cases:**

1. **Truly foundational primitives**: 
   - "Wood" - the fundamental material, everything references it
   - "The Workbench" - central to almost all hand-tool work
   - "Measurement" - foundational to all construction
   - These should have `foundational: true`

2. **Single-tool notes**: "Block Plane" - only naturally connects to "Hand Planes" and "Edge Jointing"
   - Verdict: Accept single link OR add "Woodworking Tools" as second link

3. **Material-specific notes**: "Walnut" - links to "Hardwood Species" and "Decorative Woods"
   - Verdict: Accept 2 links; not all wood species need extensive connections

4. **Safety notes**: "Table Saw Safety" - could link to "Table Saw" and "Safety Equipment"
   - Verdict: All safety notes should be mandatory linked from relevant tool notes

**Issue:** The rule doesn't distinguish "must link" (safety) from "should link" (general knowledge)

**Proposed Refinement:**
> Add `safety-critical: true` frontmatter for notes that MUST be linked from related tool/technique notes. AI agents should flag any safety note with <2 incoming links.

**Related:** [[Hub Node Creation]], [[Frontier Exploration - Equipment and Tool Dependencies]]

---

## 3. No Zero Backlinks Rule

**Rule:** Every note should be linked to from at least one other note.

**Woodworking Application:**
- Techniques link to projects using them
- Projects link to required techniques
- Tools link to projects and techniques

**Edge Cases:**

1. **Universal materials**: "Wood" - referenced in 200+ notes but links out to species
   - Verdict: High inbound, low outbound - acceptable

2. **Navigation hubs**: "List of Woodworking Joints" - aggregates but nothing links TO it
   - Verdict: Hub notes may legitimately have zero backlinks if they're truly indexes

3. **Obsolete techniques**: "Wattle and Daub" - historical, few references
   - Verdict: Either link from "Woodworking History" hub or deprecate

4. **New/emerging tools**: "CNC Routing" - might have zero backlinks in traditional vault
   - Verdict: Link from "Modern Woodworking" or "Computer-Aided Manufacturing" hub

**Proposed Refinement:**
> Allow zero backlinks for: (a) universal/primitive elements, (b) pure navigation hubs, (c) notes explicitly tagged `index: true`. All other notes require ≥1 backlink.

---

## 4. Every Link Must Be Explainable

**Rule:** Every link must be explainable in one sentence - no decorative links.

**Woodworking Application:**
- "Dovetail Joint" → "Provides mechanical interlock for strong joints" ✓
- "Walnut" → "Beautiful hardwood for furniture" ✓

**Edge Cases:**

1. **Tool-brand links**: "Lie-Nielsen Chisels" → link to "Chisels" or "Premium Hand Tools"
   - Verdict: Acceptable - brand represents quality tier

2. **Regional terminology**: "Miter" (US) and "Mitre" (UK) - should cross-link
   - Verdict: Create bidirectional links with note that they're the same thing

3. **Historical terms**: "Rasp" → "Coarse file for wood shaping"
   - Verdict: Acceptable - historical terms need modern equivalents

**Issue:** Tool brand notes might seem promotional but serve quality-signaling purpose

**Proposed Refinement:**
> Links to commercial products/brands are acceptable when they represent quality tiers or are genuinely relevant. Test: "Does this link help the reader make a decision or understand a distinction?"

---

## 5. Terminology Consistency

**Rule:** Pick one term per concept and use it everywhere.

**Woodworking Application:**
- US: "Miter saw" / UK: "Chop saw" - same tool
- US: "Poplar" / UK: "Tulip wood" - same species
- Regional variants: "Ply" vs "Plywood sheet"

**Edge Cases:**

1. **Deliberate synonyms**: "Workmate" (brand) vs "Portable Workbench" (generic)
   - Verdict: Use generic, note brand as alias

2. **Regional standards**: "2x4" (US nominal) vs "38x89mm" (actual metric)
   - Verdict: Note both; both are correct in their contexts

3. **Technical vs common**: "Forstner bit" (correct) vs "Flat-bottom bore bit" (descriptive)
   - Verdict: Use correct technical term, add common as alternative

**Proposed Refinement:**
> For domain-specific terms: Use standard terminology (industry norms). Add redirect notes for regional variants. Test: "Would a professional in this field recognize this as correct?"

---

## 6. Procedural Content vs Conceptual

**Rule:** Distinguish conceptual notes from procedural content.

**Woodworking Application:**

| Note Type | Category | Example |
|-----------|----------|---------|
| "How to Cut a Dovetail" | Procedural | Keep together |
| "Dovetail Joint Strength" | Conceptual | Atomic - ~200 words |
| "Dining Table Project" | Procedural | Keep together |
| "Wood Movement" | Conceptual | Atomic - ~250 words |

**Edge Cases:**

1. **Hybrid notes**: "Tung Oil Finishing Guide" - concept + procedure combined
   - Verdict: Split into "Tung Oil Properties" and "Applying Tung Oil Finish"

2. **Troubleshooting guides**: "Why Your Joints Are Gaps" - problem + solution
   - Verdict: Keep together - troubleshooting is inherently hybrid

**Proposed Refinement:**
> If a note has distinct "theory" and "how-to" sections >100 words each, consider splitting. Troubleshooting guides are exempt - they're inherently problem-solution paired.

---

## 7. Expertise Level Tagging

**Woodworking Application:**

| Level | Notes |
|-------|-------|
| beginner | "How to Use a Hand Plane," "Measuring Basics" |
| intermediate | "Tuning a Hand Plane," "Joinery Fundamentals" |
| advanced | "Steam Bending," "Veneering" |
| expert | "Chair Design," "Compound Curvature" |

**Issue:** No explicit Seed rule for expertise tagging in current test

**Proposed Refinement:**
> Add to Seed: "Tag notes with `level:` (beginner/intermediate/advanced/expert) and create gateway notes for each level."

---

## 8. Safety-Critical Knowledge

**Unique to Woodworking:**

Safety content is mandatory for power tools. Missing a safety link could cause injury.

**Proposed Addition to Seed:**

> **Rule:** Safety-critical notes must have ≥2 incoming links from related tool/technique notes.
> **Why:** Missing safety information causes harm; redundant safety links ensure coverage.
> **Test:** For each tool note, does it link to ≥1 safety note? For each safety note, does it have ≥2 incoming links from related tools?
> **Implementation:** Use frontmatter `safety: critical` and require AI agents to audit links.

---

## Summary of Proposed Seed Refinements

1. **Procedural content**: Length acceptable if single coherent procedure; split only if parts are independently reusable AND >1000 words

2. **Foundational primitives in craft domains**: Tools (workbench, saw, chisel), Materials (wood, adhesive, finish), Safety equipment

3. **Safety-critical metadata**: Add `safety: critical` frontmatter with mandatory linking requirements

4. **Expertise level tagging**: Require `level:` frontmatter for all notes in skill-based domains

5. **Regional terminology**: Create redirect notes for US/UK/EU variants

6. **Hub exemptions**: Pure navigation indexes may have zero backlinks

**Related:** [[Seed Stress Test - Cooking Knowledge Base]], [[Seed Stress Test - Chess Knowledge Base]], [[Frontier Exploration - Tool-Interface Knowledge]]

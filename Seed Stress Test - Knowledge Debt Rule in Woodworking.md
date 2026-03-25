---
last-reviewed: 2026-03-19
last-updated: 2026-03-19
lifecycle: evergreen
confidence: emerging
author-type: ai-assisted
---

# Seed Stress Test: Knowledge Debt Rule in Woodworking

> This note tests the Knowledge Debt rule from [[AI-Assisted Knowledge Management Seed]] against woodworking domain characteristics.

## Rule Under Test

> **Rule:** Track knowledge debt explicitly — monitor verification backlog, staleness, structural decay, redundancy, and retrieval noise as a composite debt score.
> **Test:** Calculate debt score: (V×0.25)+(S×0.25)+(D×0.20)+(R×0.15)+(N×0.15) where V=verification debt (% unverified/100), S=staleness debt (% stale/100), D=decay debt (broken links/total links), R=redundancy debt (duplicate potential/total), N=noise debt (unused notes/total). Score <0.15 = healthy; 0.15-0.30 = moderate; 0.30-0.50 = high; >0.50 = critical.

## Domain Characteristics: Woodworking

Woodworking knowledge bases have unique characteristics that stress test this rule:

1. **Long-horizon verification**: Projects take weeks/months (building a cabinet, finishing a table). Verification cannot happen in 30 days.
2. **Material-specific knowledge**: Wood species, grain direction, moisture content all affect outcomes - knowledge that works for one material may fail for another.
3. **Tool-dependent techniques**: A technique that works with hand tools may not work with power tools, and vice versa.
4. **Seasonal constraints**: Finishing work (paint, stain, lacquer) requires temperature/humidity control -只能在特定季节验证。
5. **Experience-dependent**: What works for an expert may fail for a beginner due to hand skill differences.

## Stress Test Questions

### Question 1: Does the verification debt formula work for woodworking?

The formula uses a 30-day verification window. In woodworking:
- A joinery technique might need 6+ months to verify (need to build multiple projects using the joint)
- A finish might need seasons to verify (how it ages, how it reacts to humidity changes)
- A wood movement calculation might need years to verify (does the furniture actually stay stable?)

**Edge case not covered**: The standard 30-day verification window is inappropriate for woodworking. The rule should add a domain-specific multiplier for experiential craft domains.

### Question 2: Is the staleness test appropriate?

Notes about tool settings (table saw blade height, jointer depth) may be "stale" by the standard but are still accurate - the tool hasn't changed. This is different from "time-stale" knowledge.

**New detection type needed**: Equipment-stale - knowledge that was accurate but the tool/setup has changed. Requires tracking tool/model information in frontmatter.

### Question 3: Does the test account for tool version dependencies?

Woodworking tools evolve (new saw models, new router versions). Knowledge about "how to tune a Dewalt DW735" applies to that specific planer thicknesser. The rule doesn't account for tool-specific knowledge vs. general principles.

**Gap identified**: The rule treats all knowledge the same, but tool-specific knowledge has higher decay rates than technique principles.

### Question 4: Is noise debt applicable?

Notes about specific projects (building this specific cabinet) might have low retrieval frequency but high value when retrieved - the "3-month access rule" doesn't apply to project-specific notes.

**Edge case**: Project notes are inherently low-frequency but high-value. The noise debt calculation would incorrectly flag these as "dead knowledge."

## Test Verification

For a woodworking knowledge base with 50 notes:
- V (verification debt): Would be very high by standard measures (>60%) because most techniques can't be verified in 30 days
- S (staleness debt): Moderate - tool-specific notes go stale when tools change
- D (decay debt): Low - links rarely break in a small vault
- R (redundancy debt): Could be high if similar techniques across wood species are not merged
- N (noise debt): Low - even low-frequency project notes are valuable

**The standard debt score would indicate "critical" when the vault is actually healthy** - this is a false positive that would cause unnecessary alarm.

## Proposed Additions to Seed

### Edge case for craft/experiential domains:

```yaml
# For woodworking/crafts notes
verification-cycle: long-horizon  # vs standard (30d)
verification-months-required: 6-24  # minimum verification timeline
decay-rate: tool-specific|technique-principle|material-specific
tool-specific-knowledge: true  # flags knowledge tied to specific tools
```

### Modified debt calculation for long-horizon verification domains:

When `verification-cycle: long-horizon` is present, exclude from V calculation or apply domain-appropriate threshold (e.g., 60% instead of 40% for woodworking).

### Equipment-stale detection:

Track `equipment-model:` in frontmatter. When equipment changes, flag related notes as "equipment-stale" rather than "time-stale."

## Related Seed Rules
- [[AI-Assisted Knowledge Management Seed]] — The Knowledge Debt rule under test
- [[Seed Stress Test - Verification Ratio Rule in Woodworking]] — Overlapping content on verification timing for craft domains (covers similar edge cases)
- [[Knowledge Base Workflow]] — Verification and maintenance workflows
- [[Note Lifecycle Management]] — Note aging and staleness tracking
- [[Seed Stress Test - Staging Rule in Cooking Domain]] — Similar domain stress test
- [[Seed Stress Test - Construction Phase Model in Music Composition]] — Another craft domain test
- [[Frontier Exploration - Infrastructure-Dependent Knowledge]] — Tool-specific knowledge patterns

## Related Domain Notes
- [[Frontier Exploration - Amateur Astronomy Knowledge Bases]] — Long-horizon verification similar issues
- [[Stress Test - Note Lifecycle Rule Across Domains]] — Lifecycle tracking across domains
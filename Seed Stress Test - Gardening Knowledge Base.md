---
last-reviewed: 2026-03-17
lifecycle: active
confidence: emerging
author-type: ai-assisted
knowledge-type: analysis
tags:
  - seed-stress-test
  - gardening-domain
  - edge-case
  - long-horizon
---

# Seed Stress Test: Gardening Knowledge Base

Testing Seed rules in the gardening domain reveals unique challenges around long-horizon verification, climate specificity, and seasonal knowledge.

## Domain Overview

Gardening knowledge bases face unique challenges:
- Long verification timelines (perennials take years to assess)
- Climate zone specificity (hardiness zones, frost dates)
- Seasonal knowledge (planting windows, harvest timing)
- Perennial vs annual distinction affects note lifecycle
- Experiential knowledge requires hands-on testing
- Weather variability affects reliability

---

## 1. Verification Timeline: Long-Horizon Knowledge

**Seed Rule:** Track verification ratio — verify at least 50% of new captures within 30 days.

**Gardening Application:**

### Edge Case: Multi-Year Verification

**Problem:** A note about "growing tomatoes" might describe a technique that works in year 1 but fails in year 2 (soil depletion, perennial pest buildup). A fruit tree might take 3-5 years to truly assess whether the variety thrives in your climate.

**Analysis:** Standard 30-day verification window is impossible for gardening. The Seed already has edge case for "long-horizon verification domains."

**Current Seed Edge Case:** "Use `verification-cycle:` field with values `annual|multi-year|perennial`"

**Test:** For gardening notes:
1. Is there a `verification-cycle:` field?
2. For perennial plants: has it survived 2+ growing seasons?
3. Does `verification-completion-target:` account for multi-year timelines?

### Edge Case: Weather Variability

**Problem:** One year's success may be due to favorable weather, not good technique. Need multiple years to confirm.

**Test:** Do notes distinguish "worked once in favorable conditions" from "consistently successful across multiple seasons"?

### Solution

The existing Seed edge case for long-horizon domains is appropriate. Apply it consistently to gardening notes:
- Annual vegetables: `verification-cycle: annual` (can verify in one growing season)
- Perennials (fruit trees, shrubs): `verification-cycle: multi-year` (needs 2-3 years)
- Perennial herbs: `verification-cycle: perennial` (hardy perennials may need longer)

---

## 2. Climate Zone Specificity

**Seed Rule:** Use explicit scope tags for context-dependent knowledge.

**Gardening Application:**

### Edge Case: Hardiness Zones

**Problem:** "This plant is hardy" means nothing without zone specification. "Zone 5" vs "Zone 9" determines survival.

**Test:** Do plant notes include:
- `hardiness-zone:` or `climate-type:`?
- Is there a `context-gate:` for zone-specific applicability?

### Edge Case: Frost Dates

**Problem:** "Plant after last frost" varies by 2+ months between regions. Seattle's last frost is mid-April; Minneapolis is late May.

**Test:** Do planting notes specify:
- Frost date range (average last frost ± 2 weeks)?
- Is there `context-gate: geographic` with zone specification?

### Edge Case: Microclimates

**Problem:** Within a single garden, microclimates vary significantly:
- South-facing wall: 1-2 zones warmer
- Frost pocket: colder than surrounding area
- Urban heat island: warmer than surrounding rural

**Test:** Do notes acknowledge microclimate variation? Is there guidance for assessing local conditions?

---

## 3. Seasonal Knowledge

**Seed Rule:** For time-sensitive knowledge, use explicit seasonal tagging.

**Gardening Application:**

### Edge Case: Planting Windows

**Problem:** "Plant in spring" is too vague. Spring varies by:
- Region (Northern vs Southern hemisphere)
- Climate (coastal vs continental)
- Year (weather variability)

**Test:** Do planting notes include:
- Specific month or week range?
- Soil temperature guidance (e.g., "soil reaches 50°F/10°C")?
- `season:` tagging (spring, fall, summer)?

### Edge Case: Succession Planting

**Problem:** Some crops can be planted multiple times per season (lettuce, radishes). Notes need to specify:
- First planting date
- Last planting date for harvest window
- Days to maturity

**Test:** Do succession planting notes specify timing windows, not just "plant in spring"?

---

## 4. Experiential Knowledge in Gardening

**Seed Rule:** For domains with experiential knowledge, include `experiential-component` frontmatter.

**Gardening Application:**

### Edge Case: "Healthy Plant" Judgment

**Problem:** Assessing plant health requires experience. A note saying "the plant looks healthy" is meaningless to a beginner.

**Test:** Do plant health notes include:
- Specific visual indicators (leaf color, stem firmness, growth rate)?
- `experiential-component:` field?
- Comparison photos or descriptions?

### Edge Case: Soil Assessment

**Problem:** "Good soil" means different things. Testing requires:
- Squeeze test (sandy vs clay)
- pH testing
- Compost content

**Test:** Do soil notes include:
- How to test without equipment?
- What equipment is needed for precise testing?
- `equipment-required:` field?

### Edge Case: Pest Identification

**Problem:** Identifying pests requires pattern recognition from many examples.

**Test:** Do pest notes:
- Link to multiple example photos?
- Use `knowledge-type: recognition` tag?
- Describe distinguishing features?

---

## 5. Atomicity: Growing Guides vs Techniques

**Seed Rule:** Notes should be 100-300 words; notes >300 may contain multiple ideas.

**Gardening Application:**

### Edge Case: Comprehensive Growing Guides

**Problem:** A complete tomato growing guide might cover:
- Variety selection
- Starting seeds
- Transplanting
- Watering schedule
- Fertilizing
- Pruning
- Pest management
- Harvesting

This could easily exceed 1000 words.

**Analysis:** Is this one idea (growing tomatoes) comprehensively covered, or multiple ideas bundled?

**Test:** Could this guide be split into independently useful notes?
- [[Tomato Variety Selection]] - standalone
- [[Starting Tomato Seeds]] - standalone  
- [[Tomato Pest Management]] - standalone

If yes to splitting AND parts are independently reusable → split. If no → keep together.

### Edge Case: Climate-Specific vs General Guides

**Problem:** A general tomato guide might say "water regularly." But in arid climates, irrigation details matter more.

**Test:** Should there be separate:
- General tomato guide (principles)
- Climate-specific variants (desert tomatoes, tropical tomatoes)?

---

## 6. Source Quality: Garden Advice Reliability

**Seed Rule:** Capture source quality for knowledge.

**Gardening Application:**

| Source Type | Reliability | Notes |
|-------------|-------------|-------|
| University extension | High | Research-based, regionally tested |
| Master Gardener program | High | Trained volunteers, local knowledge |
| General gardening books | Medium | May not account for local conditions |
| Blog posts | Variable | Often untested claims |
| Social media | Low | Trend-driven, untested |
| Historical/folk wisdom | Variable | May work in specific contexts |

### Edge Case: Folk Wisdom vs Research

**Problem:** "Plant marigolds to deter pests" — folk wisdom with mixed scientific support.

**Test:** Do notes distinguish:
- Scientifically validated techniques?
- Folk wisdom with anecdotal support?
- `confidence:` tagging appropriate?

---

## 7. Note Lifecycle: Perennials vs Annuals

**Seed Rule:** Notes have lifecycle stages: whisper → draft → processed → verified.

**Gardening Application:**

### Edge Case: Perennial Plant Notes

**Problem:** A note about a fruit tree variety might take 5 years to truly verify (does it thrive? produce well? survive winter?).

**Test:** For perennial plant notes:
- Is lifecycle appropriately long (multi-year verification)?
- Is there `verification-status: multi-year-pending` with target date?
- Does the note acknowledge it's still being evaluated?

### Edge Case: Variety-Specific Knowledge

**Problem:** "Apple trees need pruning" is general. "Honeycrisp apple trees need specific pruning" is specific and may have different requirements than other varieties.

**Test:** Do variety-specific notes distinguish:
- General apple pruning?
- Variety-specific adjustments?
- `version:` or `variety:` tagging?

---

## 8. Equipment and Tools

**Seed Rule:** Document physical equipment dependencies.

**Gardening Application:**

### Edge Case: Tool Availability Tier

**Problem:** "Use a garden fork" assumes tool availability. But:
- Budget gardening: digging with shovel works
- No-till gardening: uses forks differently
- Professional: long-handled forks, broadforks

**Test:** Do technique notes specify:
- Required vs optional tools?
- Alternatives for tool-limited situations?
- `gear-required:` field?

### Edge Case: Space Constraints

**Problem:** "Rotate crops" assumes garden space. Container gardening has different constraints.

**Test:** Do notes distinguish:
- In-ground gardening?
- Raised bed gardening?
- Container/patio gardening?
- `space-requirement:` tagging?

---

## 9. Diminishing Returns in Gardening

**Seed Rule:** Use diminishing returns testing before adding notes.

**Gardening Application:**

### Edge Case: Variety Overload

**Problem:** There are 10,000+ tomato varieties. Adding notes for each variety is bloat.

**Test:** For variety notes:
1. Does this variety add unique knowledge (not just another name)?
2. Is it significantly different from existing notes?
3. Is there a reason to prefer this variety over existing options?

### Edge Case: Regional vs Universal Knowledge

**Problem:** A note about "growing citrus in Zone 9" is region-specific. A note about "understanding plant hardiness" is universal.

**Test:** Do notes appropriately distinguish:
- Universal principles?
- Regional adaptations?
- `applicability:` scope tagging?

---

## 10. 3-Hop Rule: Plant Taxonomy

**Seed Rule:** Every note reachable from `_root.md` in 3 hops or fewer.

**Gardening Application:**

### Path Example

```
_root → Plants → Edibles → Vegetables → Tomatoes → Cherry Tomatoes → Sweet 100
```
= 6 hops

**Analysis:** This is a natural taxonomy (Plant → Category → Type → Specific → Variety). May legitimately exceed 3 hops.

**Test:** Is this a genuine domain taxonomy? Should hub shortcuts be created?

---

## Summary of Edge Cases

| Seed Rule | Edge Case | Solution |
|-----------|-----------|----------|
| Verification Timeline | Multi-year for perennials | Apply `verification-cycle: multi-year` |
| Verification Timeline | Weather variability | Require 2+ seasons before "verified" |
| Climate Zones | Hardiness zone specificity | Require `hardiness-zone:` tagging |
| Climate Zones | Frost date variation | Specify timing with soil temp guidance |
| Seasonal Knowledge | Planting window precision | Use month/week ranges, not "spring" |
| Experiential | Plant health assessment | Include specific indicators, `experiential-component:` |
| Experiential | Soil assessment | Document both equipment and no-equipment methods |
| Atomicity | Comprehensive growing guides | Split if parts are independently reusable |
| Source Quality | Folk wisdom vs research | Distinguish confidence levels |
| Lifecycle | Perennial verification | Use multi-year pending status |
| Equipment | Tool tier assumptions | Specify required vs optional |
| Space | Container vs in-ground | Tag with `space-requirement:` |
| Diminishing Returns | Variety overload | Apply uniqueness test strictly |
| 3-Hop Rule | Plant taxonomy deep | Allow domain taxonomies; create hub shortcuts |

---

## Recommendations for Seed

1. **Gardening Verification**: Explicitly recommend 2+ growing seasons for perennial verification. Add example frontmatter for perennial plant notes.

2. **Climate Zone Tagging**: Make `hardiness-zone:` a standard field for plant notes. Add `microclimate:` for notes about local variation.

3. **Seasonal Precision**: Require planting notes to include either specific dates OR soil temperature thresholds, not vague "spring/fall" guidance.

4. **Experiential Tagging**: For plant health and soil notes, require `experiential-component: partial` or `essential` with specific sensory indicators.

5. **Lifecycle Extension**: For perennials, default to `verification-status: multi-year-pending` with `verification-completion-target: +3 years`.

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Cooking Knowledge Base]]
- [[Seed Stress Test - Wilderness Survival Knowledge Base]]
- [[Tags vs Links in Gardening]] (existing note)
- [[Frontier Exploration - Long-Horizon Verification Domains]]
- [[Domain-Specific Knowledge Bases]]

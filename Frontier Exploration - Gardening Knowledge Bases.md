---
last-reviewed: 2026-03-16
lifecycle: active
confidence: emerging
author-type: ai-assisted
tags:
  - domain-specific
  - gardening
  - agriculture
  - experiential-knowledge
  - frontier-exploration
---

# Frontier Exploration - Gardening Knowledge Bases

Gardening presents unique knowledge management challenges that stress-test several Seed rules in ways not fully addressed by existing frontier explorations.

## The Core Challenge

Gardening knowledge is fundamentally **context-dependent** in ways that exceed typical domain variation. A tomato variety that thrives in one backyard may fail 500 feet away due to:

- **Microclimate variation**: A south-facing wall creates a frost pocket or heat island within the same property
- **Soil composition**: Clay pockets, sand streaks, and pH variation at scales irrelevant to other domains
- **Local ecosystem**: Native pest populations, beneficial insect presence, and disease pressure vary by neighborhood
- **Water drainage patterns**: Low spots collect water; slopes drain fast — same planting, different outcomes

## Seed Rules That Fail

### Diminishing Returns Testing

The standard diminishing returns test assumes knowledge utility can be evaluated without execution. In gardening:

- Two tomato variety descriptions may look nearly identical, but one fails and one succeeds in your specific conditions
- A technique described the same way produces different results based on soil biology you can't see
- **Test modification needed**: For gardening, capture with `verification-status: testing` and prioritize actual growth trials over passive evaluation

### Experiential Domain Modified Test

The Seed already has modifications for experiential domains (cooking, music), but gardening adds a layer:

- **Living system uncertainty**: Plants are not passive — they respond to conditions in ways that can't be predicted from description
- **Multi-year verification**: Perennials only reveal success or failure after seasons; one year's failure may be weather, not the knowledge
- **Location specificity**: Even "verified" knowledge may not transfer — a variety that works in your garden may not work in your neighbor's

The modified test should include: "Could this fail for reasons invisible at capture time?" If yes, tag with `location-sensitivity: high`.

### Climate Zone Coverage

Hardiness zones (covered in Seed) are necessary but insufficient:

- **Heat tolerance**: A plant hardy to Zone 4 may not survive Zone 4 heat waves
- **Rainfall patterns**: Dry-zone varieties rot in wet climates and vice versa
- **Frost timing**: Last frost date varies by mile, not just zone
- **Urban heat islands**: Cities run 1-2 zones warmer than surrounding rural areas

**Recommendation**: Use multi-dimensional climate tags beyond hardiness zone:
```yaml
climate-tags:
  - hardiness-zone: 7
  - heat-tolerance: medium  # struggles above 90F
  - moisture-preference: dry  # prefers well-drained
  - frost-sensitivity: late-spring  # vulnerable to late frost
```

### Tacit Knowledge in Gardening

Gardening has MORE tacit knowledge than most domains:

- **"When to water"**: Not by schedule — by feeling soil, checking plant wilting patterns, understanding your specific drainage
- **"When it's ready to harvest"**: Texture, color, smell, even sound — not calendar dates
- **"When something's wrong"**: Visual diagnosis requires seeing hundreds of healthy plants to recognize unhealthy ones

**Test for tacit severity**: Estimate what percentage of gardening expertise is tacit. For most gardeners: 40-60% is tacit. This exceeds typical domains. See [[Frontier Gap - Embodied Knowledge]] for more on tacit knowledge capture.

### Verification Timeframes

Standard verification assumes days-to-weeks. Gardening operates on:

- **Annual verification**: Tomatoes this year ≠ tomatoes next year (different weather)
- **Multi-year verification**: Perennials take 3-5 years to assess truly
- **Seasonal verification**: Spring planting success ≠ fall planting success

**STATUS (2026-03-17):** Added to Seed — use `verification-cycle: annual|multi-year|perennial` with explicit `verification-completion-target` date.

## Knowledge Types Unique to Gardening

### Seasonal Timing Knowledge

When to plant is geographically variable in ways that require local data:

- Last frost date (by neighborhood, not just zone)
- Soil temperature thresholds (different from air temperature)
- Day length thresholds for flowering/fruiting

### Variety-Specific Knowledge

Generic "how to grow tomatoes" is almost useless — the critical knowledge is variety-specific:

- Disease resistance profiles
- Days to maturity
- Heat/cold tolerance
- Flavor profiles

### Companion Planting (Contested)

Companion planting is a domain with contested knowledge — some combinations have research support, others are folk wisdom. The Seed's rules for contested knowledge should apply:

- Tag with `knowledge-type: heuristic` (folk wisdom) vs `knowledge-type: research-supported`
- Distinguish companion planting (beneficial) from crop rotation (evidence-based)

## Recommended Frontmatter Extensions

For gardening notes:

```yaml
domain-specific: gardening
growth-requirements:
  sun-exposure: full-sun|partial-shade|full-shade
  water-needs: low|medium|high
  soil-type: clay|sand|loam|adaptable
  drainage: well-drained|moist|adaptable
  ph-range: "6.0-7.0"
location-sensitivity: low|medium|high
verification-cycle: annual|multi-year|perennial
knowledge-origin: research|experience|folk-wisdom
trial-status: untested|testing|verified-success|verified-failure
```

## The Transfer Problem

Gardening knowledge has near-zero transferability by default:

- A technique that works in Mediterranean climate fails in humid continental
- A variety recommended for beginners in California kills beginners in Maine
- Organic methods in one soil type fail in another

**Implication**: Gardening vaults should emphasize local experimentation over general advice. The Seed's "capture personal experimentation" rule is especially critical here.

## Contrast with Other Domains

| Domain | Primary Uncertainty | Transferability |
|--------|---------------------|-----------------|
| Cooking | Technique execution | High (recipes work across locations) |
| Music | Interpretation | Medium |
| Medicine | Individual response | Low-moderate |
| Gardening | Location + living system | Very low |

## Seed Rule Refinements Needed

1. **Experiential domain test**: Add `location-sensitivity` dimension for geographically-variable domains
2. **Verification timeframes**: Allow `verification-cycle` beyond annual
3. **Tacit knowledge**: Gardening may require explicit "look/feel" cues — the Seed's failure mode documentation is essential
4. **Climate coverage**: Hardiness zones are start; need heat tolerance, rainfall, and frost timing layers
5. **Diminishing returns**: Apply modified test with living-system uncertainty

## Related Notes

- [[Frontier Exploration - Climate-Zone-Dependent Knowledge]] — extends hardiness zones
- [[Frontier Gap - Embodied Knowledge]] — applies but needs extension for living systems

## Source Quality in Gardening

Different gardening sources have different reliability profiles:

| Source Type | Reliability | Example |
|-------------|-------------|---------|
| University extension | High | Cooperative Extension Service |
| Commercial nursery | Medium | Often biased toward products sold |
| Forum/community | Low-Variable | Experience-based but untested |
| Historical texts | Variable | Pre-1970s advice may be outdated |

## Equipment Dependencies in Gardening

| Equipment | Domain-Wide | Optional |
|-----------|-------------|----------|
| Trowel | Yes | No |
| Garden fork | Yes | No |
| Soaker hose | Yes | Yes |
| Cold frame | Climate-specific | Yes |
| Greenhouse | Climate-specific | Yes |

**Climate-Dependent Equipment:** "Need a cold frame" — only for cold climates with short seasons. Equipment notes should specify climate applicability.

## Test Case: Building a Tomato Knowledge Base

Using current Seed rules, an AI building a tomato KB would:
1. Create atomic notes for each variety
2. Add links to growing conditions
3. Mark verification status

But it would MISS:
- Local frost date nuances
- Soil-specific adjustments
- Neighborhood pest pressure
- Microclimate variations within a single garden

A gardening-aware Seed would add:
- Location-specific data fields
- Explicit "verify in YOUR conditions" markers
- Multi-year verification requirements for perennials
- Tacit knowledge capture for "when it's ready" judgments

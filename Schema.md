---
protected: true
foundational: true
last-reviewed: 2026-03-19
last-updated: 2026-03-21
lifecycle: evergreen
confidence: high
author-type: ai-assisted
domain-familiarity: assessed
---

# Schema.md - Vault Field Documentation

> This document defines the frontmatter fields used in the vault.

## Standard Fields (from Seed)

| Field | Values | Description |
|-------|--------|-------------|
| `protected` | true/false | Structural pillar - do not merge or delete |
| `schema-version` | semantic version (e.g., 1.0, 1.1) | Schema version this note follows |
| `last-reviewed` | YYYY-MM-DD | Last human/AI review date |
| `last-updated` | YYYY-MM-DD | Last modification date |
| `lifecycle` | evergreen, transient, seed-extension, living, historical, perpetual-beta, frontier-exploration, seed-gap, seed-refinement, abandoned | Note lifecycle stage |
| `confidence` | high, emerging, disputed, obsolete | Reliability of knowledge |
| `author-type` | human, ai-assisted, ai-generated | Origin of content |
| `domain-familiarity` | assessed, learning, unknown | AI's familiarity level with the domain |
| `verification-status` | source-verified, drill-verified, empirically-verified, tool-verified, verified, unverified, testing, disputed | Factual verification status |
| `knowledge-type` | conceptual, procedural, factual, analysis, reference, conditional | What type of knowledge the note contains |
| `tags` | [kebab-case] | Categorization tags |
| `exclusion-considered` | true/false | Whether exclusion was evaluated for this note |
| `exclusion-reason` | public-utility, ephemeral, duplicate, decorative, scope-violation, high-maintenance, sensitive-risk, incomplete-speculation | Reason note was retained despite exclusion consideration |
| `exclusion-alternative` | text | What to capture instead if excluding |
| `exclusion-ethics` | living-individual, harm-potential, right-to-be-forgotten | Ethical exclusion category |
| `consent-status` | explicit, implied, unknown | Consent status for personal information |
| `harm-assessment` | low, medium, high | Potential for harm if exposed |

## Vault-Specific Fields

### `level`

Used to categorize notes by their abstraction level within the knowledge hierarchy.

| Value | Description | Examples |
|-------|-------------|----------|
| `principle` | Foundational rules and frameworks | Atomic Note Principle, Linking Principle |
| `pattern` | Reusable solutions to common problems | Code Patterns, Design Patterns |
| `concrete` | Specific implementations or examples | Specific tool configs, concrete recipes |
| `frontier` | Exploratory notes about gaps/uncertainties | Seed Gaps, Frontier Explorations |
| `convention` | Established practices for the vault | Naming conventions, linking standards |

**Why:** Different levels require different handling. Principles are stable; frontiers are volatile.

**Test:** Can you categorize every note by its level? Are higher-level notes (principles) created before lower-level ones (concrete)?

## Domain-Specific Fields

### For Scientific Knowledge

| Field | Values | Description |
|-------|--------|-------------|
| `evidence-tier` | systematic-review, rct, observational, case-study, expert-opinion | Strength of evidence |
| `peer-review-status` | peer-reviewed, preprint, pending | Publication status |

### For Legal Knowledge

| Field | Values | Description |
|-------|--------|-------------|
| `jurisdiction` | US, EU, UK, etc. | Legal system |
| `source-tier` | constitutional, supreme-court, circuit, district, scholarly | Legal source hierarchy |

### For Financial Knowledge

| Field | Values | Description |
|-------|--------|-------------|
| `financial-advisory-level` | general-education, planning-guidance, personalized-advice | Advice type |
| `investment-framework` | value-investing, growth-investing, momentum, index-passive, factor-investing | Investment philosophy |
| `temporal-scope` | historical, projected, unknown | Time frame |
| `holding-period` | N-years, any | Required time horizon |

### For Infrastructure-Dependent Domains

| Field | Values | Description |
|-------|--------|-------------|
| `infrastructure-type` | network, hardware, geographic, power, configuration | Type of dependency |

### For Link Density Exceptions

| Field | Values | Description |
|-------|--------|-------------|
| `foundational: true` | boolean | Note is a prerequisite/foundation, exempt from 2-link minimum |
| `specialized: true` | boolean | Note is highly domain-specific with limited connection opportunities |

**Why:** Some notes are intentionally narrow (specialized equipment, domain-specific jargon) or foundational (prerequisites that enable other notes). These should be exempt from the standard link density requirement.

### For Thinking Tools and Cognitive Strategies

| Field | Values | Description |
|-------|--------|-------------|
| `thinking-tool` | true/false | Whether this note captures a thinking strategy or cognitive approach |
| `thinking-tool-type` | cognitive-strategy, mental-model, decision-framework, problem-solving, creativity | Type of thinking tool |

### For Geographically-Constrained Knowledge

| Field | Values | Description |
|-------|--------|-------------|
| `geographic-scope` | see below | Applicability region for region-specific knowledge |

**geographic-scope format:**
```yaml
geographic-scope:
  type: regulation|climate|cultural|ecological|species
  regions: ["US", "EU", "UK"]  # or specific region
  scope-type: universal|regional|local
```

See [[Frontier Exploration - Geographically-Constrained Knowledge]] for detailed implementation.

## Knowledge Type Tags

Used to categorize what type of knowledge a note contains:

- `knowledge-type: conceptual` - Abstract ideas and frameworks
- `knowledge-type: procedural` - Step-by-step processes
- `knowledge-type: factual` - Specific data points
- `knowledge-type: analysis` - Evaluation and interpretation
- `knowledge-type: reference` - Lookup information

## Status Field (Optional)

For notes in transition states (not yet stable), an optional `status:` field may be used:

| Value | Description |
|-------|-------------|
| `stub` | Placeholder note, needs development |
| `draft` | Incomplete, under active development |
| `probe` | Experimental, testing validity |
| `gap-identified` | Identifies a gap, awaiting resolution |
| `planned` | Scheduled for future creation |
| `superseded-by-seed-rule` | Content integrated into Seed |

**Note:** Status should only be used for transitional notes. Once a note reaches evergreen/living status, remove the status field.

## Tag Naming Conventions

- Use kebab-case (lowercase with hyphens)
- Use singular form
- Avoid duplicates (e.g., don't have both `anti-pattern` and `anti-patterns`)
- Prefix seed-related tags with `seed-`: `seed-gap`, `seed-stress-test`

## Related Notes

- [[AI-Assisted Knowledge Management Seed]] — Core rules that define frontmatter requirements
- [[_root]] — Vault purpose and overview
- [[Note Types and Templates]] — How to use the schema in practice

## Schema Version

This schema is versioned. Notes should include `schema-version:` if using version-specific fields.

**Last Updated:** 2026-03-20

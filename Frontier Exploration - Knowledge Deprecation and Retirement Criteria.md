---
last-reviewed: 2026-03-27
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-lifecycle
  - deletion
  - obsolescence
schema-version: "1.0"
---

# Frontier Exploration: Knowledge Deprecation and Retirement Criteria

> When should knowledge be formally deprecated vs. kept evergreen? How do you signal "this was true then, not now" vs. "this is wrong"?

## The Gap

The Seed includes comprehensive rules for:
- **Note lifecycle**: draft → refined → evergreen
- **Gap identification**: finding missing knowledge
- **Verification**: checking accuracy over time

But it lacks explicit rules for:
- **Deprecation**: formally marking knowledge as outdated
- **Retirement**: removing knowledge that's no longer relevant
- **Versioning**: maintaining historical accuracy
- **Temporal signals**: telling readers "this applied then, not now"

## The Problem

Knowledge bases accumulate stale content:
- Techniques that worked but don't anymore
- Facts that were true but have changed
- Recommendations for tools that are obsolete
- Best practices superseded by better approaches

Without deprecation rules:
- Users waste time on outdated solutions
- Verification fails because old knowledge masquerades as current
- Vault credibility degrades

## Proposed Deprecation Framework

### 1. Deprecation States

```yaml
# For notes with temporal scope
temporal-validity:
  started: 2020-01
  ended: 2023-06  # null if still valid
  replacement: [[Updated Note Name]]  # if superseded
  deprecation-reason: superseded-by-better-approach|changed-premises|tool-obsolete|incorrect
```

### 2. Deprecation Triggers

**Automatic triggers:**
- Replacement note created with higher confidence
- Source primary claim factually contradicted by updated source
- Tool/technique explicitly discontinued by maintainers
- Domain premises changed (e.g., API deprecation)

**Manual triggers:**
- Regular review flags as outdated
- User reports broken/outdated content

### 3. Deprecation Signaling

For deprecated notes:

```yaml
---
lifecycle: deprecated
deprecated-date: 2026-03-27
deprecated-reason: superseded-by-better-approach
replaced-by: [[Frontier Exploration - Knowledge Maintenance]]
supersedes: [[Note Name Being Deprecated]]  # for the new note
---
```

### 4. Archive vs. Delete

**Archive (keep, but hidden):**
- Historical context matters
- Shows evolution of thinking
- Useful for understanding "why we changed"

**Delete (remove entirely):**
- Purely ephemeral (daily logs, temporary state)
- Security risk if retained (credentials, tokens)
- Completely incorrect (not just outdated)

## Edge Cases

### Versioned Knowledge

Some knowledge is inherently versioned:
- Software documentation for different versions
- API documentation for different versions
- Tool guides for specific versions

**Proposed rule:** Use frontmatter for version scope:

```yaml
applies-to-version: "2.x"  # null means current/unversioned
version-boundaries:
  - version: "1.x"
    note: [[Tool Guide v1]]
  - version: "2.x"
    note: [[Tool Guide v2]]
```

### Conflicting Timestamps

When knowledge from different eras conflicts:
- Don't silently update old notes
- Use "context frames" to show temporal validity
- Add confidence markers for temporal scope

## Implementation

### Deprecation Workflow

1. **Detect**: Review cycle or user flags outdated content
2. **Evaluate**: Is this replaceable, archivible, or deletable?
3. **Tag**: Add appropriate deprecation frontmatter
4. **Link**: Connect to replacement if exists
5. **Communicate**: Add deprecation notice in note body

### Reader-Facing Signals

For deprecated notes, include visible notice:

```markdown
> ⚠️ **DEPRECATED**: This note describes [old approach]. 
> See [[Current Approach]] for up-to-date guidance.
> 
> *Deprecated 2026-03-27 because [reason].*
```

## Related Seed Rules

- [[Note Lifecycle Management]] — extends to include deprecated state
- [[Frontier Exploration - Knowledge-Aware Review Cycles]] — review triggers
- [[Frontier Exploration - Knowledge Deprecation and Obsolescence Management]] — complementary perspective with domain-specific examples
- [[Confidence Markers]] — can signal temporal confidence
- [[Seed Rule - Vault Change Tracking]] — tracks evolution over time

---

**Note merged (2026-03-28):** This note absorbed content from [[Frontier Exploration - Knowledge Deprecation and Obsolescence Management]] which was redundant. The older note is now deprecated. Both notes covered deprecation workflow, obsolescence detection, and archive vs. delete decisions. This note was chosen as the merge target because it has clearer Rule/Why/Test structure and explicit Seed Gap labeling.

## Test Criteria

- [ ] Can you identify deprecated notes via frontmatter?
- [ ] Is there a clear path from deprecated to current notes?
- [ ] Do readers know when knowledge was valid?
- [ ] Can deprecated knowledge be archived vs. deleted appropriately?
- [ ] Is deprecation reversible if circumstances change?

## Open Questions

1. Should deprecated notes count against verification ratio?
2. How long should deprecated notes be retained before potential deletion?
3. Should deprecated notes appear in search results with warning?
4. How do you handle "partially deprecated" knowledge (some sections outdated)?

---

**This note is a Seed Gap**: Proposes a missing area the Seed doesn't fully address. If validated, should become a Seed rule or Seed Gap note for further development.

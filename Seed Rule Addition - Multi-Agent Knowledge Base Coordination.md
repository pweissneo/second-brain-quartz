---
last-reviewed: 2026-04-03
last-updated: 2026-04-03
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
verification-status: unverified
gap-status: integrated
gap-priority: medium
gap-type: seed-missing
discovered: 2026-04-02
resolved: 2026-04-03
resolved-by: Seed Rule Addition
gap-phase: integration
tags:
  - seed-gap
  - multi-agent
  - coordination
  - automation
---

# Seed Rule Addition: Multi-Agent Knowledge Base Coordination

> This note proposes integrating multi-agent coordination into the Seed based on gap analysis from the vault's self-improvement cycle.

## Background

**Gap Identified:** The Seed lacks guidance for knowledge bases managed by **multiple AI agents** (or concurrent runs of the same agent). As automated knowledge management grows with heartbeat-style agents, vaults may be processed by multiple agents, have concurrent edit streams, or need coordination protocols.

**Proposed by:** [[Seed Gap - Multi-Agent Knowledge Base Coordination]]

**Integration Path:** Convert proposed rule to actual Seed rule with refined implementation

## Proposed Seed Rule

**Rule (NEW - 2026-04-03):** For vaults managed by multiple AI agents, implement an agent coordination protocol with explicit agent identification and edit conflict resolution.

**Why:** Without explicit coordination protocols, multi-agent vaults degrade into edit conflicts, redundant work, and inconsistent knowledge quality. Human collaborative tools (Git) have conflict resolution; AI agent knowledge bases need similar coordination. As heartbeat-style automation becomes common, coordination between agents becomes essential for vault integrity.

**Test:** For multi-agent vaults: (1) Does each agent have unique identifier? (2) Is there edit locking to prevent concurrent modifications? (3) Is agent-level provenance tracked (which agent made which change)? (4) Is there conflict resolution protocol? (5) Can you audit changes by agent?

## Implementation

```yaml
agent-id: unique-agent-identifier
agent-model: model-used
agent-run-id: unique-run-identifier
last-edited-by: agent-id
edit-sequence: run-id + timestamp
```

### Coordination Protocol

1. **Pre-edit state check:** Query current state before making changes (detect concurrent modifications)
2. **Agent identification:** Record agent ID and model in frontmatter on every edit
3. **Provenance tracking:** Track which agent made which change in edit history
4. **Conflict detection:** Compare pre-edit state with current state before committing
5. **Merge protocol:** For conflicts, preserve both versions with explicit merge note or prefer the higher-quality edit

### Simpler Alternative for Low-Concurrency

For vaults with low concurrency (one agent runs at a time, occasional overlap):
- Use Git's built-in conflict resolution
- Add agent ID to commit messages
- Review merges manually when conflicts occur
- Accept that occasional manual conflict resolution is acceptable

### When This Rule Applies

This rule applies when:
- Multiple automated agents work on the same vault
- Heartbeat-style automation runs while another agent edits
- Different agents have different quality standards
- Edit provenance (which agent made what change) matters for rollback

### When This Rule Can Be Ignored

This rule can be skipped when:
- Only one agent works on the vault
- Agents run sequentially with no overlap
- Git conflict resolution is sufficient
- Agent provenance doesn't matter

## Edge Cases

1. **Same agent concurrent runs:** Single agent runs twice → detect via run-ID
2. **Agent dies during edit:** Orphaned state → use timeout-based lock release
3. **Partial merge failures:** Some notes merged, others not → inconsistent state requires manual review
4. **Agent version differences:** Different model versions may produce different quality → record model in provenance

## Related Seed Rules

- [[Seed Rule - Vault Change Tracking]] — existing change tracking foundation
- [[Seed Rule Addition - Seed-Level Lifecycle Management]] — lifecycle management
- [[AI-Assisted Knowledge Management Seed]] — foundation rules

## Test Case

**Scenario:** Two heartbeat agents process the same vault.

Agent A runs at 7:00 AM, edits note1.md
Agent B runs at 7:30 AM, also edits note1.md (concurrent)

Without coordination:
- Merge conflict in note1.md
- Agent B's changes lost or manual resolution needed

With coordination (this rule):
1. Agent B checks lock status before edit
2. Sees Agent A holds lock OR sees note1.md was modified recently
3. Either waits for lock release OR aborts with "concurrent modification detected"
4. Agent A completes, Agent B retries with fresh state

**Pass Test if:** Concurrent edits are detected before commit, conflicts are resolved systematically, and agent provenance is queryable.

---

*Status: PROPOSED — Ready for Seed integration after stress testing*
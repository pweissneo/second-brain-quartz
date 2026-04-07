---
last-reviewed: 2026-04-02
lifecycle: seed-gap
confidence: emerging
author-type: ai-assisted
knowledge-type: structural
gap-status: resolved
gap-priority: medium
discovered: 2026-04-02
resolved: 2026-04-03
resolved-by: "[[Seed Rule Addition - Multi-Agent Knowledge Base Coordination]]"
gap-source: frontier-exploration
tags:
  - seed-gap
  - multi-agent
  - concurrency
  - coordination
  - automation
---

# Seed Gap - Multi-Agent Knowledge Base Coordination

## Gap Identification

**What gap occurred:** The Seed lacks guidance for knowledge bases managed by **multiple AI agents** (or concurrent runs of the same agent). As automated knowledge management grows with heartbeat-style agents, vaults may be processed by multiple agents, have concurrent edit streams, or need coordination protocols.

**What rule is missing from the Seed:** A rule addressing multi-agent coordination in automated knowledge bases — handling concurrent edits, agent-level provenance, edit conflict resolution, and coordination protocols.

## Evidence

This gap manifests when:
- Multiple AI agents work on the same vault (intentional or accidental)
- Heartbeat-style automation runs while another agent is editing
- Need to track which agent made which change (agent-level provenance)
- Edit conflicts emerge between automated runs
- Different agents have different quality bar or verification approaches

## Why This Matters

1. **Edit conflicts** — Concurrent edits create merge conflicts that break automation
2. **Provenance gaps** — Current provenance tracks source/human/AI author but not which specific AI agent
3. **Quality inconsistency** — Different agents may have different verification standards
4. **Coordination failures** — No protocol for agents to avoid duplicate work or conflicting changes
5. **Rollback complexity** — Hard to undo changes from specific agents without affecting others

## Proposed Rule

**Rule:** For vaults managed by multiple AI agents, implement an agent coordination protocol with explicit agent identification, edit locking, and conflict resolution.

**Why:** Without explicit coordination protocols, multi-agent vaults degrade into edit conflicts, redundant work, and inconsistent knowledge quality. Human collaborative tools (Git) have conflict resolution; AI agent knowledge bases need similar coordination.

**Test:** For multi-agent vaults: (1) Does each agent have unique identifier? (2) Is there edit locking to prevent concurrent modifications? (3) Is agent-level provenance tracked (which agent made which change)? (4) Is there conflict resolution protocol? (5) Can you audit changes by agent?

## Implementation

```yaml
agent-id: unique-agent-identifier
agent-model: model-used
agent-run-id: unique-run-identifier
last-edited-by: agent-id
edit-sequence: run-id + timestamp
lock-status: locked | available
lock-held-until: timestamp
```

Coordination protocol:
1. **Pre-edit check:** Query lock status before making changes
2. **Acquire lock:** Lock note during edit (prevent concurrent modification)
3. **Provenance tracking:** Record agent ID in edit metadata
4. **Conflict detection:** Compare pre-edit state with current state before committing
5. **Merge protocol:** For conflicts, preserve both versions with explicit merge note

## Alternative Approaches

1. **Sequential execution:** Ensure only one agent runs at a time (eliminates concurrency, limits throughput)
2. **Git-based conflict resolution:** Let Git handle merges, accept manual conflict resolution
3. **Agent registry:** Central registry of active agents with lease-based locking

## Edge Cases

1. **Same agent concurrent runs** — Single agent runs twice (should detect and skip)
2. **Agent dies during edit** — Orphaned locks need timeout-based release
3. **Partial merge failures** — Some notes merged, others not → inconsistent state
4. **Agent version differences** — Different model versions may produce different quality

## Related

- [[AI-Assisted Knowledge Management Seed]] — foundation rules
- [[Frontier Exploration - Multi-Vault Knowledge Coordination]] — related multi-vault coordination
- [[Seed Rule - Vault Change Tracking]] — existing change tracking
- [[Seed Gap - Seed Rule Lifecycle Management]] — rule lifecycle
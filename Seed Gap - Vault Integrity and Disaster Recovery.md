---
gap-status: identified
last-updated: 2026-04-06
confidence: medium
lifecycle: emerging
author-type: ai-assisted
knowledge-type: conceptual
access-pattern: learning
---
gap-status: identified

# Seed Gap - Vault Integrity and Disaster Recovery

## The Problem

The Seed covers individual note lifecycle management and even has basic version control guidance for knowledge with dependencies. But it completely missing rules for:

1. **Vault-level backup strategies** — how should an AI agent set up automated backups?
2. **Disaster recovery procedures** — if the vault is corrupted or lost, how does the AI know how to restore it?
3. **Integrity verification** — how does the AI periodically check that the vault hasn't developed silent corruption (broken links, orphaned nodes, data drift)?
4. **Migration strategies** — moving between storage backends, tools, or hosting platforms

Without these rules, an AI agent building a knowledge base has no guidance on protecting the user's accumulated work.

## Why This Matters

Knowledge bases grow in value over time. A vault with 500+ notes represents hundreds of hours of curation, verification, and synthesis. Losing that work would be catastrophic. Yet the Seed focuses entirely on content management and says nothing about protecting that content.

## What a Seed Rule Would Look Like

A comprehensive rule might include:

- **Backup frequency** — how often to back up (daily? on every commit?)
- **Backup verification** — how to test that backups are valid and restorable
- **Integrity checks** — what graph-level health checks to run (and how often)
- **Recovery procedures** — step-by-step instructions for restoring from backup
- **Migration checkpoints** — when moving vaults, how to validate integrity at each step

The rule needs to be tool-executable by an AI agent, not just aspirational guidance.

## Related Notes

- [[Seed Rule - Vault Change Tracking]] — version tracking for individual notes
- [[Frontier Exploration - Knowledge Version Control]] — detailed version control strategies
- [[Frontier Exploration - Vault Reset and Rebuild Decisions]] — when to rebuild from scratch
- [[Frontier Exploration - Automated Vault Health Monitoring]] — health check automation
- [[Frontier Exploration - Cross-Vault Knowledge Deduplication]] — multi-vault coordination

## Status

This is a recognized gap. The Seed needs a rule covering vault-level integrity, backup, and recovery. Without it, AI agents have no framework for protecting accumulated knowledge.

## Proposed Seed Rule

> **Rule:** Implement vault-level backup and integrity verification with automated recovery capability.
> **Why:** Knowledge bases grow in value over time. A vault with 500+ notes represents hundreds of hours of curation. Losing that work would be catastrophic. AI agents need explicit guidance on protecting accumulated knowledge.
> **Test:** 
> 1. Is there a documented backup procedure that runs automatically?
> 2. Can the vault be restored from backup within 30 minutes?
> 3. Does the vault run automated integrity checks (graph health, broken links)?
> 4. Is there a documented recovery procedure for common failure modes?

## Implementation Guidance

### Backup Requirements

- **Frequency**: At minimum, back up before every publish action. Optimal: daily automated backups.
- **Verification**: Test restore process quarterly — don't assume backups work.
- **Storage**: Maintain at least one off-site backup (cloud storage, separate machine).

### Integrity Check Automation

- Run graph health checks weekly (isolated nodes, broken links, orphaned nodes).
- Verify all outgoing links resolve to existing notes monthly.
- Check for knowledge drift (notes substantially modified without metadata update).

### Recovery Procedures

Document procedures for:
- Full vault restoration from backup
- Selective note recovery (single note or small set)
- Graph structure repair after corruption
- Migration between storage backends
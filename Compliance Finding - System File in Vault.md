---
last-reviewed: 2026-04-08
lifecycle: compliance
confidence: high
author-type: ai-assisted
gap-status: open
gap-type: compliance-violation
severity: medium
vault-hygiene-issue: system-files-in-vault
knowledge-type: meta
---

# Compliance Finding: System Files in Vault

## Issue

The Seed rule (2026-04-04) states:
> Exclude workspace system files from the vault — files like AGENTS.md, SOUL.md, USER.md, IDENTITY.md, TOOLS.md, HEARTBEAT.md are operational, not content.

However, **CLAUDE.md** exists in the vault root at `/home/node/.openclaw/workspace/ai-assisted-knowledge-management-vault/CLAUDE.md`.

## Details

- **File:** `CLAUDE.md`
- **Location:** Vault root (not in state/)
- **Status:** Has `protected: true` frontmatter — cannot be moved by automation
- **Size:** 29,937 bytes
- **Last audit:** 2026-04-07 (self-documented in the file)

## Why This Violates the Rule

1. CLAUDE.md is an operational file (describes vault purpose for AI agents) — not knowledge base content
2. System files bloat the vault and create noise in structural analysis
3. The rule explicitly lists .md operational files that belong in workspace state/, not content vaults
4. While CLAUDE.md serves a legitimate purpose, it should live in state/ alongside AGENTS.md, SOUL.md, etc.

## Constraint

The CLAUDE.md file has `protected: true` in frontmatter. Per HEARTBEAT.md rule #7:
> **NEVER merge or delete notes that have `protected: true` in their frontmatter.**

Therefore, this finding cannot be resolved through automated heartbeat work. This requires:
1. Manual intervention from vault maintainer to remove `protected: true` OR
2. Accepting this as an exception (CLAUDE.md serves as vault documentation that's actually useful in context)

## Related

- [[AI-Assisted Knowledge Management Seed]] — Seed rule (2026-04-04) for system file exclusion
- [[Seed Refinement - Metadata Compliance Monitoring]] — Related refinement note
- HEARTBEAT.md — Vault hygiene rules
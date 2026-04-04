---
last-reviewed: 2026-04-03
lifecycle: seed-refinement-proposal
confidence: emerging
author-type: ai-assisted
tags:
  - structural-health
  - isolated-nodes
  - audit
---

# Structural Health Check - 2026-04-03

## Discovery Method: STRUCTURAL_HEALTH

## Findings

### Orphaned Notes (isolated, no incoming links)
- **AGENTS.md** - Workspace system file, should have always been excluded
- **Compliance Audit - Note Lifecycle Rule.md** - References other notes in Related section but no backlinks
- **Compliance Audit - Operational Maintenance Workflow.md** - Similar pattern
- **Frontier Exploration - Competing Organizational Structures (MERGED).md** - Merged note, historical
- Multiple other Frontier Exploration notes - these document gaps, may not need incoming links

### Low Outgoing Link Notes (<2 links)
- Seed Refinement - Species-Variation-Aware Knowledge Scope.md (1 link)
- Seed Stress Test - Link Explainability Rule in Creative Writing.md (1 link)
- Seed Stress Test - Linking Rule in Cooking.md (1 link)
- Seed Stress Test - Music Performance Knowledge Base.md (1 link)
- Various other stress test notes

### Root Distance
- _root.md exists and has appropriate links to hub nodes
- Most notes can reach 3 hops from root via wikilinks

### Observations
1. **AGENTS.md presence:** The workspace system file was accidentally included in the vault. Options:
   - Delete from vault (moves to state/)
   - Add to CLAUDE.md exclusion list

2. **Compliance Audit notes:** These internal audit notes document findings but may not need backlinks - they audit other notes rather than being referenced.

3. **Many Frontier Exploration notes have no backlinks:** This is expected - they document gaps rather than being referenced.

4. **Graph tools unavailable:** MCP not built, so programmatic graph analysis not possible. Manual analysis is less thorough.

## Action Taken
Created this structural health note to document findings.

## Recommendations for Future Heartbeats
1. **Delete workspace system files from vault** - AGENTS.md, HEARTBEAT.md, IDENTITY.md, SOUL.md, TOOLS.md, USER.md should be excluded (they are workspace operational files, not vault content)
2. Add these files to `.gitignore` 
3. Consider whether Compliance Audit notes need backlinks
4. Consider adding "frontier:" tag to distinguish gap notes from regular content
5. Build graph MCP for better structural analysis

## Seed Rule Gap Identified

The Seed has a rule about ignoring generated files (line 65), but it doesn't explicitly exclude **workspace system files** that are accidentally added to the vault. These files (AGENTS.md, SOUL.md, etc.) are operational for OpenClaw but don't belong in the knowledge vault.

Proposed new rule text for Seed at line ~65:

> **Rule:** Exclude workspace system files from the vault — files like AGENTS.md, SOUL.md, USER.md, IDENTITY.md, TOOLS.md are operational, not content.
> **Why:** System files bloat the vault and create noise in structural analysis. They are not knowledge base content.
> **Test:** Check that AGENTS.md, SOUL.md, USER.md, IDENTITY.md, TOOLS.md, HEARTBEAT.md are NOT in the vault directory.

## Related
- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Development Hub]]
- [[CLAUDE.md]]
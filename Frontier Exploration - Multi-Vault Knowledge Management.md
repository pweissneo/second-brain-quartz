---
last-updated: 2026-04-05
lifecycle: emerging
confidence: emerging
author-type: ai-assisted
gap-type: seed-missing
---

# Frontier Exploration - Multi-Vault Knowledge Management

> When an agent manages multiple knowledge vaults (personal second brain, project vaults, domain-specific vaults), what rules govern cross-vault knowledge?

The current Seed assumes a single vault. But many AI agents manage multiple vaults:
- Main reference vault
- Project-specific vault (one per major project)
- Domain-focused vaults (trading, cooking, woodworking)
- Shared/collaborative vaults

## The Gap

**Question:** What rules exist for:
1. Cross-vault linking (`[[vault-alias/note]]` or similar)
2. Duplicate knowledge (same idea exists in multiple vaults - merge or keep separate?)
3. Vault-specific vs. universal knowledge classification
4. Migrating notes between vaults when domains shift
5. Consistent schema across vaults vs. vault-specific customization
6. Multi-vault search/retrieval
7. Access control across vaults (some vaults more sensitive)

## Examples of Multi-Vault Scenarios

**Scenario 1:** You start a woodworking project vault. Should you:
- Copy relevant techniques from main vault?
- Link to main vault?
- Create new notes specific to the project?

**Scenario 2:** Your trading vault has "portfolio construction" but your main vault has "diversification." Same concept, different domains. Same note or two?

**Scenario 3:** A note in your cooking vault references food safety knowledge that lives in your medical vault. Link or duplicate?

## What Rules Might Be Missing

1. **Cross-vault reference syntax** - How to link to notes in other vaults
2. **Duplicate handling** - When to duplicate vs. link vs. merge
3. **Vault scope definition** - Explicit boundaries for what each vault covers
4. **Migration protocol** - How to move notes between vaults
5. **Federated search** - Searching across all vaults
6. **Access tiering** - Which vaults are more sensitive (require different handling)

## Test for Multi-Vault Awareness

Can you answer:
1. How many vaults do you manage?
2. What is the scope/boundary of each?
3. Can you identify notes that exist in multiple vaults?
4. Is there a clear "home" for each domain?
5. Do you have cross-vault links that work?

## Domain to Test Against

Test these potential rules against:
- **Music composition** (new vault for a composition project)
- **Home repair** (separate vault for DIY projects)
- **Research** (academic vault separate from personal)

---

**Status:** Frontier exploration - rule not yet formed
**Next step:** Test current Seed rules against multi-vault scenario, identify where they explicitly assume single vault
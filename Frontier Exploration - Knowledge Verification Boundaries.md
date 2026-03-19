---
knowledge-type: frontier-exploration
confidence: high
lifecycle: deprecated
last-reviewed: 2026-03-17
author-type: ai-assisted
redirects-to: [[AI-Assisted Knowledge Management Seed]]
---

# DEPRECATED: Frontier Exploration - Knowledge Verification Boundaries

> ⚠️ **This note is deprecated.** The content has been integrated into the [[AI-Assisted Knowledge Management Seed]]. This note is kept for historical reference only.

## Summary

All rules from this note are now in the Seed:
- verification-avoid frontmatter (lines 1035+)
- Alternative verification methods
- Safety-critical verification boundaries

Please use the Seed for verification boundary rules.

# Frontier Exploration - Knowledge Verification Boundaries

## The Gap

The Seed covers verification thoroughly: verification-status, activation states, experiential verification, and calibration. But there's a gap: **knowledge that should never be verified through execution**.

Not all knowledge can or should be tested. Some knowledge is:
- **Dangerous to verify** (testing could cause harm)
- **Illegal to verify** (testing would violate laws)
- **Unethical to verify** (even if possible, shouldn't)
- **Irreversible to verify** (the act of verifying changes the outcome)

The current rules assume verification is always possible and desirable. But an AI building a knowledge base needs to know when to explicitly mark knowledge as "do not verify."

## Examples

### Dangerous Knowledge
- Instructions for creating dangerous substances
- Exploit code for security vulnerabilities  
- Detailed bypasses for safety systems

### Illegal Knowledge
- Methods for evading law (fraud, tax evasion)
- Piracy/bootleg procedures
- Methods for violating privacy regulations

### Unethical Knowledge
- Social engineering techniques (even if "interesting")
- Manipulation tactics (even if "documenting the problem")
- Deception methods (even if for "awareness")

### Irreversible Knowledge
- Spoilers for media that can't be unread
- Solution reveals for puzzles (the puzzle is permanently solved)
- Outcome knowledge that changes the experience itself

## The Test

For knowledge that could be verified through execution:
1. **Could verification cause harm?** → Mark as `verification-avoid: dangerous`
2. **Would verification violate laws?** → Mark as `verification-avoid: illegal`
3. **Would verification violate ethics?** → Mark as `verification-avoid: unethical`
4. **Would verification destroy the value?** → Mark as `verification-avoid: irreversible`

## Implementation

```yaml
verification-avoid: dangerous|illegal|unethical|irreversible
verification-avoid-reason: "specific reason for avoidance"
alternative-verification: "how to assess this knowledge without execution"
```

## Alternative Verification Methods

For knowledge that shouldn't be executed, consider:
- **Source analysis**: Trust the source's credibility and track record
- **Peer review**: Check if other credible sources confirm
- **Logical consistency**: Verify the claims don't contradict known facts
- **Expert consultation**: Ask domain experts (without revealing the specific method)
- **Partial testing**: Test only safe components

## Why This Matters

An AI agent following the Seed will try to verify everything. But:
- A security researcher building a knowledge base about exploits needs to document vulnerabilities WITHOUT testing them
- A sociologist studying manipulation needs to understand techniques WITHOUT practicing them
- A compliance professional needs to know what rules exist WITHOUT trying to violate them

The vault becomes more dangerous (physically, legally, ethically) if every piece of knowledge is "verified" through execution. Explicit boundaries protect both the vault maintainer and anyone uses it.

## Edge Cases

**Knowledge that is dangerous to others but safe for you**: Document why verification is avoided and who could be harmed.

**Knowledge that was verified before the rule existed**: Retrospective tagging. Mark historical notes with `verification-avoid: historical` to note the new policy.

**Gray areas**: When unsure, err toward documenting with restrictions rather than deleting. A note with `verification-avoid: review-needed` prompts human judgment.

---

## Related Notes

- [[Confidence Markers]] — Existing confidence system
- [[Note Lifecycle Management]] — Lifecycle stages including verification states
- [[Stress Test - Verification Status Rule in Home Repair]] — Domain-specific verification in safety-critical context
- [[AI-Assisted Knowledge Management Seed#knowledge-processing]] — Verification workflow
- [[Frontier Exploration - Incomplete and Provisional Knowledge]] — Handling uncertain knowledge
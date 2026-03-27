---
last-reviewed: 2026-03-26
last-updated: 2026-03-26
lifecycle: evergreen
confidence: high
author-type: ai-assisted
gap-type: seed-missing
gap-status: resolved
resolved-by: [[AI-Assisted Knowledge Management Seed]]
---

# Seed Gap - Verification Requiring External Tooling

**Gap Type:** Verification Pathway Missing

**Observed Problem:** 
The Seed covers source verification, empirical verification, tool-executable verification (tests/code), and embodied verification. However, there's a gap: knowledge that can ONLY be verified using specialized external tools or equipment that aren't part of the knowledge base itself.

**Examples:**
- "This water quality is safe to drink" — requires water testing kit
- "This circuit is properly grounded" — requires multimeter/ground tester
- "This food is safe to consume" — requires lab equipment or requires eating it
- "This medication is authentic" — requires spectroscopy or verifying pharmacy
- "This plant identification is correct" — requires expert botanist review

**Why This Is a Gap:**
An AI agent following current Seed rules might mark these as "source verified" when they have a source, but the source itself might be wrong (counterfeit water test, mislabeled medication). The verification pathway for these claims requires physical tools or specialized expertise not available in the vault.

**Proposed Rule:**

**Rule:** For knowledge claims requiring external tooling or specialized equipment to verify, tag with `verification-mode: tool-dependent` and document the required verification tool or expertise.
**Why:** Without explicit tagging, AI agents cannot distinguish between verifiable knowledge (can be checked now) and tool-dependent knowledge (can only be checked with equipment/expertise). This prevents inappropriate confidence assignment.
**Test:** For knowledge claims about physical states (safety, authenticity, correctness): (1) Is this something that requires a tool or expert to verify? (2) Is the required tool documented? (3) Is confidence tied to tool-verification status, not just source presence?

**Implementation:**
```yaml
verification-mode: tool-dependent
verification-tool: [specific-tool-or-expertise-required]
tool-accessibility: available|requires-purchase|requires-expert
verified-by-tool: true|false
tool-verification-date: 2026-03-26
```

**Edge Cases:**
- **Tool-dependent but source verifiable:** "This medication was prescribed by a doctor" is source-verifiable. "This medication is authentic" is tool-dependent (could be counterfeit).
- **Embodied vs tool-dependent:** Eating food to verify it's safe is embodied verification (direct experience). Testing food in a lab is tool-dependent verification (using equipment).
- **Expertise as tool:** Some verifications require human experts rather than equipment. Treat expert consultation as "tool" for these purposes.

**Interaction with Existing Rules:**
- If tool verification is impossible, may be unverifiable (see existing unverifiable handling)
- If tool verification is possible but not done, verification-status should reflect tool-dependent state
- High-stakes domains (medical, safety, legal) often have tool-dependent knowledge that is critical

**See Also:**
- [[Seed Stress Test - Tool-Dependent Verification in Medical Knowledge]]
- [[Frontier Exploration - Verification Mode Taxonomy]]
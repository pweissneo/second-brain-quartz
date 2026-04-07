---
last-reviewed: 2026-03-26
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
domain-familiarity: learning
tags:
  - seed-stress-test
  - medical
  - verification
  - tool-dependent
  - external-verification
---

# Seed Stress Test: Tool-Dependent Verification in Medical Knowledge

> Testing Seed rules against knowledge that requires external tools or expertise to verify in medical/health domains.

## Context

This stress test validates the proposed gap resolution for [[Seed Gap - Verification Requiring External Tooling]] - knowledge that can ONLY be verified using specialized external tools or equipment.

---

## 1. The Verification Challenge in Medical Knowledge

Medical knowledge spans multiple verification modes:

### Source-Verifiable (Standard)
- Published guidelines (UpToDate, JAMA, etc.)
- Peer-reviewed research
- Manufacturer documentation

### Empirically Verifiable (Experiential)
- "This exercise helps back pain" — requires personal testing
- "This sleep position reduces acid reflux" — requires trying

### Tool-Dependent Verifiable (External Equipment/Expertise)
- "This medication is authentic" — requires spectroscopy/verification
- "This water is safe to drink" — requires water testing
- "This diagnostic result is accurate" — requires equipment calibration

### Embodied Verifiable (Personal Experience)
- "This treatment caused side effects" — requires personal experience

---

## 2. Stress Test Scenarios

### Scenario A: Medication Authenticity Verification

**Knowledge Claim:** "This pharmacy's generic metformin is equivalent to brand-name Glucophage."

**Verification Path:**
- Source-verifiable: FDA approval documents, bioequivalence studies
- Tool-dependent: Is THIS specific batch authentic? (requires lab testing)

**Gap Identification:** The Seed's source verification would mark this as verified (source exists), but the actual pill may be counterfeit.

**Proposed Test:** For medication knowledge:
1. Is there a source verification? (FDA, pharmacy records)
2. Is there a tool-dependent verification? (batch testing, pharmacy trust)
3. Is the tool-dependent status documented?

### Scenario B: Water Safety Verification

**Knowledge Claim:** "The tap water in this building is safe to drink."

**Verification Path:**
- Source-verifiable: Municipal water report, EPA compliance
- Tool-dependent: Is the water safe RIGHT NOW? (requires water testing kit)

**Gap Identification:** The source (municipal report) may be accurate for the system overall but not for this specific point of use (old pipes, contamination).

**Proposed Test:** For safety claims about physical states:
1. Is source verification available? (reports, inspections)
2. Is tool verification possible? (testing kit availability)
3. Has tool verification been performed?

### Scenario C: Diagnostic Equipment Calibration

**Knowledge Claim:** "This blood pressure reading is accurate."

**Verification Path:**
- Source-verifiable: Device FDA approval, calibration instructions
- Tool-dependent: Is THIS device properly calibrated? (requires reference device)

**Gap Identification:** A device can be FDA-approved (source-verified) but currently inaccurate (needs calibration).

**Proposed Test:** For measurement/diagnostic knowledge:
1. Is there source verification for the device/method?
2. Is there tool verification for THIS specific instance?
3. Is calibration status documented?

### Scenario D: Medical Imaging Interpretation

**Knowledge Claim:** "This X-ray shows no fractures."

**Verification Path:**
- Source-verifiable: Radiology training, reference atlases
- Tool-dependent: Does THIS reading have good inter-rater reliability? (requires second radiologist)

**Gap Identification:** Even expert radiologists have error rates. "Verified by source" doesn't mean "verified by multiple experts."

**Proposed Test:** For interpretive medical knowledge:
1. Is there source verification? (training, credentials)
2. Is there tool verification? (second opinion, consensus)
3. Is inter-rater reliability documented?

---

## 3. Frontmatter Verification Mode Testing

Testing the proposed frontmatter from the gap note:

```yaml
verification-mode: tool-dependent
verification-tool: [specific-tool-or-expertise-required]
tool-accessibility: available|requires-purchase|requires-expert
verified-by-tool: true|false
tool-verification-date: 2026-03-26
```

### Test Application

**Example 1: Home Water Testing**
```yaml
---
verification-mode: tool-dependent
verification-tool: water-quality-test-kit
tool-accessibility: requires-purchase
verified-by-tool: false
---
```

**Example 2: Pharmacy Verification**
```yaml
---
verification-mode: tool-dependent
verification-tool: pharmacy-inspection | lab-spectroscopy
tool-accessibility: requires-expert
verified-by-tool: true
tool-verification-date: 2026-01-15
---
```

---

## 4. Edge Cases

### Edge Case: Tool-Dependent AND Source-Verifiable

Some knowledge has both:
- "This medication requires refrigeration" — source verifiable (label)
- "This specific medication is properly refrigerated" — tool-dependent (temperature logger)

**Resolution:** Use `verification-mode: both` with separate status fields.

### Edge Case: Expertise as Tool

Some verifications require human experts rather than equipment:
- "This diagnosis is correct" — requires second opinion
- "This surgical approach is appropriate" — requires specialist consultation

**Resolution:** Treat expert consultation as "tool" verification with `verification-tool: specialist-consultation`.

### Edge Case: Tool Verification Feasibility

Some tool-dependent knowledge has no practical verification path:
- Historical medical practices — can't verify ancient treatments
- Extreme rarity — no test kit exists for obscure toxins

**Resolution:** Mark as `verification-mode: tool-dependent` with `verified-by-tool: infeasible`.

---

## 5. Relationship to Other Verification Modes

| Mode | What It Verifies | Example | Tool/Expertise Required |
|------|------------------|---------|------------------------|
| Source | Documentation accuracy | Published guideline | None (read document) |
| Empirical | Personal experience | "This works for me" | None (try it) |
| Tool-dependent | Physical/chemical state | Water safety, authenticity | Test kit, lab, expert |
| Embodied | Sensory/subjective | "It tastes good" | Personal senses |

**Test:** Can you categorize every verification claim in your medical knowledge base into one of these modes?

---

## 6. Integration with Seed Rules

### Verification Status Interaction

```yaml
verification-status: verified    # Source verified
verification-status: testing    # Empirical testing in progress
verification-status: tool-dependent-pending  # NEW: awaiting tool verification
```

### Confidence Interaction

Tool-dependent knowledge should have confidence adjusted based on:
- Tool accessibility (available = higher confidence)
- Last tool verification date (recent = higher confidence)
- Tool verification results (positive = higher confidence)

**Proposed Seed Addition:** For tool-dependent knowledge, `confidence` should consider tool verification recency and availability.

---

## Summary

Medical knowledge often requires tool-dependent verification that standard source verification cannot capture. This stress test validates that the Seed's gap resolution proposal handles:

1. ✅ Medication authenticity verification
2. ✅ Water/environmental safety verification
3. ✅ Diagnostic equipment calibration
4. ✅ Medical interpretation verification (second opinion)
5. ✅ Tool vs expertise distinction
6. ✅ Interaction with other verification modes

## Related Notes

- [[Seed Gap - Verification Requiring External Tooling]] — The gap this stress test validates
- [[Seed Stress Test - Source Reliability vs Verification in Medical Domain]] — Related medical stress test
- [[AI-Assisted Knowledge Management Seed]] — Source rules
- [[Verification Workflow]] — Verification handling

---

**Discovered during:** Compliance audit (manual source)
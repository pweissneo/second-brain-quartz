---
last-reviewed: 2026-03-21
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
knowledge-type: meta
access-pattern: decision
---

# Seed Stress Test: Source Reliability vs Verification Status in Medical Domain

Testing the Seed rule "Track source reliability and verification status as separate dimensions" in medical knowledge base context.

## The Seed Rule

**Rule:** Track source reliability and verification status as separate dimensions — a source can be reliable but unverifiable, or verified but unreliable.

**Why:** Reliability (does the source know what they're talking about?) is fundamentally different from verification (can we confirm independently?). A confidential expert whistleblower may be highly reliable but unverifiable; an accidentally-correct rumor is verified but unreliable.

**Test:** For each note with sourcing: (1) Can you assess source reliability (expertise, access, track record)? (2) Can you assess verification status (independently confirmable, unverifiable, disputed)? Are these tracked separately?

---

## Medical Domain Application

### Edge Case 1: Published Medical Research

A study published in a peer-reviewed journal (e.g., NEJM, Lancet):
- **Source reliability:** High (peer review process, institutional backing)
- **Verification status:** The findings may not be independently verified for years; other labs need to replicate

This is the classic case: reliable source (qualified researchers) but unverifiable (replication takes time).

### Edge Case 2: Patient Testimonials

A patient shares their experience with a treatment on a forum:
- **Source reliability:** Low (no medical training, N=1)
- **Verification status:** Verified (they experienced it personally)

This is "verified but unreliable" - the story is true for that person but may not generalize.

### Edge Case 3: Expert Opinion vs. Published Evidence

A renowned specialist gives advice based on decades of experience but hasn't published:
- **Source reliability:** High (expert in field with track record)
- **Verification status:** Unverifiable (personal experience not documented)

This is "reliable but unverifiable" - the expert knows their stuff but can't point to published studies.

### Edge Case 4: Retracted Papers

A study was published in a high-impact journal but later retracted:
- **Source reliability:** Was high at publication, now should be marked as compromised
- **Verification status:** Previously verified, now needs updating

This requires temporal tracking of reliability.

### Edge Case 5: Clinical Guidelines

Guidelines from professional bodies (AMA, AHA):
- **Source reliability:** High (professional consensus)
- **Verification status:** High (based on accumulated evidence)

This is the ideal case - both high.

---

## Test Executability

Can an AI agent execute this test? Let's see:

1. **Assess source reliability:** Requires understanding of source credentials. An AI can:
   - Identify journal impact factor
   - Check author credentials
   - Evaluate institutional backing
   
2. **Assess verification status:** Requires understanding of evidence hierarchy:
   - RCT > observational > case series > expert opinion
   - An AI can categorize this

The Test IS executable by an AI with appropriate tooling.

---

## Edge Cases Where Rule Fails

### Edge Case: Conflicting Reliable Sources

Two highly reliable sources (e.g., WHO and CDC) disagree:
- Both have high reliability
- Both are verified (from their respective evidence)
- But they contradict each other

The rule doesn't handle this well - it's about the same source, not conflicting sources.

### Edge Case: Source Reliability Changes Over Time

A researcher was reliable, then was found to have fabricated data:
- Old notes using their work need updating
- The rule needs temporal component

### Edge Case: Anonymous Sources

"Anonymous source at the hospital claims..."
- Cannot assess reliability (who are they?)
- Cannot verify (no way to confirm)

The rule handles this as "unverifiable, reliability unknown" but that's not explicitly tested.

---

## Implementation for Medical Domain

```yaml
source-reliability: high|medium|low|unknown
source-verification: verified|unverifiable|pending|disputed
# Example note:
source-reliability: high  # Published in peer-reviewed journal
source-verification: verified  # Multiple replications confirm
```

But need to add:
```yaml
source-reliability-as-of: 2024-06
source-verification-as-of: 2024-06
```

---

## Conclusion

The rule makes sense for medical domain - critical for distinguishing "expert said X" from "X is proven."

The Test is executable but requires:
- Access to source metadata (journal, author credentials)
- Understanding of evidence hierarchy

**Edge case found:** Conflicting reliable sources is not handled - this is a different problem from the one the rule addresses (source quality vs. verification).

---

## Related

- [[AI-Assisted Knowledge Management Seed]]
- [[Seed Stress Test - Medical Domain Knowledge]]
- [[Handling Contradictory Sources]]
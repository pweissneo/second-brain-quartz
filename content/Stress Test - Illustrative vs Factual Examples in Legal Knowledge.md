---
last-reviewed: 2026-03-09
lifecycle: draft
confidence: emerging
tags:
- seed-stress-test
- legal-domain
- edge-case
---

# Stress Test: Illustrative vs Factual Examples in Legal Knowledge

## Seed Rule Being Tested
**Rule:** Distinguish illustrative examples from factual examples — mark hypothetical/teaching examples as such, date real-world examples.
**Test:** Pick 5 notes with examples. Can you categorize each as illustrative (hypothetical) or factual (real-world)? Are factual examples dated?

## Application to Legal Knowledge Base

Legal knowledge is an excellent stress test because:
1. Lawyers constantly use hypotheticals (illustrative) vs case law (factual)
2. Confusing the two can lead to serious errors
3. The stakes are high - bad legal advice harms people

### Where the Rule Works Well

- **Case citations**: "In *Smith v. Jones* (2023), the court held that..." - clearly dated, factual
- **Statutory references**: "Under Section 26(a) of the Act..." - factual, no date needed
- **Published opinions**: "The appellate court in *Doe v. Roe* held..." - verifiable, factual

### Edge Case 1: Teaching Hypotheticals

**Problem:** Law school and bar exam materials use hypotheticals extensively:

**Note content:**
"Under the doctrine of res ipsa loquitur, if a patient leaves the operating room with a surgical instrument inside them, negligence can be inferred. For example, if Dr. Smith leaves a clamp in a patient's abdomen, the patient need not prove specific negligence."

**Analysis:**
- This is a teaching/hypothetical example - NOT a real case
- Should be marked as illustrative
- The "Dr. Smith" example never happened
- If AI treats this as factual and cites it, it would be professional malpractice

**The Test Fails:** An AI applying this rule without legal domain knowledge would:
- Not distinguish teaching hypotheticals from case law
- Potentially cite non-existent cases as precedent
- Create misleading "evidence" from teaching materials

### Edge Case 2: Modified Real Cases

**Problem:** Sometimes teachers modify real cases for classroom discussion:

**Note content:**
"In a case similar to *Johnson v. Hospital Corp*, a patient was awarded damages when..."

- The base case (if real) is factual
- The "similar to" modification makes it partially hypothetical
- How should this be marked?

### Edge Case 3: Common Law Principles

**Problem:** Notes about common law principles often cite multiple cases:

**Note content:**
"The principle of proximate cause has been recognized since *Palsgraf v. Long Island Railroad* (1928) and reaffirmed in later cases including *Bolitho v. Dodds* (1997)."

- Both cases are real and dated - this passes the test
- But what about jurisdictions that haven't adopted these cases?

### Edge Case 4: Model Laws and Uniform Acts

**Problem:** Model laws aren't actual law yet:

**Note content:**
"The Uniform Commercial Code Section 2-207 governs contract modifications."

- This is neither illustrative nor factual in the case-law sense
- It's "proposed" or "model" legislation
- Needs different handling

### Edge Case 5: International Law

**Problem:** Comparing legal systems with different sources:

**Note content:**
"In English common law, consideration is required for a contract. Under French civil code, it is not."

- This is comparative, not illustrative or factual
- Neither example is "dated" because they're describing ongoing legal systems
- The rule may not apply cleanly

### Edge Case 6: Pending Legislation

**Problem:** Laws that haven't been passed yet:

**Note content:**
"The proposed AI Regulation (EU AI Act) would require..."

- Not yet law - factual about the proposal but not about the law itself
- Changes frequently
- Needs "status: pending" marker

## The Real Issue

The illustrative/factual distinction is critical in legal contexts but the rule doesn't address:
1. Teaching hypotheticals that look like case summaries
2. Modified cases that blend fact and hypothesis
3. Model laws that aren't yet enacted
4. Comparative legal analysis
5. Pending vs. enacted legislation

## Recommendation

The Seed rule should be refined to include legal domain guidance:

**Rule:** Distinguish illustrative examples from factual examples in legal knowledge:
- **Illustrative (hypothetical)**: Teaching examples, exam scenarios, modified cases - mark with `example-type: illustrative`
- **Factual (case law)**: Real court decisions, enacted statutes - include citation and year
- **Comparative**: Cross-jurisdictional analysis - mark with `example-type: comparative`
- **Pending**: Proposed legislation, bills - mark with `status: pending`

**Test:** For notes with legal examples: (1) Is this a real case/statute or a hypothetical? (2) If hypothetical, is it marked as illustrative? (3) If real, is it dated with citation? (4) If comparative, is the jurisdiction specified?

## Related
- [[Frontier Exploration - Illustrative vs Factual Examples]]
- [[AI-Assisted Knowledge Management Seed]]
- [[Confidence Markers]]

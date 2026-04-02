---
last-reviewed: 2026-03-22
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - frontier-exploration
  - knowledge-ethics
  - sensitive-knowledge
  - responsible-ai
related-seed-rule: knowledge-ethics
---

# Frontier Exploration: Knowledge Sensitivity and Responsible Capture

> How to handle knowledge that could cause harm if mishandled, misused, or misunderstood.

## The Problem

Some knowledge, while accurate and potentially valuable, carries risks:
- **Dual-use knowledge**: Information that can be used for good or harm (security research, dangerous procedures, manipulation techniques)
- **Harmful content**: Knowledge about harmful activities that shouldn't be spread
- **Personally sensitive**: Information that could harm someone if disclosed (private data, identifying details)
- **Misuse potential**: Knowledge that could be dangerously misunderstood out of context

The current Seed addresses:
- Knowledge ethics and exclusion (what NOT to capture)
- Verification and confidence levels
- Access control (for human-only knowledge)

But it doesn't explicitly address: **How do you capture valuable but sensitive knowledge responsibly?**

## Why This Matters

Ignoring sensitive knowledge creates gaps:
- **Security vulnerabilities**: Not documenting known attacks means you can't defend against them
- **Historical atrocities**: Not understanding how atrocities happened makes them more likely to recur
- **Health dangers**: Not documenting dangerous substances/reactions puts people at risk
- **Manipulation awareness**: Not understanding manipulation techniques makes you more vulnerable

Over-capturing sensitive knowledge creates different risks:
- **Spreading harmful content**: Documentation becomes a vector for harm
- **Legal liability**: Possession of certain knowledge creates liability
- **Normalization**: Making dangerous things seem routine
- **Weaponization**: Your vault becomes a target or resource for bad actors

## The Challenge

Sensitive knowledge presents a paradox:
- Capturing it enables defense, understanding, and prevention
- Capturing it enables harm, abuse, and weaponization
- Excluding it creates blind spots that hurt you
- Including it creates risks that may outweigh benefits

## Proposed Approach

### Sensitivity Classification System

```yaml
sensitivity-level: none | low | medium | high | extreme
sensitivity-reason: dual-use | harmful-content | personally-identifiable | misuse-potential | legal-risk
capture-justification: "Why the knowledge benefits from being captured"
mitigation-strategy: "How harm is prevented"
access-restriction: none | vault-internal | human-only | encrypted | never-publish
```

### Sensitivity Levels

| Level | Description | Example | Handling |
|-------|-------------|---------|----------|
| none | Standard knowledge | Historical facts | No special handling |
| low | Mild sensitivity | Personal opinions | Note attribution |
| medium | Moderate risk | Security vulnerabilities | Access control, no public export |
| high | Significant harm potential | Dangerous procedures | Vault-internal only, encryption consideration |
| extreme | Severe harm potential | Weapons manufacturing | Do not capture unless absolutely necessary |

### The "Dual-Use" Framework

For knowledge that can be used for both benefit and harm:

1. **Capture the DEFENSE, not the attack**
   - Document how to protect against attacks, not how to execute them
   - Example: Document vulnerability mitigation, not exploitation details

2. **Capture the ANALYSIS, not the raw data**
   - Document lessons learned, not harmful content itself
   - Example: Document propaganda techniques, not propaganda content

3. **Capture the CONTEXT, not the substance**
   - Document why something is dangerous, not dangerous details
   - Example: Document that a substance is toxic, not detailed toxicity measurements that could be misused

4. **Capture the HISTORY, not the methods**
   - Document what happened and why it matters, not how to replicate
   - Example: Document that atrocities occurred and what enabled them, not operational details

### Distinction from Existing Tags

| Tag | Distinction |
|-----|-------------|
| `knowledge-ethics: exclude` | Don't capture at all |
| `access-control: human-only` | Who can access |
| `confidence: emerging` | How certain we are |
| `sensitivity-level` | How dangerous if mishandled |

### The "Necessity Test" for Extreme Sensitivity

Before capturing extreme-sensitivity knowledge, ask:

1. **Is there a demonstrated need?** Not "might be useful" but "we specifically need this"
2. **Can less-sensitive alternatives work?** Can we capture the lesson without the dangerous detail?
3. **Can we verify it's essential?** Get second opinion from another vault manager
4. **Can we minimize exposure?** Can we structure it so only essential people see essential parts?
5. **Do we have mitigation capability?** Can we actually prevent misuse if we capture it?

### Responsible Documentation Patterns

#### Security Vulnerabilities
```
Note: SQL Injection Defense

sensitivity-level: medium
sensitivity-reason: dual-use
capture-justification: "Essential for protecting applications"
mitigation-strategy: "Document defense only, not exploitation"
access-restriction: vault-internal

Content: Focus on prevention, detection, and remediation.
Do NOT include: Step-by-step exploitation guides.
```

#### Historical Atrocities
```
Note: How Genocide Occurs - Warning Signs

sensitivity-level: high  
sensitivity-reason: harmful-content | misuse-potential
capture-justification: "Prevention requires understanding warning signs"
mitigation-strategy: "Focus on warning signs and prevention, not methods"
access-restriction: human-only-discussion

Content: Document patterns that enable atrocities.
Do NOT include: Operational details that enable replication.
```

#### Manipulation Techniques
```
Note: Common Manipulation Tactics

sensitivity-level: medium
sensitivity-reason: misuse-potential
capture-justification: "Awareness enables defense"
mitigation-strategy: "Document from defender perspective, not attacker playbook"
access-restriction: none

Content: How to recognize manipulation.
Do NOT include: How to manipulate others effectively.
```

## Domain-Specific Considerations

### Security
- Document vulnerabilities in generic terms when possible
- Focus on detection and mitigation
- Never include actionable exploit code

### Medical
- Document dangerous substances with safety warnings
- Focus on prevention and treatment, not synthesis
- Consider legal liability for medical advice

### Historical
- Capture context and lessons, not operational details
- Consider trauma impact on those documented
- Balance historical accuracy with harm prevention

### Political/Social
- Document manipulation techniques defensively
- Avoid content that could be used for voter manipulation
- Consider dual-use of "influence techniques"

## Test for Seed

**Rule:** Apply sensitivity classification to knowledge with potential for harm

**Why:** Unclassified sensitive knowledge creates uncontrolled risk. Without explicit classification, sensitive knowledge looks identical to regular knowledge and gets treated the same (shared, exported, etc.).

**Test:** For knowledge that could cause harm if misused: (1) Is sensitivity-level specified? (2) Is capture-justification documented? (3) Is mitigation-strategy defined? (4) Are access restrictions applied?

## Questions for Seed

1. Should extreme-sensitivity knowledge ever be captured? What threshold justifies it?
2. How do you handle knowledge that becomes MORE sensitive over time (old vulnerabilities become weapons)?
3. Should vaults track a "sensitivity budget" - maximum amount of sensitive content allowed?
4. How do you verify sensitive knowledge without creating exploitation documentation?
5. What's the liability implications of documenting dangerous knowledge?

## Interaction with Other Rules

- **Knowledge ethics**: Sensitivity classification extends ethics into "what to capture carefully" (vs "what to exclude entirely")
- **Access control**: Sensitivity determines appropriate access restrictions
- **Verification**: Sensitive knowledge requires MORE verification, not less
- **Multi-vault**: Sensitive knowledge should not be shared across vaults without equivalent security
- **Correction workflow**: Sensitive knowledge errors are higher stakes - faster correction needed

## See Also

- [[Frontier Exploration - Knowledge Ethics and Exclusion]]
- [[Frontier Exploration - Access-Controlled Knowledge]]
- [[Handling Incorrect Knowledge]] - Critical for sensitive knowledge where errors cause harm
- [[Knowledge Verification Workflow]] - Especially important for sensitive content

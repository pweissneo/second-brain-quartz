---
last-reviewed: 2026-03-24
last-updated: 2026-03-24
lifecycle: seed-extension
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - home-automation
  - iot
  - infrastructure
schema-version: "1.0"
---

# Seed Stress Test: Home Automation Knowledge Base

> Testing Seed rules against the home automation domain to identify edge cases and gaps.

## Domain Characteristics

Home automation is an **infrastructure-dependent** domain where:
- Device ecosystems (Zigbee, Z-Wave, WiFi, Matter) create hard boundaries
- Knowledge often doesn't transfer between configurations
- Real-time state knowledge differs from static configuration knowledge
- Firmware/version drift affects knowledge validity

## Rules Tested

### 1. Atomicity Rule

**Seed Rule:** One idea per note.

**Application to Home Automation:**
- Device configuration notes should be atomic (one device = one note)
- Automation logic should be atomic (one automation = one note)
- But: automation sequences that span multiple devices are inherently multi-component

**Edge Case:** An automation that depends on 5 devices and triggers 3 actions — is this one note or should it be split?

**Test:**
- Can you create atomic notes for device config without losing context?
- Does splitting automations into sub-components break the logic?

**Expected:** Atomicity applies but requires infrastructure scoping per note.

---

### 2. Construction Phase Model

**Seed Rule:** Use construction-phase model to guide structural decisions.

**Application to Home Automation:**
- Skeleton phase (1-20 devices): Focus on core device categories
- Flesh phase (20-100 devices): Build automation patterns
- Muscle phase (100+): Complex multi-device scenarios

**Edge Case:** Home automation vaults grow with each new device added. The "construction complete" criteria may never trigger if the user continuously adds devices.

**Test:**
- Can you define construction completion for a home automation vault?
- Does the Seed's 50-note threshold make sense for this domain?

**Expected:** Construction phase may need modification for continuously-growing IoT vaults.

---

### 3. Infrastructure Tagging Rule

**Seed Rule:** For infrastructure-dependent domains, tag with infrastructure-type, protocol, and scope.

**Application to Home Automation:**
```yaml
infrastructure-type: hardware
infrastructure-scope:
  protocol: zigbee
  hub: smartthings
  firmware: "2026.02.15"
```

**Edge Cases:**
- **Multi-protocol automations:** An automation using both Zigbee and WiFi devices — how to tag?
- **Gateway dependencies:** A Zigbee device through a SmartThings hub vs. direct Hue bridge — different scopes
- **Firmware-specific knowledge:** A troubleshooting note that only applies to firmware version X

**Test:**
- Can you identify the infrastructure scope for any note?
- Does multi-protocol automation break the tagging rule?

**Expected:** Infrastructure tagging works but needs multi-protocol support.

---

### 4. Verification Ratio Rule

**Seed Rule:** Verify at least 50% of new captures within 30 days.

**Application to Home Automation:**
- Device config: verifiable immediately (can test if it works)
- Automation logic: verifiable after trigger events occur
- Troubleshooting: verifiable when problem recurs

**Edge Cases:**
- **Seasonal verification:** Automation for HVAC only testable seasonally
- **Rare event automation:** "If earthquake detected" may never trigger in test period
- **Hardware failure:** Verification of device troubleshooting requires hardware to fail

**Test:**
- Can you apply the 30-day rule to seasonally-dependent automations?
- How do you handle verification of edge-case automations?

**Expected:** Verification needs domain-specific windows for rare-event and seasonal knowledge.

---

### 5. 5:1 Personal-to-General Ratio

**Seed Rule:** For every 5 personal notes, include 1 general principle.

**Application to Home Automation:**
- Personal: "My Hue lights in living room"
- General: "How motion sensors trigger lighting automations"

**Edge Cases:**
- **Device-specific vs. general:** A note about "Hue motion detection" is device-specific but contains general principles
- **Protocol-level principles:** Zigbee networking concepts apply across all Zigbee devices

**Test:**
- Can you distinguish device-specific from protocol-specific from general?
- Do device-specific notes count as "personal" or "general"?

**Expected:** Ratio needs adjustment for device-specific knowledge that contains general principles.

---

### 6. Link Density Rule

**Seed Rule:** Notes should have meaningful links to other notes.

**Application to Home Automation:**
- Device notes link to: hub, protocol, room, automation
- Automation notes link to: triggers, actions, dependencies

**Edge Cases:**
- **Link rot from firmware updates:** Links may become stale when device firmware changes
- **Cross-ecosystem links:** A Zigbee note linking to a WiFi device — rare but possible

**Test:**
- Can you maintain meaningful link structures as devices change?
- Do firmware updates break links?

**Expected:** Link density works but needs stale-link detection.

---

### 7. Confidence Markers Rule

**Seed Rule:** Use confidence markers to indicate reliability.

**Application to Home Automation:**
- high: Device documentation from manufacturer
- emerging: Community-sourced automation recipes
- speculative: New automation patterns not yet tested

**Edge Cases:**
- **Firmware-dependent confidence:** A configuration that works on firmware X may fail on Y
- **Hardware-revision confidence:** Same device model, different hardware revision

**Test:**
- Can confidence markers capture firmware-version dependency?
- Should confidence change when firmware updates?

**Expected:** Confidence markers need firmware-version tracking.

---

### 8. Knowledge Type Distinction

**Seed Rule:** Distinguish knowledge types (factual, procedural, experiential, conceptual).

**Application to Home Automation:**
- **Procedural:** How to pair a Zigbee device
- **Factual:** This device supports these protocols
- **Experiential:** "This sensor has false positives in direct sunlight"
- **Conceptual:** How mesh networks work

**Edge Cases:**
- **State knowledge:** "Living room lights are currently ON" — ephemeral, not factual
- **Event knowledge:** "Motion detected at 2:34 PM" — time-stamped, not conceptual

**Test:**
- Can you categorize all home automation knowledge types?
- What about real-time state?

**Expected:** Seed's knowledge types work but need "state" and "event" types added.

---

## Identified Edge Cases Summary

| Seed Rule | Edge Case | Proposed Fix |
|-----------|-----------|--------------|
| Construction Phase | Continuous device addition | Add "continuous-growth" lifecycle mode |
| Infrastructure Tagging | Multi-protocol automations | Support list of protocols in scope |
| Verification Ratio | Rare-event automations | Add verification-window field |
| 5:1 Ratio | Device-specific with general principles | Distinguish device-specific from personal |
| Confidence | Firmware-version dependent | Add firmware-version to confidence |
| Knowledge Types | Real-time state/event | Add state and event types |

## Test Results

**Passed:**
- Atomicity (with infrastructure scoping)
- Link density
- Knowledge type distinction (with extensions)
- Infrastructure tagging

**Needs Modification:**
- Construction phase (continuous growth)
- Verification ratio (seasonal/rare-event windows)
- 5:1 ratio (device-specific clarification)
- Confidence markers (firmware tracking)

## Vault Application

When applying Seed to home automation knowledge:
1. Add `infrastructure-type: hardware` to all device notes
2. Use multi-protocol tagging for cross-ecosystem automations
3. Track firmware versions in frontmatter
4. Apply seasonal verification windows for HVAC/seasonal automations
5. Consider "continuous-growth" construction phase

## Related Notes

- [[Frontier Exploration - Home Automation Knowledge Bases]]
- [[AI-Assisted Knowledge Management Seed#Infrastructure-dependent domains]]
- [[Seed Stress Test - Home Repair Knowledge Base]] (similar infrastructure dependencies)
- [[Frontier Exploration - Real-Time API-Dependent Knowledge]]- [[_root]]

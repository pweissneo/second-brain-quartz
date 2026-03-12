---
last-reviewed: 2026-03-11
lifecycle: draft
confidence: emerging
tags:
  - frontier-exploration
  - simulation
  - modeling
  - knowledge-types
---

# Frontier Exploration: Simulation-Based Knowledge

> How do we capture knowledge that exists primarily through computational models rather than text?

## The Problem

Some knowledge domains don't exist primarily as text — they exist as computational models, simulations, or systems that generate understanding through execution rather than reading. Text can describe these domains, but the core knowledge is in the model itself:

- **Climate science**: Climate models simulate planetary behavior; text describes them but doesn't contain the knowledge
- **Epidemiology**: Disease spread models; understanding emerges from running simulations
- **Ecology**: Ecosystem models with predator-prey dynamics, carrying capacity
- **Economics**: Market simulations, agent-based models
- **Physics**: Particle simulations, fluid dynamics
- **Engineering**: Finite element analysis, circuit simulation

An AI building a knowledge base using only current Seed rules would:
- ✓ Create notes about climate theory, disease models, ecosystem concepts
- ✗ Not know how to capture knowledge that lives in the simulation itself
- ✗ Not know how to document model assumptions, parameters, and outputs
- ✗ Not know when to link to a model vs. text explanation

## Current Seed Gaps

1. **No guidance on model documentation** — How do you document a computational model as atomic knowledge?
2. **No guidance on simulation parameters as knowledge** — Parameters, assumptions, initial conditions
3. **No guidance on model-output knowledge** — Knowledge that emerges from running a simulation, not from theory
4. **No guidance on linking models to text** — When does a note need a linked model vs. standalone text?
5. **No guidance on model version knowledge** — How to track which model version produced which insights

## The Challenge

### Challenge 1: The Model IS the Knowledge

In traditional knowledge management, the note contains the knowledge. In simulation-based domains, the model contains the knowledge:

**Example: Predator-Prey Dynamics**
- Text note: "Lotka-Volterra equations describe predator-prey population cycles"
- Model: Running the equations with real parameters produces specific predictions
- The knowledge is in the relationship between model and output, not in either alone

**Test:** Does understanding this domain require running/visualizing a model, or just reading about it?

### Challenge 2: Parameter Sensitivity

Many simulation-based insights come from understanding how outputs change with parameters:

**Example: Climate Sensitivity**
- Climate models produce different warming predictions based on sensitivity parameters
- The "knowledge" is the relationship: parameter X → output Y
- This is different from "facts" — it's a functional relationship

**Test:** Is the core knowledge a functional relationship (if X then Y) that requires computation to verify?

### Challenge 3: Model Limitations Are Knowledge

What a model CANNOT capture is often as important as what it can:

**Example: Economic Models**
- Models assume rational actors (false in reality)
- Models cannot predict black swan events
- The limitations ARE knowledge about the domain

**Test:** Do experts in this domain spend significant time discussing what the model fails to capture?

### Challenge 4: Competing Models

In some domains, multiple competing models exist with different assumptions:

**Example: Climate Models**
- Different climate models (GFDL, CESM, HadGEM) produce different outputs
- The choice of which model to use is domain knowledge
- Model selection criteria are knowledge

**Test:** Do experts in this domain argue about which model is "better" for different purposes?

## Emerging Rule Suggestions

### Rule: Distinguish Model-Based from Text-Based Knowledge

**Why:** Model-based knowledge has different properties — it's executable, parameterized, and version-dependent. Treating it like text loses these properties.

**Test:** Can this knowledge be fully captured in text, or does it require execution/visualization to be understood?

### Rule: Document Model Assumptions as Atomic Knowledge

**Why:** Assumptions determine model validity. A model is only as good as its assumptions.

**Test:** For each model note, can you list: (1) key assumptions, (2) parameter ranges, (3) known limitations?

### Rule: Link Text to Models, Don't Replace Them

**Why:** Text descriptions of model behavior are useful but incomplete. Readers should be able to access the model.

**Test:** For notes describing model behavior, is there a link to the actual model or visualization?

### Rule: Track Model Version and Provenance

**Why:** Model outputs change with versions. Knowledge attributed to "the model" may be version-specific.

**Test:** Can you determine which model version produced a given insight?

### Rule: Include Interpretation Guides for Model Output

**Why:** Raw model output is often meaningless without domain expertise to interpret it.

**Test:** Does each model note include guidance on how to interpret its outputs?

## Test Case: Epidemiology Knowledge Base

An AI building an epidemiology vault using only current Seed rules would:
- ✓ Create notes on disease transmission, vaccination theory, herd immunity
- ✗ Not know how to document an SIR model
- ✗ Not know how to capture parameter sensitivity knowledge (what happens when R0 changes?)
- ✗ Not know when to link to a simulation vs. text explanation
- ✗ Not know how to capture "model limitations" as knowledge

## Related

- [[AI-Assisted Knowledge Management Seed]] — The Seed this note extends
- [[Frontier Exploration - Temporal and Sequential Knowledge]] — Time-dependent knowledge
- [[Frontier Exploration - Multi-Modal Knowledge]] — Non-text media
- [[Frontier Exploration - Tacit Knowledge Capture]] — Knowledge that resists articulation
- [[Stress Test - Temporal Knowledge Rule in Stock Trading]] — Time-sensitive knowledge

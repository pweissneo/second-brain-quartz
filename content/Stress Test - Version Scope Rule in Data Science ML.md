---
last-reviewed: 2026-03-12
lifecycle: draft
confidence: emerging
author-type: ai-assisted
tags:
  - seed-stress-test
  - data-science-domain
  - version-scope
  - software-dependencies
---

# Stress Test: Version Scope Rule in Data Science / Machine Learning

## Seed Rule Being Tested
**Rule:** For knowledge that applies only to specific software versions, tool releases, or library iterations, include explicit version scope in frontmatter.
**Why:** Knowledge that depends on version without version metadata is misleading — readers cannot determine applicability, leading to failed implementations or incorrect advice.
**Test:** For notes containing software/tool/library instructions: (1) Does the knowledge depend on a specific version? (2) If yes, is there version scope metadata? (3) Can you determine which versions the knowledge applies to?

## Application to Data Science / Machine Learning Knowledge Base

### The Challenge

Data Science and Machine Learning have unique version challenges:
- Frameworks release major versions frequently (PyTorch 1.x → 2.x, TensorFlow 1.x → 2.x)
- API changes between major versions are often breaking
- CUDA versions for GPU acceleration
- Python version dependencies
- Library ecosystem interdependencies (scikit-learn, pandas, numpy)
- Pre-trained model versions (BERT, GPT, etc.)

### Edge Cases Found

#### Edge Case 1: Framework API Changes Between Major Versions

**Problem:** A note describes "how to create a neural network in PyTorch":

```python
import torch
from torch import nn

model = nn.Linear(10, 2)
```

**Version dependency:**
- PyTorch 1.x: This code works
- PyTorch 2.x: `torch.nn.Linear` still works but `torch.compile()` is the new recommended approach
- The note doesn't specify which version

**The Test Fails:** Without version scope, readers don't know if they're learning the current best practice or an outdated approach.

#### Edge Case 2: CUDA Version Dependencies

**Problem:** A note describes GPU acceleration for training:

```python
model = model.cuda()  # PyTorch 1.x style
```

**Version dependency:**
- PyTorch 1.x: `model.cuda()` works
- PyTorch 2.x: `model.to('cuda')` is preferred, `.cuda()` still works but deprecated
- CUDA 11.x vs CUDA 12.x have different capabilities

**The Test Fails:** GPU knowledge is particularly sensitive because incorrect CUDA version can cause runtime failures that are hard to debug.

#### Edge Case 3: Pre-trained Model Versions

**Problem:** A note describes "how to use BERT for text classification":

```python
from transformers import BertModel, BertTokenizer
```

**Version dependency:**
- Transformers library 2.x: Different API than 3.x
- 4.x: Different again
- Specific model versions (bert-base-uncased vs bert-large-uncased)
- Hugging Face Hub model versions

**The Test Fails:** The same code can produce different results depending on model version, and the library API changes significantly between versions.

#### Edge Case 4: Python Version Dependencies

**Problem:** A note shows data processing code:

```python
from pathlib import Path
path = Path('data.csv')
df = path.read_text()  # Python 3.6+ only
```

**Version dependency:**
- Python 3.5: No `read_text()` method
- Python 3.6+: Works
- Python 3.12+: Some deprecated methods removed

**The Test Fails:** Many notes assume recent Python but don't specify.

#### Edge Case 5: Library Ecosystem Interdependencies

**Problem:** A note about "scikit-learn pipelines":

```python
from sklearn.pipeline import Pipeline
```

**Version dependency:**
- scikit-learn 0.22: Different API than 1.0+
- numpy version affects scikit-learn behavior
- pandas version affects data handling

**The Test Fails:** The library ecosystem is interdependent, but notes often only mention one library.

#### Edge Case 6: GPU vs CPU Execution Differences

**Problem:** A note describes memory management:

```python
torch.cuda.empty_cache()  # Only relevant for GPU
```

**Version dependency:**
- CPU-only systems: This code does nothing
- GPU systems: Important for memory management
- Different behavior on Apple Silicon (MPS) vs NVIDIA CUDA

**The Test Fails:** Code that works on one setup fails silently on another.

#### Edge Case 7: Deprecated vs Experimental Features

**Problem:** A note about "distributed training":

```python
torch.nn.parallel.DistributedDataParallel  # Stable
torch.distributed.fsdp  # Experimental in some versions
```

**Version dependency:**
- Some features are experimental in early versions and become stable later
- Some features are deprecated and removed
- Documentation doesn't always clearly mark experimental status

**The Test Fails:** Notes don't distinguish stable, experimental, and deprecated features.

### What Works ✓

1. **Version-specific tutorials:** "PyTorch 2.0 Deep Learning Tutorial"
2. **Migration guides:** "Moving from TensorFlow 1.x to 2.x"
3. **Library release notes:** Captured with version dates

### What Breaks ✗

1. **Generic "PyTorch Tutorial"** without version
2. **Library-agnostic "ML Best Practices"** that show code without version scope
3. **Outdated API examples** that no longer work in current versions

### Refined Test for Data Science / ML Domain

```
For each code example or API reference:
1. Does this depend on a specific framework version?
2. Does this depend on a specific Python version?
3. Does this depend on specific library versions?
4. Does this work on CPU, GPU, or both?
5. Is this feature stable, experimental, or deprecated?
```

### Recommendation

**Refined Rule:** For Data Science / ML knowledge:
- Always specify framework version (PyTorch 2.x, TensorFlow 2.x, etc.)
- Specify Python minimum version if relevant
- Note CUDA requirements for GPU code
- Distinguish stable vs experimental features
- Include `eol-estimate` for versions approaching end-of-life

**Example Frontmatter:**
```yaml
software-dependencies:
  - pytorch: ">=2.0"
  - python: ">=3.8"
  - cuda: ">=11.0"  # optional, required for GPU
features:
  status: stable  # stable | experimental | deprecated
review-when: "2026-12-01"  # for rapidly evolving content
```

### Test for AI Agents

```
Given a code example in a note:
1. Can you identify all software dependencies?
2. Is each dependency version-scoped?
3. Does the note specify CPU vs GPU requirements?
4. Is the feature stable, experimental, or deprecated?
5. Is there a review date for when this knowledge might become stale?
```

## Related
- [[Frontier Exploration - API and External Service Dependencies]]
- [[Stress Test - Seed Rules in Programming Knowledge Bases]]
- [[Frontier Exploration - Tool-Interface Knowledge]]
- [[Frontier Exploration - API and External Service Dependencies]]

---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Link Quality Rule

Links should be **meaningful and purposeful**, not just decorative.

## Rule
- Only link when there's a **substantive connection**
- Each link should answer: "Why should the reader follow this link?"
- Avoid linking for the sake of linking

## Test Criteria (for AI Evaluation)
- [ ] Can you explain WHY each link exists in one sentence?
- [ ] Does each link add genuine value to the current note?
- [ ] Is there a minimum of 2-3 links per note?
- [ ] Are links substantive, not just keyword matches?
- [ ] Would removing any link lose meaningful context?

## Quality Guidelines
| Good Link | Bad Link |
|-----------|----------|
| Explains a concept used in current note | Random keyword match |
| Provides deeper context on a related idea | "Also see..." without context |
| Connects to a concrete related concept | Link to everything mentioned |

## Link Density
- **Minimum**: 2-3 links per note (ensures connectivity)
- **Maximum**: Avoid over-linking (dilutes meaning)
- **Target**: Links that add genuine value

## Agent Responsibility
When adding new notes:
1. Find truly related concepts via `graph_related`
2. Only link to notes with meaningful connection
3. Verify links enhance understanding

## Related
- [[Atomic Note Principle]]
- [[Linking Principle]]
- [[Graph Traversal Efficiency]]

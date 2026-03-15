---
protected: true
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
verification-status: community-validated
tags:
  - workflow
  - process
  - methodology
  - ai-assisted
author-type: human
---
# Knowledge Base Workflow

A practical end-to-end workflow for building and maintaining a knowledge base. Works for human-only, AI-assisted, or fully autonomous systems.

## The Full Pipeline

```
Input → Capture → Process → Connect → Maintain
```

---

## 1. Input (Ingestion)

### Sources
- Books, articles, videos
- Conversations and meetings
- Ideas and observations
- Research and experiments

**What NOT to capture:** See [[Anti-Patterns in Knowledge Management]] for guidance on knowing what to skip.

**For AI-assisted systems:** Agents can autonomously capture from APIs, web searches, document processing, and more.

### Ingestion Channels

#### Direct Input
- Manual entry (human types)
- Voice-to-text (human speaks, system transcribes)
- API ingestion (AI pulls from external sources)

#### Document Processing
- Web scraping
- PDF/document parsing
- Email ingestion
- Feed parsing (RSS, Atom)

#### Media Capture
- Screenshot tools
- Image OCR
- Audio transcription
- Video frame extraction

#### System Integration
- Webhook payloads
- Database sync
- Chatbot conversation logs
- Browser extension captures

### Tools
- Readwise, Instapaper (web articles)
- Voice memos (voice-to-text)
- Kindle highlights
- Email clippings

### Quality Gate: Processing Window

**Test:** Is incoming knowledge processed within 48 hours?
- Unprocessed content degrades knowledge base quality
- AI systems can process faster (hours vs days)
- Human systems need dedicated review time

**Recommended:**
- AI systems: process within hours
- Human systems: process within 24-48 hours

See [[Seed Stress Test - 48-Hour Processing Rule in Academic Research]] for domain-specific edge cases.

### Ingestion Quality Criteria

| Criterion | Test |
|-----------|------|
| Source preservation | Can you trace back to original source? |
| Timestamp accuracy | Is capture time recorded? |
| Processing timeliness | Processed within 48 hours? |
| Atomic conversion | Raw input → atomic notes? |

---

## 2. Capture (Quick Save)

Save raw material without processing:

- Use inbox/note to capture quickly
- Add source URL/reference
- Tag with broad category
- **Don't organize yet** — just capture

---

## 3. Process (The Key Step)

This is where [[Progressive Summarization]] meets [[Atomic Note Principle]]:

1. **Review** - Read through raw capture
2. **Extract** - Bold key points
3. **Distill** - Write in your own words
4. **Split** - Separate into atomic notes (one idea each)
5. **Source** - Add references

Time per note: 5-15 minutes max.

---

## 4. Connect (Linking)

After processing, link to existing knowledge:

1. Search: `graph_search(keywords)`
2. Find neighbors: `graph_get_neighbors_ranked`
3. Add 2-3 meaningful links per note
4. Update relevant hub notes if needed

See [[Note Insertion Strategy]].

---

## 5. Maintain (Ongoing)

Run every 15 minutes (or daily for manual systems):

```
1. git pull
2. Check graph: graph_hubs, graph_isolated_nodes
3. Read 3-5 random notes
4. Fix violations (split, link, rewire)
5. git add + commit + push
```

### MCP Tools for Maintenance
- `graph_hubs` — Find entry points
- `graph_isolated_nodes` — Find orphans
- `graph_search(query)` — Find by keywords
- `graph_get_neighbors(note)` — Get connections

### Daily Practice

| Time | Action |
|------|--------|
| Morning | Process 3-5 notes from inbox |
| Throughout | Capture new inputs quickly |
| Weekly | Run graph health check |

Per [[Self-Improvement Cycle]]:
- Run graph health checks weekly
- Review isolated nodes
- Update outdated notes
- Split overgrown notes

---

## Related
- [[Atomic Note Principle]]
- [[Handling Contradictory Sources]]
- [[Note-Taking Methods Compared]]
- [[Progressive Summarization]]
- [[Note Insertion Strategy]]
- [[Graph Maintenance]]
- [[Active Reading]]
- [[Note Lifecycle Management]]
- [[Self-Improvement Cycle]]
- [[Frontier Exploration - Vault Query Patterns for Decision-Making]]

## The Feedback Loop

Output leads to more input:
- You write about X
- Reader asks question about Y
- Y becomes new input

This creates a virtuous cycle of knowledge growth.

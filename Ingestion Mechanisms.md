---
last-reviewed: 2026-03-08
lifecycle: evergreen
confidence: high
---

# Ingestion Mechanisms

How knowledge enters a knowledge base. Applies to human-only, AI-assisted, and autonomous systems.

## The Problem

Knowledge is fleeting. Without mechanisms to capture it, insights are lost.

## Ingestion Channels

### 1. Direct Input
- Manual entry (human types)
- Voice-to-text (human speaks, system transcribes)
- API ingestion (AI pulls from external sources)

### 2. Document Processing
- Web scraping
- PDF/document parsing
- Email ingestion
- Feed parsing (RSS, Atom)

### 3. Media Capture
- Screenshot tools
- Image OCR
- Audio transcription
- Video frame extraction

### 4. System Integration
- Webhook payloads
- Database sync
- Chatbot conversation logs
- Browser extension captures

## Quality Gate: Processing Window

**Test:** Is incoming knowledge processed within 48 hours?
- Unprocessed content degrades knowledge base quality
- AI systems can process faster (minutes vs days)
- Human systems need dedicated review time

**Recommended:**
- AI systems: process within hours
- Human systems: process within 24-48 hours

## Ingestion Quality Criteria

| Criterion | Test |
|-----------|------|
| Source preservation | Can you trace back to original source? |
| Timestamp accuracy | Is capture time recorded? |
| Processing timeliness | Processed within 48 hours? |
| Atomic conversion | Raw input → atomic notes? |

## Related
- [[Knowledge Base Workflow]]
- [[Atomic Note Principle]]
- [[Note Templates]]
- [[Sources Provenance MCP]]

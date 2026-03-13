# Self-Improvement Execution

Detailed steps for running the self-improvement cycle.

## Execution (Every Heartbeat)

### Step 1: Pull
```bash
git pull origin main
```

### Step 2: Read State
- Read `Heartbeat State.md` for metrics
- Read `Heartbeat Backlog.md` for queue

### Step 3: Decide Mode
- Apply decision logic from [[Self-Improvement Cycle]]
- Pop specific item from backlog if not REFLECT

### Step 4: Execute
- Run the mode's specific task
- Quality gate: verify before committing

### Step 5: Commit & Update
- Update metrics in Heartbeat State.md
- Mark item complete in Heartbeat Backlog.md
- Commit with format: `[Mode] What changed`
- Push to origin

## Staleness Detection

| Score | Criteria |
|-------|----------|
| **low** | Committed in last 3 heartbeats, backlog 5+ |
| **medium** | No commit 3-5 heartbeats OR backlog 2-4 |
| **high** | No commit 5+ heartbeats OR backlog empty OR edit failures > 3 |

## Backlog Format
```markdown
- [ ] [MODE] Specific actionable task
- [x] [MODE] Completed task (date)
```

## Related
- [[Self-Improvement Cycle]]
- [[Heartbeat State]]
- [[Heartbeat Backlog]]

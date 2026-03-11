# Claude MCP Setup

Configuring MCP servers for vault navigation.

---

## MCP Configuration

`.mcp.json` for vault navigation:

```json
{
  "mcpServers": {
    "vault-graph": {
      "command": "node",
      "args": ["/path/to/vault-graph-mcp/dist/index.js"],
      "env": { "VAULT_PATH": "/path/to/vault" }
    },
    "vault-sources": {
      "command": "node", 
      "args": ["/path/to/vault-sources-mcp/dist/src/index.js"],
      "env": { "VAULT_PATH": "/path/to/vault" }
    }
  }
}
```

---

## Essential Tools

- `graph_hubs` — Find entry points
- `graph_search(query)` — Find notes
- `graph_get_neighbors(note)` — Explore connections

---

## Related
- [[Claude Knowledge Base Setup]]
- [[Graph Navigation MCP]]

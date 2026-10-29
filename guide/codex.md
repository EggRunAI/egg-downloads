# Codex

Point a second MCP client at the same egg and get the same machine. Any MCP client works: Codex, Claude, your own harness. The egg does not care who is driving. Same tools, same machine, same snapshots.

What changes between clients is only how you register the server; each client has its own config for MCP servers. In the egg window, the **MCP** popover's **Copy for Codex** gives you the registration for the app's server:

```bash
codex mcp add egg --url http://127.0.0.1:7777/
```

Or, in `~/.codex/config.toml`:

```toml
[mcp_servers.egg]
url = "http://127.0.0.1:7777/"
```

What never changes: the agent gets `vm_start`, `vm_exec`, `vm_screenshot`, `snapshot_take`, `snapshot_restore` and friends, and nothing outside the egg. No different egg is needed for Codex: MCP is the contract.

Inside Sandbox Linux, **Codex** and **Codex CLI** are already on the dock as well, working inside the egg rather than driving it from your Mac; see **Vibe coding in Sandbox**.

## You should now be able to

- register the Egg MCP server in a second client
- explain what stays constant across clients

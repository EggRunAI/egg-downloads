# Claude Code

Give Claude a whole computer that is not yours, then attach it with one registration. Treat agents as untrusted code. Inside an egg, an agent has a shell, files, a screen and the network you chose, and **nothing of yours**: no shared kernel, no Mac filesystem, no keychain. Remove the egg and the mess is gone.

Four things you get for free:

- **Blast radius**: experiments stay inside the machine.
- **Undo**: snapshot before risky steps; restore is total (memory, disk, devices).
- **Eyes and hands**: screenshots give the agent visual feedback; click, type and key give it a desktop, not just a shell.
- **Reproducibility**: the same egg boots the same machine every time, so agent runs are replayable.

## Attach Claude

In the egg window, click **MCP**, turn **Egg MCP server** on (it asks you to sign in once), then **Copy for Claude**. Paste it in a terminal:

```bash
claude mcp add --transport http egg http://127.0.0.1:7777/
```

One server serves every egg on this Mac; the tools take the egg's name, so ask Claude for the egg you mean. Without the app's server, a local Claude Code can start `egg-mcp` itself:

```bash
claude mcp add egg -- egg-mcp
```

Then a session looks like this:

```text
agent → image_pull("learn/agent-lab")          ✓ pulled + signature verified
agent → vm_start(...)                          ✓ VM booted
agent → vm_exec("pytest /opt/repo")            ✗ FAILED — 1 of 1
agent → snapshot_take({"label": "before-fix"}) ✓ saved
agent → vm_exec("pytest /opt/repo")            ✓ passed
```

Headless works too: agents drive eggs with no window open (`egg run <egg> --headless`). The lab egg `learn/agent-lab` is `egg/agent-base` plus a small repo with a failing test, built for exactly this. Try it: run the lab, attach Claude, ask it to make the test pass.

[Download the agent lab](egg:install/learn/agent-lab)

## You should now be able to

- explain why one machine per agent
- name the four benefits
- register the Egg MCP server with Claude Code
- run one agent session against the lab egg

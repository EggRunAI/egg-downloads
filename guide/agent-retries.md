# Retry with snapshots

Make an agent's failures cheap: snapshot first, try, verify, and restore before the next attempt. The pattern that works:

1. `snapshot_take {label: "before-<task>"}`
2. try the change (`vm_exec`)
3. verify: the exit code, test output, or a `vm_screenshot` compared against what you expect
4. on failure: `snapshot_restore`, then retry with a *changed plan*, not the same command again

Deterministic retries beat prompting harder: the machine is always back to a known-good state, so the agent's next attempt starts clean. Put the loop in the agent's instructions, not in your head; an agent that snapshots before every risky step needs no supervision to be safe.

## Feel it once

The lab egg has a failing test waiting in `/opt/repo`. Snapshot, let the agent edit `calc.py`, run `pytest`, restore if it made it worse.

[Download the agent lab](egg:install/learn/agent-lab)

Every snapshot the agent takes shows up in the egg's **Snapshots…** panel on the desk, so you can restore by hand what the agent broke.

## You should now be able to

- write the four-step loop
- run it once against the lab

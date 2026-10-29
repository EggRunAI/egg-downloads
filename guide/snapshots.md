# Snapshots

Take a snapshot before anything you would not want to redo by hand, then go back to that exact instant. A snapshot captures the **whole running machine**, memory, every device and disk, and brings it back as it was.

## On the desk

Right-click a downloaded egg and choose **Snapshots…**. The panel shows the live machine on top and every snapshot below it, newest first. **Snapshot** takes one; **Restore** brings one back.

Closing a running egg's window offers **Suspend** next to **Shut down**. Suspend takes a warm snapshot and stops the machine; the next **Resume** picks up where you left off, and **Start fresh** boots the disk instead.

## From the terminal

```bash
egg run sandbox
egg snapshot sandbox before-upgrade     # snapshot a RUNNING egg
# ...break something inside the machine...
egg restore ~/.egg/eggs/sandbox.egg/snapshots/sandbox-<timestamp>.egg
```

`egg snapshot` prints where the bundle landed, `snapshots/<name>-<timestamp>.egg` inside the egg's own folder, and `egg restore <that path>` brings the machine back to that instant.

Rule of thumb: snapshot before an upgrade, a migration, or letting an agent loose. After a restore, everything that happened after the snapshot is gone; that is the feature.

Agents do the same through MCP with `snapshot_take` and `snapshot_restore`; see **Retry with snapshots**.

## You should now be able to

- snapshot a running machine from the desk or the terminal
- find the snapshot bundle inside the egg's folder
- restore and check the state

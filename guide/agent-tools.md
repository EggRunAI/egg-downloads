# The tools

Choose the right tool for a task, exec, screenshot or snapshot, and run the five-step sequence that operates an egg from start to hand-off. The tool set is organized by what an operator of a real computer needs:

- **Machines**: `egg_list`, `egg_create`, `image_pull`, `vm_start`, `vm_list`, `vm_status`, `vm_info`, `vm_stop`, `vm_pause`, `vm_resume`, `vm_reboot`
- **Run code and files**: `vm_exec`, `vm_file_read`, `vm_file_write`, `vm_console_read`, `vm_console_write`
- **See and drive the screen**: `vm_screenshot`, `vm_click`, `vm_type`, `vm_key`, `vm_mouse_move`, `vm_scroll`
- **Checkpoints**: `snapshot_take`, `snapshot_list`, `snapshot_restore`, `snapshot_delete` (and `vm_snapshot`, `vm_restore`)
- **Recordings**: `screenrecord_start`, `screenrecord_stop`, `screenrecord_status`, `screenrecord_list`, `screenrecord_delete`
- **Guest introspection**: `guest_info`, `guest_sysinfo`, `guest_ps`, `guest_netstat`, `guest_ls`, `guest_stat`, `guest_read`, `guest_env`, `guest_install`
- **Networks**: `net_create`, `net_list`, `net_delete`
- **Hub card art**: `card_info`, `card_set_logo`, `card_add_shot`, `card_capture_shot`, `card_rm_shot`, `card_clear_shots`

`vm_screenshot` returns the machine's screen as an image; `vm_exec` runs a command and returns its exit code and output; `snapshot_take` is the checkpoint you restore to.

The **MCP** popover in an egg's window lists the agents currently driving that machine, with their action counts.

## Operate an egg: the sequence

1. `image_pull {ref}` if not present, then `vm_start {egg}`, then poll `vm_status` until `running`.
2. `snapshot_take {label: "before-<task>"}` and keep the `snapshot_id`.
3. `vm_exec {cmd}` and require `exit_code == 0`; on failure read `stdout/stderr`, then `snapshot_restore {snapshot_id}` and retry with a changed plan (at most 3).
4. `vm_screenshot` when a GUI is involved; compare against expected text, not pixels.
5. Hand off: report `snapshot_id`, the commands run, the final state. Never write outside the egg; never assume Mac paths exist.

## You should now be able to

- name the tool families
- choose exec vs screenshot vs snapshot for a task
- run the five-step sequence

# Changelog

All notable changes to the **Egg Run** desktop app (macOS, Apple Silicon).
Newest first. Dates are release dates.

Every version is a [GitHub Release](https://github.com/EggRunAI/egg-downloads/releases); [`latest.json`](latest.json) is what the app's updater reads.

## [0.6.3] — 2026-10-02

- A running egg shows its own logo in the Dock and Cmd-Tab, named after the
  egg; the window title is the egg's name.
- The stream mark moved to the top-right, below the guest's top bar.

## [0.6.2] — 2026-10-02

- The update banner says up front when macOS will ask for your password.
- Release packaging fix: the in-app update bundle always carries the egg runner.

## [0.6.1] — 2026-10-02

- Egg now keeps itself up to date: it checks for new versions on launch and
  every few hours, downloads them in the background, and offers "Update and
  restart" on the desk.
- Alpine joins Ubuntu and Ubuntu Server as a starter on the desk.
- WebGPU content renders in Windows eggs (Chrome and Edge with
  `--enable-unsafe-webgpu`).
- A Windows egg no longer comes back with a blank screen after a shutdown.

## [0.6.0] — 2026-10-01

- First public build: the Egg desk with the Ubuntu, Ubuntu Server and Alpine
  starters — double-click one to install it.

## [0.3.0] — 2026-07-01

- **New look** — refreshed Egg Run branding and a login that follows your
  system light/dark theme.
- **Egg catalog** — see all your eggs and their specs (CPU, RAM, disk, base
  image) at a glance in the dashboard.
- **Manage from a browser** — a self-hosted control panel to view and run your
  eggs from anywhere on your network.
- **Snapshot & restore** — pause an egg and pick up right where you left off.
- **More platforms** — now runs on Linux in addition to macOS.
- Fixed a crash that could occur when shutting down an egg during heavy GPU
  use, like running a local LLM.
- Reliability and stability improvements.

## [0.2.0] — 2026-06-19

- **Better graphics** — smoother, more capable display for your eggs.
- **More headroom** — additional memory available to demanding workloads.
- **Live logs** — watch each running egg's output in the app.
- Performance and stability improvements.

## [0.1.0] — 2026-05-26

- Run Linux VMs — *"eggs"* — on Apple Silicon. Fast, isolated, and fully in
  userspace: no background service, no sudo.
- Menu-bar app with hide-to-tray and built-in auto-updates.
- Signed & notarized installers.

[0.3.0]: https://github.com/EggRunAI/egg-downloads
[0.2.0]: https://github.com/EggRunAI/egg-downloads
[0.1.0]: https://github.com/EggRunAI/egg-downloads

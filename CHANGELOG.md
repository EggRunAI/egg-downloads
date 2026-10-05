# Changelog

All notable changes to the **Egg Run** desktop app (macOS, Apple Silicon).
Newest first. Dates are release dates.

Every version is a [GitHub Release](https://github.com/EggRunAI/egg-downloads/releases); [`latest.json`](latest.json) is what the app's updater reads.

## [0.6.8] — 2026-10-05

- A dark, flicker-free launch: the window appears only once the app has
  drawn, so you no longer see a white flash before the welcome.
- The welcome's hello holds each word a little longer, never clips the
  handwriting, and Skip is available on every step.
- The Ubuntu Server and Alpine eggs now set their clocks correctly when they
  resume from a snapshot. Pull them again to get the new builds.
- The account note above the dock reads "Faster downloads, backups, safety
  news."

## [0.6.7] — 2026-10-05

- A welcome on first launch: a handwritten hello, a turning egg that takes
  on the colours of each Linux flavour, then a chance to sign in to your
  eggrun.ai account or be reminded later. Any key moves on; Help ▸ Replay
  Welcome plays it again.
- A one-line note above the dock invites you to sign in, with a dismiss that
  is remembered.
- The Fedora logo is drawn correctly on its tile.

## [0.6.6] — 2026-10-04

- Fixed: an Ubuntu Desktop egg resuming from a snapshot no longer freezes.
  It comes back to a live desktop in about a second.
- Egg Card: right-click an egg on the desk, or pick one in Search, to read
  its card — logo, facts, screenshots and the publisher's notes — and
  install or open it from there.
- The three starter eggs on a fresh desk take their names and logos from the
  hub, so an icon looks the same before and after install.
- Starting an egg no longer flashes an empty window; the install progress
  ring appears as soon as you double-click.
- Show Screenshots and Show Recordings open each egg's own folders, from the
  egg window and from the desk menu.
- The egg window's footer shows uptime, CPUs, memory, display and GPU with
  icons, and links to eggrun.ai.
- The desk shows the system each egg really runs.
- Ubuntu Desktop ships with Firefox, Chromium, Thunderbird, LibreOffice and
  App Center in the dock.

## [0.6.5] — 2026-10-03

- Desk icons and Dock tiles share one raised look.
- The install progress ring is yolk gold, so it is visible on the light desk.

## [0.6.4] — 2026-10-03

- Eggs can be built to open in their own window instead of streaming into
  the app; the app then shows a preview.
- Ubuntu Desktop is Retina-sharp and resumes straight into the desktop, with
  no setup wizard and no update bubble.

## [0.6.3] — 2026-10-02

- A running egg shows its own logo in the Dock and Cmd-Tab, named after the
  egg, and its window carries the egg's name.
- The stream indicator moved to the top-right, out of the way.

## [0.6.2] — 2026-10-02

- The update banner says up front when macOS will ask for your password.
- Fixed in-app updates so every update carries everything it needs.

## [0.6.1] — 2026-10-02

- Egg keeps itself up to date: it checks for new versions on launch and
  every few hours, downloads them in the background, and offers "Update and
  restart" on the desk.
- Alpine joins Ubuntu and Ubuntu Server as a starter on the desk.
- Windows eggs can run modern 3D web content in Chrome and Edge.
- A Windows egg no longer comes back to a blank screen after a shutdown.

## [0.6.0] — 2026-10-01

- First public build: the Egg desk with the Ubuntu, Ubuntu Server and Alpine
  starters. Double-click one to install it.

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

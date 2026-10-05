# Changelog

All notable changes to the **Egg Run** desktop app (macOS, Apple Silicon).
Newest first. Dates are release dates.

Every version is a [GitHub Release](https://github.com/EggRunAI/egg-downloads/releases); [`latest.json`](latest.json) is what the app's updater reads.

## [0.6.7] — 2026-10-05

- A welcome on first launch: a handwritten hello, a turning egg that wears
  the Linux marks and takes each one's colours, then your eggrun.ai account
  with Sign in or Remind me later. Any key moves on; Help ▸ Replay Welcome
  plays it again.
- The account ask on the desk is one line above the dock, with Sign in and a
  dismiss that is remembered. It comes back only if a pull needs an account.
- The Fedora mark is drawn as a glyph on its tile, not stretched to fill it.

## [0.6.6] — 2026-10-04

- Fixed: a warm-restored desktop egg no longer freezes on screen. GL objects
  are now rebuilt per sub-context after a restore, so GNOME draws again and
  input works; `egg/ubuntu-26-desktop` resumes to a live desktop in about a
  second.
- Egg Card: right-click a desk egg, or pick one in Search, for its
  marketplace card — logo, facts, screenshots, the publisher's notes, and
  Install / Open.
- The fresh desk's three starters take their names and logos from the hub,
  so an icon looks the same before and after install.
- An egg without a stream has only its native window: no app window flashes
  while it starts. The install ring appears on the double-click.
- Each egg's screenshots and recordings live in its own `screenshots/` and
  `recordings/` folders; "Show Screenshots" and "Show Recordings" open them
  from the egg window and the desk menu.
- The egg window's footer uses icons for uptime, CPUs, memory, display and
  GPU, shows the display as the Eggfile declares it (`1280×960@2x`), and
  links to eggrun.ai.
- Machine rows show the OS the egg actually runs, read from the bundle.
- `egg/ubuntu-26-desktop` 2026.10.04: the full Ubuntu desktop with Firefox,
  Chromium, Thunderbird, LibreOffice and App Center pinned to the dock.

## [0.6.5] — 2026-10-03

- Desk icons and Dock tiles now share one raised style; the gloss highlight
  shows on logo tiles too.
- The install progress ring is yolk gold — it was white, and invisible on the
  light desk.

## [0.6.4] — 2026-10-03

- Eggfile: new `STREAM ws|webrtc|off` directive. Streaming is now opt-in for
  built eggs; without it an egg runs in its native window and the app shows
  a preview.
- Eggfile `DISPLAY` (size and `scale=`) now governs every build phase, the
  installer window included.
- Week-1 eggs rebuilt: `egg/ubuntu-26-desktop` is 2× (Retina-sharp) and
  resumes straight into the desktop — no welcome wizard, no update bubble.

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

# Changelog

All notable changes to the **Egg Run** desktop app (macOS, Apple Silicon).
Newest first. Dates are release dates.

Every version is a [GitHub Release](https://github.com/EggRunAI/egg-downloads/releases); [`latest.json`](latest.json) is what the app's updater reads.

## [0.6.31] — 2026-10-16

- Direct3D 12 inside Windows 11 eggs: textures created from images reached the
  GPU in the wrong order, so scenes that load their materials from pictures
  drew with another picture's pixels or none at all (a three.js car and road
  were missing). Work handed between a program's Direct3D 11 and Direct3D 12
  devices is now run in the order the program asked for. Groundwork for WebGPU
  in Windows eggs, which still waits on the signed guest display driver.

## [0.6.30] — 2026-10-16

- Direct3D 12 inside Windows 11 eggs: three rendering faults fixed. Anti-aliased
  scenes were never resolved (frames came out washed out or black), texture
  arrays and cube maps uploaded layer by layer lost or shifted faces, and small
  textures with 2- or 8-byte texels uploaded shifted or empty. This is the
  groundwork for WebGPU in Windows eggs, which still waits on the signed guest
  display driver.
- Windows 11 eggs can be installed unattended from an answer file; the gate
  that builds and verifies them runs the whole install to a signed-in desktop at
  1080p 2x in under ten minutes.

## [0.6.24] — 2026-10-14

- WebGL pages in Chrome inside Sandbox Linux drew as torn strips in 0.6.23;
  they render correctly now.

## [0.6.23] — 2026-10-14

- Chrome inside Sandbox Linux and Chromium inside Ubuntu Desktop now draw
  with the egg's GPU. They used to fall back to software and paint every
  frame on the CPU, which made the whole egg feel slow; canvas, compositing,
  WebGL, WebGPU and video decode are hardware accelerated now. Download the
  eggs again to get the rebuilt snapshots.

## [0.6.22] — 2026-10-13

- Usage sessions are now decided the moment something happens, not when the
  report is sent: every event knows its sitting, a sitting cut short by a
  crash is closed at its last activity on the next launch, and sign-in
  attribution is per sitting.

## [0.6.21] — 2026-10-12

- Usage sessions measure the sitting, not the time the Mac sat idle, and a
  sitting that ended by idle is recorded when it actually ended.

## [0.6.20] — 2026-10-12

- Sandbox Linux: the house desktop, renamed from Diamond, with its own mark
  and colours. It is the first icon on the desk; the welcome downloads it by
  itself and opens it when it lands, no picking.

## [0.6.19] — 2026-10-12

- Usage data is tied to your account while you are signed in, so we can see
  how Egg is actually used and, later, show you your own usage. Still event
  names and numbers only, never files or anything you type. Settings →
  Privacy says so, and turns it off.
- The update check no longer runs twice at launch.

## [0.6.18] — 2026-10-12

- Anonymous usage events now follow what you do on the desk: the welcome,
  signing in, downloading an egg, running it. Nothing you type is ever sent,
  same as before.
- The "Egg runner may be out of date" warning no longer appears on a fresh
  install; the runner and the app are stamped together.

## [0.6.17] — 2026-10-12

- Egg window: ⌘ shortcuts no longer leave a key held in the egg. ⌘C used to
  type "ccc…" until another key was pressed; every ⌘ key now releases
  cleanly.

## [0.6.16] — 2026-10-11

- Updates: Egg Run now checks every hour and whenever its window comes back
  to the front, not only at launch and every four hours. Once a release is
  downloaded the menu bar's "Check for updates" reads "Update to …", so you
  see it even with the window closed. A check that could not reach the feed
  says so instead of calling you up to date.
- Opening Egg Run while it is already running brings the running window
  forward instead of starting a second copy.
- One verb for getting an egg: Download, everywhere, with "Unpacking…" once
  the bytes are in.
- Full screen: hiding the egg's panel gives its width back to the egg image.

## [0.6.15] — 2026-10-11

- Security in the egg's panel: the hub's vulnerability scan of the build you
  are running (Clean, or how many findings and how serious), affected
  packages marked in the package list with their CVE ids, a "Findings only"
  switch, and a Rescan that checks what is installed right now, after your
  own upgrades, against OSV.
- Package rows show the name and the full version on two lines; nothing is
  cut off any more, and the list only scrolls up and down.

## [0.6.14] — 2026-10-11

- About this egg, round two: copy works (click a value and ⌘C, or the Copy
  button that confirms with Copied), the password sits behind an eye, the
  panel closes with an × and slides open and shut, and the toolbar button
  lights up while it is open.
- Packages: click "N installed" to see every package in the egg with its
  version, filter as you type, and open the distro's page for any of them.
- The panel's open/closed choice is kept with the egg, not in a hidden
  preferences file.

## [0.6.13] — 2026-10-10

- About this egg, finished: the Sign in section is always there, shows the
  egg author's own sentence, keeps the password behind a Reveal button and
  shows a dash when there is none. Whether you keep the panel open is
  remembered per egg.
- Eggfiles describe their account one fact per line: LOGIN_USER,
  LOGIN_PASSWORD, LOGIN_AUTOLOGIN, LOGIN_HELPTEXT. Alpine on the hub is
  built that way; pull it again to see it in the panel.
- Alpine: hostname alpine, UTC, readable console font on every boot and
  resume, internet checked at build time.

## [0.6.12] — 2026-10-09

- About this egg: a panel in the egg's window that says how to sign in,
  what is inside (the OS release, the installed packages) and how big the
  machine is. It opens the first time you run an egg; the sidebar button in
  the toolbar hides it, and the choice is remembered per egg.
- Alpine opens straight on a root shell; no more login prompt. Pull it again
  to get the new build.
- Eggfiles can declare the account they create (`LOGIN`), and the hub shows it.

## [0.6.11] — 2026-10-08

- The welcome now asks which eggs to download, shows their size, and starts
  the downloads before you reach sign-in; the desk shows the rings when you
  land. Eggs you have not downloaded yet wear a Get badge.
- Get Started: a guide on the desk with pictures for the things people
  missed (downloading an egg, the right-click menu, the menu-bar egg,
  Claude and Codex in Diamond). It updates without an app update.
- Welcome.txt is now Notes.txt, a real file at ~/.egg/Notes.txt.
- Right-click menus for Get Started and Notes.txt.
- Removing an egg cleans up its leftover files; build debris no longer
  appears as an egg.
- The desk's starter list comes from eggrun's feed, not the app.

## [0.6.10] — 2026-10-08

- Diamond Linux joins the desk as a starter: Debian 13, GNOME, Chrome, and
  Claude and Codex ready to sign in, from the dock and the terminal.
- Typing in a Linux egg's window no longer reaches the egg's serial console.
- The Alpine and Ubuntu Server eggs render sharp at 2x with a readable
  console font. Pull them again to get the new builds.
- /billing on eggrun.ai shows a Coming Soon page instead of a 404.

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

<p align="center">
  <img src="logo.png" alt="Egg Run" width="128" />
</p>

<h1 align="center">Egg Run</h1>

<p align="center">
  <b>Run Linux VMs on your Mac in seconds.</b><br/>
  Hardware-isolated. No daemon. No shared kernel.
</p>

<p align="center">
  <i>Isolated inside-out just like an egg 🥚 for the finest safeguards.</i>
</p>

---

## What is Egg Run?

Egg Run is the macOS desktop app for **EggRun** — a faster, safer way to run Linux
workloads on Apple Silicon. Each VM (an *"egg"*) is a real **hardware-isolated**
machine. 

It's built on the Camouflage Network's **Yolk** hypervisor — and Apple **Hypervisor.framework**, entirely in userspace, **no background daemon, no sudo** —
so eggs boot in seconds and run lean, <b><i>ultra fast</i></b> like a real machine with a serious punch 👊.

## Downloads

### macOS (Apple Silicon)

| File | Description |
|------|-------------|
| [`Egg Run.pkg`](https://github.com/EggRunAI/egg-downloads/releases/latest/download/Egg%20Run.pkg) | **Installer (recommended)** — double-click, installs to Applications |
| [`Egg Run.dmg`](https://github.com/EggRunAI/egg-downloads/releases/latest/download/Egg%20Run.dmg) | Disk image — drag to Applications |
| [`Egg Run.app.tar.gz`](https://github.com/EggRunAI/egg-downloads/releases/latest/download/Egg%20Run.app.tar.gz) | App bundle (what the in-app updater installs) |

> Requires macOS 14.0 or later, Apple Silicon. The `.pkg` and `.dmg` are both
> signed and notarized; the `.pkg` is recommended since it installs to
> **/Applications** for you.

## Install

### One-liner (recommended)

```bash
curl -L "https://github.com/EggRunAI/egg-downloads/releases/latest/download/Egg%20Run.pkg" -o ~/Downloads/Egg\ Run.pkg && open ~/Downloads/Egg\ Run.pkg
```

### Manual

**Installer (.pkg) — recommended**

1. Download [`Egg Run.pkg`](https://github.com/EggRunAI/egg-downloads/releases/latest/download/Egg%20Run.pkg)
2. Double-click it and follow the installer — Egg Run is placed in Applications automatically
3. Launch Egg Run from Applications

**Disk image (.dmg) — alternative**

1. Download [`Egg Run.dmg`](https://github.com/EggRunAI/egg-downloads/releases/latest/download/Egg%20Run.dmg)
2. Open the disk image and drag **Egg Run** to Applications
3. Launch Egg Run from Applications

## Links

- Website: [eggrun.ai](https://eggrun.ai)
- Docs: [eggrun.ai/docs](https://eggrun.ai/docs)

## License

Copyright © 2025–2026 Camouflage Networks, Inc. All rights reserved.

## Notices

Apple, Apple Silicon, macOS, and Hypervisor.framework are trademarks of Apple Inc.,
registered in the U.S. and other countries and regions. Egg Run is built on Apple
Hypervisor.framework but is **not affiliated with, endorsed by, or sponsored by
Apple Inc.** All other trademarks are the property of their respective owners.

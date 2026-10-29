# Eggfile

Describe a whole machine in one file, build it, and run it. An **Eggfile** is a build file that is allowed to talk about hardware: the familiar build lines, `FROM`, `RUN`, `COPY`, `ENV`, `WORKDIR`, `CMD`, plus a set of machine instructions, because an egg is a whole computer, not a process.

```eggfile
# Eggfile: a GPU dev box
FROM alpine

RUN apk add build-base git
COPY . /work
WORKDIR /work

# The machine (Egg instructions)
CPUS 8
RAM 16G
DISK 40G
GPU virgl
DISPLAY 1920x1080
NETWORK open
SOUND true
MCP true

INSTALL sys
SNAPSHOT ready
LOGO logo.png
```

Read it top to bottom: **what it is made from** (`FROM`), **what to do inside it** (`RUN`, `COPY`, `WORKDIR`), **what machine it is** (`CPUS` to `MCP`), and **how it ships** (`INSTALL`, `SNAPSHOT`, `LOGO`).

## Build and run

```bash
egg build -f Eggfile --egg devbox      # build the egg (a signed bundle in ~/.egg/eggs/devbox.egg)
egg run devbox                         # boot it, a real machine
```

`egg build` boots a build machine from your `FROM`, runs your steps inside it, applies the machine lines, and writes the result as a **bundle**: `~/.egg/eggs/devbox.egg/` holding the disk, `egg.toml`, metadata, art and the build snapshot. The bundle is signed (`MANIFEST.json` + `MANIFEST.sig`) so anyone who pulls it can verify it. The new egg appears on the desk like any other.

Build names an **egg**; a version is named when you publish it, by `egg push --tag`.

## The directives

| Directive | What it does |
|---|---|
| `FROM alpine` | the base the machine is made from; `FROM <publisher>/<slug>` starts from a hub egg |
| `RUN apk add build-base git` | a step run inside the build machine |
| `COPY . /work` | copy files from the build context into the machine |
| `WORKDIR /work` | the working directory for later steps |
| `CPUS 8` | virtual CPUs |
| `RAM 16G` | guest memory |
| `DISK 40G` | root disk (G or M) |
| `CLASS M` | XS, S, M or L: stands in for CPUS, RAM and DISK |
| `GPU virgl` | the 3D backend (default `virgl`) |
| `DISPLAY 1920x1080` | the screen; or `DISPLAY width=1920 height=1080 scale=2` |
| `NETWORK open` | `isolated` or `open` |
| `SOUND true` | the sound device, if the machine needs it |
| `MCP true` | agent-ready: the egg is built for MCP sessions |
| `INSTALL sys` | install the base onto the disk; cold-boots as a real installed OS |
| `SNAPSHOT ready` | snapshot after the build, so `egg run` restores a warm, known-good state |
| `LOGO logo.png` | 512×512 bundle art, shown on the desk and on the hub |
| `TITLE "Dev box"` | the name the hub listing shows |

## You should now be able to

- spot the Egg lines in any Eggfile
- explain why an Eggfile is a build file plus hardware
- build an egg, explain what is in the bundle, and run it

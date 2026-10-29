# Clone and toss

Machines are disposable. Need a second one? Clone the egg. Broke one? Toss it and run another from the same egg.

## A second machine

One egg boots one machine at a time, because its disk is in use while it runs. For two, copy the egg:

```bash
egg clone sandbox dev-b      # copy the EGG (copy-on-write where the disk supports it)
egg run dev-b                # two machines, two kernels
egg stop dev-b               # a RUN is stopped; the egg stays
```

`--snapshot <name>` clones from one of the source's snapshots instead of its current disk.

## Toss it

```bash
egg stop dev-b                       # the run is gone
egg delete dev-b                     # the egg goes to the recycle bin, restorable
egg pull egg/sandbox --name dev-b
egg run dev-b                        # fresh, run again
```

On the desk the same is **Remove** on the right-click menu, then download the egg again. The Trash restores one you did not mean to toss.

## The loop

The workflow that falls out of these pages: the **egg** as the known-good machine, a **snapshot** before the risky part, **toss** when it goes wrong, **run** again. That is the whole Egg loop; the rest is variations on it: declaring machines in an Eggfile, handing them to agents, running models on them, publishing your own. Eggs are pre-built, usually with a warm snapshot, so a new run is a boot, not a build.

## You should now be able to

- clone an egg to get a second machine
- remove and recreate a run
- describe egg, snapshot, toss, run

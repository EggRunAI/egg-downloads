# Publish

Ship your machine as a signed, versioned egg that others run with one command, or install from the hub with a double-click.

```bash
egg build -f Eggfile --egg myimage
egg card myimage logo icon.png          # 512×512 logo; rides the signed bundle
egg card myimage capture                # screenshots of the running egg into the carousel
egg login                               # browser SSO, once
egg push myimage --tag v1.0             # --as <handle> to pick a namespace
```

Publishing signs the manifest with your key (kept on your Mac), uploads content-addressed chunks (unchanged chunks are not re-uploaded), and creates the version on the hub as `<your-handle>/myimage`. From then on anyone runs it with `egg run <your-handle>/myimage`, or finds it with ⌘K on the desk. The `LOGO`, the `TITLE` and the card's screenshots become the listing. `--private` keeps the egg to your organization (Pro).

## Versions and tags

Tags are versions: build `v1.1`, and `latest` always resolves to the newest live version (it is reserved and cannot be assigned). A push with no `--tag` gets a dated tag from the hub.

```bash
egg tag myhandle/myimage:v1.0 stable       # name a version that is already on the hub
egg rm myhandle/myimage:v1.0 --origin      # withdraw a version (stays in history, restorable)
```

Your [dashboard](https://eggrun.ai/dashboard) edits what the hub owns, never the signed content: description, visibility, rename (the old name keeps redirecting), transfer, delete.

## You should now be able to

- prepare card art
- publish under your handle
- withdraw and republish a version

#!/bin/bash
# release.sh — cut the macOS release of Egg Run as a GitHub Release.
#
#   ./release.sh            # version from EggRun's root Cargo.toml [workspace.package]
#   ./release.sh --dry-run  # show what would happen
#
# Run by egg-app/osx.sh at the end of `osx.sh notarize`, after it has copied the
# signed + notarized artifacts next to this script:
#     Egg Run.app.tar.gz  Egg Run.app.tar.gz.sig  Egg Run.pkg  Egg Run.dmg
#
# GitHub stores release assets with spaces turned into dots ("Egg.Run.pkg"), so
# every URL below uses the dotted names.
# What a release is: a tag v<version> on this repo with those four files as
# release assets (GitHub's CDN; versioned; never overwritten — a published
# version is immutable, a bad one is rolled back by re-pointing `latest`),
# plus latest.json. The app's updater reads the stable URL
#     https://github.com/EggRunAI/egg-downloads/releases/latest/download/latest.json
# and the website's /download page links the same way, so publishing a release
# IS the rollout and nothing else has to be deployed. The binaries are never
# committed to git (see .gitignore); main holds README, CHANGELOG, latest.json.
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
REPO="EggRunAI/egg-downloads"
APP="Egg Run"
DRY=0; [ "${1:-}" = "--dry-run" ] && DRY=1
die() { echo "release: $*" >&2; exit 1; }

# One version, from the workspace: the same number version.sh stamps into every
# Cargo.toml and package.json, and the one Info.plist carries.
ROOT_TOML="$HERE/../Cargo.toml"
[ -f "$ROOT_TOML" ] || die "no $ROOT_TOML — this script lives in EggRun/egg-downloads"
VERSION=$(awk '/^\[workspace\.package\]/{f=1;next} f&&/^version *=/{gsub(/.*= *"|".*/,"");print;exit}' "$ROOT_TOML")
[ -n "$VERSION" ] || die "could not read [workspace.package] version from $ROOT_TOML"
TAG="v$VERSION"

cd "$HERE"
for f in "$APP.app.tar.gz" "$APP.app.tar.gz.sig" "$APP.pkg" "$APP.dmg"; do
    [ -s "$f" ] || die "missing artifact: $f (run osx.sh notarize first)"
done
# The tarball's Info.plist must carry this version, or the updater would offer
# a number no artifact has.
BUILT=$(tar -xzOf "$APP.app.tar.gz" "$APP.app/Contents/Info.plist" | plutil -extract CFBundleShortVersionString raw - 2>/dev/null || true)
[ "$BUILT" = "$VERSION" ] || die "artifact is $BUILT, Cargo.toml says $VERSION — refusing"
command -v gh >/dev/null || die "gh (GitHub CLI) is required"
gh auth status >/dev/null 2>&1 || die "gh is not logged in"
[ -z "$(git status --porcelain -- README.md CHANGELOG.md)" ] || die "commit README/CHANGELOG first"

SIG=$(cat "$APP.app.tar.gz.sig")
PUB_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
ASSET_BASE="https://github.com/$REPO/releases/download/$TAG"
# `notes` is what the updater shows; the CHANGELOG section for this version if
# there is one, else the bare version.
NOTES=$(awk -v v="## [$VERSION]" 'index($0,v)==1{f=1;next} f&&/^## \[/{exit} f' CHANGELOG.md | sed '/^$/d' | head -20)
NOTES_JSON=$(printf '%s' "${NOTES:-Egg v$VERSION}" | python3 -c 'import json,sys; print(json.dumps(sys.stdin.read()))')

cat > latest.json <<EOF
{
  "version": "$VERSION",
  "notes": $NOTES_JSON,
  "pub_date": "$PUB_DATE",
  "platforms": {
    "darwin-aarch64": {
      "signature": "$SIG",
      "url": "$ASSET_BASE/Egg.Run.app.tar.gz"
    }
  }
}
EOF
python3 -c 'import json; json.load(open("latest.json"))' || die "latest.json is not valid JSON"

echo "release $TAG: $(du -h "$APP.pkg" | cut -f1) pkg, $(du -h "$APP.app.tar.gz" | cut -f1) updater bundle"
if [ "$DRY" = 1 ]; then cat latest.json; echo "(dry run: no release, no push)"; exit 0; fi

if gh release view "$TAG" -R "$REPO" >/dev/null 2>&1; then
    die "$TAG already exists — a published version is immutable; bump the version"
fi
gh release create "$TAG" -R "$REPO" --title "Egg Run $VERSION" --notes "${NOTES:-Egg v$VERSION}" \
    "$APP.app.tar.gz" "$APP.app.tar.gz.sig" "$APP.pkg" "$APP.dmg" latest.json
# latest.json also lives on main: the website reads it, and git shows what shipped.
git add latest.json
git commit -q -m "$TAG" || true
git push origin HEAD:main
echo "published: https://github.com/$REPO/releases/tag/$TAG"
echo "updater feed: https://github.com/$REPO/releases/latest/download/latest.json"

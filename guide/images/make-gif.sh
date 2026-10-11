#!/bin/bash
# make-gif.sh — turn a screen recording into a guide GIF.
#
#   make-gif.sh in.mov out.gif [start_s] [duration_s] [crop=w:h:x:y]
#
# 1200 px wide, 12 fps, two-pass palette so the yolk gold and the desk
# wallpaper do not band. Trim with start/duration; crop in source pixels
# (Retina recordings are 2x the window's point size).
set -euo pipefail
in=$1; out=$2; start=${3:-0}; dur=${4:-}; crop=${5:-}
vf=""
[ -n "$crop" ] && vf="crop=${crop#crop=},"
vf="${vf}fps=12,scale=1200:-1:flags=lanczos"
trim=(-ss "$start"); [ -n "$dur" ] && trim+=(-t "$dur")
palette=$(mktemp -t pal).png
ffmpeg -v error -y "${trim[@]}" -i "$in" -vf "$vf,palettegen=stats_mode=diff" "$palette"
ffmpeg -v error -y "${trim[@]}" -i "$in" -i "$palette" \
  -lavfi "$vf [x]; [x][1:v] paletteuse=dither=bayer:bayer_scale=5:diff_mode=rectangle" \
  -loop 0 "$out"
rm -f "$palette"
ls -la "$out"

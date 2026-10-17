#!/usr/bin/env bash
# Download the fonts used by the CV into ./fonts (git-ignored).
# Usage: scripts/fetch-fonts.sh [dest-dir]
set -euo pipefail

DEST="${1:-fonts}"
FA_VERSION="7.3.1"

mkdir -p "$DEST"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# TeX Gyre Heros: the Helvetica clone used by the LaTeX `tgheros` package
for style in regular bold italic bolditalic; do
  curl -fsSL --retry 3 -o "$DEST/texgyreheros-$style.otf" \
    "https://mirrors.ctan.org/fonts/tex-gyre/opentype/texgyreheros-$style.otf"
done

# Font Awesome 7 Free (desktop OTFs) for the contact icons
curl -fsSL --retry 3 -o "$TMP/fa.zip" \
  "https://github.com/FortAwesome/Font-Awesome/releases/download/${FA_VERSION}/fontawesome-free-${FA_VERSION}-desktop.zip"
unzip -qo "$TMP/fa.zip" -d "$TMP/fa"
find "$TMP/fa" -name '*.otf' -exec cp {} "$DEST" \;

echo "Fonts installed in $DEST:"
ls "$DEST"

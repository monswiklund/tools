#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HS_DIR="$HOME/.hammerspoon"
BACKUP_SUFFIX="$(date +%Y%m%d-%H%M%S)"

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "This setup is for macOS only (Hammerspoon)."
  exit 1
fi

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required but not installed."
  echo "Install: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  exit 1
fi

if [[ -d "$HS_DIR" ]]; then
  echo "Backing up existing ~/.hammerspoon -> ~/.hammerspoon.bak.$BACKUP_SUFFIX"
  mv "$HS_DIR" "$HS_DIR.bak.$BACKUP_SUFFIX"
fi

echo "Installing Hammerspoon (if needed)..."
brew install --cask hammerspoon >/dev/null

echo "Cloning base config..."
git clone https://github.com/MadTinker/DansHammerSpoon "$HS_DIR"

if [[ -f "$HS_DIR/.secrets.example" && ! -f "$HS_DIR/.secrets" ]]; then
  cp "$HS_DIR/.secrets.example" "$HS_DIR/.secrets"
fi

echo "Applying local patches..."
(
  cd "$HS_DIR"
  patch -p0 < "$SCRIPT_DIR/patches/disable-dragongrid-loadconfig.patch"
  patch -p0 < "$SCRIPT_DIR/patches/disable-dragongrid-hotkeys.patch"
  patch -p0 < "$SCRIPT_DIR/patches/kineticlatch-corner-smooth.patch"
)

# Upstream currently has incomplete submodule setup for Layouts.spoon.
if [[ ! -f "$HS_DIR/Spoons/Layouts.spoon/init.lua" ]]; then
  rm -rf "$HS_DIR/Spoons/Layouts.spoon"
  git clone https://github.com/DanEdens/Layouts.spoon.git "$HS_DIR/Spoons/Layouts.spoon"
fi

echo "Restarting Hammerspoon..."
osascript -e 'tell application "Hammerspoon" to quit' >/dev/null 2>&1 || true
sleep 1
open -a Hammerspoon

echo
echo "Done."
echo "Config path: $HS_DIR"
echo "Tip: Open Hammerspoon menu bar icon -> Reload Config if needed."

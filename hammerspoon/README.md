# Hammerspoon (DansHammerSpoon Setup)

Ready-to-go setup for your current Hammerspoon config, based on:
- Upstream: `MadTinker/DansHammerSpoon`
- Local tweaks:
  - DragonGrid disabled
  - KineticLatch improved (corner-based resize)
  - KineticLatch smooth mode (`throttleMs=4`, `minPixelDelta=0`)

## Quick Start

From `~/Dev/tools`:

```bash
cd hammerspoon
./setup.sh
```

This script will:
1. Install Hammerspoon via Homebrew (if missing)
2. Backup existing `~/.hammerspoon` to `~/.hammerspoon.bak.<timestamp>`
3. Clone `DansHammerSpoon` into `~/.hammerspoon`
4. Apply local patches from `patches/`
5. Ensure `Layouts.spoon` exists (workaround for upstream submodule issue)
6. Restart Hammerspoon

## Files

- `setup.sh`: Full install + patch workflow
- `patches/disable-dragongrid-loadconfig.patch`: Disables DragonGrid loading
- `patches/disable-dragongrid-hotkeys.patch`: Disables DragonGrid hotkeys
- `patches/kineticlatch-corner-smooth.patch`: Corner resize + smoother KineticLatch

## Update Workflow

If upstream changes, regenerate patch files against your current `~/.hammerspoon` and commit updates in this folder.

## Notes

- macOS only.
- Requires Homebrew.
- `.secrets` is created from `.secrets.example` if missing.

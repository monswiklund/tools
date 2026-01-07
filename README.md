# Tools (Omarchy Stack)

Developer environment configuration for macOS and Linux (Arch/Omarchy).

## Installation

### 1. Install Packages (If needed)

#### macOS (Homebrew)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install --cask ghostty
brew install neovim fish starship zellij ripgrep fd lazygit
brew install --cask font-jetbrains-mono-nerd-font
```

#### Linux (Arch / Omarchy)

```bash
# Most tools are pre-installed in Omarchy. If not:
sudo pacman -S neovim fish starship zellij ripgrep fd lazygit ghostty
```

### 2. Setup Dotfiles

```bash
# Clone repository
mkdir -p ~/Dev
git clone https://github.com/monswiklund/tools.git ~/Dev/tools

# Backup existing configs to avoid conflicts
mkdir -p ~/.config
mv ~/.config/nvim ~/.config/nvim.bak 2>/dev/null
mv ~/.config/ghostty ~/.config/ghostty.bak 2>/dev/null
mv ~/.config/fish ~/.config/fish.bak 2>/dev/null

# Symlink configurations
ln -s ~/Dev/tools/nvim ~/.config/nvim
ln -s ~/Dev/tools/ghostty ~/.config/ghostty
ln -s ~/Dev/tools/fish ~/.config/fish
ln -s ~/Dev/tools/starship.toml ~/.config/starship.toml
```

## Command Reference

### Shell Aliases (Fish)

| Command | Alias For | Description              |
| ------- | --------- | ------------------------ |
| `v`     | `nvim`    | Open NeoVim              |
| `g`     | `lazygit` | Open Git UI              |
| `ll`    | `ls -lG`  | List files (long format) |
| `ls`    | `ls -G`   | List files (default)     |

### Key Navigation (Starship/Fish)

- **Autosuggestion**: Press `Right Arrow` to complete the gray text.
- **Path Navigation**: `..` works as expected.

### NeoVim Shortcuts (Leader = Space)

| Key          | Action                    |
| ------------ | ------------------------- |
| `<Space> ff` | Find Files (Telescope)    |
| `<Space> /`  | Grep Search (search text) |
| `<Space> gg` | LazyGit (inside Vim)      |
| `<Space> e`  | File Explorer (Neo-tree)  |
| `<Space> u`  | Undotree (Toggle History) |

### Primeagen Power Pack

| Key          | Action                     |
| ------------ | -------------------------- |
| `<Space> a`  | Harpoon: Add current file  |
| `Ctrl + e`   | Harpoon: Open Menu         |
| `Ctrl + h`   | Go to File 1               |
| `Ctrl + t`   | Go to File 2               |
| `Ctrl + n`   | Go to File 3               |
| `Ctrl + s`   | Go to File 4               |
| `<Space> re` | Refactor: Extract Function |
| `<Space> rv` | Refactor: Extract Variable |

### Zellij (Terminal Multiplexer)

| Shortcut                | Action         |
| ----------------------- | -------------- |
| `Ctrl + g` then `n`     | New Pane       |
| `Ctrl + g` then `x`     | Close Pane     |
| `Ctrl + g` then `Arrow` | Move Focus     |
| `Ctrl + g` then `d`     | Detach Session |

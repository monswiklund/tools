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

## Cheat Sheet

### NeoVim (Leader = Space)

| Key          | Action        |
| ------------ | ------------- |
| `<Space> ff` | Find Files    |
| `<Space> /`  | Grep Search   |
| `<Space> gg` | LazyGit       |
| `<Space> e`  | File Explorer |
| `<Space> u`  | Undotree      |

### Primeagen Power Pack 🔱

| Key              | Action                     |
| ---------------- | -------------------------- |
| `<Space> a`      | Harpoon: Add File          |
| `Ctrl + e`       | Harpoon: Menu              |
| `Ctrl + h/t/n/s` | Navigate Harpoon 1-4       |
| `<Space> re`     | Refactor: Extract Function |

### Terminal

- **Fish**: Right Arrow to accept autosuggestions.
- **Zellij**: `zellij` to start. `Ctrl+g` + `n` (new pane), `Ctrl+g` + Arrows (navigate).

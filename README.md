# Tools (Omarchy Stack)

Developer environment configuration for macOS.

## Installation

### 1. Install Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Packages

```bash
brew install --cask ghostty
brew install neovim fish starship zellij ripgrep fd lazygit
brew install --cask font-jetbrains-mono-nerd-font
```

### 3. Setup Dotfiles

```bash
# Clone repository
mkdir -p ~/Dev
git clone https://github.com/monswiklund/tools.git ~/Dev/tools

# Create config directory
mkdir -p ~/.config

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

### Terminal

- **Fish**: Right Arrow to accept autosuggestions.
- **Zellij**: `zellij` to start. `Ctrl+g` + `n` (new pane), `Ctrl+g` + Arrows (navigate).

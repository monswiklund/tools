# Monster Tools (The Omarchy Stack) 🛠️

Detta repo innehåller hela min utvecklingsmiljö.
Följ bara dessa steg på en ny dator så är du igång på < 15 minuter.

## 🚀 Installation på ny Mac

### 1. Öppna Terminalen

Kör följande kommando för att installera Homebrew (Macens pakethanterare):

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Ladda ner verktygen

Kopiera och kör ALLT detta i terminalen:

```bash
# Installera "Omarchy"-stacken
brew install --cask ghostty
brew install neovim fish starship zellij ripgrep fd lazygit
brew install --cask font-jetbrains-mono-nerd-font
```

### 3. Länka ihop allt

Nu hämtar vi inställningarna och kopplar in dem.

```bash
# Skapa mapp
mkdir -p ~/Dev

# Hämta detta repo
git clone https://github.com/monswiklund/tools.git ~/Dev/tools

# Skapa config-mapp om den inte finns
mkdir -p ~/.config

# LÄNKA (Så att ändringar här slår igenom direkt)
ln -s ~/Dev/tools/nvim ~/.config/nvim
ln -s ~/Dev/tools/ghostty ~/.config/ghostty
ln -s ~/Dev/tools/fish ~/.config/fish
ln -s ~/Dev/tools/starship.toml ~/.config/starship.toml
```

### 4. Starta! 🏁

1.  Öppna appen **Ghostty**.
2.  Skriv `nvim` och låt den installera plugins.
3.  Njut.

---

## ⚡ Fusklapp

### ⌨️ NeoVim (LazyVim)

| Kommando | Vad det gör |
| (Leader) | **Space** (Mellanslag) |
| `<Space> f f` | Hitta filer |
| `<Space> /` | Sök text (Grep) |
| `<Space> g g` | Öppna LazyGit |
| `<Space> e` | Filhanterare |

### 👻 Terminal (Ghostty + Fish)

- **Fish Autosuggest**: Tryck `Pil Höger` för att fylla i grå text.
- **Zellij**: Skriv `zellij` för att få paneler.
  - `Ctrl+g` sedan `n` = Ny panel.
  - `Ctrl+g` sedan `Pilar` = Flytta fokus.

---

_Created by Antigravity_ 🧠

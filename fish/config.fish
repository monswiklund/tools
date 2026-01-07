# Disable the welcome message
set -U fish_greeting ""

# Homebrew
if test -d /opt/homebrew
    eval (/opt/homebrew/bin/brew shellenv)
end

# Starship prompt
if type -q starship
    starship init fish | source
end

# Aliases
alias ls="ls -G"
alias ll="ls -lG"
alias la="ls -laG"
alias g="lazygit"
alias v="nvim"

# Paths
fish_add_path $HOME/go/bin
fish_add_path $HOME/.pub-cache/bin

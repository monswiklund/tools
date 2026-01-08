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

# Display system info on startup
if status is-interactive
    fastfetch
end

# GRC (Colorizer) & Custom Wrappers
if type -q grc
    # Load default GRC rules (optional, but good for ls, ping etc)
    source (brew --prefix)/etc/grc.fish
    
    # Custom logger with our config
    function clog
        if test -f ~/.grc/conf.clog
            grc -c ~/.grc/conf.clog --colour=on $argv
        else
            grc --colour=on $argv
        end
    end

    # Auto-colorize Go
    function go
        clog command go $argv
    end

    # Auto-colorize Flutter
    function flutter
        clog command flutter $argv
    end
end

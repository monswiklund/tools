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

# GRC (Colorizer)
if type -q grc
    source (brew --prefix)/etc/grc.fish
    
    # Custom alias for coloring Flutter/Backend logs
    # Usage: clog flutter run
    function clog
        grc -c conf.log --colour=on $argv
    end
end

# GRC (Colorizer) - Updated
if type -q grc
    source (brew --prefix)/etc/grc.fish
    
    # Custom alias for coloring Flutter/Backend logs
    function clog
        # Use our custom config if it exists, otherwise fall back
        if test -f ~/.grc/conf.clog
            grc -c ~/.grc/conf.clog --colour=on $argv
        else
            grc -c conf.log --colour=on $argv
        end
    end
end

# Auto-Colorization (Abbreviations)
# Automatically wraps commands with clog when typed

# Forced Colorization (Functions)
# Abbreviations require triggers, functions force it.
function go
    clog /opt/homebrew/bin/go $argv
end

function flutter
    clog /Users/mans/fvm/default/bin/flutter $argv
end

# Auto-Colorization (Functions)
# This forces colorization on every run
function go
    if type -q grc
        clog /usr/local/go/bin/go $argv
    else
        /usr/local/go/bin/go $argv
    end
end

function flutter
    if type -q grc
        clog /opt/homebrew/bin/flutter $argv
    else
        /opt/homebrew/bin/flutter $argv
    end
end

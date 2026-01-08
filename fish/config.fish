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
abbr --add go 'clog go'
abbr --add flutter 'clog flutter'

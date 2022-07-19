autoload -U colors && colors

setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.cache/zsh/history

# Load aliases
[ -f "$HOME/.config/shell/aliases" ] && source "$HOME/.config/shell/aliases"

# Load personal functions
[ -f "$HOME/.config/shell/functions" ] && source "$HOME/.config/shell/functions"

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
fpath+=~/.config/shell/completions
compinit
_comp_options+=(globdots)		# Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# Correct the delete key binding
bindkey '^[[3~' delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'
bindkey '^[[P' delete-char

## Starship config
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init zsh)"

##THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ramiro/.sdkman"
[[ -s "/home/ramiro/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ramiro/.sdkman/bin/sdkman-init.sh"

# fnm
export PATH=/home/ramiro/.fnm:$PATH
eval "`fnm env`"

# fzf
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Load syntax highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Load autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

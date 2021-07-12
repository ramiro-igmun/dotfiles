#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# If the user is root, ommit the rest of the file
[[ "$(whoami)" = "root" ]] && return

# Set bash options
shopt -s autocd

# If running in endeavouros distro source eos functions
[[ -f ~/.config/bash/eos_functions ]] && . ~/.config/bash/eos_functions

# limits recursive functions, see 'man bash'
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# Alias to use lsd app to colorize the output
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias ll="ls -la"

alias vi="nvim"

# Git aliases
alias g="git"
alias gs="git status"
alias ga="g add"
alias gaa="ga -A"
alias gc="g commit -m"
alias grs="g restore --staged"
alias gps="g push"
alias gp="g pull"


# start intellij from terminal, dump all stdout to /dev/null and run it on the background
ij() {
 idea $1>/dev/null 2>&1 &
}

## Starship config
export STARSHIP_CONFIG=~/.config/starship/config.toml
eval "$(starship init bash)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ramiro/.sdkman"
[[ -s "/home/ramiro/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ramiro/.sdkman/bin/sdkman-init.sh"

# Set up nvm
[[ -s "/usr/share/nvm/init-nvm.sh" ]] && source /usr/share/nvm/init-nvm.sh

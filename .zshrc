
# ░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀
# ░░░▄▀░░▀▀█░█▀█░█▀▄░█░░
# ░▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ZSH=$HOME/.zsh
EDITOR=nano

if command -v yay &> /dev/null; then
  AUR_HELPER="yay"
elif command -v paru &> /dev/null; then
  AUR_HELPER="paru"
fi

# Smol starship fix
precmd() {
  precmd() {
    echo
  }
}

# User configuration

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
HISTDUPE=erase
HISTCONTROL=ignoreboth
HISTIGNORE="&:[bf]g:echo:clear:cls:history:exit:q:pwd:ll:* --help:* -h"

# zsh options
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Binds
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shell integrations

# neofetch
# pfetch
# fastfetch
# catnap

source <(fzf --zsh)
eval $(thefuck --alias)
eval $(thefuck --alias tf)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Personal aliases and plugins here.

alias e='$EDITOR'
alias fm='dolphin'

alias reload='source $HOME/.zshrc'
alias ezp='$EDITOR $HOME/.zshrc && source $HOME/.zshrc'
alias ebp='$EDITOR $HOME/.bashrc'
alias ezh='$EDITOR $HOME/.zsh_history'
alias ebh='$EDITOR $HOME/.bash_history'

# User dirs
alias dot='cd $HOME/.dotfiles'
alias cfg='cd $HOME/.config'
alias dx='cd $HOME/Desktop'
alias docs='cd $HOME/Documents'
alias dl='cd $HOME/Downloads'
alias dev='cd $HOME/Projects'

alias find='fd'
alias findr='$EDITOR $(fzf -m --preview="bat --color=always {}")'
alias cls='clear'
alias open='xdg-open'

alias cat='bat --color=always'

alias cd='z'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias ls='eza -1 --icons=auto'
alias ll='eza -lha --sort=name --git --git-repos --icons=auto'

alias mkdir='mkdir -p'

# Pacman
alias i='$AUR_HELPER -S'
alias r='$AUR_HELPER -Rns'
alias c='$AUR_HELPER -Scc'
alias u='$AUR_HELPER -Syyu'
alias s='$AUR_HELPER -Ss'
alias q='$AUR_HELPER -Qs'

# Get the error messages from journalctl
alias jctl='journalctl -p 3 -xb'

# Show disk usage of current directory
alias duh='du -sh * | sort -rh'

# Monitor disk space usage in real-time
alias qdisk='watch -n 1 df -h'

# Generate a random password
alias genpasswd='openssl rand -base64 12'

# List all environment variables
alias envlist='printenv | sort'

# Edit hosts file
alias hosts='sudo $EDITOR /etc/hosts'

# Get ip
alias myip='curl ipinfo.io/ip'

# Check network connectivity
alias qnet='ping -c 4 google.com'

# Git
alias g='git'
alias gc='git clone'
alias gs='git status'
alias ga='git add'
alias gcm='git commit'
alias gco='git checkout'
alias gb='git branch'
alias gd='git diff'
alias gl='git log'
alias gp='git pull'
alias gps='git push'
alias gpo='git push origin'

lazyg() {
  ga .
  gcm -m "$1"
  gps
}


# Initialize plugins 

# Staged zsh startup
source $ZSH/zsh-defer/zsh-defer.plugin.zsh

# Automatically lists completions as you type
#source $ZSH/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Use history substring search
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh

# Fish-like syntax highlighting and autosuggestions
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enhances the terminal environment with 256 colors
# source $ZSH/zsh-256color/zsh-256color.plugin.zsh

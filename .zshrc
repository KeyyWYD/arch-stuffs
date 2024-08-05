
# ░░░▀▀█░█▀▀░█░█░█▀▄░█▀▀
# ░░░▄▀░░▀▀█░█▀█░█▀▄░█░░
# ░▀░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

limit coredumpsize 0

# Vars
ZSH=$HOME/.zsh
EDITOR=nano

if command -v yay &> /dev/null; then
  aurhelper=yay
elif command -v paru &> /dev/null; then
  aurhelper=paru
fi

# User configuration

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
HISTDUPE=erase
HISTCONTROL=ignoreboth
HISTIGNORE="&:[bf]g:echo:clear:cls:history:exit:q:pwd:ll:* --help:* -h"
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# zsh options
setopt MENU_COMPLETE
setopt LIST_PACKED
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

# Binds
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
bindkey '^[[3~' delete-char

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
# eval "$(starship init zsh)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/kdot.toml)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Personal aliases and plugins here.

alias e='$EDITOR'
alias fm='yazi'

alias reload='. $HOME/.zshrc'
alias ezp='$EDITOR $HOME/.zshrc && source $HOME/.zshrc'
alias ebp='$EDITOR $HOME/.bashrc'
alias ezh='$EDITOR $HOME/.zsh_history'
alias ebh='$EDITOR $HOME/.bash_history'
alias czh=':>$HOME/.zsh_history'
alias cbh=':>$HOME/.bash_history'

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
alias x='exit'

alias cat='bat --color=always --paging=never --wrap=never'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'

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
alias i='$aurhelper -S'
alias r='$aurhelper -Rns'
alias c='$aurhelper -Scc'
alias u='$aurhelper -Syyu'
alias s='$aurhelper -Ss'
alias q='$aurhelper -Qs'

alias free='free -h'

# Get the error messages from journalctl
alias jctl='journalctl -p 3 -xb'

# Show disk usage of current directory
alias duh='du -sh * | sort -rh'

# Monitor disk space usage in real-time
alias qdisk='watch -n 1 df -h'

# Generate a random password
alias genpasswd='openssl rand -base64 12'

# Generate random numbers
alias gennum='shuf -i 100000-999999 -n 1'

# List all environment variables
alias envlist='printenv | sort'

# Edit hosts file
alias hosts='sudo $EDITOR /etc/hosts'

# Get ip
alias myip='curl ipinfo.io/ip'

# Check network connectivity
alias qnet='ping -c 1 example.com'

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
# source $ZSH/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Use history substring search
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh

# Fish-like syntax highlighting and autosuggestions
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Enhances the terminal environment with 256 colors
# source $ZSH/zsh-256color/zsh-256color.plugin.zsh

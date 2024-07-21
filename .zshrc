
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

# User configuration

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.zsh_history
HISTDUPE=erase
HISTCONTROL=ignoreboth
HISTIGNORE="&:[bf]g:clear:cls:history:exit:q:pwd:* --help:* -h"

# zsh options
setopt appendhistory
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Shell integrations

# neofetch
# pfetch
# fastfetch
# catnap

eval $(thefuck --alias)
eval $(thefuck --alias tf)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Personal aliases and plugins here.

alias e='$EDITOR'
alias fm='dolphin'

alias rlp=". $HOME/.zshrc"
alias ezp="$EDITOR $HOME/.zshrc"
alias ebp="$EDITOR $HOME/.bashrc"
alias ezh="$EDITOR $HOME/.zsh_history"
alias ebh="$EDITOR $HOME/.bash_history"

# User dirs
alias dot='cd $HOME/.dotfiles'
alias cfg='cd $HOME/.config'
alias dx='cd $HOME/Desktop'
alias docs='cd $HOME/Documents'
alias dl='cd $HOME/Downloads'

alias cd='z'
alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias find='fd'

alias ls='eza -1 --icons=auto'
alias ll='eza -lha --sort=name --git --git-repos --icons=auto'
alias mkdir='mkdir -p'

alias cls='clear'

# Pacman
alias i='$AUR_HELPER -S'
alias r='$AUR_HELPER -Rns'
alias c='$AUR_HELPER -Scc'
alias u='$AUR_HELPER -Syu'
alias s='$AUR_HELPER -Ss'
alias q='$AUR_HELPER -Qs'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Git
alias gcl='git clone'
alias gs='git status'
alias gpl='git pull'
alias gp='git push'
alias gpo='git push origin'
alias ga='git add'
alias gd='git diff'
alias gcm='git commit'
alias gb='git branch'
alias gco='git checkout'
alias gl='git log'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'
alias gr='git remote'
alias grs='git remote show'

lazyg() {
  ga .
  gcm -m "$1"
  gp
}


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
source $ZSH/zsh-256color/zsh-256color.plugin.zsh

# fzf
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh

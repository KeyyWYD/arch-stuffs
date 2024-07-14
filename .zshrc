# .zshrc

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
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
HISTCONTROL=ignoreboth
HISTIGNORE="&:[bf]g:clear:cls:history:exit:q:pwd:* --help:* -h"

# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY
# Share history between all sessions.
setopt SHARE_HISTORY
# Expire a duplicate event first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST
# Do not record an event that was just recorded again.
setopt HIST_IGNORE_DUPS
# Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_ALL_DUPS
# Do not display a previously found event.
setopt HIST_FIND_NO_DUPS
# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE
# Do not write a duplicate event to the history file.
setopt HIST_SAVE_NO_DUPS
# Do not execute immediately upon history expansion.
setopt HIST_VERIFY

setopt appendhistory

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

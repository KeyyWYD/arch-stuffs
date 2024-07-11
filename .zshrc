# arch btw

ZSH=$HOME/.zsh
EDITOR=nano

if command -v yay &> /dev/null; then
    AUR_HELPER="yay"
elif command -v paru &> /dev/null; then
    AUR_HELPER="paru"
fi

### ---- Plugins ---------------------------------------------------------------
# source $ZSH/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $ZSH/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### ---- Fetch  ----------------------------------------------------------------
# neofetch
# pfetch
# fastfetch
# catnap

### ---- Startup ---------------------------------------------------------------
eval $(thefuck --alias)
eval $(thefuck --alias tf)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
source <(fzf --zsh)

### ---- profile ---------------------------------------------------------------
alias rlp=". ~/.zshrc"
alias ezp="$EDITOR ~/.zshrc"
alias ebp="$EDITOR ~/.bashrc"

### ---- Handy aliases ---------------------------------------------------------
alias e='$EDITOR'

alias cd='z'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias find='fd'

alias dx='cd $HOME/Desktop'
alias docs='cd $HOME/Documents'
alias dl='cd $HOME/Downloads'

alias ls='eza -1 --icons=auto'
alias ll='eza -lha --sort=name --git --git-repos --icons=auto'
alias mkdir='mkdir -p'

alias cls='clear'

alias i='$AUR_HELPER -S'
alias r='$AUR_HELPER -Rns'
alias c='$AUR_HELPER -Sc'
alias u='$AUR_HELPER -Syu'
alias s='$AUR_HELPER -Ss'
alias q='$AUR_HELPER -Qs'

### ---- GIT -------------------------------------------------------------------
alias gcl='git clone'
alias gst='git status'
alias gpl='git pull'
alias ga='git add .'
alias gd='git diff | mate'
alias gau='git add --update'
alias gcm='git commit -m'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias pushmain='git push origin main'
alias pushmaster='git push origin master'

lazyg() {
  git add .
  git commit -m "$1"
  git push
}

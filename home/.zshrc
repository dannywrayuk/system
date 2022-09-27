export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZDOTDIR="$ZSH/cache"
HISTFILE="$ZDOTDIR/.zsh_history"

ZSH_THEME="robbyrussell" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ENABLE_CORRECTION="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Lazy NVM loader - only load nvm when it's needed

alias nvm="lazy_nvm; nvm"
alias npm="lazy_nvm; npm"
alias node="lazy_nvm; node"
alias npx="lazy_nvm; npx"

function lazy_nvm {
  unalias nvm
  unalias npm
  unalias node
  unalias npx

  if [ -d "${HOME}/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi
}

unset ZDOTDIR

# Project directory
PROJDIR=~/proj

# Alias and Functions
source ~/dotfiles/customs.zsh

# Source device specific configs
[ -s "$HOME/.zshlocal" ] && source $HOME/.zshlocal

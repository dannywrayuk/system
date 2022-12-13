export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZDOTDIR="$ZSH/cache"
HISTFILE="$ZDOTDIR/.zsh_history"

ZSH_THEME="robbyrussell" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ENABLE_CORRECTION="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh
unset ZDOTDIR

# Lazy NVM loader - only load nvm when it's needed

alias nvm="lazy_nvm; nvm"
alias npm="lazy_nvm; npm"
alias node="lazy_nvm; node"
alias npx="lazy_nvm; npx"
alias yarn="lazy_nvm; yarn"

function lazy_nvm {
  unalias nvm
  unalias npm
  unalias node
  unalias npx
  unalias yarn

  if [ -d "${HOME}/.nvm" ]; then
    ZDOTDIR="$ZSH/cache"
    BREW_LOCATION="$(brew --prefix)/opt"
    export NVM_DIR="$HOME/.nvm"
    [ -s "$BREW_LOCATION/nvm/nvm.sh" ] && \. "$BREW_LOCATION/nvm/nvm.sh" # This loads nvm
    [ -s "$BREW_LOCATION/nvm/etc/bash_completion.d/nvm" ] && \. "$BREW_LOCATION/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion
    unset ZDOTDIR
    unset BREW_LOCATION
  fi
}

# Project directory
export PROJDIR=~/proj

# Dotfiles directory
export DOTFILES=~/dotfiles

# Alias and Functions
source $DOTFILES/customs.zsh

# Source device specific configs
[ -s "$HOME/.zshlocal" ] && source $HOME/.zshlocal


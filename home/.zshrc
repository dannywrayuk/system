export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZDOTDIR="$ZSH/cache"
HISTFILE="$ZDOTDIR/.zsh_history"

ZSH_THEME="robbyrussell" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ENABLE_CORRECTION="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

unset ZDOTDIR

# Project directory
PROJDIR=~/proj

# Alias and Functions
source ~/dotfiles/customs.zsh

# Source device specific configs
[ -s "$HOME/.zshlocal" ] && source $HOME/.zshlocal

export PATH=/opt/homebrew/bin:$PATH
export ZSH="/Users/danny/.oh-my-zsh"
HISTFILE="$ZSH/cache/.zsh_history"
ZDOTDIR="$ZSH/cache/"

ZSH_THEME="robbyrussell" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ENABLE_CORRECTION="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

unset ZDOTDIR

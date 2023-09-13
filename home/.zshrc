export PATH=/opt/homebrew/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
ZDOTDIR="$ZSH/cache"
HISTFILE="$ZDOTDIR/.zsh_history"

ZSH_THEME="robbyrussell" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
plugins=(git)

source $ZSH/oh-my-zsh.sh
unset ZDOTDIR

# Initialise fnm
eval "$(fnm env --use-on-cd)"

# Project directory
export PROJDIR=~/proj

# Dotfiles directory
export DOTFILES=~/dotfiles

# Alias and Functions
source $DOTFILES/customs.zsh

# neovim
export XDG_CONFIG_HOME=~/
alias vim="nvim"

# Source device specific configs
[ -s "$HOME/.zshlocal" ] && source $HOME/.zshlocal


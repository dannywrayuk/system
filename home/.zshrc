export DOTFILES=~/dotfiles

# Source global configs
source $DOTFILES/terminal/config.zsh

# Source device specific configs
[ -s "$HOME/.zshlocal" ] && source $HOME/.zshlocal

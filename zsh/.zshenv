export ZDOTDIR=$HOME/.config/zsh

export CONFIG_DIR="/Users/danny/.config"
export PROJ_DIR="$HOME/project"
export SYS_CONFIG_DIR="/Users/danny/.config/system"
export SHELL_SESSIONS_DISABLE=1
export HISTSIZE="10000"
export SAVEHIST="10000"
export HISTFILE="$CONFIG_DIR/zsh/zsh_history"

# Set the default editor
export EDITOR="nvim"
export VISUAL="nvim" 

typeset -U path cdpath fpath manpath
path+=(
    "/opt/homebrew/bin"
    "/Users/danny/.cargo/bin"
    "$CONFIG_DIR/terminal/commands"
)

# Load FNM
[ -z $FNM_MULTISHELL_PATH ] && eval "$(fnm --log-level quiet env --use-on-cd)"

# Source local device config
[ -s "$CONFIG_DIR/zsh/.zshlocal" ] && source "$CONFIG_DIR/zsh/.zshlocal"

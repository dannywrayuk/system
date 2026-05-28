export ZDOTDIR="$HOME/.config/zsh"
export CONFIG_DIR="$HOME/.config"
export PROJ_DIR="$HOME/project"
export SYS_CONFIG_DIR="$CONFIG_DIR/system"

typeset -U path cdpath fpath manpath
path+=(
  "/opt/homebrew/bin"
  "$HOME/.cargo/bin"
  "$CONFIG_DIR/terminal/commands"
)

export SHELL_SESSIONS_DISABLE=1
export HISTSIZE="10000"
export SAVEHIST="10000"
export HISTFILE="$ZDOTDIR/zsh_history"

export EDITOR="nvim"
export VISUAL="$EDITOR"


[ -z $FNM_MULTISHELL_PATH ] && eval "$(fnm --log-level quiet env --use-on-cd)"

[ -s "$ZDOTDIR/.zshlocal" ] && source "$ZDOTDIR/.zshlocal"

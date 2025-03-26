# Style the prompt
autoload -U add-zsh-hook vcs_info
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
setopt prompt_subst
export PROMPT='%F{green}➜%f '
export RPROMPT='%F{8}${vcs_info_msg_0_} %1~ %*%f'

# Deno 
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# Load FNM
[ -z $FNM_MULTISHELL_PATH ] && eval "$(fnm env --use-on-cd)"

# Load shell functions
source "$CONFIG_DIR/terminal/functions/all.zsh"

# Source local device config
[ -s "$CONFIG_DIR/zsh/.zshlocal" ] && source "$CONFIG_DIR/zsh/.zshlocal"

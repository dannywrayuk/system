# Environment Variables and Options


# Load zsh plugins
autoload -U add-zsh-hook vcs_info

# Add homebrew to path
export PATH=/opt/homebrew/bin:$PATH

# Config location
export XDG_CONFIG_HOME=~/.config

# Project directory
export PROJDIR=~/proj

# Dotfiles directory
export DOTFILES=~/dotfiles



# Look and Feel

# No sounds pls
setopt no_beep 
setopt no_list_beep
set bell-style none

# Set Prompt Line
add-zsh-hook precmd vcs_info
zstyle ':vcs_info:git:*' formats '(%b)'
setopt prompt_subst
export PROMPT='%F{green}➜%f '
export RPROMPT='%F{8}${vcs_info_msg_0_} %1~ %*%f'

# Iterm title to PWD
DISABLE_AUTO_TITLE="true"

iterm_tab_title() {
    echo -ne "\e]0;$(dirs)\a"
}
add-zsh-hook precmd iterm_tab_title

# Handle history correctly
HISTFILE="$XDG_CONFIG_HOME/.zsh_history"
HISTSIZE=5000
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Automatically enter directories
setopt auto_cd

# Add color to ls
alias ls="ls -G"

# Use completion menu
# autoload -Uz compinit && compinit
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# zstyle ':completion:*' menu no


# Alias

# Meta


# Re-source .zshrc
alias rsz="source ~/.zshrc"

# List application versions
alias v="$DOTFILES/terminal/scripts/list-info"

# Quit terminal
alias :q="exit"


# Git


# Git
alias g="git"

# Status
alias gs="git status"

# Status short form
alias gss="git status -s -b"

# Add
alias ga="git add"

# Add all
alias gaa="git add --all"

# Commit
alias gc="git commit"

# Pull
alias gl="git pull"

# Push
alias gp="git push"

# Force push
alias gpf="git push --force"

# Checkout
alias gco="git checkout"

# Checkout new branch
alias gcb="git checkout -b"

# Clone repo into project directory
alias clone="git -C $PROJDIR clone"

# Clear all untracked files (interactive)
alias nuke="git clean -xdfi"

# Get main branch (with remote)
alias ggdr="git branch -rl | grep 'origin/HEAD' | cut -d '>' -f 2 | tr -d ' '"

# Get main branch
alias ggd="git branch -rl | grep 'origin/HEAD' | cut -d '>' -f 2 | tr -d ' ' | sed 's/origin\///' "

# Rebase main from origin
alias grm="git fetch && git rebase -i \$(ggdr)"

# Checkout main branch
alias gcm="git checkout \$(ggd)"


# Navigation

# Go home
alias ~="cd ~"

# Go back
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Go to a project
alias proj="cd $PROJDIR/\$(ls $PROJDIR | fzf)"

# Go to Documents
alias docs="cd ~/Documents"


# Editor

# Remap vim to neovim
alias vim="nvim"


# Fun

# Open lofi hiphop beats
alias lofi="open https://www.youtube.com/watch\?v\=jfKfPfyJRdk"



# Scripts and Functions

# Tmux Sessionizer
alias tmux-sessionizer="$DOTFILES/terminal/scripts/tmux-sessionizer"

# Navigator
alias op=". $DOTFILES/terminal/scripts/navigator"
bindkey -s ^o "op\n"

# Kill process running on network port $1
function kop(){
    lsof -i:$1 && echo \\nkilling $(lsof -t -i:$1) && lsof -t -i:$1 | xargs kill -9
}

# Display paste history
alias ph="vim +$ ~/.pasteboardHistory"

# Display command history
alias ch="vim +$ ~/.config/.zsh_history"



# Application Config


# FNM
eval "$(fnm env --use-on-cd)"

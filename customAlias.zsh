# help      List all custom commands
alias help="cat ~/dotfiles/customAlias.zsh | sed -nr 's/^# (.*)|^#/\1/p'"

# rsz       Re-source .zshrc
alias rsz="source ~/.zshrc"

# dotup     Update dotfiles
alias dotu=""

# dotedit   Edit dotfiles
alias dotedit="code ~/dotfiles"

# clone     Clone repo into project directory
alias clone="git -C $PROJDIR clone"

# proj      Go to project directory
alias proj="cd $PROJDIR"

# docs      Go to Documents
alias docs="cd ~/Documents"



# help      List all custom commands
alias help="cat ~/dotfiles/customs.zsh | sed -nr 's/^# (.*)|^#/\1/p'"

# rsz       Re-source .zshrc
alias rsz="source ~/.zshrc"

# dotup     Update dotfiles from remote
function dotup(){
    git checkout -b local-changes
    git fetch origin master:master
    git stash
    git checkout master
    git stash pop
    git branch -d local-changes
}

# dotedit   Edit dotfiles
alias dotedit="code ~/dotfiles"

# clone     Clone repo into project directory
alias clone="git -C $PROJDIR clone"

# proj      Go to project directory
alias proj="cd $PROJDIR"

# docs      Go to Documents
alias docs="cd ~/Documents"

# kop       Kill process running on port $1
function kop(){
        lsof -f -i tcp:$1 | xargs kill
}



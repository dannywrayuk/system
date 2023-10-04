# help      List all custom commands
alias help="cat $DOTFILES/customs.zsh | sed -nr 's/^# (.*)|^#/\1/p'"

# rsz       Re-source .zshrc
alias rsz="source ~/.zshrc"

# dotedit   Edit dotfiles
alias dotedit="code $DOTFILES"

# dotln     Link dotfiles with symlinks
alias dotln="$DOTFILES/install.sh"

# clone     Clone repo into project directory
alias clone="git -C $PROJDIR clone"

# proj      Go to a project
alias proj="cd $PROJDIR/\$(ls $PROJDIR | fzf)"

# docs      Go to Documents
alias docs="cd ~/Documents"

# lofi      Open lofi hiphop beats
alias lofi="open https://www.youtube.com/watch\?v\=jfKfPfyJRdk"

# nuke      Clear all untracked files (interactive)
alias nuke="git clean -xdfi"

# ggmr      Git get default branch (with remote)
alias ggdr="git branch -rl | grep 'origin/HEAD' | cut -d '>' -f 2 | tr -d ' '"

# ggmr      Git get default branch
alias ggd="git branch -rl | grep 'origin/HEAD' | cut -d '>' -f 2 | tr -d ' ' | sed 's/origin\///' "

# grm      Git rebase main from origin
unalias grm
alias grm="git fetch && git rebase -i $(ggdr)"

# gcm      Git checkout default brnach
unalias gcm
alias gcm="git checkout $(ggd)"

# kop       Kill process running on port $1
function kop(){
        lsof -i:$1 && echo \\nkilling $(lsof -t -i:$1) && lsof -t -i:$1 | xargs kill -9
}

# op        Open a child directory
function op(){
    DEPTH=${1:-"4"}
    DIR=$(fd --type d --max-depth $DEPTH  | fzf)
    if [[ ! -z $DIR ]]
    then
        cd $DIR
    fi
}

# wksp      Open a vscode workspace
function wksp(){
if [[ -z $1 ]]
then
    ls $PROJDIR/workspaces | sed -e 's/\.code-workspace$//'
else
    code $PROJDIR/workspaces/$1.code-workspace
fi
}

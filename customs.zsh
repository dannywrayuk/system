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

# proj      Go to project directory
alias proj="cd $PROJDIR"

# docs      Go to Documents
alias docs="cd ~/Documents"

# lofi      Open lofi hiphop beats
alias lofi="open https://www.youtube.com/watch\?v\=jfKfPfyJRdk"

# kop       Kill process running on port $1
function kop(){
        lsof -i:$1 && echo \\nkilling $(lsof -t -i:$1) && lsof -t -i:$1 | xargs kill -9
}

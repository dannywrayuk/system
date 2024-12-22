function ps() {
PACKAGE=$(cat package.json)
if [[ ! -z $PACKAGE ]]; then
    SCRIPT=$(echo $PACKAGE | jq -r '.scripts | keys[]' | fzf --height ~30% --layout reverse --border)
    if [[ ! -z $SCRIPT ]]; then
        print -rz -- "yarn $SCRIPT "
    fi
fi
}

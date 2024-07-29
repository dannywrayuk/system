function ps() {
PACKAGE=$(cat package.json)
if [[ ! -z $PACKAGE ]]; then
    SCRIPT=$(echo $PACKAGE | jq -r '.scripts | keys[]' | fzf)
    if [[ ! -z $SCRIPT ]]; then
        print -rz -- "yarn $SCRIPT "
    fi
fi
}

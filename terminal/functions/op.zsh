function op () {
    DIR=$(fd --type d --min-depth 1 --max-depth 4  | fzf  --height ~30% --layout reverse --border  --query ${1:-""})

    if [[ ! -z $DIR ]]; then
        if [[ -d $DIR ]]; then
            cd "$DIR"
        else
            echo "Not found: $DIR"
        fi
    fi
}

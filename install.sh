read -p "Do you wish to overwrite existing files?(y/n)" OVERWRITE

find $DOTFILES/home -type f | while read FILE
do
LINK=${FILE/$DOTFILES\/home/~}
 if [[ "$OVERWRITE" =~ [yY] ]]; then rm "$LINK"; fi
 ln -s "$FILE" "$LINK"
done

ln -s $DOTFILES/nvim ~/.config
ln -s $DOTFILES/.hammerspoon ~

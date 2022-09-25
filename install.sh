read -p "Do you wish to overwrite existing files?(y/n)" OVERWRITE

find $PWD/home -type f | while read FILE
do
LINK=${FILE/$PWD\/home/~}
 if [[ "$OVERWRITE" =~ [yY] ]]; then rm "$LINK"; fi
 ln -s "$FILE" "$LINK"
done
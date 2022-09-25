find $PWD/home -type f | while read FILE
do
LINK=${FILE/$PWD\/home/~}
 echo $FILE
 echo $LINK
 ln -s "$FILE" "$LINK"
done
printdiff(){
DIR1="$1"
DIR2="$2"
ls $DIR1 | while read x
do
    str=$(diff --exclude '.svn' $DIR1/$x $DIR2/$x )
    [ -n "$str" ] && echo $x && echo $str
done
}

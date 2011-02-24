#!/bin/sh

set -e
set -u

BASEDIR=`pwd`
HEADER='HEADER.txt'
FOOTER='FOOTER.txt'

# ----
BASEHD='-'
BASEFT='-'


# convert every *.txt -> *.md
# if there is a *.conf file:
#     -> follow the rules of the *.conf
# else
#     -> follow the standard:

recdir(){
    locdir="$1"
    #src=$(find "$dir" -maxdepth 2 | grep -v '\.htmlmd$' | grep -v '\.html$' | grep -v '\.conf' | grep -v 'HEADER.txt' | grep -v 'FOOTER.txt' )
    src=$(find "$locdir" -maxdepth 1 )
    for i in "$locdir"/* ; do

        # exclude this file
        s=$( ( echo "$i" |  grep -v '\.htmlmd$' | grep -v '\.html$' | grep -v '\.conf' | grep -v 'HEADER.txt' | grep -v 'FOOTER.txt'  ) || { echo '-';  } )

        if [ ! "$s" = '-' ]; then # excluded file
            sn=$(basename "$s")
            fd=$(dirname "$s")
            fdn=$(basename "$fd")
            echo sn $sn

            [ "$sn" =  $HEADER ] && echo has header $s
            [ "$sn" =  $FOOTER ] && echo has footer $s

            if [ -d "$s" ] && [ ! "$locdir" = "$s" ]; then
                cd "$s"
                recdir "$s"
            fi
    fi
    done
}


main(){
    echo main
    for f in "$BASEDIR"/* ; do
        [ "$f" =  $HEADER ] &&  BASEHD="$f"
        [ "$f" =  $FOOTER ] &&  BASEFT="$f"
    done

    recdir "$BASEDIR"
}

convert(){
        fn=$(basename "$f" )
        name=$( echo $fn | sed 's/\..*//g')
        fmd="${name}.md"
        fconf="${name}.conf"

        [ -f "$fmd" ] && rm -f "$fmd"

        # if there is a foo.conf file, that configures the composition order
        if [ -f $fconf ];then
            cat $fconf | while read l ; do
                ln=$(echo $l | sed 's/\.\w*$//g')
                echo l $l
                echo ln $ln
                cat $l >> $fmd
            done
        else
            [ -f "HEADER" ] && cat HEADER >> $fmd
            [ -f "$f" ] && cat "$f"  >> $fmd
            [ -f "FOOTER" ] && cat FOOTER >> $fmd
        fi
}


main


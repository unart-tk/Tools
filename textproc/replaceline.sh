#!/bin/sh

#    by: Ben, untar.org
#    in: tools, bash, textmanipulation
#
# 

set -e
set -u
set -n

line_nr=''
text=''
file=''
backup='false'

usage(){
    echo "Usage: $0 - [-backup] <line_nr> <text> <file>"
    exit 1
}

# usages: prog -backup 4 foobar myfile.txt
# usages: prog 123 'xdesdkl(' myfile.txt

if [ "$#" = 4 ];then
    if [ "$1" = '-backup' ]; then
        backup='true'
        line_nr="$2"
        text="$3"
        file="$4"
    else
        usage
    fi
elif [ "$#" = 3 ]; then
    line_nr="$1"
    text="$2"
    file="$3"
    backup='false'
else
    echo kaka
    usage
fi


if [ ! -f "$file" ];then
    echo "Error: the file $file is not a valid file"
fi

[ -z "${line_nr##[0-9]*}" ] || { 
    echo "Error: line_nr $line_nr is not a number." ;
    usage
}

if [ "$backup" = 'true' ];then
    perl -i.bak -pe "s/.*/$text/ if $. ==$line_nr" "$file"
else
    perl -pe "s/.*/$text/ if $. ==$line_nr" "$file"
fi


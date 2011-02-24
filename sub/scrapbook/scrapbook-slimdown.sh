#!/bin/sh
# copyright (c) 2010 ben@leakin.org
# ./slimdown.sh --help
# 
set -u

USAGE='[-a|--all] [-f|--file <filename>] input'

input=

die(){
	echo >&2 "$@"
	exit 1
}
usage(){
	die "Usage: $0 $USAGE"
}
case "$#" in 0) usage ;; esac

dir="$1"
d=""
echo $dir

for p in $(find "$dir" -iname '*.html'); do {
    d=$(dirname "$p")
    f=$(basename "$p")
    n=${f%%.html}
    t="$d/$n.txt"
    echo "$t"
    if [ ! -f "$t" ]; then
        html2text  -o "$d/$n.txt" "$p"
    fi
}
done

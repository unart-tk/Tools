for p in $(find . -type f -iname "*" | grep -v html | grep -v dat | grep -v txt | grep -v "\.ml*"  | grep -v "\.c" | grep -v "\.h" | grep -v awk); do { del "$p"; } done

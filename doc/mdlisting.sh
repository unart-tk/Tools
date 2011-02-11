#!/bin/sh
#
#
#   (C) 2011 Ben, untar.org
#
# ****

# this is the generated index file
index='index.md'
header='index.txt'

# source dir
dir=''

# targed dir
docdir='htmldoc'

if [ "$#" = 1 ]; then
  dir="$1"
else
  dir=`pwd`
fi

rm -rf "$docdir"
mkdir "$docdir"

# Prepare index.md

if [ -f $header ] ; then
  cat $header > $index
else
  echo "Index" > $index
  echo "=====" >> $index
  echo "" >> $index
fi

title=''
[ -n "$dir" ] &&
for f in "$dir"/*.txt ; do
  # convert .txt to .html
   md2html "$f"  || { echo "Error with md2html"; exit 1; }
  # Register the .html in a index.md file
  fn=$(basename $f)
  fx=$(echo $fn | sed 's/\..*//g')
  fhtml="${fx}.html"
  title=$(head -n 1 $f)

  # Maybe we have a summary
  summary=''
  sumark=$(sed -n 9,9p $f)
  sum=$( echo "$sumark" | grep '\*\*\*'  || echo '-'  )

  if [  "$sum" != '-'  ]; then
    summary=$(sed -n 7,7p $f)
    echo "[ $title ]( $fhtml ) "  - $summary  >> $index
  else
    echo "[ $title ]( $fhtml ) "  >> $index
  fi

  echo "" >> $index

  mv $fhtml $docdir/
done



# convert index.md  to .html
md2html "$index" || { echo "Error with md2html"; exit 1; }
mv index.html $docdir/

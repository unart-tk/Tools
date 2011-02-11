#!/bin/sh

# md2html - Alias for markdown conversion
# =======================================
#
#     (c) 2011 Ben, untar.org>
# 

set -e

fmd=''     # input/ markdown
fhtml=''   # output/html

# conversion command
cmd='pandoc -s  -- "$fhtml" > "$fmd"'

if [ "$#" = 1 ];then
  fhtml="$1"
else
  echo "Usage: $0 - <markdown file>"
  exit 1
fi

fbn=$(basename "$fhtml")
fn=$(echo "$fbn" | sed 's/\..*//g')
fmd="${fn}.html"

eval ${cmd}

#!/bin/sh

# md2html - convert markdown to html
# ==================================
#
#     (c) 2011 Ben <b@untar.org>
# 

set -e

pandoc -s -f markdown -t html "$@"

#!/bin/sh

# md - Generate a html doc from a markdown (.md) file
#
#     (C) 2011 Ben <b@untar.org>
#

set -e

ffn=$(basename $1)
fn=${ffn%.*}

if [ -f $fn.html ]; then
	rm -f $fn.html
fi

echo '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">' > $fn.html
echo "<html>" >> $fn.html
echo "  <head>" >> $fn.html
echo "  </head>" >> $fn.html
echo "  <body>" >> $fn.html

markdown $1 >> $fn.html


echo "</body></html>" >> $fn.html

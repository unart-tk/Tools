# html.sh - oneliners for html files
#
#	Copyright (c) 2010 Ben Leak
#	v0.1: 2010-10-18, leakin.org/r/oneliners
#	tags: oneliner | html
#
#
# find urls in href in html
findurl () {
	local file=$1
	perl -nle 'print $1 while /\<a\b[^\>"]*?\bhref=\"?([^\>"]*)/g' $file
}

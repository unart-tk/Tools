# tools.sh - oneliners for text files
#
#	Copyright (c) 2010 Ben Leak
#	v0.1: 2010-10-18, leakin.org/r/oneliners
#	tags: oneliner | text
#

dos2unix(){
	file=$1 #~/foo.txt
	perl  -i -pe 's/\r//' $file 
}

# doublespace file
doublespace(){
	file=$1 #~/foo.txt
	perl -pe '$_.=$/' $file 
}
 
# print line twice
printtwice () {
	file=$1 #~/foo.txt
	perl -pe '$\=$_' $file 
}

# print last line
lastline () {
	file=$1 #~/foo.txt
	perl -pe '$*=$_}{$_=$*' $file 
}

# print number of lines 'wc -l'
linesinfile () {
	file=$1 #~/foo.txt
	perl -le 'print $==()=<>' $file 
}

# sum the numbers in the fst column
sumcol () {
	file=$1 #~/foo.txt
	perl -lpe '$,+=$_}{$_=+$,' $file
}

# remove the first column
rmcol () {
	file=$1 #~/foo.txt
	perl -nale 'shift@F;print"@F"' $file
}

# print module version number
printmodv () {
	module=$1 #File::Find
	perl -le 'eval "require $ARGV[0]" and print $ARGV[0]->VERSION' $module
}


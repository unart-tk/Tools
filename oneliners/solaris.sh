solaris_tar(){
	input=$1
	outputar=$input.tar
	tar cf $outputar $input
	gzip -f $outputar
}
solaris_untar(){
	input=$1.gz
	outputar=$1
	gunzip $input
	tar -xvf $outputar
}

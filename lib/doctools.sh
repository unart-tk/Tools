
cleanmd (){  # clean all except txt, md, ...
    rm -f *.pdf *.tex *.html log
}

xvman (){   #  vman.sh - view man pages in vim
	vim -c "Man $*" -c 'silent! only' -c 'nmap q :q<CR>'
}

# ; && -> not oneliner
md2html () {
    n=$(echo $1 | sed 's/\.[^\.]*$//g'); pandoc -f markdown -s $1 > ${n}.html
}


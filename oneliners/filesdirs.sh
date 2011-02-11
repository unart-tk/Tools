findi (){
    dir="$1"
    pat="$2"
    find "$dir" -iname "*$pat*"
}
grepi (){
    dir="$1"
    pat="$2"
    grep -lir "$pat" "$dir"
}



cleantrash () {
    rm -rf $HOME/trash/*
}

f () { 
    mydir="$1"; search="$2"
    if [ ! $2 ];then
        echo "use default . "
        mydir="."; search="$1"
    fi
    find "$mydir" -iname "$search" ; 
}

mk () {
    mkdir "$1" && cd "$1"
}


# make destructive comnds more secure

# open files in new tabs


foldersizes () {
    echo "$1";
    for file in "$1"/*; do if [ -d $file ]; then du -sh $file; fi; done ;
}

findmacexecutables () {
    for file in *; do if [ "`file $file | grep Mach`" ]; then echo $file ; fi ; done ;
}

xtar () { 
    FILE="$1"; NAME=$(echo "$FILE" | sed 's/\.[a-z]*\.[a-z]*$//');
    echo $FILE;
    tar xfvz $FILE; 
    cd $NAME/; 
    echo -e "DONE: \n"
}

maketar () {
    DIR="$1"
    tar cfvz $DIR.tar.gz $DIR
    echo -e "DONE: \n"
    ls $DIR*
}

renameext () {
	old=$1;  new=$2
	for f in *.$old; do mv "$f" "`basename "$f" .$old`.$new"; done;
}

lsl(){
    ls -l  | awk '{ print $8 }'
}

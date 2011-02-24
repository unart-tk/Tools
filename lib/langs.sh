
yeti(){
	yh=$HOME/usr/local/yeti;rlwrap $JAVA_HOME/bin/java -classpath $yh/.build/lib:$yh/.build/compiler:$yh/asm-3.1r.jar:$yh/.build/std:$yh/.build/modules:. yeti.lang.compiler.yeti "$@"
}

obatt(){	
	ledit ocamlfind batteries/ocaml
}

fsi(){
	exec mono $FSHARP_HOME/bin/fsi.exe $*
}

ipy(){
    mono /usr/local/ironpython/ipy.exe $cmdargs
}

iocaml(){
	ledit "/usr/local/ocaml/bin/ocaml"
}

battc(){
	ocamlfind batteries/ocamlc "$@"
}
battopt(){
	ocamlfind batteries/ocamlopt "$@"
}

ipysh(){
	ipython -p sh
}

closure (){
	java -jar $HOME/usr/local/closure/compiler.jar "$@"
}

ocamltwt(){
	ocamlfind  batteries/ocamlc -pp ocaml+twt "$1"
}

sbt (){
	java -Xmx512M -jar  $HOME/local/javalibs/sbt-launcher-0.5.6.jar "$@"
}
